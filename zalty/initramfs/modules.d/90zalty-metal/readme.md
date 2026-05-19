# 90zalty-metal

Módulo inicial para integrar la lógica semiótica de Zalty dentro de un initramfs modular.

Este directorio está pensado para alojar, en una fase posterior, piezas como:

- `module-setup.sh`
- `zalty-metal-init.sh`
- `metal-inventory`
- `metal-check`
- `metal-report`

La misión del módulo será montar los espacios mínimos del arranque temprano, localizar o simular `/boot/metal/`, inventariar nodos técnicos y emitir una decisión semiótica de continuidad.
