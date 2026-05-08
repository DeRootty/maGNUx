> [inicio](README.md)

# Superficie del kernel expuesta a interaccion con init PID1
Lo incluido en .config representa el conjunto de capacidades sensibles que el kernel puede exponer. Un init con PID 1 no llama directamente a esos tags, sino a las interfaces que esas capacidades habilitan. Cada llamada puede devolver un valor, fallar con un error, generar un evento o provocar un cambio de estado en recursos controlados por el kernel, incluidos recursos de hardware cuando exista el driver correspondiente.

# Tags `CONFIG_*` potencialmente incluibles en `.config`

## Objetivo fijado

Este documento fija el análisis en:

- **Kernel:** Linux **6.18.25**
- **Arquitecturas:**
  - `ARCH=x86_64`
  - `ARCH=riscv`

La finalidad es obtener el universo de símbolos `CONFIG_*` potencialmente incluibles en un `.config`, separando:

1. el **bruto total** declarado por los ficheros `Kconfig` del árbol fuente;
2. el universo filtrado por **arquitectura x86_64**;
3. el universo filtrado por **arquitectura RISC-V**;
4. la configuración resultante tras aplicar un perfil base;
5. los símbolos relevantes para un init propio como `maGNUx-init`.

---

## 1. Aviso técnico importante

No existe una lista única y universal de todos los `CONFIG_*` válida para cualquier Linux.

Incluso fijando Linux **6.18.25**, el conjunto real depende de:

- arquitectura seleccionada;
- dependencias `depends on`;
- selecciones indirectas `select`;
- sugerencias `imply`;
- símbolos visibles o internos;
- plataforma concreta;
- drivers habilitados;
- toolchain usada;
- opciones base escogidas: `defconfig`, `allnoconfig`, `tinyconfig`, configuración de distribución, etc.

Por eso hay que distinguir:

| Nivel | Qué significa |
|---|---|
| Bruto del árbol | Todos los símbolos declarados en los `Kconfig` del código fuente. |
| Bruto por arquitectura | Símbolos alcanzables al cargar la arquitectura elegida. |
| Visible | Símbolos que aparecen en `menuconfig` porque sus dependencias permiten mostrarlos. |
| Seleccionable | Símbolos que se pueden activar manualmente. |
| Forzado | Símbolos activados por `select`. |
| Sugerido | Símbolos inducidos por `imply`. |
| Resultante | Lo que finalmente aparece en `.config`. |

---

## 2. Preparar el árbol Linux 6.18.25

Desde una máquina con `git`, `make`, `gcc`, `bc`, `flex`, `bison`, `openssl`, `elfutils` y herramientas básicas:

```bash
git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-6.18.25
cd linux-6.18.25
git checkout v6.18.25
```

Si la etiqueta `v6.18.25` no existe en tu remoto o tu mirror todavía no la tiene, comprueba etiquetas cercanas:

```bash
git tag -l 'v6.18*' | sort -V | tail -30
```

---

## 3. Extraer el bruto total de símbolos declarados en Kconfig

Este comando ignora arquitectura y extrae todos los símbolos `config` y `menuconfig` declarados en el árbol:

```bash
find . -name 'Kconfig*' -type f \
  -exec grep -hE '^[[:space:]]*(config|menuconfig)[[:space:]]+[A-Za-z0-9_]+' {} + \
  | awk '{print $2}' \
  | sort -u \
  | sed 's/^/CONFIG_/' \
  > linux-6.18.25-CONFIG-bruto-total.txt
```

Generar versión Markdown:

```bash
{
  echo '# Linux 6.18.25 - CONFIG bruto total'
  echo
  echo '```text'
  cat linux-6.18.25-CONFIG-bruto-total.txt
  echo '```'
} > linux-6.18.25-CONFIG-bruto-total.md
```

---

## 4. Extraer universo para `ARCH=x86_64`

### 4.1. Generar configuración mínima base

```bash
make mrproper
make ARCH=x86_64 allnoconfig
cp .config linux-6.18.25-x86_64-allnoconfig.config
```

### 4.2. Generar configuración por defecto de arquitectura

```bash
make mrproper
make ARCH=x86_64 defconfig
cp .config linux-6.18.25-x86_64-defconfig.config
```

### 4.3. Extraer símbolos resultantes activados y desactivados

```bash
grep -E '^CONFIG_|^# CONFIG_' linux-6.18.25-x86_64-defconfig.config \
  > linux-6.18.25-x86_64-defconfig-resultante.txt

grep -E '^CONFIG_.*=y|^CONFIG_.*=m' linux-6.18.25-x86_64-defconfig.config \
  > linux-6.18.25-x86_64-defconfig-activados.txt

grep -E '^# CONFIG_.* is not set' linux-6.18.25-x86_64-defconfig.config \
  > linux-6.18.25-x86_64-defconfig-desactivados.txt
```

### 4.4. Abrir menú para ver símbolos visibles

```bash
make ARCH=x86_64 menuconfig
```

---

## 5. Extraer universo para `ARCH=riscv`

### 5.1. Generar configuración mínima base

```bash
make mrproper
make ARCH=riscv allnoconfig
cp .config linux-6.18.25-riscv-allnoconfig.config
```

### 5.2. Generar configuración por defecto de arquitectura

```bash
make mrproper
make ARCH=riscv defconfig
cp .config linux-6.18.25-riscv-defconfig.config
```

### 5.3. Extraer símbolos resultantes activados y desactivados

```bash
grep -E '^CONFIG_|^# CONFIG_' linux-6.18.25-riscv-defconfig.config \
  > linux-6.18.25-riscv-defconfig-resultante.txt

grep -E '^CONFIG_.*=y|^CONFIG_.*=m' linux-6.18.25-riscv-defconfig.config \
  > linux-6.18.25-riscv-defconfig-activados.txt

grep -E '^# CONFIG_.* is not set' linux-6.18.25-riscv-defconfig.config \
  > linux-6.18.25-riscv-defconfig-desactivados.txt
```

### 5.4. Abrir menú para ver símbolos visibles

```bash
make ARCH=riscv menuconfig
```

---

## 6. Comparar x86_64 contra RISC-V

Una vez generados los ficheros de ambas arquitecturas:

```bash
comm -12 \
  <(grep -E '^CONFIG_' linux-6.18.25-x86_64-defconfig-activados.txt | cut -d= -f1 | sort -u) \
  <(grep -E '^CONFIG_' linux-6.18.25-riscv-defconfig-activados.txt | cut -d= -f1 | sort -u) \
  > CONFIG-comunes-x86_64-riscv.txt
```

Símbolos activados en x86_64 pero no en RISC-V:

```bash
comm -23 \
  <(grep -E '^CONFIG_' linux-6.18.25-x86_64-defconfig-activados.txt | cut -d= -f1 | sort -u) \
  <(grep -E '^CONFIG_' linux-6.18.25-riscv-defconfig-activados.txt | cut -d= -f1 | sort -u) \
  > CONFIG-solo-x86_64.txt
```

Símbolos activados en RISC-V pero no en x86_64:

```bash
comm -13 \
  <(grep -E '^CONFIG_' linux-6.18.25-x86_64-defconfig-activados.txt | cut -d= -f1 | sort -u) \
  <(grep -E '^CONFIG_' linux-6.18.25-riscv-defconfig-activados.txt | cut -d= -f1 | sort -u) \
  > CONFIG-solo-riscv.txt
```

---

## 7. Símbolos relevantes para un init propio

Estos no son todos los símbolos de Linux 6.18.25. Son los símbolos que deberías mirar primero si vas a crear un init propio o un contrato de arranque para maGNUx.

### 7.1. Filesystems virtuales y base de arranque

```text
CONFIG_PROC_FS
CONFIG_SYSFS
CONFIG_TMPFS
CONFIG_TMPFS_POSIX_ACL
CONFIG_TMPFS_XATTR
CONFIG_DEVTMPFS
CONFIG_DEVTMPFS_MOUNT
CONFIG_DEVPTS_FS
CONFIG_CONFIGFS_FS
CONFIG_SECURITYFS
CONFIG_DEBUG_FS
```

### 7.2. Procesos, señales y eventos

```text
CONFIG_EPOLL
CONFIG_SIGNALFD
CONFIG_TIMERFD
CONFIG_EVENTFD
CONFIG_FHANDLE
CONFIG_ANON_INODES
CONFIG_CHECKPOINT_RESTORE
```

### 7.3. Cgroups

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
```

### 7.4. Namespaces

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

### 7.5. Seguridad, capacidades y aislamiento

```text
CONFIG_KEYS
CONFIG_PERSISTENT_KEYRINGS
CONFIG_SECURITY
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
```

### 7.6. BPF

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

### 7.7. Red y netlink

```text
CONFIG_NET
CONFIG_UNIX
CONFIG_INET
CONFIG_IPV6
CONFIG_NETLINK_DIAG
CONFIG_PACKET
CONFIG_NETFILTER
CONFIG_NF_TABLES
CONFIG_NET_SCHED
CONFIG_NET_SCH_FQ_CODEL
CONFIG_DUMMY
CONFIG_VETH
CONFIG_BRIDGE
CONFIG_TUN
```

### 7.8. Dispositivos y uevents

```text
CONFIG_HOTPLUG
CONFIG_UEVENT_HELPER
CONFIG_UEVENT_HELPER_PATH
CONFIG_FW_LOADER
CONFIG_FW_LOADER_USER_HELPER
CONFIG_BLK_DEV
CONFIG_BLK_DEV_BSG
CONFIG_DEVTMPFS
CONFIG_SYSFS
CONFIG_PROC_FS
```

### 7.9. Montajes y filesystem namespace

```text
CONFIG_AUTOFS_FS
CONFIG_OVERLAY_FS
CONFIG_TMPFS
CONFIG_TMPFS_XATTR
CONFIG_TMPFS_POSIX_ACL
CONFIG_EXT4_FS
CONFIG_EXT4_FS_POSIX_ACL
CONFIG_XFS_FS
CONFIG_XFS_POSIX_ACL
CONFIG_BTRFS_FS
CONFIG_BTRFS_FS_POSIX_ACL
CONFIG_FUSE_FS
CONFIG_CUSE
```

### 7.10. Memoria, presión y OOM

```text
CONFIG_MEMCG
CONFIG_PSI
CONFIG_PSI_DEFAULT_DISABLED
CONFIG_SWAP
CONFIG_ZSWAP
CONFIG_ZRAM
CONFIG_COMPACTION
CONFIG_MMU
CONFIG_PROC_PAGE_MONITOR
```

### 7.11. Reboot, kexec y apagado

```text
CONFIG_KEXEC
CONFIG_KEXEC_FILE
CONFIG_KEXEC_SIG
CONFIG_HIBERNATION
CONFIG_PM
CONFIG_PM_SLEEP
CONFIG_REBOOT
```

### 7.12. Consola, TTY y login temprano

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

### 7.13. Arquitectura, firmware y plataforma

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
CONFIG_RISCV
CONFIG_X86_64
```

---

## 8. Contrato mínimo sugerido para maGNUx-init en Linux 6.18.25

### Requerido

```text
CONFIG_PROC_FS=y
CONFIG_SYSFS=y
CONFIG_DEVTMPFS=y
CONFIG_TMPFS=y
CONFIG_DEVPTS_FS=y
CONFIG_CGROUPS=y
CONFIG_NAMESPACES=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_USER_NS=y
CONFIG_CGROUP_NS=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_UNIX=y
CONFIG_NET=y
CONFIG_FHANDLE=y
```

### Recomendado

```text
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
CONFIG_BPF=y
CONFIG_BPF_SYSCALL=y
CONFIG_CGROUP_BPF=y
CONFIG_BPF_LSM=y
CONFIG_MEMCG=y
CONFIG_PSI=y
CONFIG_KEYS=y
CONFIG_SECURITY=y
CONFIG_AUDIT=y
```

### Según diseño

```text
CONFIG_EFI
CONFIG_EFIVAR_FS
CONFIG_KEXEC
CONFIG_OVERLAY_FS
CONFIG_FUSE_FS
CONFIG_TUN
CONFIG_VETH
CONFIG_BRIDGE
CONFIG_NETFILTER
CONFIG_NF_TABLES
CONFIG_IMA
CONFIG_EVM
CONFIG_ACPI
CONFIG_OF
```

---

## 9. Script único para generar todo

Guarda esto como `extract-config-symbols-6.18.25.sh` dentro del árbol del kernel:

```bash
#!/usr/bin/env bash
set -euo pipefail

KVER="6.18.25"

echo "[1/7] Extrayendo bruto total de Kconfig..."
find . -name 'Kconfig*' -type f \
  -exec grep -hE '^[[:space:]]*(config|menuconfig)[[:space:]]+[A-Za-z0-9_]+' {} + \
  | awk '{print $2}' \
  | sort -u \
  | sed 's/^/CONFIG_/' \
  > "linux-${KVER}-CONFIG-bruto-total.txt"

for ARCH in x86_64 riscv; do
  echo "[2/7] Procesando ARCH=${ARCH} allnoconfig..."
  make mrproper >/dev/null
  make ARCH="${ARCH}" allnoconfig >/dev/null
  cp .config "linux-${KVER}-${ARCH}-allnoconfig.config"

  echo "[3/7] Procesando ARCH=${ARCH} defconfig..."
  make mrproper >/dev/null
  make ARCH="${ARCH}" defconfig >/dev/null
  cp .config "linux-${KVER}-${ARCH}-defconfig.config"

  grep -E '^CONFIG_|^# CONFIG_' "linux-${KVER}-${ARCH}-defconfig.config" \
    > "linux-${KVER}-${ARCH}-defconfig-resultante.txt"

  grep -E '^CONFIG_.*=y|^CONFIG_.*=m' "linux-${KVER}-${ARCH}-defconfig.config" \
    > "linux-${KVER}-${ARCH}-defconfig-activados.txt"

  grep -E '^# CONFIG_.* is not set' "linux-${KVER}-${ARCH}-defconfig.config" \
    > "linux-${KVER}-${ARCH}-defconfig-desactivados.txt"
done

echo "[4/7] Comparando x86_64 y riscv..."
comm -12 \
  <(grep -E '^CONFIG_' "linux-${KVER}-x86_64-defconfig-activados.txt" | cut -d= -f1 | sort -u) \
  <(grep -E '^CONFIG_' "linux-${KVER}-riscv-defconfig-activados.txt" | cut -d= -f1 | sort -u) \
  > "linux-${KVER}-CONFIG-comunes-x86_64-riscv.txt"

comm -23 \
  <(grep -E '^CONFIG_' "linux-${KVER}-x86_64-defconfig-activados.txt" | cut -d= -f1 | sort -u) \
  <(grep -E '^CONFIG_' "linux-${KVER}-riscv-defconfig-activados.txt" | cut -d= -f1 | sort -u) \
  > "linux-${KVER}-CONFIG-solo-x86_64.txt"

comm -13 \
  <(grep -E '^CONFIG_' "linux-${KVER}-x86_64-defconfig-activados.txt" | cut -d= -f1 | sort -u) \
  <(grep -E '^CONFIG_' "linux-${KVER}-riscv-defconfig-activados.txt" | cut -d= -f1 | sort -u) \
  > "linux-${KVER}-CONFIG-solo-riscv.txt"

echo "[5/7] Generando resumen Markdown..."
{
  echo "# Linux ${KVER} - CONFIG x86_64 vs RISC-V"
  echo
  echo "## Bruto total"
  echo
  echo "Total símbolos declarados en Kconfig: $(wc -l < linux-${KVER}-CONFIG-bruto-total.txt)"
  echo
  echo "## x86_64 defconfig"
  echo
  echo "Activados: $(wc -l < linux-${KVER}-x86_64-defconfig-activados.txt)"
  echo "Desactivados: $(wc -l < linux-${KVER}-x86_64-defconfig-desactivados.txt)"
  echo
  echo "## RISC-V defconfig"
  echo
  echo "Activados: $(wc -l < linux-${KVER}-riscv-defconfig-activados.txt)"
  echo "Desactivados: $(wc -l < linux-${KVER}-riscv-defconfig-desactivados.txt)"
  echo
  echo "## Comparativa"
  echo
  echo "Comunes activados: $(wc -l < linux-${KVER}-CONFIG-comunes-x86_64-riscv.txt)"
  echo "Solo x86_64 activados: $(wc -l < linux-${KVER}-CONFIG-solo-x86_64.txt)"
  echo "Solo RISC-V activados: $(wc -l < linux-${KVER}-CONFIG-solo-riscv.txt)"
} > "linux-${KVER}-resumen-CONFIG-x86_64-riscv.md"

echo "[6/7] Listo. Archivos generados:"
ls -1 linux-${KVER}-*.txt linux-${KVER}-*.config linux-${KVER}-*.md
```

Uso:

```bash
chmod +x extract-config-symbols-6.18.25.sh
./extract-config-symbols-6.18.25.sh
```

---

## 10. Fórmula conceptual

El `.config` no es una API.

El `.config` es el **genoma compilado del kernel**.

Tu init no invoca el genoma directamente. Tu init prueba órganos funcionales:

```text
/proc responde       → existe procfs
/sys responde        → existe sysfs
/dev responde        → existe devtmpfs/devfs operativo
timerfd_create() ok  → existe timerfd
signalfd() ok        → existe signalfd
/sys/fs/cgroup ok    → existe cgroupfs
cgroup.kill ok       → existe cgroup v2 moderno
```

Por tanto:

```text
CONFIG_* = potencial anatómico del kernel
API      = órgano funcional expuesto
init     = verificador de contrato
```

Para `maGNUx-init`:

```text
Si el kernel no presenta los órganos mínimos exigidos,
el contrato de arranque soberano no se cumple.
```

