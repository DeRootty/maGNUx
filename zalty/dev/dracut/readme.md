# Zalty dracut administration

Scripts administrativos para construir un initramfs experimental de Zalty OS usando dracut sobre un Linux ya existente.

Este directorio no contiene el modulo dracut en si. El modulo vive en:

```text
zalty/initramfs/modules.d/90zalty-metal/
```

Este directorio contiene utilidades para instalar ese modulo en el sistema anfitrion, generar una imagen initramfs de prueba, verificarla y, opcionalmente, crear una entrada de GRUB para arrancarla.

## Advertencia principal

Estos scripts son experimentales.

No deben ejecutarse sobre sistemas criticos sin copia de seguridad y sin entender antes que hacen.

La imagen generada por defecto no reemplaza el initramfs principal del sistema. Se crea como imagen separada:

```text
/boot/initramfs-zalty-test-<kernel>.img
```

La entrada de GRUB tambien es opcional y debe revisarse antes de reiniciar.

## Objetivo de estos scripts

Permitir que Zalty inserte una fase temprana en initramfs para:

```text
1. usar un kernel Linux preexistente;
2. generar un initramfs experimental mediante dracut;
3. incluir el modulo 90zalty-metal;
4. ejecutar metal-inventory durante el arranque temprano;
5. preparar la futura comprobacion contra nodos semioticos declarados en /boot/metal/;
6. avanzar hacia la raiz semiotica runtime /run/maGNUx.
```

La idea general es:

```text
Linux existente
    ↓
drivers, kernel y herramientas disponibles
    ↓
dracut construye initramfs
    ↓
90zalty-metal entra como modulo de dracut
    ↓
metal-inventory se ejecuta en arranque temprano
    ↓
se genera inventario tecnico
    ↓
futuro metal-check compara contra /boot/metal
```

## Requisitos previos

El sistema anfitrion debe tener:

```text
Linux funcionando
dracu t instalado
kernel instalado
modulos del kernel disponibles
/boot accesible
permisos de root para instalar modulo y generar initramfs
```

Comandos esperados:

```text
dracut
uname
cp
mkdir
chmod
ls
```

Para verificacion de imagen se usara uno de estos, si existe:

```text
lsinitrd
lsinitramfs
```

## Estructura de scripts

```text
zalty/dev/dracut/
├── 00-check-dracut-env.sh
├── 10-install-zalty-dracut-module.sh
├── 20-build-zalty-initramfs.sh
├── 30-install-grub-test-entry.sh
├── 40-verify-zalty-initramfs.sh
└── 90-uninstall-zalty-dracut-module.sh
```

## Uso recomendado

Ejecutar desde la raiz del repositorio clonado:

```bash
chmod +x zalty/dev/dracut/*.sh
```

Despues:

```bash
sudo zalty/dev/dracut/00-check-dracut-env.sh
sudo zalty/dev/dracut/10-install-zalty-dracut-module.sh
sudo zalty/dev/dracut/20-build-zalty-initramfs.sh
sudo zalty/dev/dracut/40-verify-zalty-initramfs.sh
```

La entrada de GRUB es opcional:

```bash
sudo zalty/dev/dracut/30-install-grub-test-entry.sh
```

La limpieza del modulo instalado es:

```bash
sudo zalty/dev/dracut/90-uninstall-zalty-dracut-module.sh
```

## Script 00 — comprobar entorno

Archivo:

```text
00-check-dracut-env.sh
```

Funcion:

```text
verifica que dracut exista;
comprueba comandos minimos;
identifica el kernel actual;
comprueba /boot;
comprueba que exista el modulo fuente 90zalty-metal;
avisa si faltan module-setup.sh o zalty-metal-hook.sh.
```

Uso:

```bash
sudo zalty/dev/dracut/00-check-dracut-env.sh
```

Tambien puede ejecutarse sin root, pero algunos avisos indicaran que la instalacion y construccion real necesitan `sudo`.

Variables admitidas:

```bash
KERNEL_VERSION="6.x.y-custom"
REPO_ROOT="/ruta/al/repo/maGNUx"
MODULE_SRC="/ruta/al/modulo/90zalty-metal"
DRACUT_MODULE_DEST="/usr/lib/dracut/modules.d/90zalty-metal"
```

Ejemplo:

```bash
sudo KERNEL_VERSION="$(uname -r)" zalty/dev/dracut/00-check-dracut-env.sh
```

## Script 10 — instalar modulo dracut de Zalty

Archivo:

```text
10-install-zalty-dracut-module.sh
```

Funcion:

```text
copia los ficheros del modulo Zalty desde el repositorio hacia el directorio de modulos de dracut del sistema anfitrion.
```

Origen por defecto:

```text
zalty/initramfs/modules.d/90zalty-metal/
```

Destino por defecto:

```text
/usr/lib/dracut/modules.d/90zalty-metal
```

Uso:

```bash
sudo zalty/dev/dracut/10-install-zalty-dracut-module.sh
```

Variables admitidas:

```bash
REPO_ROOT="/ruta/al/repo/maGNUx"
MODULE_SRC="/ruta/al/modulo/90zalty-metal"
DRACUT_MODULE_DEST="/usr/lib/dracut/modules.d/90zalty-metal"
```

Ejemplo:

```bash
sudo REPO_ROOT="$PWD" zalty/dev/dracut/10-install-zalty-dracut-module.sh
```

Nota:

```text
Este script no genera el initramfs. Solo instala el modulo para que dracut pueda encontrarlo.
```

## Script 20 — construir initramfs Zalty

Archivo:

```text
20-build-zalty-initramfs.sh
```

Funcion:

```text
ejecuta dracut para generar una imagen initramfs de prueba que incluye el modulo zalty-metal.
```

Salida por defecto:

```text
/boot/initramfs-zalty-test-<kernel>.img
```

Uso:

```bash
sudo zalty/dev/dracut/20-build-zalty-initramfs.sh
```

Variables admitidas:

```bash
KERNEL_VERSION="$(uname -r)"
INITRAMFS_OUT="/boot/initramfs-zalty-test-$(uname -r).img"
DRACUT_MODULE_NAME="zalty-metal"
DRACUT_MODULE_DEST="/usr/lib/dracut/modules.d/90zalty-metal"
FORCE="yes"
VERBOSE="yes"
```

Ejemplo:

```bash
sudo INITRAMFS_OUT="/boot/initramfs-zalty-test-$(uname -r).img" \
     zalty/dev/dracut/20-build-zalty-initramfs.sh
```

El script exige que existan en el modulo instalado:

```text
module-setup.sh
zalty-metal-hook.sh
metal-inventory
```

Si faltan `module-setup.sh` o `zalty-metal-hook.sh`, la construccion se detendra. Esto es intencionado, porque sin ellos dracut no puede integrar correctamente `metal-inventory` en el ciclo de arranque.

## Script 30 — crear entrada GRUB de prueba

Archivo:

```text
30-install-grub-test-entry.sh
```

Funcion:

```text
agrega una entrada de prueba en /etc/grub.d/40_custom para arrancar el kernel actual con el initramfs experimental de Zalty.
```

Uso:

```bash
sudo zalty/dev/dracut/30-install-grub-test-entry.sh
```

Variables admitidas:

```bash
KERNEL_VERSION="$(uname -r)"
INITRAMFS_OUT="/boot/initramfs-zalty-test-$(uname -r).img"
GRUB_CUSTOM_FILE="/etc/grub.d/40_custom"
ENTRY_TITLE="Zalty OS semantic initramfs test ($(uname -r))"
KERNEL_PATH="/boot/vmlinuz-$(uname -r)"
ROOT_CMDLINE="root=UUID=... ro"
```

Ejemplo con linea de root explicita:

```bash
sudo ROOT_CMDLINE="root=UUID=XXXX-YYYY ro" \
     zalty/dev/dracut/30-install-grub-test-entry.sh
```

Advertencia:

```text
Este script no debe usarse a ciegas. La entrada generada debe revisarse antes de reiniciar.
```

El script intentara regenerar GRUB usando:

```text
grub-mkconfig -o /boot/grub/grub.cfg
```

o, si existe:

```text
update-grub
```

## Script 40 — verificar initramfs generado

Archivo:

```text
40-verify-zalty-initramfs.sh
```

Funcion:

```text
inspecciona la imagen initramfs generada y comprueba si contiene las piezas esperadas de Zalty.
```

Uso:

```bash
sudo zalty/dev/dracut/40-verify-zalty-initramfs.sh
```

Variables admitidas:

```bash
KERNEL_VERSION="$(uname -r)"
INITRAMFS_OUT="/boot/initramfs-zalty-test-$(uname -r).img"
```

Busca referencias como:

```text
bin/metal-inventory
zalty-metal-hook.sh
90zalty-metal
```

Si no encuentra alguna, emite aviso.

## Script 90 — desinstalar modulo dracut de Zalty

Archivo:

```text
90-uninstall-zalty-dracut-module.sh
```

Funcion:

```text
elimina el modulo Zalty instalado en el directorio de modulos de dracut del sistema anfitrion.
```

Uso:

```bash
sudo zalty/dev/dracut/90-uninstall-zalty-dracut-module.sh
```

Destino eliminado por defecto:

```text
/usr/lib/dracut/modules.d/90zalty-metal
```

Variable admitida:

```bash
DRACUT_MODULE_DEST="/usr/lib/dracut/modules.d/90zalty-metal"
```

El script no elimina:

```text
imagenes initramfs generadas
entradas GRUB ya creadas
contratos en /boot/metal
informes en /run/maGNUx
```

Esas piezas deben revisarse y eliminarse manualmente si ya no hacen falta.

## Flujo completo esperado

Primera preparacion:

```bash
git clone https://github.com/DeRootty/maGNUx.git
cd maGNUx
chmod +x zalty/dev/dracut/*.sh
```

Comprobacion:

```bash
sudo zalty/dev/dracut/00-check-dracut-env.sh
```

Instalacion del modulo:

```bash
sudo zalty/dev/dracut/10-install-zalty-dracut-module.sh
```

Construccion:

```bash
sudo zalty/dev/dracut/20-build-zalty-initramfs.sh
```

Verificacion:

```bash
sudo zalty/dev/dracut/40-verify-zalty-initramfs.sh
```

Entrada GRUB opcional:

```bash
sudo zalty/dev/dracut/30-install-grub-test-entry.sh
```

Reinicio y prueba:

```text
1. reiniciar;
2. seleccionar la entrada Zalty OS semantic initramfs test;
3. observar mensajes de Zalty durante initramfs;
4. confirmar que el sistema arranca o entra en modo esperado;
5. revisar inventarios generados cuando metal-report exista.
```

## Estado actual de la implementacion

En este momento ya existe:

```text
metal-inventory
```

Faltan todavia para que el modulo sea plenamente ejecutable desde dracut:

```text
module-setup.sh
zalty-metal-hook.sh
```

Faltan tambien las piezas posteriores:

```text
metal-check
metal-link
metal-report
```

Por tanto, la documentacion de uso ya anticipa el flujo completo, pero la primera ejecucion real requiere crear `module-setup.sh` y `zalty-metal-hook.sh`.

## Criterio de seguridad

Estos scripts deben mantener tres reglas:

```text
1. no reemplazar el initramfs principal sin orden explicita;
2. no convertir la entrada Zalty en arranque por defecto automaticamente;
3. no particionar discos ni modificar almacenamiento desde la carpeta dracut.
```

La preparacion de particiones de prueba pertenece a otra zona futura:

```text
zalty/dev/storage/
```

## Relacion con la Fase 1

Estos scripts pertenecen a la Fase 1 de Zalty OS:

```text
Initramfs semiótico live compatible
```

Su objetivo es permitir el primer puente operativo:

```text
kernel Linux preexistente
    ↓
dracut initramfs
    ↓
90zalty-metal
    ↓
metal-inventory
    ↓
/run/maGNUx
    ↓
futura comparacion contra /boot/metal
```
