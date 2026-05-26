# Documentación maGNUx

> [🏠 Inicio](../README.md)

Este índice concentra la lectura principal del proyecto. La documentación queda organizada como una sola ruta, con varios niveles de profundidad.

La documentación nueva funciona como columna vertebral. Los conceptos del corpus anterior quedan absorbidos dentro de los documentos principales, evitando dos navegaciones paralelas.

## Lectura principal única

| Orden | Plano | Entrada | Función |
|---:|---|---|---|
| 1 | Propuesta técnica | [Resumen ejecutivo](propuesta-tecnica/00-resumen-ejecutivo.md) | Presenta el problema, la hipótesis y el prototipo viable. |
| 2 | Propuesta técnica | [Especificación xGNUpeD](propuesta-tecnica/01-xgnuped-spec.md) | Formaliza la capa de identidad temprana. |
| 3 | Propuesta técnica | [Especificación Dernel](propuesta-tecnica/02-dernel-spec.md) | Formaliza la licencia operativa entre host y guest. |
| 4 | Manifiesto | [Manifiesto](manifesto/01-manifiesto.md) | Expone la razón de ser del proyecto. |
| 5 | Manifiesto | [Hipótesis central](manifesto/02-hipotesis-central.md) | Declara la soberanía sistémica como problema de arranque. |
| 6 | Arquitectura | [Estratos](arquitectura/03-estratos.md) | Ordena ROOT, COMM y ADMIN. |
| 7 | Arquitectura | [Inicio del sistema](arquitectura/04-inicio-sistema.md) | Describe la transición desde metal hacia sistema. |
| 8 | Arquitectura | [Bus de arranque](arquitectura/05-bus-arranque.md) | Explica la comunicación temprana. |
| 9 | Arquitectura | [Capas POSIX](arquitectura/06-capas-posix.md) | Sitúa compatibilidad, Linux e init tradicionales. |
| 10 | Identidad | [xGNUpeD](identidad/07-xgnuped.md) | Define identidad distributiva, conmutativa, asociativa y comunicativa. |
| 11 | Identidad | [Trilobytes](identidad/08-trilobytes.md) | Integra coherencia, logon, login y legitimación orgánica. |
| 12 | Identidad | [Dernel](identidad/09-dernel.md) | Explica la licencia operativa y la traducción entre kernel, host y guest. |
| 13 | Identidad | [Host y Guest](identidad/10-host-guest.md) | Refunde Host, Guest, VMKZ, VMDZ y plano delegado. |
| 14 | Identidad | [Root y dominios](identidad/11-root-dominios.md) | Delimita dominios raíz, autoridad y administración. |
| 15 | Filosofía | [Unix y GNU](filosofia/12-filosofia-unix-gnu.md) | Integra filosofía Unix, GNU, GPL y C como medio sistémico. |
| 16 | Filosofía | [Hormiguero](filosofia/13-hormiguero.md) | Usa la metáfora orgánica para explicar nodos, comunidad y coordinación. |
| 17 | Filosofía | [Hardware](filosofia/14-hardware.md) | Relaciona hardware presente, futuro, ISA y capacidades del kernel. |
| 18 | Filosofía | [Hoja de maduración](filosofia/15-hoja-maduracion.md) | Ordena fases, límites y transición hacia prototipo. |
| 19 | Implementación | [Zalty](../zalty/readme.md) | Presenta la distribución GNU/Linux experimental. |
| 20 | Implementación | [Initramfs de Zalty](../zalty/initramfs/README.md) | Sitúa el laboratorio de arranque temprano. |
| 21 | Implementación | [Prototipo HostID v0.1](../zalty/initramfs/prototipo-hostid-v0.1/README.md) | Primer ensayo técnico de identidad temprana. |

## Secciones principales

| Sección | Función |
|---|---|
| [Propuesta técnica](propuesta-tecnica/README.md) | Síntesis ejecutiva y primeras especificaciones. |
| [Manifiesto](manifesto/README.md) | Declaración de intención, soberanía e hipótesis central. |
| [Arquitectura](arquitectura/README.md) | Modelo de capas, arranque y compatibilidad. |
| [Identidad](identidad/README.md) | Autoridad, identidad y dominios orgánicos/técnicos. |
| [Filosofía](filosofia/README.md) | Marco cultural, hardware y maduración. |
| [Corpus absorbido](legacy/README.md) | Mapa de documentos históricos absorbidos por la lectura principal. |

## Política de navegación

Consulta [NAVIGATION.md](NAVIGATION.md) para el patrón de enlaces internos.

## Criterio de esta refundición

```text
La ruta nueva ordena.
El corpus antiguo se absorbe.
La navegación única sustituye a las rutas paralelas.
```

Los documentos históricos pueden permanecer en el repositorio durante la transición, pero dejan de ser la ruta recomendada de lectura.