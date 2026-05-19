# Capacitación sistémica en Zalty

> Puente técnico entre los nodos técnicos de Linux y la propuesta de nodos semióticos de maGNUx/Zalty.

[⬅ Volver al índice de Zalty](readme.md) · [Objetivos de Zalty](objetivos_zalty.md) · [Identidades de Zalty](identidades_zalty.md)

---

## 1. Propósito del documento

Este documento ocupa una posición intermedia dentro de la documentación inicial de Zalty.

Se sitúa entre:

```text
Objetivos de Zalty
→ define la intención general, la capa semiótica y el papel de la IA agente

Emergencia de identidades
→ explica cómo emergen root, admin y comm
```

La pieza que faltaba era explicar cómo aparece técnicamente el plano sobre el que `root` puede operar y cómo, a partir de ese plano, puede proponerse una nueva capacitación del sistema para habilitar nodos semióticos.

Por tanto, este documento explica:

```text
CONFIG_*
→ capacitación del kernel
→ código integrado en la compilación
→ capacidad técnica disponible
→ nodo técnico emergente
→ propuesta de nodo semiótico
→ emergencia de identidades root, admin y comm
```

---

## 2. Capacitación sistémica

En Zalty, llamamos capacitación sistémica al proceso por el cual una distribución declara, compila, activa y expone capacidades del sistema.

En Linux, muchas capacidades nacen antes del arranque del sistema vivo.

Nacen en la fase de configuración y compilación del kernel.

```text
Kconfig
→ define opciones posibles

.config
→ recoge las capacidades seleccionadas

kbuild
→ transforma esas decisiones en reglas de compilación

autoconf.h / auto.conf
→ exponen CONFIG_* al código C y a los Makefiles

compilación
→ integra o excluye código

runtime
→ aparecen capacidades y nodos técnicos
```

La capacitación sistémica comienza, por tanto, como una declaración previa de posibilidad.

Un sistema no puede exponer técnicamente una capacidad que no ha sido compilada, cargada o habilitada en alguna capa válida.

---

## 3. De Kconfig a .config

`Kconfig` define los símbolos configurables del kernel.

Estos símbolos suelen expresarse como `CONFIG_*`.

Pueden representar subsistemas, drivers, políticas, mecanismos de seguridad, sistemas de archivos, buses, interfaces o capacidades internas del kernel.

Ejemplos:

```text
CONFIG_PROC_FS
CONFIG_SYSFS
CONFIG_DEVTMPFS
CONFIG_EXT4_FS
CONFIG_NET
CONFIG_CGROUPS
CONFIG_NAMESPACES
CONFIG_SECURITY
CONFIG_MODULES
CONFIG_BPF
```

El archivo `.config` recoge el resultado concreto de esa selección.

Por ejemplo:

```text
CONFIG_PROC_FS=y
CONFIG_EXT4_FS=y
CONFIG_BTRFS_FS=m
# CONFIG_SECURITY_SELINUX is not set
```

Ese archivo no es solo una lista de preferencias.

Es una declaración técnica de capacitación del kernel.

---

## 4. Valores de capacitación: y, m, n

Muchos símbolos del kernel son de tipo `tristate`.

Esto permite tres estados básicos:

```text
y
→ built-in
→ la capacidad se integra dentro del kernel

m
→ module
→ la capacidad se compila como módulo cargable

n
→ disabled
→ la capacidad queda excluida
```

Traducción para Zalty:

```text
CONFIG_X=y
→ capacidad estructural del kernel
→ puede dar lugar a nodos técnicos constitutivos

CONFIG_X=m
→ capacidad dinámica
→ puede dar lugar a nodos técnicos si el módulo es cargado

CONFIG_X=n
→ capacidad ausente
→ no debería dar lugar a nodos técnicos propios de esa capacidad
```

Esta distinción es fundamental para diferenciar:

```text
capacidad estructural
capacidad dinámica
capacidad ausente
```

---

## 5. Archivos generados de interpretación técnica

El `.config` no es leído directamente por cada archivo fuente del kernel.

El sistema de build transforma `.config` en archivos generados.

Dos piezas importantes son:

```text
include/config/auto.conf
→ usado por kbuild y Makefiles

include/generated/autoconf.h
→ usado por el preprocesador C
```

La cadena técnica puede expresarse así:

```text
.config
→ archivos generados
→ macros CONFIG_*
→ Makefiles y preprocesador C
→ objetos compilados
→ kernel y módulos resultantes
```

Por tanto, la forma precisa de decirlo es:

```text
Las cabeceras no leen directamente .config.
El .config se transforma en cabeceras y archivos auxiliares generados.
Después, el compilador y el preprocesador ven macros CONFIG_* y compilan unas ramas u otras.
```

---

## 6. Cómo CONFIG_* condiciona la compilación

Un símbolo `CONFIG_*` puede condicionar la compilación en al menos dos planos.

### 6.1 En Makefiles

Ejemplo conceptual:

```make
obj-$(CONFIG_EXT4_FS) += ext4/
```

Lectura:

```text
CONFIG_EXT4_FS=y
→ ext4 se integra en el kernel

CONFIG_EXT4_FS=m
→ ext4 se compila como módulo

CONFIG_EXT4_FS=n
→ ext4 no se compila
```

### 6.2 En código C

Ejemplo conceptual:

```c
#ifdef CONFIG_PROC_FS
    /* código relacionado con procfs */
#endif
```

Lectura:

```text
si CONFIG_PROC_FS está definido,
esta rama de código puede entrar en la traducción a código objeto
```

Así, los `CONFIG_*` condicionan:

```text
qué fuentes se compilan
qué ramas internas se incluyen
qué objetos se generan
qué módulos existen
qué capacidades aparecen en runtime
```

---

## 7. De capacidad compilada a nodo técnico

Una capacidad compilada no siempre produce un nodo técnico inmediatamente.

Normalmente hace falta una cadena:

```text
CONFIG_* activado
+ código compilado
+ hardware o condición presente
+ driver o subsistema inicializado
+ filesystem/interfaz expuesta
+ espacio de usuario que lo monta o gestiona
= nodo técnico visible
```

Ejemplo:

```text
CONFIG_SYSFS=y
+ kobjects del kernel
+ sysfs montado en /sys
= nodos técnicos bajo /sys
```

Otro ejemplo:

```text
CONFIG_BLK_DEV_NVME=y o m
+ hardware NVMe presente
+ driver inicializado
+ devtmpfs/udev
= /dev/nvme0n1 y /sys/block/nvme0n1
```

Por tanto:

```text
El nodo técnico no aparece aislado.
Aparece como resultado de una capacitación previa y una activación en runtime.
```

---

## 8. Mapa inicial de nodos técnicos y CONFIG_*

### 8.1 /proc

Nodos técnicos:

```text
/proc
/proc/cpuinfo
/proc/meminfo
/proc/PID/status
/proc/sys
```

Configs relevantes:

```text
CONFIG_PROC_FS
CONFIG_PROC_SYSCTL
CONFIG_SYSCTL
CONFIG_TASKSTATS
```

Lectura semiótica futura:

```text
/proc
→ estado vivo del sistema
→ procesos, memoria, cmdline, módulos y parámetros ajustables
```

---

### 8.2 /sys

Nodos técnicos:

```text
/sys/devices
/sys/class
/sys/block
/sys/bus
/sys/module
```

Configs relevantes:

```text
CONFIG_SYSFS
CONFIG_HOTPLUG
CONFIG_DEVTMPFS
CONFIG_DEVTMPFS_MOUNT
```

Lectura semiótica futura:

```text
/sys
→ mapa de relaciones entre hardware, buses, drivers y clases
```

---

### 8.3 /dev

Nodos técnicos:

```text
/dev/nvme0n1
/dev/sda
/dev/input/event0
/dev/tty
/dev/random
```

Configs relevantes:

```text
CONFIG_DEVTMPFS
CONFIG_DEVTMPFS_MOUNT
CONFIG_BLK_DEV
CONFIG_INPUT
CONFIG_TTY
CONFIG_HW_RANDOM
```

Lectura semiótica futura:

```text
/dev
→ puntos de acceso imperativo a recursos materiales
```

---

### 8.4 Sistemas de archivos y montajes

Nodos técnicos:

```text
/
/boot
/boot/efi
/boot/metal
/home
/tmp
/proc
/sys
/dev
```

Configs relevantes:

```text
CONFIG_EXT4_FS
CONFIG_BTRFS_FS
CONFIG_XFS_FS
CONFIG_VFAT_FS
CONFIG_FAT_FS
CONFIG_TMPFS
CONFIG_PROC_FS
CONFIG_SYSFS
CONFIG_DEVTMPFS
CONFIG_OVERLAY_FS
CONFIG_FUSE_FS
```

Lectura semiótica futura:

```text
mountpoint
→ territorio lógico del sistema

/boot/metal
→ nodo semiótico soberano si tiene UUID, manifiesto y contrato
```

---

### 8.5 Red

Nodos técnicos:

```text
/sys/class/net/*
/proc/net
sockets
interfaces
rutas
firewall
```

Configs relevantes:

```text
CONFIG_NET
CONFIG_INET
CONFIG_IPV6
CONFIG_PACKET
CONFIG_UNIX
CONFIG_NETFILTER
CONFIG_NF_TABLES
CONFIG_BRIDGE
CONFIG_VLAN_8021Q
CONFIG_WIRELESS
CONFIG_CFG80211
CONFIG_MAC80211
```

Lectura semiótica futura:

```text
interfaz de red
→ capacidad comunicativa
→ exposición externa
→ contrato de red
→ zona de confianza
```

---

### 8.6 Procesos, cgroups y namespaces

Nodos técnicos:

```text
PID
/proc/PID
/sys/fs/cgroup
namespaces
signals
scheduler
```

Configs relevantes:

```text
CONFIG_MULTIUSER
CONFIG_CGROUPS
CONFIG_CGROUP_SCHED
CONFIG_CGROUP_PIDS
CONFIG_MEMCG
CONFIG_NAMESPACES
CONFIG_UTS_NS
CONFIG_IPC_NS
CONFIG_USER_NS
CONFIG_PID_NS
CONFIG_NET_NS
CONFIG_CGROUP_NS
CONFIG_TIME_NS
```

Lectura semiótica futura:

```text
proceso
→ entidad viva

cgroup
→ dominio administrativo

namespace
→ jurisdicción operativa
```

---

### 8.7 Seguridad e integridad

Nodos técnicos:

```text
capabilities
LSM
SELinux
AppArmor
Landlock
IMA
EVM
keyrings
audit
```

Configs relevantes:

```text
CONFIG_SECURITY
CONFIG_SECURITY_SELINUX
CONFIG_SECURITY_APPARMOR
CONFIG_SECURITY_LANDLOCK
CONFIG_INTEGRITY
CONFIG_IMA
CONFIG_EVM
CONFIG_KEYS
CONFIG_SECURITYFS
CONFIG_AUDIT
CONFIG_AUDITSYSCALL
```

Lectura semiótica futura:

```text
política de seguridad
→ contrato de acceso
→ sujeto, objeto, acción y legitimidad
```

---

### 8.8 Módulos del kernel

Nodos técnicos:

```text
/lib/modules/$(uname -r)/
/proc/modules
/sys/module/*
modprobe
insmod
rmmod
```

Configs relevantes:

```text
CONFIG_MODULES
CONFIG_MODULE_UNLOAD
CONFIG_MODVERSIONS
CONFIG_MODULE_SIG
CONFIG_MODULE_SIG_FORCE
CONFIG_MODULE_COMPRESS
```

Lectura semiótica futura:

```text
módulo
→ capacidad dinámica del kernel
→ carga, firma, contrato y traza
```

---

### 8.9 eBPF y trazado

Nodos técnicos:

```text
bpf()
bpffs
programas BPF
mapas BPF
hooks
tracefs
ftrace
perf
```

Configs relevantes:

```text
CONFIG_BPF
CONFIG_BPF_SYSCALL
CONFIG_BPF_JIT
CONFIG_CGROUP_BPF
CONFIG_BPF_EVENTS
CONFIG_XDP_SOCKETS
CONFIG_DEBUG_INFO_BTF
CONFIG_BPF_LSM
CONFIG_TRACEPOINTS
CONFIG_FTRACE
CONFIG_TRACING
CONFIG_PERF_EVENTS
CONFIG_TRACEFS
```

Lectura semiótica futura:

```text
BPF/tracing
→ sensor de actos imperativos
→ posible fuente de trazas declarativas
```

---

## 9. La emergencia de root desde nodos técnicos

La identidad `root` emerge de la existencia de nodos técnicos.

Si el kernel no habilita capacidades, no aparecen ciertos nodos técnicos.

Si no aparecen nodos técnicos, no existe superficie técnica sobre la que operar.

Por eso, `root` puede entenderse como la identidad que nace del sistema como máquina operable.

```text
CONFIG_*
→ capacidad técnica
→ nodo técnico
→ operación imperativa
→ emergencia de root
```

`root` no necesita que el nodo tenga significado semiótico.

Le basta con que el nodo pueda ser manipulado técnicamente.

```text
root
→ autoridad técnica
→ dominio imperativo
→ soberanía operativa
```

---

## 10. Propuesta de capacitación para nodos semióticos

La siguiente frontera de Zalty consiste en proponer una capacitación adicional.

No basta con que el kernel habilite nodos técnicos.

Zalty necesita que el sistema pueda declarar nodos semióticos.

Un nodo semiótico requiere, como mínimo:

```text
identidad
función
relación
contrato
firma
traza
estado
significado
```

La propuesta de capacitación sería:

```text
capacidad técnica del kernel
+ manifiesto semiótico
+ contrato de sistema
+ firma de estado
+ traza de actualización
+ relación con otros nodos
= nodo semiótico
```

Esta capacitación puede empezar en espacio de usuario mediante manifiestos, repositorios, contratos y herramientas de auditoría.

En fases futuras, podría apoyarse en capacidades del kernel como:

```text
CONFIG_SECURITY
CONFIG_IMA
CONFIG_EVM
CONFIG_AUDIT
CONFIG_BPF
CONFIG_TRACEFS
CONFIG_MODULE_SIG
CONFIG_KEYS
```

Estas capacidades no crean por sí solas nodos semióticos.

Pero ofrecen puntos de anclaje para medición, firma, auditoría, trazado y legitimidad.

---

## 11. De nodo técnico a nodo semiótico

La transformación puede expresarse así:

```text
nodo técnico
→ existe porque una capacidad técnica lo permitió

nodo semiótico
→ existe porque una declaración lo interpreta y legitima
```

Ejemplo:

```text
/dev/nvme0n1p2
```

Como nodo técnico:

```text
partición accesible por el sistema
```

Como nodo semiótico:

```text
partición FAT32 con UUID propio
montada en /boot/metal
contiene manifiestos de arranque
participa en el contrato soberano del sistema
```

La diferencia no está en la materia del nodo.

Está en su capacidad de declarar significado.

---

## 12. Emergencia de admin desde nodos semióticos

Si `root` nace de la capacidad técnica de operar nodos técnicos, `admin` nace de la capacidad declarativa de administrar nodos semióticos.

```text
nodo técnico
→ permite operación
→ emerge root

nodo semiótico
→ permite interpretación y administración declarativa
→ emerge admin
```

`admin` no es simplemente un root con otro nombre.

`admin` pertenece a otro plano.

```text
root
→ ¿puedo cambiar esto?

admin
→ ¿qué significa cambiar esto?
```

`admin` administra contratos, relaciones, trazas, versiones, legitimidad y coherencia.

---

## 13. Apertura hacia comm

La identidad `comm` queda como tercera identidad en desarrollo.

Su papel será dar dinamismo a las propiedades identitarias propuestas por maGNUx.

`comm` debe encargarse de:

```text
1. Establecer comunicación coherente entre nodos técnicos y nodos semióticos.

2. Mantener coherencia entre operación imperativa y lectura declarativa.

3. Gestionar el módulo de propiedades identitarias de maGNUx.
```

Así, la cadena completa queda:

```text
CONFIG_*
→ capacidad del kernel
→ nodo técnico
→ root
→ nodo semiótico
→ admin
→ coherencia comunicativa entre ambos planos
→ comm
```

---

## 14. Tesis de cierre

La capacitación sistémica permite explicar que maGNUx/Zalty no parte de una abstracción externa al sistema.

Parte de la propia realidad técnica de Linux.

```text
CONFIG_* es la semilla declarativa de una capacidad técnica.

La capacidad técnica permite la emergencia del nodo técnico.

El nodo técnico permite la emergencia de root.

La declaración semiótica permite transformar el nodo técnico en nodo semiótico.

El nodo semiótico permite la emergencia de admin.

La comunicación coherente entre ambos planos abre el camino para comm.
```

Por tanto:

```text
Linux permite operar.
Zalty pretende declarar significado.
maGNUx pretende mantener coherencia entre operación, significado e identidad.
```

---

[⬅ Volver al índice de Zalty](readme.md) · [Objetivos de Zalty](objetivos_zalty.md) · [Identidades de Zalty](identidades_zalty.md)
