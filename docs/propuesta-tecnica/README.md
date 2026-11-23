# Propuesta técnica

> [⬆ Subir a documentación](../README.md) · [🏠 Inicio](../../README.md)

Esta sección abre la lectura técnica de maGNUx. Su función es condensar la hipótesis general en una forma evaluable: qué declara maGNUx, qué problema intenta resolver y qué piezas técnicas necesitaría para madurar.

## Lectura única de propuesta técnica

| Orden | Documento | Función |
|---:|---|---|
| 1 | [maGNUx — Propuesta técnica introductoria](00-resumen-ejecutivo.md) | Absorbe el manifiesto histórico, la confianza cero, el arranque soberano y el marco del primer prototipo. |
| 2 | [Especificación técnica: xGNUpeD](01-xgnuped-spec.md) | Absorbe la necesidad de identidad temprana, distribución, kernel y cierre del arranque. |
| 3 | [Especificación técnica: Dernel](02-dernel-spec.md) | Absorbe Dernel/ZaltID, contrato operativo y licencia entre host y guest. |

## Ampliación posterior a v0.1

[03 — Trilobytes: legitimación e intermediación computacional](03-trilobytes-mediacion-spec.md) especifica el futuro agente Go, su doble función (coherencia e intermediación), la triple delegación positiva ROOT/COMM/ADMIN, el mandato de representación, la revocación y las pruebas propuestas. Es un borrador arquitectónico, no un componente implementado en Zalty.

---

## Revisión RGBA y usuario α — rama temporal

La rama `feature/rgba-trilobytes-alpha` conserva la arquitectura publicada y propone su evolución por composición de sesiones. Los siguientes documentos están **en revisión**, no implementados:

- [Matriz de refundición RGBA](matriz-refundicion-rgba.md): correspondencias con el corpus anterior, tensiones T1–T7 y registro de avance.
- [ADR-0001 — Composición RGBA y límites de autoridad](adr-0001-composicion-rgba.md): propuestas de resolución, invariantes de privilegios, dos rutas de arranque.
- [04 — Especificación provisional de sesión RGBA](04-sesion-rgba-spec.md): RAW, descriptor revelado, autómatas, trazas de eventos y pruebas negativas.

La [constitución ecológica RGBA](../manifesto/04-modelo-ecologico-rgba.md) expresa su tesis en el plano del manifiesto. Estas especificaciones corresponden al plano de ingeniería, no alteran el prototipo HostID v0.1 y no prueban seL4/NPU.

---

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