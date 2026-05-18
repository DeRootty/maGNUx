> [⬆ Subir al índice CONFIG_*](README.md) · [🏠 Inicio](../README.md)

# Capacidades del kernel expuestas a un init PID 1

Este documento describe, de forma conceptual y técnica, el conjunto de capacidades que el kernel Linux puede exponer **en potencia** a cualquier init PID 1 que un desarrollador se proponga implementar.

La hipótesis de trabajo es deliberadamente extrema:

```text
¿Y si diseñamos un init plenamente dependiente del kernel,
capaz de explotar todas las superficies modernas que Linux ofrece,
aunque eso viole parcialmente la filosofía Unix clásica de herramientas pequeñas,
separadas y poco acopladas?
```

El objetivo no es recomendar que un init deba usarlo todo. El objetivo es separar con claridad:

1. **CONFIG de compilación**: capacidades anatómicas incluidas o no en el kernel.
2. **Interfaces de runtime**: syscalls, pseudo-filesystems, objetos, eventos y recursos que existen cuando el kernel ya está ejecutándose.
3. **Contrato PID 1**: lo que un init podría exigir, probar, usar o rechazar durante el arranque.

---

## 1. Principio base

Un símbolo `CONFIG_*` no es una llamada al kernel.

Un init PID 1 no llama directamente a:

```text
CONFIG_CGROUPS
CONFIG_PROC_FS
CONFIG_BPF
CONFIG_SECCOMP
```

Lo que hace el init es llamar o abrir interfaces de runtime que existen porque el kernel fue compilado con ciertas capacidades.

La relación correcta es:

```text
CONFIG_*  → capacidad compilada
syscall   → puerta de entrada
objeto    → recurso kernel gestionable
fs virtual → interfaz de observación/control
PID 1     → verificador y consumidor del contrato
```

Ejemplo:

```text
CONFIG_CGROUPS=y
        ↓
/sys/fs/cgroup existe
        ↓
PID 1 puede crear jerarquías, mover procesos, aplicar límites,
leer presión, matar grupos o definir unidades de ejecución.
```

---

## 2. Capas de exposición kernel → PID 1

Un init puede interactuar con el kernel a través de varias capas:

| Capa | Ejemplos | Uso para PID 1 |
|---|---|---|
| Syscalls | `clone`, `execve`, `mount`, `reboot`, `bpf`, `pidfd_open` | Crear procesos, montar sistemas, aislar, reiniciar, controlar. |
| Pseudo-filesystems | `/proc`, `/sys`, `/dev`, `/run`, `/sys/fs/cgroup` | Observar y modificar estado del sistema. |
| Objetos kernel | PID, fd, socket, mount, namespace, cgroup, keyring, bpf program | Recursos vivos que pueden gestionarse. |
| Eventos | netlink, uevents, signals, inotify, fanotify, epoll | Reaccionar al sistema en tiempo real. |
| Políticas | LSM, seccomp, capabilities, audit, namespaces | Restringir o legitimar ejecución. |
| Firmware/plataforma | EFI, ACPI, DMI, device tree, TPM | Arranque, plataforma, identidad, medición. |
| Recursos | CPU, memoria, IO, red, energía, dispositivos | Administración material de la máquina. |

---

## 3. Grados de dependencia posibles

No todos los init usan igual el kernel.

| Grado | Descripción | Ejemplo conceptual |
|---|---|---|
| Bajo | Usa procesos, señales, scripts y consola. | `sysVinit`, `runit` en modo simple. |
| Medio | Añade dependencias, supervisión y coordinación, pero delega mucho. | `OpenRC`, `dinit`. |
| Alto | Usa cgroups, namespaces, eventos, políticas, udev, BPF y runtime rico. | `systemd`. |
| Máximo | Diseña PID 1 como verificador soberano de contrato kernel. | Hipótesis maGNUx-init extremo. |

Este documento se centra en el caso **máximo**.

---

## 4. Base mínima de proceso y ejecución

Todo init PID 1 necesita interactuar con la mecánica básica de procesos.

### CONFIG representativos

```text
CONFIG_PROC_FS
CONFIG_FHANDLE
CONFIG_EPOLL
CONFIG_SIGNALFD
CONFIG_TIMERFD
CONFIG_EVENTFD
CONFIG_ANON_INODES
CONFIG_CHECKPOINT_RESTORE
CONFIG_PROC_CHILDREN
CONFIG_PROC_PID_CPUSET
```

### Syscalls y funciones relacionadas

```text
fork()
vfork()
clone()
clone3()
execve()
execveat()
wait()
waitpid()
waitid()
exit()
_exit()
kill()
tgkill()
rt_sigaction()
rt_sigprocmask()
prctl()
setpgid()
setsid()
getpid()
getppid()
gettid()
```

### Objetos de runtime

```text
PID
TID
process group
session
exit status
signal
file descriptor
/proc/<pid>
/proc/<pid>/status
/proc/<pid>/fd
/proc/<pid>/cmdline
```

### Uso por PID 1

Un init puede:

```text
- lanzar servicios;
- reapadrinar procesos huérfanos;
- recolectar zombies;
- matar árboles de procesos;
- leer estado de procesos;
- declarar fallo si un proceso crítico muere;
- aplicar contratos por proceso.
```

---

## 5. Pseudo-filesystems de observación y control

### CONFIG representativos

```text
CONFIG_PROC_FS
CONFIG_SYSFS
CONFIG_TMPFS
CONFIG_TMPFS_XATTR
CONFIG_TMPFS_POSIX_ACL
CONFIG_DEVTMPFS
CONFIG_DEVTMPFS_MOUNT
CONFIG_DEVPTS_FS
CONFIG_CONFIGFS_FS
CONFIG_SECURITYFS
CONFIG_DEBUG_FS
CONFIG_TRACEFS
```

### Interfaces de runtime

```text
/proc
/sys
/dev
/run
/sys/kernel
/sys/module
/sys/devices
/sys/class
/sys/fs
/sys/fs/cgroup
/sys/kernel/security
/sys/kernel/debug
/sys/kernel/tracing
```

### Uso por PID 1

Un init dependiente del kernel podría exigir:

```text
/proc montado y coherente
/sys montado y coherente
/dev disponible mediante devtmpfs o gestor externo
/run como tmpfs de runtime
cgroupfs disponible
securityfs disponible si se requieren LSM/IMA/EVM
tracefs/debugfs solo en perfiles diagnósticos
```

---

## 6. Montajes y namespace de ficheros

### CONFIG representativos

```text
CONFIG_TMPFS
CONFIG_TMPFS_XATTR
CONFIG_TMPFS_POSIX_ACL
CONFIG_AUTOFS_FS
CONFIG_OVERLAY_FS
CONFIG_FUSE_FS
CONFIG_CUSE
CONFIG_EXT4_FS
CONFIG_EXT4_FS_POSIX_ACL
CONFIG_XFS_FS
CONFIG_XFS_POSIX_ACL
CONFIG_BTRFS_FS
CONFIG_FANOTIFY
CONFIG_FSNOTIFY
CONFIG_INOTIFY_USER
CONFIG_FHANDLE
```

### Syscalls y APIs

```text
mount()
umount2()
pivot_root()
chroot()
open_tree()
move_mount()
fsopen()
fsconfig()
fsmount()
fspick()
mount_setattr()
name_to_handle_at()
open_by_handle_at()
statx()
fanotify_init()
inotify_init1()
```

### Objetos de runtime

```text
mount namespace
mount tree
superblock
vfsmount
file handle
inode
dentry
fs context
idmapped mount
```

### Uso por PID 1

Un init extremo podría:

```text
- montar /proc, /sys, /dev, /run;
- validar rootfs;
- pivotar de initramfs a root real;
- montar capas overlay;
- aplicar opciones de solo lectura;
- usar idmapped mounts;
- bloquear symlinks peligrosos;
- validar identificadores únicos de montaje;
- declarar panic si el contrato de montaje falla.
```

---

## 7. Cgroups y control material de servicios

### CONFIG representativos

```text
CONFIG_CGROUPS
CONFIG_CGROUP_SCHED
CONFIG_FAIR_GROUP_SCHED
CONFIG_CFS_BANDWIDTH
CONFIG_RT_GROUP_SCHED
CONFIG_CGROUP_PIDS
CONFIG_CGROUP_FREEZER
CONFIG_CGROUP_DEVICE
CONFIG_CGROUP_CPUACCT
CONFIG_CGROUP_PERF
CONFIG_CGROUP_BPF
CONFIG_BLK_CGROUP
CONFIG_MEMCG
CONFIG_MEMCG_SWAP
CONFIG_CGROUP_HUGETLB
CONFIG_CPUSETS
CONFIG_PROC_PID_CPUSET
CONFIG_PSI
```

### Interfaces de runtime

```text
/sys/fs/cgroup
/sys/fs/cgroup/cgroup.controllers
/sys/fs/cgroup/cgroup.subtree_control
/sys/fs/cgroup/cgroup.procs
/sys/fs/cgroup/cgroup.kill
/sys/fs/cgroup/cpu.max
/sys/fs/cgroup/memory.max
/sys/fs/cgroup/memory.current
/sys/fs/cgroup/pids.max
/sys/fs/cgroup/io.max
/proc/pressure/cpu
/proc/pressure/memory
/proc/pressure/io
```

### Objetos de runtime

```text
cgroup
controller
cgroup v2 hierarchy
process membership
resource limit
pressure stall information
```

### Uso por PID 1

Un init plenamente dependiente del kernel podría definir cada servicio como:

```text
servicio = proceso + cgroup + contrato de recursos + política de muerte + presión admisible
```

Capacidades posibles:

```text
- crear cgroup por servicio;
- mover procesos a cgroups;
- limitar CPU, memoria, IO y número de procesos;
- congelar servicios;
- matar cgroups completos;
- detectar presión de memoria/CPU/IO;
- aplicar políticas de OOM;
- asociar BPF a cgroups.
```

---

## 8. Namespaces y aislamiento

### CONFIG representativos

```text
CONFIG_NAMESPACES
CONFIG_UTS_NS
CONFIG_IPC_NS
CONFIG_USER_NS
CONFIG_PID_NS
CONFIG_NET_NS
CONFIG_TIME_NS
CONFIG_CGROUP_NS
```

### Syscalls y APIs

```text
clone()
clone3()
unshare()
setns()
ioctl(NS_GET_NSTYPE)
ioctl(NS_GET_PARENT)
```

### Objetos de runtime

```text
mnt namespace
pid namespace
net namespace
user namespace
ipc namespace
uts namespace
time namespace
cgroup namespace
/proc/<pid>/ns/*
```

### Uso por PID 1

Un init extremo podría:

```text
- crear servicios con red privada;
- crear servicios con PID namespace propio;
- aislar IPC;
- aislar hostname/domainname;
- aislar tiempo;
- asociar user namespaces a identidad de servicio;
- construir contenedores ligeros desde PID 1;
- rechazar servicios que pidan aislamiento no disponible.
```

---

## 9. Red, sockets y netlink

### CONFIG representativos

```text
CONFIG_NET
CONFIG_UNIX
CONFIG_INET
CONFIG_IPV6
CONFIG_PACKET
CONFIG_NETLINK_DIAG
CONFIG_NETFILTER
CONFIG_NF_TABLES
CONFIG_NET_SCHED
CONFIG_NET_SCH_FQ_CODEL
CONFIG_DUMMY
CONFIG_VETH
CONFIG_BRIDGE
CONFIG_TUN
CONFIG_NET_NS
CONFIG_CGROUP_BPF
```

### Syscalls y APIs

```text
socket()
bind()
listen()
accept4()
connect()
sendmsg()
recvmsg()
setsockopt()
getsockopt()
shutdown()
socketpair()
```

### Objetos de runtime

```text
AF_UNIX socket
AF_NETLINK socket
AF_INET socket
network namespace
interface
route
fib rule
nftables ruleset
veth pair
tun/tap device
```

### Uso por PID 1

Un init dependiente del kernel podría:

```text
- crear sockets de activación;
- exponer IPC local;
- escuchar uevents por netlink;
- configurar red temprana;
- crear veth/tun para servicios;
- aislar servicios en net namespaces;
- aplicar filtros de red por cgroup/BPF;
- bloquear interfaces a servicios.
```

---

## 10. Dispositivos, uevents y hardware visible

### CONFIG representativos

```text
CONFIG_HOTPLUG
CONFIG_UEVENT_HELPER
CONFIG_UEVENT_HELPER_PATH
CONFIG_DEVTMPFS
CONFIG_DEVTMPFS_MOUNT
CONFIG_SYSFS
CONFIG_PROC_FS
CONFIG_FW_LOADER
CONFIG_FW_LOADER_USER_HELPER
CONFIG_BLK_DEV
CONFIG_BLK_DEV_BSG
CONFIG_DMI
CONFIG_DMIID
CONFIG_DMI_SYSFS
```

### Interfaces de runtime

```text
/sys/devices
/sys/class
/sys/block
/sys/bus
/dev
/dev/disk
uevents
netlink KOBJECT_UEVENT
```

### Objetos de runtime

```text
device
bus
driver
class
block device
char device
major/minor
uevent
firmware request
```

### Uso por PID 1

Un init extremo podría:

```text
- esperar dispositivos críticos;
- validar discos antes de montar;
- asociar identidad de hardware al contrato de arranque;
- reaccionar a hotplug;
- delegar o absorber funciones de udev;
- iniciar servicios según presencia de hardware;
- bloquear arranque si falta un recurso material obligatorio.
```

---

## 11. Seguridad, credenciales y autoridad

### CONFIG representativos

```text
CONFIG_KEYS
CONFIG_PERSISTENT_KEYRINGS
CONFIG_SECURITY
CONFIG_SECURITYFS
CONFIG_SECURITY_NETWORK
CONFIG_SECURITY_PATH
CONFIG_LSM
CONFIG_SECCOMP
CONFIG_SECCOMP_FILTER
CONFIG_AUDIT
CONFIG_AUDITSYSCALL
CONFIG_INTEGRITY
CONFIG_IMA
CONFIG_EVM
CONFIG_CAPABILITIES
```

### Syscalls y APIs

```text
capget()
capset()
keyctl()
add_key()
request_key()
prctl()
seccomp()
setresuid()
setresgid()
setgroups()
setfsuid()
setfsgid()
getxattr()
setxattr()
removexattr()
```

### Objetos de runtime

```text
capability set
ambient capabilities
bounding set
keyring
LSM label
securityfs
IMA measurement
EVM metadata
seccomp filter
audit event
```

### Uso por PID 1

Un init dependiente del kernel podría:

```text
- definir identidad de servicio por capabilities;
- cargar filtros seccomp;
- exigir LSM activo;
- validar medidas IMA;
- usar keyrings para credenciales tempranas;
- definir políticas de autoridad por servicio;
- fallar si un servicio pide privilegios fuera de contrato.
```

---

## 12. BPF, eBPF y programas cargables en kernel

### CONFIG representativos

```text
CONFIG_BPF
CONFIG_BPF_SYSCALL
CONFIG_BPF_JIT
CONFIG_HAVE_EBPF_JIT
CONFIG_BPF_EVENTS
CONFIG_CGROUP_BPF
CONFIG_BPF_LSM
CONFIG_DEBUG_INFO_BTF
CONFIG_DEBUG_INFO_BTF_MODULES
```

### Syscalls y APIs

```text
bpf()
perf_event_open()
```

### Objetos de runtime

```text
BPF program
BPF map
BPF link
BPF cgroup hook
BPF LSM hook
BTF type info
perf event
```

### Uso por PID 1

Un init extremo podría:

```text
- adjuntar BPF a cgroups de servicios;
- filtrar red por servicio;
- aplicar restricciones de filesystem;
- recolectar métricas;
- definir políticas cargables;
- usar BPF LSM como extensión de contrato;
- rechazar políticas si BTF/BPF no está disponible.
```

---

## 13. Memoria, presión y OOM

### CONFIG representativos

```text
CONFIG_MEMCG
CONFIG_MEMCG_SWAP
CONFIG_PSI
CONFIG_PSI_DEFAULT_DISABLED
CONFIG_SWAP
CONFIG_ZSWAP
CONFIG_ZRAM
CONFIG_COMPACTION
CONFIG_MMU
CONFIG_PROC_PAGE_MONITOR
CONFIG_CGROUP_HUGETLB
```

### Interfaces de runtime

```text
/proc/meminfo
/proc/vmstat
/proc/pressure/memory
/sys/fs/cgroup/memory.current
/sys/fs/cgroup/memory.max
/sys/fs/cgroup/memory.high
/sys/fs/cgroup/memory.events
/sys/fs/cgroup/memory.oom.group
```

### Objetos de runtime

```text
memory cgroup
pressure metrics
swap device
zram device
hugetlb cgroup
OOM event
```

### Uso por PID 1

Un init extremo podría:

```text
- definir memoria máxima por servicio;
- detectar presión antes del OOM;
- matar servicios según prioridad soberana;
- activar swap/zram;
- declarar servicios críticos no sacrificables;
- reiniciar servicios tras OOM controlado.
```

---

## 14. CPU, scheduler y afinidad

### CONFIG representativos

```text
CONFIG_SMP
CONFIG_SCHED_CORE
CONFIG_CGROUP_SCHED
CONFIG_FAIR_GROUP_SCHED
CONFIG_CFS_BANDWIDTH
CONFIG_RT_GROUP_SCHED
CONFIG_CPUSETS
CONFIG_NO_HZ
CONFIG_HZ_PERIODIC
CONFIG_PREEMPT
```

### Syscalls y APIs

```text
sched_setaffinity()
sched_getaffinity()
sched_setscheduler()
sched_getscheduler()
sched_setparam()
sched_getparam()
nice()
setpriority()
getpriority()
```

### Interfaces de runtime

```text
/proc/stat
/proc/schedstat
/sys/devices/system/cpu
/sys/fs/cgroup/cpu.max
/sys/fs/cgroup/cpu.weight
/sys/fs/cgroup/cpuset.cpus
```

### Uso por PID 1

Un init extremo podría:

```text
- asignar servicios a CPUs;
- aplicar cuotas de CPU;
- separar servicios críticos;
- usar afinidad por identidad de servicio;
- imponer políticas RT solo a servicios autorizados.
```

---

## 15. Almacenamiento, bloques e IO

### CONFIG representativos

```text
CONFIG_BLK_DEV
CONFIG_BLK_CGROUP
CONFIG_BLK_DEV_BSG
CONFIG_DM
CONFIG_DM_CRYPT
CONFIG_DM_VERITY
CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG
CONFIG_MD
CONFIG_EXT4_FS
CONFIG_XFS_FS
CONFIG_BTRFS_FS
CONFIG_F2FS_FS
CONFIG_VFAT_FS
CONFIG_NTFS3_FS
CONFIG_IO_URING
```

### Syscalls y APIs

```text
open()
read()
write()
pread64()
pwrite64()
ioctl()
sync()
fsync()
fdatasync()
syncfs()
fallocate()
copy_file_range()
splice()
io_uring_setup()
io_uring_enter()
io_uring_register()
```

### Interfaces de runtime

```text
/sys/block
/dev/disk/by-uuid
/dev/mapper
/proc/mounts
/proc/self/mountinfo
/sys/fs/cgroup/io.max
/sys/fs/cgroup/io.stat
```

### Uso por PID 1

Un init extremo podría:

```text
- desbloquear volúmenes;
- validar rootfs;
- aplicar cuotas de IO por servicio;
- montar sistemas de ficheros según contrato;
- verificar imágenes Verity;
- coordinar fsck;
- rechazar discos no esperados.
```

---

## 16. Firmware, plataforma y raíz de confianza

### CONFIG representativos

```text
CONFIG_EFI
CONFIG_EFI_STUB
CONFIG_EFI_PARTITION
CONFIG_EFIVAR_FS
CONFIG_DMI
CONFIG_DMIID
CONFIG_DMI_SYSFS
CONFIG_ACPI
CONFIG_OF
CONFIG_OF_EARLY_FLATTREE
CONFIG_TCG_TPM
CONFIG_TCG_TIS
CONFIG_TCG_CRB
CONFIG_INTEGRITY_MACHINE_KEYRING
CONFIG_IMA_ARCH_POLICY
```

### Interfaces de runtime

```text
/sys/firmware/efi
/sys/firmware/acpi
/sys/firmware/devicetree
/sys/class/tpm
/sys/devices/virtual/dmi/id
/sys/kernel/security/ima
```

### Objetos de runtime

```text
EFI variable
ACPI table
Device Tree node
TPM device
PCR
DMI field
platform keyring
MOK/DB keys
```

### Uso por PID 1

Un init extremo podría:

```text
- validar plataforma;
- leer identidad de firmware;
- comprobar TPM;
- medir estado de arranque;
- comprobar claves de plataforma;
- distinguir host autorizado de host no autorizado;
- bloquear transición si el hardware no cumple contrato.
```

---

## 17. Reboot, apagado, kexec e hibernación

### CONFIG representativos

```text
CONFIG_REBOOT
CONFIG_KEXEC
CONFIG_KEXEC_FILE
CONFIG_KEXEC_SIG
CONFIG_HIBERNATION
CONFIG_PM
CONFIG_PM_SLEEP
CONFIG_SUSPEND
CONFIG_PM_AUTOSLEEP
```

### Syscalls y APIs

```text
reboot()
kexec_load()
kexec_file_load()
sync()
syncfs()
```

### Interfaces de runtime

```text
/sys/power/state
/sys/power/disk
/sys/power/resume
/sys/power/resume_offset
/proc/sys/kernel/panic
/proc/sysrq-trigger
```

### Uso por PID 1

Un init extremo podría:

```text
- controlar apagado ordenado;
- sincronizar discos;
- reiniciar según política;
- saltar a otro kernel mediante kexec;
- suspender/hibernar;
- declarar panic si el contrato de apagado falla.
```

---

## 18. Consola, TTY y login temprano

### CONFIG representativos

```text
CONFIG_TTY
CONFIG_VT
CONFIG_VT_CONSOLE
CONFIG_UNIX98_PTYS
CONFIG_LEGACY_PTYS
CONFIG_SERIAL_8250
CONFIG_SERIAL_8250_CONSOLE
CONFIG_HW_CONSOLE
```

### Interfaces de runtime

```text
/dev/console
/dev/tty
/dev/tty0
/dev/ttyS0
/dev/pts
/sys/class/tty
```

### Uso por PID 1

Un init extremo podría:

```text
- abrir consola temprana;
- lanzar getty;
- ofrecer shell de rescate;
- controlar sesiones;
- distinguir consola física, serial o virtual;
- exigir consola segura para administración temprana.
```

---

## 19. Auditoría, trazas y diagnóstico

### CONFIG representativos

```text
CONFIG_AUDIT
CONFIG_AUDITSYSCALL
CONFIG_TRACEPOINTS
CONFIG_FTRACE
CONFIG_FUNCTION_TRACER
CONFIG_KPROBES
CONFIG_UPROBES
CONFIG_PERF_EVENTS
CONFIG_DEBUG_FS
CONFIG_TRACEFS
```

### Syscalls y APIs

```text
perf_event_open()
bpf()
ptrace()
```

### Interfaces de runtime

```text
/sys/kernel/tracing
/sys/kernel/debug
/proc/kallsyms
/proc/sys/kernel
```

### Uso por PID 1

Un init extremo podría:

```text
- activar diagnóstico temprano;
- recolectar fallos de servicios;
- auditar transiciones de contrato;
- medir latencias de arranque;
- exponer trazas controladas;
- bloquear debugfs/tracefs en modo producción.
```

---

## 20. Módulos, firmware y extensión dinámica

### CONFIG representativos

```text
CONFIG_MODULES
CONFIG_MODULE_UNLOAD
CONFIG_MODVERSIONS
CONFIG_KMOD
CONFIG_FW_LOADER
CONFIG_FW_LOADER_USER_HELPER
CONFIG_MODULE_SIG
CONFIG_MODULE_SIG_FORCE
```

### Syscalls y APIs

```text
init_module()
finit_module()
delete_module()
```

### Interfaces de runtime

```text
/proc/modules
/sys/module
/lib/modules/<kernel>
/lib/firmware
```

### Uso por PID 1

Un init extremo podría:

```text
- cargar módulos críticos;
- prohibir módulos no firmados;
- validar firmware;
- declarar módulos obligatorios;
- bloquear descarga de módulos;
- separar perfil estático frente a perfil dinámico.
```

---

## 21. Tabla de contrato máximo PID 1

| Dominio | CONFIG clave | Runtime | Riesgo si falta |
|---|---|---|---|
| Procesos | `CONFIG_PROC_FS` | `/proc`, PID, señales | No hay observación fiable de procesos. |
| Eventos | `CONFIG_EPOLL`, `CONFIG_SIGNALFD`, `CONFIG_TIMERFD` | fd/event loop | Init moderno pierde reactividad. |
| Dispositivos | `CONFIG_DEVTMPFS`, `CONFIG_SYSFS` | `/dev`, `/sys` | No hay descubrimiento temprano coherente. |
| Cgroups | `CONFIG_CGROUPS` | `/sys/fs/cgroup` | No hay control material por servicio. |
| Memoria | `CONFIG_MEMCG`, `CONFIG_PSI` | memory cgroup, PSI | No hay control fino de presión/OOM. |
| Namespaces | `CONFIG_NAMESPACES` | `/proc/<pid>/ns` | No hay aislamiento por servicio. |
| Seguridad | `CONFIG_SECCOMP`, `CONFIG_LSM` | seccomp, securityfs | No hay reducción fuerte de superficie. |
| BPF | `CONFIG_BPF`, `CONFIG_CGROUP_BPF` | `bpf()`, maps, programs | No hay políticas kernel programables. |
| Montajes | `CONFIG_FHANDLE`, FS varios | mount API, mountinfo | No hay contrato robusto de filesystem. |
| Firmware | `CONFIG_EFI`, `CONFIG_DMI`, `CONFIG_TCG_TPM` | EFI/DMI/TPM | No hay identidad de plataforma fuerte. |
| Reboot | `CONFIG_KEXEC`, `CONFIG_PM` | reboot/kexec/sysfs power | No hay transición controlada de apagado. |
| Diagnóstico | `CONFIG_AUDIT`, `CONFIG_TRACEFS` | audit, tracefs | Menor trazabilidad del arranque. |

---

## 22. Fórmula conceptual para maGNUx-init extremo

Un init plenamente dependiente del kernel podría declararse como:

```text
maGNUx-init = PID 1 + verificador de contrato + administrador de objetos kernel
```

Donde el contrato sería:

```text
1. El kernel debe exponer órganos mínimos.
2. Cada órgano se comprueba en runtime.
3. Cada servicio se lanza solo si el contrato se cumple.
4. Cada recurso se asocia a identidad, cgroup, namespace y política.
5. Si el contrato falla, el sistema no arranca en modo soberano.
```

En términos anatómicos:

```text
CONFIG_*       = genoma compilado
syscall        = articulación funcional
pseudo-fs      = órgano visible
objeto kernel  = entidad viva administrable
PID 1          = conciencia contractual del arranque
```

---

## 23. Contradicción con la filosofía Unix

Este enfoque viola parcialmente la filosofía Unix clásica porque convierte PID 1 en una entidad muy potente.

La filosofía Unix favorece:

```text
herramientas pequeñas
composición
delegación
mínimo acoplamiento
interfaces simples
```

Un init plenamente dependiente del kernel favorece:

```text
contrato centralizado
validación fuerte
control de recursos
integración profunda
política temprana
identidad soberana del arranque
```

La tensión conceptual es real:

```text
menos Unix clásico,
más contrato soberano sobre el kernel.
```

---

## 24. Uso recomendado de este documento

Este documento debe usarse como mapa de diseño, no como lista cerrada.

Para construir un init real conviene separar perfiles:

| Perfil | Descripción |
|---|---|
| Mínimo | Procesos, señales, `/proc`, `/dev`, `/run`. |
| Supervisado | Añade control de servicios y reinicio. |
| Dependencial | Añade orden, dependencias y estados. |
| Aislado | Añade namespaces, capabilities y seccomp. |
| Material | Añade cgroups, memoria, CPU, IO y PSI. |
| Soberano | Añade TPM, IMA/EVM, BPF, auditoría y contrato de plataforma. |

---

## 25. Siguiente paso documental

El siguiente paso natural sería cruzar este documento con la carpeta:

```text
init_pid1/
```

para construir una matriz:

```text
capacidad kernel × init PID 1
```

Ejemplo:

| Capacidad | sysVinit | runit | OpenRC | dinit | systemd | maGNUx-init extremo |
|---|---|---|---|---|---|---|
| cgroups | bajo | bajo | bajo/medio | bajo/medio | alto | obligatorio |
| namespaces | bajo | bajo | bajo | bajo | alto | obligatorio según perfil |
| BPF/seccomp | muy bajo | muy bajo | bajo | bajo | alto | soberano/político |
| TPM/IMA | externo | externo | externo | externo | parcial | raíz de confianza |

---

> [⬆ Subir al índice CONFIG_*](README.md) · [🏠 Inicio](../README.md)
