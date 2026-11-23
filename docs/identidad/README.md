# Identidad

> [⬆ Subir a documentación](../README.md) · [🏠 Inicio](../../README.md)

Esta sección define xGNUpeD, Trilobytes, Dernel, Host/Guest y los dominios de autoridad raíz.

La identidad es el punto donde maGNUx deja de ser solo una teoría de arranque y empieza a formular quién puede actuar, bajo qué autoridad, con qué contrato y en qué dominio.

## Lectura única de identidad

| Orden | Documento | Función |
|---:|---|---|
| 1 | [07 — xGNUpeD: la capa de identidad](07-xgnuped.md) | Absorbe identidad distributiva, asociativa, conmutativa y comunicativa. |
| 2 | [08 — Trilobytes: coherencia y representación](08-trilobytes.md) | Conserva coherencia, Logon y Login; incorpora intermediación por triple delegación y mandato. |
| 3 | [09 — Dernel: licencia operativa](09-dernel.md) | Absorbe Dernel/ZaltID y la idea de licencia operativa entre host y guest. |
| 4 | [10 — Dinámica de identidades: Host y Guest](10-host-guest.md) | Absorbe Host, Guest, VMKZ, VMDZ y plano delegado. |
| 5 | [11 — Root y los dominios de autoridad](11-root-dominios.md) | Absorbe init_ID, contrato administrativo, autoridad raíz y dominios de ejecución. |

La ampliación de Trilobytes dispone de una [especificación técnica propuesta](../propuesta-tecnica/03-trilobytes-mediacion-spec.md). Su desarrollo no modifica el alcance del prototipo HostID v0.1.

---

## Composición de identidad de sesión (en revisión)

La refundición RGBA amplía **xGNUpeD** (objetos funcionales G), **Dernel** (objetos administrativos B) y **Trilobytes** (verificación, revelado RAW e intermediación). Mantiene las autoridades originales y sus tres delegaciones independientes cuando el agente representa intereses.

La [especificación de sesiones](../propuesta-tecnica/04-sesion-rgba-spec.md) presenta escenarios `3/$` y `α/$`, sin elevación de privilegios ni dependencia obligatoria de IA. Se trata de una propuesta para validar, no una función actualmente disponible en Zalty.

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