> [Inico](README.md)
# sysVinit: mapa de interacción con el kernel Linux

Fecha de elaboración: 2026-05-07

## Alcance

Este documento resume, en formato práctico, la relación entre **sysVinit** y el kernel Linux. Es el equivalente conceptual del trabajo realizado previamente con systemd, pero con una diferencia importante:

> **sysVinit no publica una tabla oficial de APIs del kernel por versión comparable a la de systemd.**

Por tanto, el mapa se construye a partir de:

- la descripción upstream de sysVinit;
- la página de manual `init(8)`;
- el modelo clásico de `/etc/inittab`, runlevels y scripts `/etc/init.d`;
- la función real de los programas del paquete sysvinit: `init`, `telinit`, `shutdown`, `halt`, `reboot`, `poweroff`, `killall5`, `pidof`, `runlevel`, etc.;
- las interfaces POSIX/Linux que esos programas necesitan para funcionar.

## 1. Modelo general

sysVinit es un init clásico de tipo System V. Su programa principal, `/sbin/init`, puede ejecutarse como **PID 1**. En ese modo:

1. el kernel ejecuta `/sbin/init` como último paso del arranque de espacio de usuario;
2. `init` lee `/etc/inittab`;
3. determina el runlevel inicial;
4. ejecuta entradas `sysinit`, `boot`, `bootwait`, `wait`, `once`, `respawn`, etc.;
5. mantiene algunos procesos vivos, típicamente `getty`;
6. cambia de runlevel cuando `telinit` se comunica con él;
7. en apagado/reinicio, coordina señales y scripts de parada.

A diferencia de systemd, sysVinit **no centraliza cgroups, BPF, namespaces, seccomp, udev, logging, resolución DNS o red**. Gran parte del trabajo real se delega a scripts externos y a herramientas del sistema base.

## 2. Flujo de arranque simplificado

```text
Firmware / BIOS / UEFI / OpenSBI
        ↓
Bootloader
        ↓
Kernel Linux
        ↓
execve("/sbin/init") o init=/ruta
        ↓
sysVinit PID 1
        ↓
/etc/inittab
        ↓
sysinit / boot / bootwait
        ↓
scripts /etc/init.d/*
        ↓
runlevel normal: 2, 3, 4 o 5
        ↓
getty / login / servicios
```

## 3. Mapa de componentes de sysVinit

| Componente | Función | Interacción principal con kernel |
|---|---|---|
| `/sbin/init` | PID 1 clásico | `fork`, `exec`, señales, `wait`, consola, FIFO `/run/initctl` |
| `/sbin/telinit` | Solicita cambio de runlevel | FIFO `/run/initctl`, señales, permisos |
| `/sbin/shutdown` | Programa apagado/reinicio ordenado | señales, wall/terminales, comunicación con init |
| `/sbin/halt` | Detiene el sistema | syscall `reboot()` o llamada equivalente a kernel |
| `/sbin/reboot` | Reinicia el sistema | syscall `reboot()` o llamada equivalente a kernel |
| `/sbin/poweroff` | Apaga la máquina | syscall `reboot()` con modo poweroff si está soportado |
| `/sbin/killall5` | Mata procesos fuera del runlevel actual | escaneo de `/proc`, señales |
| `/bin/pidof` | Obtiene PIDs por nombre | escaneo de `/proc` |
| `/sbin/runlevel` | Muestra runlevel anterior/actual | lectura de utmp/wtmp |
| `/etc/inittab` | Tabla de procesos y acciones | no interactúa con kernel directamente |
| `/etc/init.d/*` | Scripts de servicios | dependen de comandos externos: `mount`, `modprobe`, `ifconfig/ip`, `fsck`, etc. |

## 4. Archivos y pseudo-ficheros clave

| Ruta | Uso en sysVinit | Necesidad de kernel |
|---|---|---|
| `/etc/inittab` | Configuración central de init | FS raíz legible |
| `/etc/initscript` | Wrapper opcional para procesos lanzados por init | FS raíz legible |
| `/dev/console` | Consola del sistema | dispositivo de consola funcional |
| `/run/initctl` | FIFO de control para `telinit`/`init` | soporte de FIFO, tmpfs o FS writable |
| `/var/run/utmp` | Registro de runlevel/procesos | FS writable |
| `/var/log/wtmp` | Registro histórico | FS writable |
| `/proc` | Usado por herramientas como `pidof` y `killall5` | `CONFIG_PROC_FS` |
| `/sys` | Usado por scripts de arranque modernos | `CONFIG_SYSFS` |
| `/dev` | Dispositivos de consola, terminales, discos | devtmpfs/udev/mdev o nodos estáticos |
| `/etc/powerstatus` | Interfaz histórica para SIGPWR | FS raíz legible |

## 5. Interfaces directas entre sysVinit y el kernel

| Área | Interfaces / syscalls / mecanismo | Uso |
|---|---|---|
| Creación de procesos | `fork()`, `vfork()` si se usa, `execve()` vía libc | lanzar entradas de `/etc/inittab`, scripts y shells |
| Recolección de procesos | `wait()`, `waitpid()` | detectar hijos muertos, evitar zombis, respawn |
| Señales | `sigaction()`, `kill()`, `pause()`, `sigprocmask()` | SIGHUP, SIGUSR1, SIGUSR2, SIGINT, SIGWINCH, SIGPWR, SIGCHLD |
| Consola | `open("/dev/console")`, `tcgetattr()`, `tcsetattr()`, `tcflush()` | inicialización y saneamiento de consola |
| Grupos de procesos | `setsid()`, `setpgid()`, `tcsetpgrp()` según ruta | control de procesos asociados a terminales |
| Ficheros | `open()`, `read()`, `write()`, `close()`, `stat()`, `access()` | leer `/etc/inittab`, escribir logs, abrir consola |
| FIFO | `mkfifo()` o FIFO preexistente, `open()`, `read()`, `write()` | canal `/run/initctl` para control de init |
| Temporización | `alarm()`, `sleep()`, `select()` | retardos entre SIGTERM/SIGKILL, respawn throttling |
| Reloj | `time()` | controlar respawn demasiado rápido |
| Syslog | socket `/dev/log` vía libc/syslog | logging si syslogd está disponible |
| Apagado/reinicio | `reboot()` | `halt`, `reboot`, `poweroff` |
| Procesos del sistema | lectura de `/proc` | `pidof`, `killall5` |
| Estado de sesión | utmp/wtmp | registro de runlevels y procesos |

## 6. Señales relevantes

| Señal | Emisor típico | Efecto |
|---|---|---|
| `SIGHUP` | administrador / `telinit q` | recargar/reexaminar `/etc/inittab` |
| `SIGUSR1` | scripts/admin | cerrar y reabrir `/run/initctl` |
| `SIGUSR2` | scripts/admin | cerrar y dejar cerrado `/run/initctl` |
| `SIGINT` | kernel por Ctrl-Alt-Del | ejecutar acción `ctrlaltdel` |
| `SIGWINCH` | kernel por KeyboardSignal | ejecutar acción `kbrequest` |
| `SIGPWR` | subsistema de energía/UPS histórico | procesar estado de energía |
| `SIGCHLD` | kernel al morir hijos | recoger procesos y decidir respawn |
| `SIGTERM` | init hacia procesos | parada ordenada en cambio de runlevel |
| `SIGKILL` | init hacia procesos | terminación forzada tras timeout |

## 7. Acciones de `/etc/inittab` y efecto sobre kernel/userspace

| Acción | Descripción | Interacción técnica |
|---|---|---|
| `sysinit` | Ejecutar durante inicialización temprana | `fork`/`exec`, scripts |
| `boot` | Ejecutar durante arranque sin esperar | `fork`/`exec` |
| `bootwait` | Ejecutar durante arranque y esperar | `fork`/`exec` + `wait` |
| `initdefault` | Runlevel inicial | lógica interna, sin syscall especial |
| `respawn` | Reiniciar proceso si termina | `waitpid`, `fork`, `exec`, throttling |
| `wait` | Ejecutar una vez al entrar en runlevel y esperar | `fork`, `exec`, `wait` |
| `once` | Ejecutar una vez al entrar en runlevel | `fork`, `exec` |
| `ctrlaltdel` | Acción ante Ctrl-Alt-Del | señal `SIGINT` desde kernel |
| `kbrequest` | Acción ante KeyboardSignal | señal `SIGWINCH` desde kernel |
| `powerfail*` | Acciones ante fallo eléctrico | `SIGPWR`, `/etc/powerstatus` |
| `off` | Desactivar entrada | sin interacción |
| `ondemand` | Runlevels especiales a/b/c | señales/control por telinit |

## 8. Opciones de kernel recomendables para sysVinit

sysVinit puro necesita mucho menos que systemd. Esta lista no es una “lista oficial upstream de CONFIG_*”, sino un checklist práctico para un Linux moderno que use sysVinit como PID 1.

| Opción | Motivo |
|---|---|
| `CONFIG_PROC_FS` | Necesario para `/proc`; herramientas como `pidof` y `killall5` dependen de él |
| `CONFIG_SYSFS` | Necesario para scripts de arranque modernos y detección de hardware |
| `CONFIG_DEVTMPFS` | Muy recomendable para poblar `/dev` temprano |
| `CONFIG_DEVTMPFS_MOUNT` | Útil para montar devtmpfs automáticamente si la distro lo espera |
| `CONFIG_TMPFS` | Recomendable para `/run`, `/tmp`, `/dev/shm` |
| `CONFIG_UNIX` | Sockets Unix; syslog y muchos demonios dependen de ellos |
| `CONFIG_NET` | Base de red para muchos servicios y sockets Unix según configuración |
| `CONFIG_TTY` | Consolas y terminales |
| `CONFIG_VT` | Consolas virtuales en sistemas con VT |
| `CONFIG_UNIX98_PTYS` | Pseudoterminales para login, shells y servicios |
| `CONFIG_DEVPTS_FS` | `/dev/pts` |
| `CONFIG_MODULES` | Si los scripts cargan módulos con `modprobe` |
| `CONFIG_KMOD` | Auto-carga de módulos desde kernel/userspace |
| `CONFIG_BLK_DEV_INITRD` | Si se usa initramfs/initrd |
| `CONFIG_BINFMT_SCRIPT` | Ejecutar scripts con shebang |
| `CONFIG_BINFMT_ELF` | Ejecutar binarios ELF |
| `CONFIG_MAGIC_SYSRQ` | Opcional para depuración y recuperación |
| `CONFIG_RTC_CLASS` | Recomendable para reloj en arranque |
| `CONFIG_FHANDLE` | No esencial para sysVinit puro, útil para herramientas modernas |
| `CONFIG_CGROUPS` | No esencial para sysVinit, pero puede ser usado por servicios o scripts |
| `CONFIG_SECCOMP` | No esencial para sysVinit, útil para servicios modernos |
| `CONFIG_NAMESPACES` | No esencial para sysVinit, útil para contenedores/servicios |
| `CONFIG_NET_NS` | Contenedores/red aislada |
| `CONFIG_USER_NS` | Contenedores/aislamiento de usuarios |

## 9. Diferencia esencial frente a systemd

| Aspecto | systemd | sysVinit |
|---|---|---|
| PID 1 persistente | Sí, gestor complejo de units | Sí, pero mucho más simple |
| Cgroups | Parte central del diseño | No central |
| BPF | Usado para varias políticas modernas | No central |
| seccomp | Integrado en sandboxing de units | No central |
| namespaces | Integrado en sandboxing de units | No central |
| udev | Parte del ecosistema systemd | Externo |
| logging | journald | syslog externo |
| servicios | units declarativas | scripts `/etc/init.d` |
| dependencia de kernel moderno | Alta | Baja |
| portabilidad Unix/POSIX | Menor | Mayor |

## 10. Checklist práctico en una máquina RISC-V

### Comprobar configuración de kernel

```sh
zgrep -E 'CONFIG_(PROC_FS|SYSFS|DEVTMPFS|DEVTMPFS_MOUNT|TMPFS|UNIX|NET|TTY|VT|UNIX98_PTYS|DEVPTS_FS|MODULES|KMOD|BLK_DEV_INITRD|BINFMT_SCRIPT|BINFMT_ELF)' /proc/config.gz
```

### Comprobar pseudo-ficheros

```sh
mount | grep -E 'proc|sysfs|devtmpfs|tmpfs|devpts'
ls -ld /proc /sys /dev /run
test -c /dev/console && echo "console OK"
```

### Comprobar sysVinit como PID 1

```sh
ps -p 1 -o pid,comm,args
runlevel
cat /etc/inittab
```

### Comprobar canal de control

```sh
ls -l /run/initctl
telinit q
```

## 11. Conclusión

sysVinit interactúa con el kernel de forma mucho más clásica y reducida que systemd. Su núcleo depende de:

- proceso PID 1;
- señales;
- `fork`/`exec`/`wait`;
- consola;
- FIFO de control;
- ficheros de estado;
- `/proc` para herramientas auxiliares;
- syscall de reboot/apagado.

Para una máquina RISC-V, sysVinit es una prueba de madurez mucho menos exigente que systemd. Si sysVinit arranca pero systemd falla, eso puede indicar que el kernel y el userland soportan lo básico de Unix/Linux, pero todavía no todas las APIs modernas que systemd exige para una distribución generalista contemporánea.

## 12. Fuentes consultadas

- SysVinit README upstream: https://github.com/slicer69/sysvinit/blob/main/README
- Manual Debian `init(8)` de sysvinit-core: https://manpages.debian.org/testing/sysvinit-core/init.8.en.html
- Código fuente `init.c`: https://github.com/slicer69/sysvinit/blob/main/src/init.c
- Código fuente `halt.c`: https://github.com/slicer69/sysvinit/blob/main/src/halt.c
- Código fuente `killall5.c`: https://github.com/slicer69/sysvinit/blob/main/src/killall5.c
- Código fuente `shutdown.c`: https://github.com/slicer69/sysvinit/blob/main/src/shutdown.c

* [Enlace a sysVinit](https://github.com/slicer69/sysvinit)

> [Inico](README.md)
