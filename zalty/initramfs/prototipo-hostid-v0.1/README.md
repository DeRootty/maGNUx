# prototipo-initramfs

> [⬆ Subir a initramfs](../README.md) · [🏠 Inicio](../../../README.md)

**Versión:** 0.1  
**Objetivo:** demostrar identidad de host temprana y persistente en initramfs  
**Herramientas:** C (estático), bash, QEMU  

---

## Estructura

```
prototipo-initramfs/
  ├── doc/
  │     ├── build.md          — cómo compilar y empaquetar
  │     └── test-qemu.md      — cómo probar en QEMU
  │
  ├── src/
  │     ├── identity/
  │     │     ├── host_identity.h   — estructura de datos central
  │     │     └── host_identity.c   — implementación xGNUpeD (prototipo)
  │     ├── boot/
  │     │     ├── boot_validator.h
  │     │     └── boot_validator.c  — validación de secuencia de arranque
  │     └── comm/
  │           ├── early_comm.h
  │           └── early_comm.c      — canal mínimo entre etapas
  │
  ├── scripts/
  │     ├── init                    — init refactorizado por estratos
  │     ├── build-initramfs.sh      — empaqueta el initramfs
  │     └── policy.conf             — política Dernel (prototipo)
  │
  └── tests/
        ├── run-qemu.sh             — lanza el test en QEMU
        └── expected-output.txt     — salida esperada para validación
```

---

## Qué demuestra este prototipo

1. **Identidad temprana:** el sistema genera un `host_identity_t` antes de montar `/`.
2. **Persistencia:** la identidad no desaparece tras el `pivot_root`.
3. **Discriminación de procesos:** solo los binarios de la lista blanca pueden ejecutarse en fase ROOT.

## Qué NO hace este prototipo

- No implementa Trilobytes.
- No implementa Kommu services completo.
- No tiene integración con KDE / Wayland.
- No requiere hardware específico: funciona en QEMU.

---

## Requisitos para compilar

```bash
# Compilador C estático
apt install gcc musl-tools

# QEMU para testing
apt install qemu-system-x86

# Herramientas de initramfs
apt install cpio
```

---

## Inicio rápido

```bash
# 1. Compilar los binarios
cd prototipo-initramfs
./scripts/build-initramfs.sh

# 2. Probar en QEMU
./tests/run-qemu.sh

# 3. Ver la salida esperada
cat tests/expected-output.txt
```

## Nota de integración

Este prototipo procede de la propuesta maGNUx v2 y se ubica aquí porque Zalty es el plano de implementación experimental. No debe confundirse con el manifiesto: aquí se prueba, no se redefine.
