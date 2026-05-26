# Propuesta técnica

> [⬆ Subir a documentación](../README.md) · [🏠 Inicio](../../README.md)

Esta sección abre la lectura técnica de maGNUx. Su función es condensar la hipótesis general en una forma evaluable: qué declara maGNUx, qué problema intenta resolver y qué piezas técnicas necesitaría para madurar.

## Lectura única de propuesta técnica

| Orden | Documento | Función |
|---:|---|---|
| 1 | [maGNUx — Propuesta técnica introductoria](00-resumen-ejecutivo.md) | Absorbe el manifiesto histórico, la confianza cero, el arranque soberano y el marco del primer prototipo. |
| 2 | [Especificación técnica: xGNUpeD](01-xgnuped-spec.md) | Absorbe la necesidad de identidad temprana, distribución, kernel y cierre del arranque. |
| 3 | [Especificación técnica: Dernel](02-dernel-spec.md) | Absorbe Dernel/ZaltID, contrato operativo y licencia entre host y guest. |

## Criterio de absorción

Los documentos históricos dejan de ser entradas alternativas de lectura. Sus conceptos quedan refundidos en esta secuencia:

```text
problema general
→ identidad temprana
→ licencia operativa
→ prototipo verificable
```

## Lugar dentro del proyecto

```text
propuesta técnica
→ traduce el manifiesto en una hipótesis evaluable
→ prepara el paso hacia arquitectura, identidad y Zalty
```

La implementación práctica debe referenciarse desde `zalty/`, no mezclarse aquí.