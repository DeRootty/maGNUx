# Fases de implementación de Zalty OS

> [⬆ Subir a Zalty](../readme.md) · [🏠 Inicio](../../README.md)

Esta hoja de ruta separa lo que puede demostrarse hoy sobre Linux estándar de lo que deberá madurar hacia integración estructural más profunda.

## Fase 1 — Initramfs semiótico compatible

Objetivo: demostrar que un kernel Linux estándar puede participar en una arquitectura semiótica sin ser modificado.

```text
firmware/UEFI
  ↓
bootloader
  ↓
kernel Linux preexistente
  ↓
initramfs experimental
  ↓
contratos y validación temprana
  ↓
/run/maGNUx
  ↓
rootfs real o live
```

## Estructuras clave

```text
/boot/metal
    declara contratos persistentes

/run/maGNUx
    ensaya raíz semiótica viva compatible con Linux

/upLoad
    futura raíz de nodos semióticos kernelizados
```

## Prototipos

| Prototipo | Función |
|---|---|
| [prototipo-hostid-v0.1](../initramfs/prototipo-hostid-v0.1/README.md) | Identidad temprana de host, política de arranque y prueba QEMU. |

## Frase guía

```text
/boot/metal declara.
/run/maGNUx ensaya.
/upLoad integra.
```
