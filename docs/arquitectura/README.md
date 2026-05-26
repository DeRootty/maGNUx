# Arquitectura

> [⬆ Subir a documentación](../README.md) · [🏠 Inicio](../../README.md)

Esta sección ordena los estratos del sistema, el inicio temprano, el bus de arranque y la relación con capas POSIX.

La arquitectura funciona como puente entre el manifiesto y la identidad operativa: toma la soberanía sistémica y la traduce en fases, capas y contratos.

## Lectura única de arquitectura

| Orden | Documento | Función |
|---:|---|---|
| 1 | [03 — Los tres estratos: ROOT, COMM, ADMIN](03-estratos.md) | Absorbe Host, Guest, VMKZ, VMDZ y la división entre autoridad estructural, comunicación y operación. |
| 2 | [04 — El inicio estratificado del sistema](04-inicio-sistema.md) | Absorbe arranque temprano, protosistema raíz, initramfs, seL4, Hurd e init_ID como hipótesis de autoridad temprana. |
| 3 | [05 — Bus de comunicación de arranque](05-bus-arranque.md) | Absorbe Kommu, identidad comunicativa y mediación temprana entre capas. |
| 4 | [06 — Capas de compatibilidad POSIX](06-capas-posix.md) | Absorbe Linux como kernel modelo, carga del kernel, inits tradicionales y hacks al kernel actual. |

## Criterio de absorción

Los documentos antiguos de arranque, microkernel, Linux, init y hacks dejan de formar una segunda tabla de navegación. Sus conceptos se concentran aquí:

```text
estratos
→ inicio temprano
→ comunicación de arranque
→ compatibilidad POSIX y Linux actual
```

## Lugar dentro del proyecto

```text
arquitectura
→ ordena capas y fases
→ conecta arranque temprano con sistema operativo
→ prepara el paso hacia identidad y Zalty
```

La implementación práctica debe referenciarse desde `zalty/`, no mezclarse aquí.