# Identidad

> [⬆ Subir a documentación](../README.md) · [🏠 Inicio](../../README.md)

Esta sección define xGNUpeD, Trilobytes, Dernel, Host/Guest y los dominios de autoridad raíz.

La identidad es el punto donde maGNUx deja de ser solo una teoría de arranque y empieza a formular quién puede actuar, bajo qué autoridad, con qué contrato y en qué dominio.

## Lectura única de identidad

| Orden | Documento | Función |
|---:|---|---|
| 1 | [07 — xGNUpeD: la capa de identidad](07-xgnuped.md) | Absorbe identidad distributiva, asociativa, conmutativa y comunicativa. |
| 2 | [08 — Trilobytes: coherencia integral](08-trilobytes.md) | Absorbe Trilobytes, Logon y Login como proceso coherente de legitimación orgánica. |
| 3 | [09 — Dernel: licencia operativa](09-dernel.md) | Absorbe Dernel/ZaltID y la idea de licencia operativa entre host y guest. |
| 4 | [10 — Dinámica de identidades: Host y Guest](10-host-guest.md) | Absorbe Host, Guest, VMKZ, VMDZ y plano delegado. |
| 5 | [11 — Root y los dominios de autoridad](11-root-dominios.md) | Absorbe init_ID, contrato administrativo, autoridad raíz y dominios de ejecución. |

## Criterio de absorción

Los documentos históricos sobre identidad dejan de ser rutas alternativas. Sus conceptos quedan refundidos en esta secuencia:

```text
xGNUpeD
→ Trilobytes
→ Dernel
→ Host / Guest
→ Root y dominios de autoridad
```

## Lugar dentro del proyecto

```text
identidad
→ define quién actúa
→ delimita autoridad y contrato
→ conecta host, guest, root, comm y admin
```

La implementación práctica debe referenciarse desde `zalty/`, no mezclarse aquí.