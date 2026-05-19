# Zalty initramfs

Espacio de trabajo para el initramfs semiótico de Zalty OS.

Este árbol contendrá la lógica temprana encargada de inventariar nodos técnicos expuestos por Linux y contrastarlos con nodos semióticos declarados en `/boot/metal/`.

Objetivo inicial:

- demostrar el puente entre nodos técnicos y nodos semióticos en modo live;
- ejecutar comprobaciones desde initramfs antes de entregar el control al sistema raíz;
- mantener una implementación mínima, auditable y progresiva.
