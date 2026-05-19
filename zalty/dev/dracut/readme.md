# Zalty dracut administration

Scripts administrativos para construir un initramfs experimental de Zalty OS usando dracut sobre un Linux ya existente.

Este directorio no contiene el modulo dracut en si. El modulo vive en:

```text
zalty/initramfs/modules.d/90zalty-metal/
```

Este directorio contiene utilidades para instalar ese modulo en el sistema anfitrion, generar una imagen initramfs de prueba, verificarla y, opcionalmente, crear una entrada de GRUB para arrancarla.

## Flujo recomendado

Desde la raiz del repositorio clonado:

```bash
chmod +x zalty/dev/dracut/*.sh
sudo zalty/dev/dracut/00-check-dracut-env.sh
sudo zalty/dev/dracut/10-install-zalty-dracut-module.sh
sudo zalty/dev/dracut/20-build-zalty-initramfs.sh
sudo zalty/dev/dracut/40-verify-zalty-initramfs.sh
```

La entrada de GRUB es opcional:

```bash
sudo zalty/dev/dracut/30-install-grub-test-entry.sh
```

## Advertencia

Estos scripts son experimentales. No reemplazan el initramfs principal del sistema salvo que se indique explicitamente. La imagen generada por defecto se llama:

```text
/boot/initramfs-zalty-test-<kernel>.img
```

## Variables utiles

```bash
KERNEL_VERSION="$(uname -r)"
INITRAMFS_OUT="/boot/initramfs-zalty-test-$(uname -r).img"
DRACUT_MODULE_DEST="/usr/lib/dracut/modules.d/90zalty-metal"
```

## Objetivo

Permitir que Zalty inserte una fase temprana en initramfs para inventariar nodos tecnicos y preparar la futura comprobacion contra nodos semioticos declarados en `/boot/metal/`.
