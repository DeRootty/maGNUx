> [Inicio](README.md)

# dinit — interacciones con el kernel Linux

## Contexto

Este documento continúa la misma línea de trabajo aplicada antes a `systemd`, `OpenRC`, `sysVinit` y `runit`: identificar el papel de `dinit` como init/supervisor, qué partes dependen del kernel Linux, qué APIs/superficies del kernel utiliza, y qué opciones `CONFIG_*` conviene verificar en una máquina Linux/RISC-V.

**Advertencia metodológica:** a diferencia de systemd, `dinit` no publica una tabla oficial de “APIs del kernel usadas por versión”. Por tanto, esta tabla es un mapa técnico derivado de su documentación oficial, de las páginas de manual y del modelo POSIX/Linux que utiliza.

Fuentes principales:

- Repositorio oficial: <https://github.com/davmac314/dinit>
- Página oficial: <https://davmac.org/projects/dinit/>
- Manual `dinit(8)`: <https://davmac.org/projects/dinit/man-pages-html/dinit.8.html>
- Manual `dinit-service(5)`: <https://davmac.org/projects/dinit/man-pages-html/dinit-service.5.html>
- Guía “Dinit as init”: <https://github.com/davmac314/dinit/blob/master/doc/linux/DINIT-AS-INIT.md>

---

## 1. Modelo general

`dinit` es un **service manager / supervisor** que también puede actuar como **init del sistema** en Linux.

Según su documentación, cuando se ejecuta como PID 1, `dinit` actúa como system manager: arranca el servicio inicial, gestiona dependencias, supervisa procesos, acepta órdenes por socket de control y puede apagar o reiniciar el sistema.

A diferencia de `sysVinit`, no se basa principalmente en `/etc/inittab` y runlevels clásicos. A diferencia de `runit`, integra dependencias declarativas en el propio gestor. A diferencia de `systemd`, no intenta absorber tantos subsistemas del sistema operativo.

Flujo conceptual:

```text
kernel Linux
  ↓ execve(init=... o /sbin/init)
dinit como PID 1
  ↓
lee entorno inicial y descripciones de servicios
  ↓
arranca el servicio especial "boot"
  ↓
resuelve dependencias
  ↓
lanza procesos, scripts o servicios internos
  ↓
supervisa procesos asociados
  ↓
recibe órdenes por socket de control dinitctl
  ↓
apaga/reinicia/detiene servicios cuando corresponde
```

---

## 2. Componentes principales

| Componente | Función | Relación con kernel |
|---|---|---|
| `dinit` | Gestor principal de servicios; puede ser PID 1 | `fork`, `exec`, señales, socket de control, espera de hijos, shutdown/reboot |
| `dinitctl` | Cliente de control | socket Unix hacia `dinit` |
| `dinitcheck` | Verificación de servicios/configuración | lectura de ficheros; no requiere privilegios de kernel especiales |
| servicios `process` | Procesos supervisados directamente | creación, monitorización, señales, grupos de proceso |
| servicios `bgprocess` | Daemons que se bifurcan y escriben PID file | lectura de pid-file, señales al PID descubierto |
| servicios `scripted` | Comandos de arranque/parada | ejecución y código de retorno |
| servicios `internal` | Servicios lógicos sin proceso externo | sin interacción directa relevante |
| servicios `triggered` | Servicios internos activados por trigger externo | control por socket/cliente |
| log propio | consola, syslog o fichero | consola/stdout, socket syslog o filesystem |
| cgroups opcional | `run-in-cgroup` | `/sys/fs/cgroup`, cgroup v1/v2, si se compila con soporte |
| capabilities opcional | `capabilities`, `securebits` | Linux capabilities, securebits |
| ioprio opcional | `ioprio` | prioridad de E/S en Linux |
| OOM score opcional | `oom-score-adj` | `/proc/<pid>/oom_score_adj` |

---

## 3. Punto de entrada como PID 1

Cuando Linux ejecuta `dinit` como PID 1, el contrato mínimo es:

```text
kernel → execve("/sbin/init" o init=/ruta/a/dinit)
```

A partir de ahí, `dinit`:

1. interpreta parte de la línea de comandos del kernel;
2. lee entorno inicial;
3. abre su socket de control;
4. carga servicios bajo demanda desde directorios como `/etc/dinit.d`;
5. arranca el servicio especial `boot` si no se especifica otro;
6. entra en su bucle de eventos/supervisión.

Según `dinit(8)`, al correr como PID 1 en Linux puede tratar de forma especial argumentos de la línea de comandos del kernel: ignora muchas palabras sueltas, acepta `single` como servicio de arranque, y procesa opciones con `--`.

---

## 4. Servicios y dependencias

`dinit-service(5)` define cinco tipos principales de servicio:

| Tipo | Descripción | Interacción kernel |
|---|---|---|
| `process` | Un proceso supervisado directamente | `fork`, `exec`, `wait`, señales |
| `bgprocess` | Proceso que daemoniza y escribe PID file | lectura de fichero PID, señales al PID |
| `scripted` | Comandos de start/stop | ejecución de procesos y estado de salida |
| `internal` | Estado lógico interno, sin proceso | sin interacción directa relevante |
| `triggered` | Interno, activado externamente | control por socket/cliente |

Dinit tiene dependencias declarativas:

| Relación | Semántica |
|---|---|
| `depends-on` | Dependencia dura: debe arrancar y permanecer arrancada |
| `depends-ms` | Milestone: debe arrancar antes, pero luego puede detenerse |
| `waits-for` | Espera a que el otro servicio arranque o falle, sin bloquear necesariamente |

---

## 5. Mapa de APIs/superficies del kernel

| Área | API/superficie kernel | Uso por dinit |
|---|---|---|
| Ejecución de procesos | `fork`, `execve`, `waitpid`/`waitid` | lanzar y supervisar servicios |
| Señales | `kill`, `sigaction`, `sigprocmask`, `SIGCHLD`, `SIGINT`, `SIGTERM`, `SIGQUIT` | parar servicios, recibir muerte de hijos, apagar/reiniciar |
| PID 1 semantics | reglas especiales del kernel para PID 1 | recepción de señales, responsabilidad de recolección de huérfanos |
| Grupos de procesos | `setpgid`, señales a grupos | parar árboles simples de procesos |
| Sesiones/TTY | consola, terminales, control de stdio | servicios que usan `runs-on-console`, `starts-on-console`, `shares-console` |
| Ficheros | `open`, `read`, `write`, `stat`, `rename`, `unlink`, permisos | servicios, logs, pid-files, entorno |
| Directorios | `opendir`, `readdir`, `stat` | búsqueda de descripciones de servicios |
| Socket de control | Unix domain socket | comunicación `dinitctl` ↔ `dinit` |
| Eventos | poll/epoll/kqueue vía Dasynq | bucle principal portable |
| Temporizadores | timers de usuario/libc; backend de eventos | timeouts de arranque/parada, restart rate limiting |
| Syslog | `/dev/log` o mecanismo libc/syslog | logging si se usa syslog |
| Reboot/halt | syscall `reboot()` o herramientas auxiliares según configuración | apagar/reiniciar al correr como system manager |
| `/proc` | `/proc`, `/proc/<pid>/oom_score_adj`, autogroup en nice | OOM score, nice/autogroup en Linux |
| cgroups | `/sys/fs/cgroup`, cgroup v1/v2 | `run-in-cgroup`, si se compila con soporte |
| capabilities | Linux capabilities, ambient/inheritable/bounding, securebits | `capabilities=`, `securebits=` si se compila con soporte |
| I/O priority | `ioprio_set` | `ioprio=` si se compila con soporte |
| rlimits | `setrlimit` | `rlimit-nofile`, `rlimit-core`, `rlimit-data`, `rlimit-addrspace` |
| UID/GID | `setuid`, `setgid`, `initgroups` | ejecutar servicios como usuario/grupo determinado |
| utmp | base de datos utmp | `inittab-id`, `inittab-line`, si se compila con soporte |
| Montajes básicos | no los gestiona globalmente por defecto | normalmente delegados a servicios/scripts |
| udev/devtmpfs | no implementa udev | depende de servicios externos o scripts para poblar `/dev` |
| red | no implementa red | depende de servicios externos |
| coredumps | kernel + límites `RLIMIT_CORE` | indirecto por `rlimit-core` |

---

## 6. Opciones de servicio con interacción kernel clara

| Opción dinit | Kernel/API implicada | Comentario |
|---|---|---|
| `command` | `fork`/`execve` | comando principal del servicio |
| `stop-command` | `fork`/`execve`; alternativa a señal directa | parada por script/comando |
| `pid-file` | filesystem + PID management | usada por servicios `bgprocess` |
| `restart` / auto restart | `wait` + temporizadores | supervisión y reinicio |
| `start-timeout` | temporizador + señales | si expira, señal al grupo de proceso |
| `stop-timeout` | temporizador + `SIGKILL` | parada forzosa |
| `logfile` | filesystem, permisos, `open`/`write` | salida de servicio a fichero |
| `log-type = pipe` | pipes | captura de stdout/stderr |
| `consumer-of` | pipes | pipeline entre servicios |
| `inittab-id` / `inittab-line` | utmp | historial de sesiones, si habilitado |
| `rlimit-nofile` | `setrlimit(RLIMIT_NOFILE)` | límite de FDs |
| `rlimit-core` | `setrlimit(RLIMIT_CORE)` | coredumps |
| `rlimit-data` | `setrlimit(RLIMIT_DATA)` | segmento de datos |
| `rlimit-addrspace` | `setrlimit(RLIMIT_AS)` | espacio de direcciones |
| `nice` | `setpriority`/nice; procfs en Linux para autogroup | prioridad CPU |
| `run-in-cgroup` | `/sys/fs/cgroup` | cgroup debe existir previamente |
| `capabilities` | Linux capabilities | requiere build con soporte |
| `securebits` | securebits Linux | requiere build con soporte |
| `ioprio` | `ioprio_set` | prioridad de E/S |
| `oom-score-adj` | `/proc/<pid>/oom_score_adj` | requiere procfs montado |
| `runs-on-console` | consola/TTY/stdin/stdout/stderr | serialización de acceso a consola |
| `starts-on-console` | consola/TTY | consola durante arranque |
| `shares-console` | consola/TTY | uso compartido |

---

## 7. Opciones `CONFIG_*` recomendables para Linux/RISC-V con dinit

Dinit no exige un conjunto tan amplio como systemd, pero para una máquina Linux moderna con dinit como PID 1 conviene verificar al menos:

```text
CONFIG_PROC_FS
CONFIG_SYSFS
CONFIG_DEVTMPFS
CONFIG_TMPFS
CONFIG_UNIX
CONFIG_NET
CONFIG_SIGNALFD
CONFIG_EPOLL
CONFIG_INOTIFY_USER
CONFIG_TIMERFD
CONFIG_CGROUPS
CONFIG_CGROUP_SCHED
CONFIG_FAIR_GROUP_SCHED
CONFIG_MEMCG
CONFIG_BLK_CGROUP
CONFIG_CGROUP_PIDS
CONFIG_CGROUP_FREEZER
CONFIG_CGROUP_BPF        # no porque dinit sea systemd-like, sino si otros servicios lo usan
CONFIG_NAMESPACES
CONFIG_UTS_NS
CONFIG_IPC_NS
CONFIG_PID_NS
CONFIG_NET_NS
CONFIG_USER_NS
CONFIG_SECCOMP
CONFIG_SECCOMP_FILTER
CONFIG_SECURITY
CONFIG_SECURITYFS
CONFIG_KEYS
CONFIG_POSIX_TIMERS
CONFIG_TTY
CONFIG_VT
CONFIG_UNIX98_PTYS
CONFIG_DEVPTS_FS
CONFIG_BINFMT_ELF
CONFIG_BINFMT_SCRIPT
CONFIG_MODULES
CONFIG_KALLSYMS
CONFIG_PRINTK
CONFIG_MAGIC_SYSRQ
CONFIG_REBOOT
```

### Mínimo estricto para dinit como init sencillo

```text
CONFIG_PROC_FS
CONFIG_SYSFS
CONFIG_DEVTMPFS
CONFIG_TMPFS
CONFIG_UNIX
CONFIG_TTY
CONFIG_UNIX98_PTYS
CONFIG_BINFMT_ELF
CONFIG_BINFMT_SCRIPT
CONFIG_REBOOT
```

### Para usar `run-in-cgroup`

```text
CONFIG_CGROUPS
CONFIG_CGROUP_SCHED
CONFIG_FAIR_GROUP_SCHED
CONFIG_MEMCG
CONFIG_CGROUP_PIDS
CONFIG_BLK_CGROUP
```

### Para capabilities/securebits

```text
CONFIG_SECURITY
CONFIG_SECURITYFS
CONFIG_KEYS
```

La disponibilidad exacta depende también de cómo se compile dinit: algunas opciones (`capabilities`, `cgroups`, `ioprio`, `oom-score-adj`, utmp) son funcionalidad condicional de build.

---

## 8. Comparación de exigencia frente a systemd

| Aspecto | systemd | dinit |
|---|---|---|
| PID 1 persistente | sí | sí, si se usa como init |
| Dependency management | sí | sí |
| Supervisión de procesos | sí | sí |
| Socket activation amplia | sí | no del mismo alcance |
| udev integrado en el proyecto | sí | no |
| network manager propio | sí, `systemd-networkd` | no |
| resolved/timesync/journald | sí | no equivalente integrado |
| cgroups obligatorios | muy centrales | opcionales para `run-in-cgroup` |
| BPF/seccomp/namespaces | ampliamente usados | no centrales, salvo servicios externos |
| Tabla oficial de kernel APIs por versión | sí | no |
| Portabilidad no-Linux | limitada en la práctica | objetivo explícito POSIX/Linux/BSD |

---

## 9. Checklist práctico en una máquina RISC-V/Linux

### Comprobar kernel y pseudo-filesystems

```sh
uname -a
zcat /proc/config.gz | grep -E 'CONFIG_(PROC_FS|SYSFS|DEVTMPFS|TMPFS|UNIX|CGROUPS|MEMCG|CGROUP_PIDS|TTY|UNIX98_PTYS|BINFMT_ELF|BINFMT_SCRIPT|REBOOT)'
mount | grep -E 'proc|sysfs|devtmpfs|tmpfs|cgroup'
```

### Comprobar dinit como PID 1

```sh
ps -p 1 -o pid,comm,args
dinitctl list
dinitctl status boot
```

### Comprobar socket de control

```sh
ls -l /dev/dinitctl /run/dinitctl 2>/dev/null
```

### Comprobar servicios

```sh
find /etc/dinit.d /run/dinit.d /usr/local/lib/dinit.d /lib/dinit.d -maxdepth 1 -type f 2>/dev/null
```

### Comprobar cgroups si se usa `run-in-cgroup`

```sh
stat -fc %T /sys/fs/cgroup
findmnt /sys/fs/cgroup
cat /proc/1/cgroup
```

### Comprobar procfs para OOM score

```sh
cat /proc/1/oom_score_adj
```

---

## 10. Lectura recomendada del código

Orden sugerido:

```text
src/dinit.cc / fichero principal equivalente
  ↓
carga de argumentos y modo PID 1
  ↓
servicio especial boot
  ↓
parser de service descriptions
  ↓
modelo de dependencias
  ↓
lanzamiento de procesos
  ↓
supervisión y SIGCHLD
  ↓
control socket / dinitctl
  ↓
shutdown/reboot
```

Para auditar interacciones con kernel en el código:

```sh
grep -R "fork\|exec\|wait\|kill\|socket\|bind\|listen\|accept\|poll\|epoll\|signalfd\|timerfd\|setrlimit\|setuid\|setgid\|ioprio\|cap_\|prctl\|reboot\|oom_score_adj\|cgroup" .
```

---

## 11. Conclusión

`dinit` es un init/supervisor moderno, con dependencias y supervisión, pero mucho más contenido que systemd. En una máquina RISC-V/Linux, su utilidad como prueba de madurez del kernel es distinta:

- **systemd** prueba muchísimos subsistemas modernos del kernel;
- **dinit** prueba mejor el contrato clásico de PID 1, supervisión, señales, procesos, sockets Unix, cgroups opcionales, capabilities opcionales y arranque declarativo simple.

Una plataforma RISC-V que arranque dinit limpiamente con servicios, consola, cgroups opcionales, procfs/sysfs/devtmpfs y apagado/reinicio funcional tiene una base Linux sólida, aunque no necesariamente cubra todos los subsistemas avanzados que systemd ejercita.


* [Enlace a dinit](https://github.com/davmac314/dinit)

> [Inicio](README.md)
