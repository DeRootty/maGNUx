# Fases de implementación de Zalty OS

Este documento declara la intención de desarrollo por fases de Zalty OS como distribución GNU/Linux de referencia para maGNUx.

La finalidad de esta hoja de ruta es separar con claridad lo que se puede demostrar hoy, sin modificar el kernel Linux, de lo que en fases posteriores deberá madurar hacia integración estructural, semiótica viva y nodos kernelizados.

## Principio general

Zalty OS no comienza sustituyendo Linux ni modificando directamente el kernel.

Zalty OS comienza aprovechando un kernel Linux preexistente, un initramfs generado mediante dracut y una partición semiótica `/boot/metal/` para demostrar la correspondencia entre nodos técnicos y nodos semióticos durante el arranque temprano.

La formulación base es:

```text
/boot/metal
    declara contratos semióticos persistentes

/
    raíz de nodos técnicos kernelizados

/run/maGNUx
    raíz semiótica viva transicional, compatible con Linux tradicional

/upLoad
    futura raíz de nodos semióticos kernelizados
```

Durante las fases iniciales se usará `/run/maGNUx` para conservar compatibilidad con Linux/Unix tradicional. Cuando el modelo madure, la función semiótica viva atribuida provisionalmente a `/run/maGNUx` migrará hacia `/upLoad`.

## Fase 1 — Initramfs semiótico live compatible

### Estado

Experimental.

### Objetivo

Demostrar que un kernel Linux estándar puede participar en una arquitectura semiótica sin ser modificado, mediante un initramfs que:

1. arranca sobre un sistema Linux existente;
2. monta los espacios técnicos mínimos del arranque temprano;
3. localiza o simula `/boot/metal/`;
4. inventaría nodos técnicos expuestos por el kernel;
5. compara esos nodos con nodos semióticos declarados;
6. crea una raíz semiótica viva en `/run/maGNUx`;
7. entrega o no el control al sistema raíz según una política declarativa.

La fase 1 no pretende crear todavía una distribución completa. Pretende demostrar el puente:

```text
nodo técnico → nodo semiótico → contrato → estado → decisión de arranque
```

### Kernel e initramfs

En esta fase se usa un kernel Linux preexistente.

Dracut se ejecuta desde un sistema Linux ya levantado para generar un initramfs experimental que incluya el módulo de Zalty:

```text
zalty/initramfs/modules.d/90zalty-metal/
```

El initramfs resultante se carga después junto al kernel durante el siguiente arranque.

La secuencia conceptual es:

```text
firmware/UEFI
    ↓
bootloader
    ↓
kernel Linux preexistente
    ↓
initramfs generado por dracut
    ↓
90zalty-metal
    ↓
/run/maGNUx
    ↓
rootfs live o sistema raíz real
```

### Particiones de prueba

Para la variante live con almacenamiento real, Zalty fase 1 propone un layout mínimo y separado:

```text
p1  BOOT/EFI    FAT32    /boot/efi
p2  METAL       FAT32    /boot/metal
p3  ROOT-LIVE   ext4     /sysroot o /
```

Quedan fuera de esta fase particiones como:

```text
swap
/tmp separado
/home separado
/var separado
particiones de datos
```

La fase 1 debe ejecutarse primero sobre un dispositivo experimental:

```text
USB dedicado
disco virtual
imagen loop
```

No debe probarse inicialmente sobre el disco principal de una máquina.

### `/boot/metal/`

`/boot/metal/` actúa como raíz semiótica persistente.

No sustituye a `/boot/efi` ni a `/`.

Su función es declarar contratos, nodos, políticas e identidades que permitan interpretar lo que Linux levanta técnicamente.

Ejemplo de estructura inicial:

```text
/boot/metal/
├── contracts/
│   └── dev.toml
├── nodes/
│   └── dev/
│       ├── essential.toml
│       ├── storage.toml
│       └── authority.toml
└── policies/
```

### `/run/maGNUx/`

`/run/maGNUx/` actúa como raíz semiótica viva transicional.

Es equivalente conceptualmente a la raíz técnica `/`, pero situada en el plano semiótico-runtime y mantenida en compatibilidad con Linux tradicional.

La relación queda definida así:

```text
/dev
    lado técnico dinámico de los nodos de dispositivo

/run/maGNUx/dev
    lado dinámico semiótico equivalente
```

Y de forma más general:

```text
/
    raíz técnica-operativa levantada por Linux

/run/maGNUx
    raíz semiótica-runtime levantada por Zalty en fase compatible
```

No debe ser una copia literal de `/`. Debe ser una estructura interpretativa.

Ejemplo:

```text
/run/maGNUx/dev/null/
├── technical -> /dev/null
├── semantic  -> /boot/metal/nodes/dev/essential.toml
├── state
└── report.toml
```

### `/upLoad/`

`/upLoad/` queda reservado como futura raíz de nodos semióticos kernelizados.

La distinción esencial es:

```text
/
    nodos técnicos kernelizados

/upLoad
    nodos semióticos kernelizados
```

Durante la fase 1, `/upLoad` no se implementa todavía. Su función queda ensayada de forma compatible en `/run/maGNUx`.

La frase guía es:

```text
/boot/metal declara.
/run/maGNUx ensaya.
/upLoad integra.
```

### Semiótica inicial de `/dev`

La fase 1 empieza por `/dev` porque es el catálogo técnico donde el kernel y devtmpfs/udev materializan nodos de dispositivo.

La semiótica inicial de `/dev` se declara en:

```text
zalty/initramfs/examples/boot-metal/contracts/dev.toml
zalty/initramfs/examples/boot-metal/nodes/dev/essential.toml
zalty/initramfs/examples/boot-metal/nodes/dev/storage.toml
zalty/initramfs/examples/boot-metal/nodes/dev/authority.toml
```

Nodos esenciales iniciales:

```text
/dev/null
/dev/zero
/dev/random
/dev/urandom
/dev/console
/dev/kmsg
```

Nodos de almacenamiento iniciales:

```text
dev.storage.metal
dev.storage.rootfs
dev.storage.boot_efi
```

Nodos de alta autoridad observados inicialmente:

```text
/dev/mem
/dev/kmem
/dev/port
/dev/kvm
/dev/fuse
/dev/net/tun
/dev/mapper/control
/dev/loop-control
```

### Herramientas iniciales

La fase 1 introduce el primer script técnico:

```text
zalty/initramfs/modules.d/90zalty-metal/metal-inventory
```

Su misión es producir un inventario técnico temprano de `/dev`, `/proc`, `/sys`, `/run`, kernel y almacenamiento.

Salida prevista:

```text
/run/metal/inventory/dev.toml
```

En fases inmediatas se añadirán:

```text
metal-check
    compara inventario técnico contra nodos semióticos declarados

metal-link
    crea la estructura viva /run/maGNUx

metal-report
    comunica el estado del arranque semiótico
```

### Administración mediante dracut

Los scripts administrativos para generar el initramfs experimental se alojan en:

```text
zalty/dev/dracut/
```

Flujo previsto:

```bash
chmod +x zalty/dev/dracut/*.sh

sudo zalty/dev/dracut/00-check-dracut-env.sh
sudo zalty/dev/dracut/10-install-zalty-dracut-module.sh
sudo zalty/dev/dracut/20-build-zalty-initramfs.sh
sudo zalty/dev/dracut/40-verify-zalty-initramfs.sh
```

Entrada GRUB opcional:

```bash
sudo zalty/dev/dracut/30-install-grub-test-entry.sh
```

Limpieza del módulo instalado:

```bash
sudo zalty/dev/dracut/90-uninstall-zalty-dracut-module.sh
```

### Entregables de la fase 1

La fase 1 deberá producir como mínimo:

```text
1. módulo dracut 90zalty-metal funcional;
2. initramfs generado con dracut;
3. inventario técnico generado durante arranque temprano;
4. contratos semióticos mínimos en /boot/metal;
5. raíz semiótica viva en /run/maGNUx;
6. primera correspondencia técnica-semiótica de /dev;
7. informe de estado del arranque semiótico.
```

### Estados previstos

La fase 1 manejará estados simples:

```text
OK
WARNING
DEGRADED
MAINTENANCE
BLOCKED
```

Significado inicial:

```text
OK
    todo lo esencial corresponde

WARNING
    existen diferencias no críticas

DEGRADED
    el sistema puede continuar, pero no cumple plenamente el contrato

MAINTENANCE
    se recomienda shell de mantenimiento

BLOCKED
    no debe entregarse el sistema operativo normal
```

### Fuera de alcance en fase 1

Queda fuera de la fase 1:

```text
modificar el kernel Linux
crear /upLoad como nodo kernelizado real
firmar criptográficamente todo el árbol
crear una distribución instalable completa
gestionar usuarios finales
crear swap, /home, /tmp o /var separados
implementar COMM completo
implementar Dernel/ZaltID completo
```

## Fase 2 — Correspondencia semiótica ampliada

Entrada futura.

Posibles líneas:

```text
/proc → /run/maGNUx/proc
/sys  → /run/maGNUx/sys
/boot → /run/maGNUx/boot
/etc  → /run/maGNUx/etc
```

## Fase 3 — Contratos de identidad y autoridad

Entrada futura.

Posibles líneas:

```text
host identity
distro identity
kernel identity
root/admin/comm
políticas de autoridad
```

## Fase 4 — Integración fuerte con arranque y almacenamiento

Entrada futura.

Posibles líneas:

```text
/boot/metal real obligatorio
validación de layout de almacenamiento
políticas de bloqueo reales
modo mantenimiento
modo recuperación
```

## Fase 5 — Transición hacia `/upLoad`

Entrada futura.

Posibles líneas:

```text
migración desde /run/maGNUx
nodo semiótico kernelizado
pseudo-filesystem semiótico
interfaz tipo sysfs/securityfs
integración futura con Dernel/ZaltID
```

## Resumen conceptual

```text
Fase 1:
    demostrar semiótica runtime compatible con Linux usando /run/maGNUx

Fases posteriores:
    ampliar correspondencias, endurecer contratos y preparar /upLoad

Madurez final:
    / contiene nodos técnicos kernelizados
    /upLoad contiene nodos semióticos kernelizados
```
