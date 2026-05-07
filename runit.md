> [Inicio](README.md)

# runit — mapa de interacción con el kernel Linux

## Alcance

Este documento sigue el mismo enfoque usado previamente con systemd, pero aplicado a **runit**.

A diferencia de systemd, runit **no publica una tabla oficial de APIs del kernel por versión** ni una lista formal de opciones `CONFIG_*` requeridas. La razón es arquitectónica: runit es pequeño, portable entre Unix y deliberadamente evita depender de subsistemas Linux modernos como cgroups, BPF, seccomp, namespaces o journald.

Por tanto, este documento resume:

- modelo de arranque de runit;
- componentes principales;
- superficies de interacción con el kernel;
- llamadas del sistema y familias de APIs implicadas;
- pseudo-sistemas de ficheros y nodos necesarios;
- checklist Linux/RISC-V razonable para ejecutarlo como PID 1;
- diferencias frente a systemd.

Fuentes principales:

- Sitio oficial de runit: <https://smarden.org/runit/>
- Manual `runit(8)`: <https://smarden.org/runit/runit.8>
- Manual `runit-init(8)` de Debian: <https://manpages.debian.org/testing/runit/runit-init.8.en.html>
- Repositorio upstream de Gerrit Pape: <https://github.com/g-pape/runit/>
- Manual `runsv(8)`: <https://smarden.org/runit/runsv.8>
- Manual `svlogd(8)`: <https://manpages.ubuntu.com/manpages/focal/man8/svlogd.8.html>
- Manual `chpst(8)`: <https://manpages.ubuntu.com/manpages/focal/man8/chpst.8.html>

---

## 1. Modelo general

runit es un esquema de init Unix con supervisión de servicios. Puede reemplazar a sysvinit y otros sistemas de init. Está pensado para ejecutarse como proceso número 1, aunque también puede usarse bajo otro init.

El sitio oficial describe tres etapas:

| Etapa | Programa/archivo | Función |
|---|---|---|
| Stage 1 | `/etc/runit/1` | Inicialización única del sistema |
| Stage 2 | `/etc/runit/2` | Estado normal del sistema; típicamente ejecuta `runsvdir` |
| Stage 3 | `/etc/runit/3` | Parada, apagado o reinicio |

Flujo simplificado:

```text
kernel
  ↓
/sbin/init → runit-init
  ↓
runit
  ↓
/etc/runit/1
  ↓
/etc/runit/2
  ↓
runsvdir
  ↓
runsv por cada servicio
  ↓
servicio/run + servicio/log/run opcional
```

`runit-init` es el reemplazo de `/sbin/init`. Si se ejecuta como PID 1, hace `exec` de `runit`. Si se llama como `init 0` o `init 6`, señaliza al PID 1 usando permisos en `/etc/runit/stopit` y `/etc/runit/reboot`, y después envía `SIGCONT`.

---

## 2. Componentes principales de runit

| Componente | Papel | Interacción principal con kernel |
|---|---|---|
| `runit-init` | Reemplazo de `/sbin/init`; entrada desde el kernel | `execve`, señales, `chmod`, filesystem |
| `runit` | PID 1 real; coordina stages 1, 2 y 3 | `fork`, `exec`, `wait`, señales, consola |
| `/etc/runit/1` | Script de arranque inicial | Montajes, init de `/dev`, `/proc`, `/sys`, red básica, hostname, etc. según distro |
| `/etc/runit/2` | Script de ejecución normal | Arranca `runsvdir` |
| `/etc/runit/3` | Script de apagado | Detiene servicios, desmonta FS, apaga/reinicia |
| `runsvdir` | Supervisa un directorio de servicios | `stat`, `open`, `fork`, `exec`, `wait`, señales |
| `runsv` | Supervisa un servicio individual | `fork`, `exec`, `pipe`, FIFO, `wait`, señales |
| `sv` | Cliente de control de servicios | FIFO/control files, señales indirectas |
| `svlogd` | Logger de servicio | `read`, `write`, `open`, `rename`, `fsync`, rotación |
| `chpst` | Ejecuta programas con estado modificado | `setuid`, `setgid`, `setrlimit`, `chdir`, `nice`, `exec` |
| `utmpset` | Limpieza de registros utmp | ficheros utmp/wtmp |

---

## 3. Diferencia fundamental frente a systemd

systemd como PID 1 mantiene un gran gestor residente que integra:

- cgroups;
- sandboxing;
- activation sockets;
- logging/journald;
- udev;
- control de recursos;
- namespaces;
- seccomp;
- BPF;
- D-Bus;
- timers;
- mounts;
- units complejas.

runit, en cambio:

- mantiene PID 1 mínimo;
- delega casi todo en scripts;
- usa supervisión por procesos pequeños;
- no requiere cgroups;
- no requiere BPF;
- no requiere seccomp;
- no requiere namespaces;
- no requiere D-Bus;
- no requiere journald;
- no requiere interfaces modernas específicas de Linux.

Esto lo hace más simple de portar a RISC-V o a otros Unix, pero también significa que muchas funciones avanzadas quedan fuera de runit y dependen de scripts, paquetes externos o de la distribución.

---

## 4. Interacciones de `runit` como PID 1

| Área | Kernel/API | Uso esperado |
|---|---|---|
| Entrada inicial | `execve("/sbin/init")` desde el kernel | El kernel ejecuta `/sbin/init`, que puede ser `runit-init` |
| Reemplazo de proceso | `execve()` | `runit-init` reemplaza su imagen por `runit` |
| Creación de procesos | `fork()` / variante libc | Ejecutar stages y scripts |
| Ejecución de programas | `execve()` | Ejecutar `/etc/runit/1`, `/etc/runit/2`, `/etc/runit/3` |
| Espera de hijos | `wait()` / `waitpid()` | Esperar fin de stage 1, stage 2, stage 3 |
| Señales | `sigaction`, `kill`, `pause`, `SIGCONT`, `SIGINT`, `SIGTERM` | Control de apagado/reinicio y eventos |
| Consola | `/dev/console`, `open`, `read`, `write`, `ioctl` | Stage 1 puede tener control de consola para shell de emergencia |
| Filesystem | `open`, `stat`, `access`, `chmod` | Leer scripts y archivos de control |
| Apagado/reinicio | normalmente vía scripts y utilidades externas | Runit coordina; la llamada final puede hacerla `halt`, `reboot`, `poweroff` o script equivalente |

---

## 5. Interacciones de `runit-init`

| Acción | Kernel/API | Detalle |
|---|---|---|
| Ser PID 1 | `execve` desde kernel | Si `/sbin/init` apunta a `runit-init`, el kernel lo lanza |
| Reemplazar por `runit` | `execve("runit")` | Según manual, si es proceso 1, ejecuta y se reemplaza por `runit` |
| Señalizar halt | `chmod("/etc/runit/reboot", 0000)`, `chmod("/etc/runit/stopit", 0100)`, `kill(SIGCONT)` | `init 0` |
| Señalizar reboot | `chmod("/etc/runit/reboot", 0100)`, `chmod("/etc/runit/stopit", 0100)`, `kill(SIGCONT)` | `init 6` |
| Salida | exit codes | 111 en error, 0 en otros casos |

---

## 6. Interacciones de `runsvdir`

`runsvdir` supervisa un directorio de servicios. Su tarea es observar subdirectorios y lanzar un `runsv` por cada servicio.

| Área | Kernel/API | Uso |
|---|---|---|
| Enumerar servicios | `opendir`, `readdir`, `stat` | Recorre directorios de servicio |
| Crear supervisores | `fork`, `execve` | Lanza `runsv` |
| Esperar hijos | `waitpid` | Detecta supervisores terminados |
| Señales | `sigaction`, `kill` | Control y terminación |
| Sueño/reintento | `sleep`, `nanosleep` o equivalente libc | Reescaneo periódico |
| Descriptores | `open`, `close`, `dup2` | Redirecciones básicas |

No requiere inotify: el modelo clásico de runit es portable y puede funcionar por sondeo/reescaneo.

---

## 7. Interacciones de `runsv`

`runsv` supervisa un servicio individual.

| Área | Kernel/API | Uso |
|---|---|---|
| Directorio de servicio | `chdir`, `stat`, `open` | Entra en el directorio del servicio |
| Script principal | `execve("./run")` | Lanza el servicio |
| Servicio de log opcional | `execve("log/run")` | Lanza logger asociado |
| Procesos | `fork`, `waitpid` | Supervisa hijo principal y logger |
| Señales | `kill`, `sigaction` | Arranque, parada, reload, terminación |
| FIFO de control | `mkfifo`, `open`, `read`, `write` | Control mediante `service/supervise/control` |
| Estado | `open`, `write`, `rename` | Ficheros en `service/supervise/` |
| Pipes | `pipe`, `dup2` | Conexión stdout/stderr del servicio con logger |
| Permisos | `chmod`, `chown` | Estado y control según implementación/paquete |
| Tiempo | `time`, `gettimeofday`, `nanosleep` | Timestamps y reintentos |

El manual de `runsv` documenta los pipes nombrados `service/supervise/control` y `service/log/supervise/control` para controlar servicios.

---

## 8. Interacciones de `sv`

`sv` es el cliente de control. No necesita hablar con el kernel de forma compleja; escribe comandos en las interfaces de control de `runsv`.

| Área | Kernel/API | Uso |
|---|---|---|
| Localizar servicio | `stat`, `access` | Resolver directorio de servicio |
| Control | `open`, `write` sobre FIFO | Enviar órdenes a `runsv` |
| Estado | `open`, `read` | Leer estado bajo `supervise/` |
| Espera | `poll`/`select` o espera por fichero | Esperar cambios de estado |
| Señales | indirectas vía `runsv` | No suele matar servicios directamente salvo modos concretos |

---

## 9. Interacciones de `svlogd`

`svlogd` lee de stdin y escribe logs rotados.

| Área | Kernel/API | Uso |
|---|---|---|
| Lectura | `read(0, ...)` | Recibe logs desde pipe |
| Escritura | `write` | Escribe en `current` |
| Ficheros | `open`, `close`, `fsync`, `fdatasync` | Persistencia de logs |
| Rotación | `rename`, `unlink`, `stat`, `chmod` | Rotar `current` a `@timestamp.*` |
| Directorios | `mkdir`, `opendir`, `readdir` | Gestionar directorio de logs |
| Procesador externo | `fork`, `execve`, `waitpid`, `pipe` | Ejecutar procesador de logs |
| Señales | `SIGHUP`, `SIGTERM`, etc. | Releer config o terminar |
| Red opcional | `socket`, `sendto` UDP | Alertas por UDP si se configura |

El manual de `svlogd` indica que lee continuamente de entrada estándar, rota ficheros y puede enviar mensajes seleccionados por UDP.

---

## 10. Interacciones de `chpst`

`chpst` ejecuta programas con estado de proceso modificado.

| Función | Kernel/API aproximada | Ejemplo |
|---|---|---|
| Cambiar usuario | `setuid`, `setgid`, `setgroups`, `initgroups` | `chpst -u user` |
| Cambiar directorio | `chdir` | Directorio de trabajo |
| Cambiar entorno | `clearenv`, `setenv`, lectura de ficheros `envdir` | Entornos por directorio |
| Cambiar nice | `setpriority` / `nice` | Prioridad CPU |
| Límites de recursos | `setrlimit` | memoria, ficheros abiertos, procesos, core, stack |
| Bloqueos | `flock` o `fcntl` según implementación | `setlock` emulado |
| Nuevo proceso | `execve` | Ejecuta el programa final |

Los límites típicos que aparecen en el código/manpage incluyen:

| Límite | Posible constante |
|---|---|
| Data segment | `RLIMIT_DATA` |
| Stack | `RLIMIT_STACK` |
| Memlock | `RLIMIT_MEMLOCK` |
| Address space / virtual memory | `RLIMIT_AS` / `RLIMIT_VMEM` |
| Open files | `RLIMIT_NOFILE` |
| Processes | `RLIMIT_NPROC` |
| File size | `RLIMIT_FSIZE` |
| Core size | `RLIMIT_CORE` |
| Resident set | `RLIMIT_RSS` |

---

## 11. Pseudo-sistemas de ficheros y nodos necesarios

runit no los monta mágicamente por sí solo en el núcleo de PID 1; normalmente se montan desde `/etc/runit/1` o desde scripts de la distribución.

| Elemento | ¿Lo requiere runit estrictamente? | ¿Lo requiere un Linux normal con runit? | Comentario |
|---|---:|---:|---|
| `/dev/console` | Sí, en la práctica | Sí | Stage 1 puede usar consola de emergencia |
| `/dev/null` | Sí, en la práctica | Sí | Redirecciones y servicios |
| `/dev`, `devtmpfs` | No por diseño abstracto | Muy recomendable | Necesario para un sistema Linux usable |
| `/proc` | No estrictamente para runit mínimo | Sí | Scripts y herramientas lo esperan |
| `/sys` | No estrictamente para runit mínimo | Sí | Hardware, udev/mdev/eudev, módulos |
| `/run` | No histórico, sí práctico | Sí | Estado runtime moderno |
| `/tmp` | No estrictamente | Sí | Scripts y servicios |
| `/var/service` o `/service` | Sí para supervisión | Sí | Directorio de servicios |
| `service/supervise/control` | Sí para control runit | Sí | FIFO de control por servicio |

---

## 12. Opciones `CONFIG_*` mínimas para Linux/RISC-V con runit

Como runit no publica lista oficial, esta tabla es una checklist técnica razonable para un sistema Linux real.

### 12.1 Mínimo práctico para arrancar PID 1 y ejecutar scripts

```text
CONFIG_BINFMT_ELF
CONFIG_PROC_FS
CONFIG_SYSFS
CONFIG_DEVTMPFS
CONFIG_TTY
CONFIG_VT
CONFIG_UNIX
CONFIG_TMPFS
CONFIG_SIGNALFD        # no imprescindible para runit clásico, útil para software moderno
CONFIG_EPOLL           # no imprescindible para runit clásico, útil para software moderno
```

Notas:

- `CONFIG_BINFMT_ELF` es necesario para ejecutar binarios ELF.
- `CONFIG_PROC_FS` y `CONFIG_SYSFS` no son una dependencia fuerte del núcleo de runit, pero sí de un sistema Linux normal.
- `CONFIG_DEVTMPFS` facilita `/dev`.
- `CONFIG_TTY`/`CONFIG_VT` importan para consola, especialmente si se usa shell de emergencia o login local.

### 12.2 Para scripts de arranque normales

```text
CONFIG_BLK_DEV_INITRD      # si se usa initramfs/initrd
CONFIG_TMPFS
CONFIG_TMPFS_POSIX_ACL     # recomendado
CONFIG_TMPFS_XATTR         # recomendado
CONFIG_MODULES             # si la distro carga módulos
CONFIG_KMOD                # si se usa auto-carga de módulos
CONFIG_NET                 # red
CONFIG_INET                # IPv4
CONFIG_IPV6                # si se usa IPv6
```

### 12.3 Para control de servicios y logging

```text
CONFIG_UNIX
CONFIG_FHANDLE             # útil para herramientas modernas, no específico de runit
CONFIG_FANOTIFY            # no requerido por runit
CONFIG_INOTIFY_USER        # no requerido por runit clásico, útil para servicios
```

runit no depende de inotify para su modelo central; puede funcionar con reescaneo.

### 12.4 Para seguridad y límites de procesos

```text
CONFIG_MULTIUSER
CONFIG_POSIX_TIMERS
CONFIG_RT_MUTEXES
CONFIG_KEYS                # útil para algunos servicios, no requerido por runit
CONFIG_AUDIT               # opcional
CONFIG_SECURITY            # opcional
CONFIG_SECURITYFS          # opcional
```

`chpst` usa primitivas POSIX clásicas como `setuid`, `setgid`, `setrlimit`, `nice` y `exec`.

### 12.5 No requeridas por runit, pero útiles en Linux moderno

```text
CONFIG_CGROUPS
CONFIG_CGROUP_BPF
CONFIG_BPF
CONFIG_BPF_SYSCALL
CONFIG_SECCOMP
CONFIG_SECCOMP_FILTER
CONFIG_NAMESPACES
CONFIG_USER_NS
CONFIG_NET_NS
CONFIG_PID_NS
CONFIG_UTS_NS
CONFIG_IPC_NS
```

Estas no son dependencias de runit como init/supervisor. Pueden ser necesarias para contenedores, sandboxing externo, servicios modernos, Docker/Podman, navegadores o demonios concretos.

---

## 13. APIs del kernel: tabla por familia

| Familia | Syscalls/APIs típicas | Usada por |
|---|---|---|
| Proceso | `fork`, `vfork`, `clone` vía libc, `execve`, `exit` | `runit`, `runsvdir`, `runsv`, `svlogd`, `chpst` |
| Espera | `wait`, `waitpid`, `wait4` | PID 1, supervisores |
| Señales | `sigaction`, `sigprocmask`, `kill`, `pause`, `sigsuspend` | Control y terminación |
| Ficheros | `open`, `read`, `write`, `close`, `stat`, `lstat`, `access` | Todos |
| Directorios | `opendir`, `readdir`, `mkdir`, `rmdir` | `runsvdir`, `runsv`, `svlogd` |
| Permisos | `chmod`, `chown`, `umask` | `runit-init`, `runsv`, scripts |
| FIFO/pipes | `mkfifo`, `pipe`, `dup2` | `runsv`, `sv`, logging |
| Bloqueo | `flock`, `fcntl` | `chpst`/`setlock`, logs |
| Tiempo | `time`, `gettimeofday`, `clock_gettime`, `sleep` | `svlogd`, reintentos |
| Red opcional | `socket`, `sendto` | `svlogd` con UDP |
| Identidad | `setuid`, `setgid`, `setgroups` | `chpst` |
| Prioridad | `nice`, `setpriority` | `chpst` |
| Límites | `setrlimit`, `getrlimit` | `chpst` |
| Consola | `open("/dev/console")`, `ioctl` | stage 1/scripts |
| Apagado | `reboot` indirecto vía scripts/utilidades | stage 3 |

---

## 14. Lo que runit NO exige al kernel

Esto es tan importante como lo anterior.

| Subsistema Linux | ¿runit lo necesita? | Comentario |
|---|---:|---|
| cgroup v1/v2 | No | No gestiona servicios por cgroup |
| BPF/eBPF | No | Sin filtros BPF ni cgroup-BPF |
| seccomp | No | No aplica filtros de syscalls |
| namespaces | No | No implementa sandboxing nativo |
| pidfd | No | Usa supervisión clásica con `wait` y señales |
| D-Bus | No | No tiene bus de control |
| journald | No | Usa logs por pipes y `svlogd` si se configura |
| udev integrado | No | Puede coexistir con eudev, mdev, udev u otros |
| mount API nueva | No | Montajes se hacen por scripts/utilidades |
| PSI/oomd | No | No tiene oomd integrado |
| tmpfiles/sysusers | No | Se resuelve por scripts o herramientas externas |
| socket activation estilo systemd | No | No nativo |

---

## 15. Checklist para evaluar una máquina RISC-V con runit

### 15.1 Comprobar PID 1

```sh
cat /proc/1/comm
ps -p 1 -o pid,comm,args
```

Esperable:

```text
runit
```

o equivalente según empaquetado.

### 15.2 Comprobar pseudo-FS básicos

```sh
mount | grep -E 'proc|sysfs|devtmpfs|tmpfs'
ls -l /dev/console /dev/null
```

### 15.3 Comprobar servicios

```sh
sv status /service/*
sv status /var/service/*
```

Según distribución, el directorio será `/service`, `/var/service` o `/etc/service`.

### 15.4 Comprobar supervisores

```sh
ps ax -o pid,ppid,comm,args | grep -E 'runit|runsvdir|runsv|svlogd'
```

### 15.5 Comprobar kernel config

```sh
zgrep -E 'CONFIG_(BINFMT_ELF|PROC_FS|SYSFS|DEVTMPFS|TTY|VT|UNIX|TMPFS|NET|INET|MODULES|KMOD|CGROUPS|SECCOMP|BPF|NAMESPACES)' /proc/config.gz
```

### 15.6 Comprobar que los scripts hacen lo que deben

```sh
ls -l /etc/runit/1 /etc/runit/2 /etc/runit/3
sed -n '1,200p' /etc/runit/1
sed -n '1,200p' /etc/runit/2
sed -n '1,200p' /etc/runit/3
```

En runit, gran parte de la interacción con el kernel real de la máquina no está en el binario `runit`, sino en estos scripts y en los servicios que lanzan.

---

## 16. Conclusión para Linux/RISC-V

runit es un buen candidato para máquinas RISC-V si se busca:

- PID 1 mínimo;
- pocas dependencias del kernel;
- arranque simple;
- supervisión robusta;
- menor superficie de integración que systemd.

Pero no es una prueba tan completa de madurez del kernel como systemd. Una máquina RISC-V puede arrancar runit correctamente aunque todavía no tenga buen soporte de:

- cgroups;
- BPF;
- seccomp;
- namespaces;
- pidfd;
- PSI;
- mount API moderna;
- gestión avanzada de dispositivos.

Por eso, para evaluar “madurez Linux completa” en RISC-V, runit sirve para probar lo esencial de Unix/Linux: procesos, señales, consola, ficheros, pipes, FIFOs, scripts, logs y apagado. Para probar el contrato moderno kernel-userspace en profundidad, systemd sigue siendo mucho más exigente.

[Enalce a runit](https://github.com/void-linux/runit)

> [Inicio](README.md)
