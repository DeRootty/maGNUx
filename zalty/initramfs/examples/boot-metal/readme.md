# boot-metal example

Ejemplo inicial de árbol `/boot/metal/` para el modo live de Zalty OS.

Este directorio servirá como maqueta de la partición semiótica cuando todavía no exista una partición real montada en `/boot/metal/`.

La finalidad del ejemplo es permitir que el initramfs demuestre la correspondencia entre:

- nodos técnicos detectados en `/dev`, `/proc`, `/sys` y `/run`;
- nodos semióticos declarados en contratos y manifiestos;
- políticas de decisión aplicadas durante el arranque temprano.
