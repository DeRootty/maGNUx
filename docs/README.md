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
| 5 bis | Manifiesto en revisión | [04 — Composición ecológica RGBA](manifesto/04-modelo-ecologico-rgba.md) | Introduce el revelado de sesiones y la contribución del usuario α. |
| 6 | Manifiesto | [Horizonte tecnológico — Arquetipar sistemas operativos](manifesto/horizonte-arquetipado.md) | Organiza las siete dimensiones, la maqueta y su continuidad por convolución. |
| 6 bis | Manifiesto | [Artículo de soberanía contributiva](manifesto/03-reciprocidad-economica-computacional.md) | Presenta la hipótesis de financiación verificable de contribuciones libres, IA, contratos y gobernanza comunitaria. |
| 7 | Arquitectura | [Estratos](arquitectura/03-estratos.md) | Ordena ROOT, COMM y ADMIN. |
| 8 | Arquitectura | [Inicio del sistema](arquitectura/04-inicio-sistema.md) | Describe la transición desde metal hacia sistema. |
| 9 | Arquitectura | [Bus de arranque](arquitectura/05-bus-arranque.md) | Explica la comunicación temprana. |
| 10 | Arquitectura | [Capas POSIX](arquitectura/06-capas-posix.md) | Sitúa compatibilidad, Linux e init tradicionales. |
| 11 | Identidad | [xGNUpeD](identidad/07-xgnuped.md) | Define identidad distributiva, conmutativa, asociativa y comunicativa. |
| 12 | Identidad | [Trilobytes](identidad/08-trilobytes.md) | Integra coherencia, logon, login y legitimación orgánica. |
| 13 | Identidad | [Dernel](identidad/09-dernel.md) | Explica la licencia operativa y la traducción entre kernel, host y guest. |
| 14 | Identidad | [Host y Guest](identidad/10-host-guest.md) | Refunde Host, Guest, VMKZ, VMDZ y plano delegado. |
| 15 | Identidad | [Root y dominios](identidad/11-root-dominios.md) | Delimita dominios raíz, autoridad y administración. |
| 16 | Filosofía | [Unix y GNU](filosofia/12-filosofia-unix-gnu.md) | Integra filosofía Unix, GNU, GPL y C como medio sistémico. |
| 17 | Filosofía | [Hormiguero](filosofia/13-hormiguero.md) | Usa la metáfora orgánica para explicar nodos, comunidad y coordinación. |
| 18 | Filosofía | [Hardware](filosofia/14-hardware.md) | Relaciona hardware presente, futuro, ISA y capacidades del kernel. |
| 19 | Filosofía | [Hoja de maduración](filosofia/15-hoja-maduracion.md) | Ordena fases, límites y transición hacia prototipo. |
| 20 | Implementación | [Zalty](../zalty/readme.md) | Presenta la distribución GNU/Linux experimental. |
| 21 | Implementación | [Initramfs de Zalty](../zalty/initramfs/README.md) | Sitúa el laboratorio de arranque temprano. |
| 22 | Implementación | [Prototipo HostID v0.1](../zalty/initramfs/prototipo-hostid-v0.1/README.md) | Primer ensayo técnico de identidad temprana. |
| 23 | Herramientas GNU | [GCC ES Técnico](gcc/README.md) | Documentación técnica en español sobre GCC, compilación y cadena de herramientas. |

## Secciones principales

| Sección | Función |
|---|---|
| [Propuesta técnica](propuesta-tecnica/README.md) | Síntesis ejecutiva y primeras especificaciones. |
| [Manifiesto](manifesto/README.md) | Declaración de intención, soberanía e hipótesis central. |
| [Arquitectura](arquitectura/README.md) | Modelo de capas, arranque y compatibilidad. |
| [Identidad](identidad/README.md) | Autoridad, identidad y dominios orgánicos/técnicos. |
| [Filosofía](filosofia/README.md) | Marco cultural, hardware y maduración. |
| [GCC ES Técnico](gcc/README.md) | Traducción técnica y guía documental de GCC en español. |
| [Corpus absorbido](legacy/README.md) | Mapa de documentos históricos absorbidos por la lectura principal. |

## Base constitutiva de la Commonwealth del silicio

El manifiesto se amplía con el [Volumen I histórico](manifesto/volumen-i-britania-roma-commonwealth.md) y el [Volumen II constitutivo](manifesto/volumen-ii-commonwealth-del-silicio.md). Este último desarrolla la secuencia ROOT/kernel → COMM/xGNUpeD → ADMIN/Dernel, los modos de mantenimiento y el arranque ordinario con Trilobytes, sin confundir ADMIN con la identidad no administrativa del usuario.

## Soberanía contributiva y auditoría de ramas

El [artículo académico del manifiesto](manifesto/03-reciprocidad-economica-computacional.md) propone financiar el software libre mediante contratos, evidencias y valoración revisable, distinguiendo la historia de la esclavitud colonial del voluntariado informático. La [auditoría de ramas](gestion-ramas.md) aclara qué integra ya master y por qué deben conservarse las ramas de archivo.

## Revisión arquitectónica RGBA (rama temporal)

La nueva propuesta puede revisarse desde el [modelo ecológico RGBA](manifesto/04-modelo-ecologico-rgba.md), la [matriz de correspondencias](propuesta-tecnica/matriz-refundicion-rgba.md), el [ADR-0001](propuesta-tecnica/adr-0001-composicion-rgba.md) y la [especificación provisional de sesión](propuesta-tecnica/04-sesion-rgba-spec.md).

El objetivo es refundir estas aportaciones en la única lectura principal de `master`, sin introducir una línea doctrinal alternativa ni presentar como implementado el arranque seL4/NPU.

## Ampliación oficial: Trilobytes

La [descripción de Trilobytes](identidad/08-trilobytes.md) mantiene su función de coherencia de sesión y añade la representación contractual de intereses. La [especificación de legitimación e intermediación](propuesta-tecnica/03-trilobytes-mediacion-spec.md) formaliza la triple delegación positiva ROOT/COMM/ADMIN y deja claro que todavía es una propuesta, no una implementación de Zalty.

---

## Política de navegación

Consulta [NAVIGATION.md](NAVIGATION.md) para el patrón de enlaces internos.

## Criterio de esta refundición

```text
La ruta nueva ordena.
El corpus antiguo se absorbe.
La navegación única sustituye a las rutas paralelas.
```

Los documentos históricos pueden permanecer en el repositorio durante la transición, pero dejan de ser la ruta recomendada de lectura.