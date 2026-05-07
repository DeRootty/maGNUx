> [Inicio](README.md)
# Postulando OpenRC

# OpenRC: mapa de interacciones con el kernel Linux

> Alcance: este documento resume las interacciones de OpenRC con el kernel Linux a partir de la documentación y scripts upstream del proyecto OpenRC, no de los scripts de servicios específicos de cada distribución. A diferencia de systemd, OpenRC no publica una tabla oficial de “APIs del kernel por versión”; por tanto, la forma correcta de documentarlo es por subsistema: pseudo-sistemas de ficheros, cgroups, gestión de procesos, montaje, módulos, sysctl, dispositivos y funciones opcionales.

Fuentes principales:

- OpenRC `README.md`: https://raw.githubusercontent.com/OpenRC/openrc/master/README.md
- OpenRC `user-guide.md`: https://raw.githubusercontent.com/OpenRC/openrc/master/user-guide.md
- OpenRC `etc/rc.conf`: https://raw.githubusercontent.com/OpenRC/openrc/master/etc/rc.conf
- OpenRC `init.d/devfs.in`: https://raw.githubusercontent.com/OpenRC/openrc/master/init.d/devfs.in
- OpenRC `init.d/sysfs.in`: https://raw.githubusercontent.com/OpenRC/openrc/master/init.d/sysfs.in
- OpenRC `init.d/procfs.in`: https://raw.githubusercontent.com/OpenRC/openrc/master/init.d/procfs.in
- OpenRC `init.d/cgroups.in`: https://raw.githubusercontent.com/OpenRC/openrc/master/init.d/cgroups.in
- OpenRC `init.d/sysctl.in`: https://raw.githubusercontent.com/OpenRC/openrc/master/init.d/sysctl.in
- OpenRC `init.d/modules.in`: https://raw.githubusercontent.com/OpenRC/openrc/master/init.d/modules.in
- Debian manpage `openrc-run(8)`: https://manpages.debian.org/testing/openrc/openrc-run.8.en.html
- Debian manpage `supervise-daemon(8)`: https://manpages.debian.org/testing/openrc/supervise-daemon.8.en.html

## 1. Modelo de arranque

| Aspecto | Qué hace OpenRC | Dependencia del kernel / sistema |
|---|---|---|
| Papel de OpenRC | Normalmente el PID 1 real, por ejemplo SysVinit, llama a `/sbin/openrc`; OpenRC calcula dependencias, ejecuta scripts de runlevel y termina. | Kernel capaz de ejecutar `/sbin/init` o el init configurado; rootfs funcional; shell POSIX; libc; filesystem montable. |
| `openrc-init` | OpenRC también puede proporcionar un init propio opcional, especialmente en Linux. | Requiere que el kernel lo ejecute como PID 1; debe poder recibir señales, esperar/recolectar hijos y ordenar apagado/reinicio. |
| Persistencia | OpenRC no es normalmente un daemon persistente como systemd PID 1; tras arrancar servicios, termina. | El seguimiento de servicios se apoya en estado en `/run`/`RC_SVCDIR`, pidfiles, cgroups opcionales y supervisores opcionales. |

## 2. Pseudo-sistemas de ficheros y montajes

| Subsistema | API/interfaz del kernel | Ficheros/scripts OpenRC relevantes | Configuración de kernel asociada |
|---|---|---|---|
| `/proc` | `procfs`, `/proc/filesystems`, `/proc/modules`, `/proc/sys`, `/proc/self/fd`, `/proc/kcore` | `procfs.in`, `devfs.in`, `modules.in`, `sysctl.in` | `CONFIG_PROC_FS`, `CONFIG_PROC_SYSCTL`, soporte de `/proc` en general |
| `/sys` | `sysfs` | `sysfs.in` | `CONFIG_SYSFS` |
| `/dev` | `devtmpfs` o `tmpfs`; nodos de dispositivo mediante `mknod`; `/dev/kmsg`; `/dev/console`; `/dev/null` | `devfs.in` | `CONFIG_DEVTMPFS` o `CONFIG_TMPFS`; soporte de device nodes |
| `/dev/pts` | `devpts` | `devfs.in` | `CONFIG_DEVPTS_FS`, normalmente `CONFIG_UNIX98_PTYS` |
| `/dev/mqueue` | POSIX message queues | `devfs.in` | `CONFIG_POSIX_MQUEUE` |
| `/dev/shm` | `tmpfs` | `devfs.in` | `CONFIG_TMPFS` |
| `/sys/kernel/security` | `securityfs` | `sysfs.in` | `CONFIG_SECURITYFS` |
| `/sys/kernel/debug` | `debugfs` | `sysfs.in` | `CONFIG_DEBUG_FS` |
| `/sys/kernel/tracing` | `tracefs` | `sysfs.in` | `CONFIG_TRACING`, `CONFIG_TRACEFS` o equivalente según kernel |
| `/sys/kernel/config` | `configfs` | `sysfs.in` | `CONFIG_CONFIGFS_FS` |
| `/sys/fs/fuse/connections` | `fusectl` | `sysfs.in` | `CONFIG_FUSE_FS`, `CONFIG_FUSE_CTL` |
| `/sys/fs/selinux` | `selinuxfs` | `sysfs.in` | `CONFIG_SECURITY_SELINUX` y soporte de selinuxfs |
| `/sys/fs/pstore` | `pstore` | `sysfs.in` | `CONFIG_PSTORE` y backend pstore aplicable |
| `/sys/firmware/efi/efivars` | `efivarfs` | `sysfs.in` | `CONFIG_EFIVAR_FS`, `CONFIG_EFI` si la plataforma usa EFI |
| `/sys/fs/bpf` | `bpffs` | `sysfs.in` | `CONFIG_BPF`, `CONFIG_BPF_SYSCALL`, `CONFIG_BPF_FS` si existe como opción separada |
| `/proc/sys/fs/binfmt_misc` | `binfmt_misc` | `procfs.in` | `CONFIG_BINFMT_MISC` o módulo `binfmt-misc` |
| `/run`, `/var/run`, `/var/lock` | tmpfs o filesystem raíz; bind mounts; symlinks | `bootmisc.in` | `CONFIG_TMPFS` recomendado; soporte de bind mount |

## 3. Cgroups

| Modo OpenRC | Interfaz del kernel | Qué hace OpenRC | Configuración de kernel asociada |
|---|---|---|---|
| Cgroups v1 base | `cgroup` en `/proc/filesystems`; montaje `-t cgroup`; `/proc/cgroups` | Crea `/sys/fs/cgroup/openrc`; monta cgroup `name=openrc`; usa `notify_on_release`; monta controladores v1 individuales. | `CONFIG_CGROUPS`; controladores v1 que se quieran usar: memoria, cpu, cpuacct, cpuset, blkio/io, devices, hugetlb, net_cls, net_prio, pids, etc. |
| Cgroups v2 base | `cgroup2` en `/proc/filesystems`; montaje `-t cgroup2`; `cgroup.controllers`; `cgroup.subtree_control` | Monta cgroup2 en `/sys/fs/cgroup` o ruta detectada; activa controladores v2 disponibles escribiendo `+controller`. | `CONFIG_CGROUPS`; cgroup v2; controladores v2: `memory`, `pids`, `cpu`, `cpuset`, `io`, etc. |
| Modo `hybrid` | cgroup v2 en ruta unificada + cgroup v1 por controladores | Permite seleccionar controladores v2 mediante `rc_cgroup_controllers`; el resto queda disponible para v1. | Soporte simultáneo v1/v2 si el kernel/distro lo permite. |
| Modo `legacy` | cgroups v1 | Monta v1 en `/sys/fs/cgroup`. | `CONFIG_CGROUPS` y controladores v1. |
| Modo `unified` | cgroups v2 | Monta v2 en `/sys/fs/cgroup`. | `CONFIG_CGROUPS` y cgroup v2. |
| Limpieza de servicios | `cgroup.kill` si existe; si no, lectura de procesos en cgroup + señales | Para `rc_cgroup_cleanup`, OpenRC usa `cgroup.kill` si el kernel lo proporciona; si falla, envía señales a los procesos restantes. | Kernel con `cgroup.kill` para limpieza fiable; de lo contrario, señales POSIX normales. |
| Límites por servicio v2 | Ficheros de control bajo cgroup2, por ejemplo `memory.max`, `pids.max` | `rc_cgroup_settings` permite escribir pares setting/valor por servicio. | Controladores cgroup2 correspondientes. |
| Límites por servicio v1 | Ficheros de control de cada controlador v1 | Variables `rc_cgroup_cpu`, `rc_cgroup_memory`, `rc_cgroup_pids`, etc. | Controladores v1 correspondientes. |

## 4. Gestión de procesos y servicios

| Funcionalidad | API/interfaz del kernel | Herramienta OpenRC | Configuración/soporte asociado |
|---|---|---|---|
| Lanzar servicios | `fork()`/`execve()` vía libc; shell POSIX; redirecciones de fd | `openrc-run`, `start-stop-daemon`, `supervise-daemon` | Procesos Unix básicos; filesystem ejecutable; libc |
| Parar servicios | señales POSIX: `SIGTERM`, `SIGKILL`, `SIGHUP`, señales configurables | `start-stop-daemon`, `supervise-daemon`, scripts de servicio | Señales POSIX |
| Esperar procesos | `wait*()`/recolección de hijos | `openrc-init`, `supervise-daemon`, `start-stop-daemon` | Semántica normal de procesos Unix |
| PID files | filesystem en `/run` o `/var/run` | `start-stop-daemon`, scripts | `/run` escribible; tmpfs recomendado |
| Supervisión con reinicio | bucle de supervisión, señales, espera de hijos | `supervise-daemon` | APIs POSIX de procesos y señales |
| Cambio de usuario/grupo | `setuid()`, `setgid()`, `setgroups()`, NSS/PAM si aplica | `start-stop-daemon`, `supervise-daemon` | Usuarios/grupos funcionales; libc/NSS; PAM opcional |
| `chroot` | `chroot(2)` | `start-stop-daemon`, `supervise-daemon` | `CONFIG_CHROOT` no suele ser opción separada en kernels modernos; syscall disponible |
| Directorio de trabajo | `chdir(2)` | `start-stop-daemon`, `supervise-daemon` | POSIX básico |
| Prioridad CPU | `nice(2)`/`setpriority(2)` | `SSD_NICELEVEL`, `--nicelevel` | Planificador normal del kernel |
| Prioridad I/O | `ioprio_set` vía interfaz Linux | `SSD_IONICELEVEL`, `--ionice` | Soporte Linux de I/O priority; depende del scheduler de I/O |
| OOM score | Escritura en `/proc/<pid>/oom_score_adj` | `SSD_OOM_SCORE_ADJ`, `--oom-score-adj` | `/proc`; soporte OOM score adjustment |
| Capabilities | `capset`, libcap, capability sets inheritable/ambient/bounding | `--capabilities` | `CONFIG_SECURITY`, `CONFIG_MULTIUSER`, capabilities Linux; `libcap` en userspace |
| Securebits | `prctl()`/securebits | `--secbits` | Soporte de securebits del kernel |
| No New Privs | `prctl(PR_SET_NO_NEW_PRIVS)` | `--no-new-privs` | Kernel con `PR_SET_NO_NEW_PRIVS` |
| Notificación estilo systemd | socket datagram en `$NOTIFY_SOCKET` o pipe fd | `supervise-daemon --notify` | Sockets Unix; pipes/fds |

## 5. Módulos, sysctl y parámetros de kernel

| Funcionalidad | API/interfaz del kernel | Script OpenRC | Configuración de kernel asociada |
|---|---|---|---|
| Cargar módulos | `modprobe`; `/proc/modules`; módulos del kernel | `modules.in` | `CONFIG_MODULES`; `CONFIG_KMOD` si se depende de carga automática por kernel; `kmod` en userspace |
| Aplicar sysctl | `/proc/sys`; `sysctl --system` | `sysctl.in` | `CONFIG_PROC_SYSCTL`; `CONFIG_SYSCTL` según kernel |
| Registrar binfmt_misc | `/proc/sys/fs/binfmt_misc/register` | `procfs.in` | `CONFIG_BINFMT_MISC` |
| Guardar dmesg | `dmesg` lee buffer del kernel | `bootmisc.in` | `CONFIG_PRINTK`; permisos de `dmesg_restrict` si aplica |
| `fuser`/detección de sockets activos | `/proc`, inodos de sockets, procesos | `bootmisc.in` y herramientas externas | `CONFIG_PROC_FS`; red/sockets según caso |

## 6. Integraciones opcionales de compilación

| Opción OpenRC | Qué activa | Posible interacción con kernel |
|---|---|---|
| `audit` | Soporte de libaudit | `CONFIG_AUDIT`, subsistema audit del kernel, netlink audit |
| `selinux` | Soporte SELinux en OpenRC | `CONFIG_SECURITY_SELINUX`, selinuxfs, etiquetas y restorecon |
| `pam` | Módulo PAM y autostart de servicios de usuario | PAM es userspace, pero puede depender de sesión, credenciales, cgroups, tmpfs y `XDG_RUNTIME_DIR` |
| `sysvinit` | Compatibilidad con SysVinit, Linux only | Integración con `/sbin/init`/inittab; no añade por sí misma una API de kernel especial |
| `newnet` | Scripts de red de OpenRC | Interfaces de red del kernel vía herramientas externas como `ip`, `ifconfig`, DHCP, netlink/ioctl según configuración |

## 7. Lista consolidada de opciones CONFIG_* a comprobar

Esta lista no es una lista oficial upstream equivalente a la de systemd; es una lista práctica derivada de los scripts y documentación de OpenRC. Algunas opciones pueden llamarse distinto entre versiones del kernel o estar implícitas.

```text
CONFIG_PROC_FS
CONFIG_PROC_SYSCTL
CONFIG_SYSFS
CONFIG_DEVTMPFS
CONFIG_TMPFS
CONFIG_DEVPTS_FS
CONFIG_UNIX98_PTYS
CONFIG_POSIX_MQUEUE
CONFIG_CGROUPS
CONFIG_MEMCG
CONFIG_CGROUP_SCHED
CONFIG_FAIR_GROUP_SCHED
CONFIG_CFS_BANDWIDTH
CONFIG_CGROUP_PIDS
CONFIG_CPUSETS
CONFIG_BLK_CGROUP
CONFIG_CGROUP_DEVICE
CONFIG_CGROUP_HUGETLB
CONFIG_NET_CLS_CGROUP
CONFIG_NETPRIO_CGROUP
CONFIG_SECURITYFS
CONFIG_DEBUG_FS
CONFIG_TRACING
CONFIG_TRACEFS
CONFIG_CONFIGFS_FS
CONFIG_FUSE_FS
CONFIG_SECURITY_SELINUX
CONFIG_PSTORE
CONFIG_EFI
CONFIG_EFIVAR_FS
CONFIG_BPF
CONFIG_BPF_SYSCALL
CONFIG_BPF_FS
CONFIG_BINFMT_MISC
CONFIG_MODULES
CONFIG_KMOD
CONFIG_PRINTK
CONFIG_AUDIT
```

## 8. Checklist de validación en una máquina RISC-V/Linux con OpenRC

```sh
# Versión y modo general
openrc --version
rc-status
rc-status -a

# Pseudo-fs fundamentales
mount | grep -E 'proc|sysfs|devtmpfs|tmpfs|devpts|cgroup|cgroup2'
cat /proc/filesystems

# Cgroups
cat /proc/cgroups 2>/dev/null || true
findmnt /sys/fs/cgroup
ls -la /sys/fs/cgroup
[ -e /sys/fs/cgroup/cgroup.controllers ] && cat /sys/fs/cgroup/cgroup.controllers
[ -e /sys/fs/cgroup/cgroup.kill ] && echo 'cgroup.kill disponible'

# Kernel config, si está disponible
zgrep -E 'CONFIG_(PROC_FS|PROC_SYSCTL|SYSFS|DEVTMPFS|TMPFS|DEVPTS_FS|CGROUPS|MEMCG|CGROUP_PIDS|BPF|BPF_SYSCALL|BPF_FS|MODULES|KMOD|SECURITY_SELINUX|AUDIT)' /proc/config.gz

# Servicios OpenRC importantes
rc-service devfs status
rc-service sysfs status
rc-service procfs status
rc-service cgroups status
rc-service modules status
rc-service sysctl status

# Pruebas de arranque/parada/supervisión
rc-service <servicio> start
rc-service <servicio> status
rc-service <servicio> stop
```

## 9. Diferencia clave frente a systemd

OpenRC interactúa bastante con el kernel, pero lo hace de forma más clásica y modular que systemd. La mayor parte del contrato con el kernel pasa por:

1. pseudo-sistemas de ficheros (`/proc`, `/sys`, `/dev`, cgroups),
2. montaje de pseudo-fs,
3. gestión POSIX de procesos y señales,
4. cgroups opcionales para agrupar/limitar/limpiar servicios,
5. utilidades externas (`modprobe`, `sysctl`, `mount`, `dmesg`, `fuser`, herramientas de red),
6. capacidades, securebits y `no_new_privs` si se usan las opciones modernas de `start-stop-daemon`/`supervise-daemon`.

Por eso, para OpenRC, no necesita demostrar tantas APIs modernas como una instalación systemd completa, pero sí debe tener muy bien soportados `/proc`, `/sys`, `/dev`, cgroups, señales, procesos, módulos, sysctl y montajes tempranos.



* [Enlace al init OpenRC](https://github.com/OpenRC/openrc)
