# Zalty

> [🏠 Inicio](../README.md) · [📚 Documentación maGNUx](../docs/README.md)

Zalty es la distribución GNU/Linux experimental que ensaya la arquitectura maGNUx sobre un sistema Linux real.

Zalty no sustituye el manifiesto maGNUx. Lo implementa, lo prueba y lo somete a fricción técnica.

## Índice

| Documento | Función |
|---|---|
| [Fases de implementación](fases/readme.md) | Hoja de ruta experimental. |
| [Initramfs](initramfs/README.md) | Laboratorio de arranque temprano. |

## Relación con maGNUx

```text
maGNUx
→ manifiesto, contrato y arquitectura

Zalty
→ distribución GNU/Linux experimental
```

## Principio operativo

Zalty debe demostrar primero lo posible sin modificar el kernel Linux: initramfs, `/boot/metal/`, `/run/maGNUx`, políticas de arranque y contratos declarativos.
