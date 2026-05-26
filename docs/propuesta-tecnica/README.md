# Propuesta técnica

> [⬆ Subir a documentación](../README.md) · [🏠 Inicio](../../README.md)

Esta sección abre la lectura técnica de maGNUx. Su función es condensar la hipótesis general en una forma evaluable: qué declara maGNUx, qué problema intenta resolver y qué piezas técnicas necesitaría para madurar.

## Documentos principales

| Orden | Documento | Archivo |
|---:|---|---|
| 1 | [maGNUx — Propuesta técnica introductoria](00-resumen-ejecutivo.md) | `00-resumen-ejecutivo.md` |
| 2 | [Especificación técnica: xGNUpeD](01-xgnuped-spec.md) | `01-xgnuped-spec.md` |
| 3 | [Especificación técnica: Dernel](02-dernel-spec.md) | `02-dernel-spec.md` |

## Corpus integrado

Estos documentos del corpus anterior quedan integrados aquí como desarrollo profundo:

| Tema | Documento |
|---|---|
| Manifiesto histórico y confianza cero | [maGNUx.md](../maGNUx.md) |
| Dernel / ZaltID | [dernelZaltID.md](../dernelZaltID.md) |
| Contrato de sistema operativo | [contractOS.md](../contractOS.md) |
| Capacidades configurables del kernel | [kernelConfigCaps.md](../kernelConfigCaps.md) |
| Arranque soberano | [sovereignBoot.md](../sovereignBoot.md) |

## Lugar dentro del proyecto

```text
propuesta técnica
→ traduce el manifiesto en una hipótesis evaluable
→ prepara el paso hacia arquitectura, identidad y Zalty
```

La implementación práctica debe referenciarse desde `zalty/`, no mezclarse aquí.