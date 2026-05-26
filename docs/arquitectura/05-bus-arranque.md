# 05 — Bus de comunicación de arranque

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

---

## La exigencia

Todo lo anterior conduce a una exigencia todavía parcial: la necesidad de un **bus de comunicación de arranque**.

No se trata de un bus en sentido banal de interconexión de dispositivos, sino de una **infraestructura protocolizada** desde la que el sistema pueda articular, en fase temprana:

| Capacidad | Descripción |
|---|---|
| **Identidad** | El sistema sabe quién es desde el arranque. |
| **Estado deseado** | Declara cuál es la configuración legítima. |
| **Validación** | Verifica que lo que arranca coincide con lo declarado. |
| **Secuenciación** | Ordena el levantamiento de capas sin ambigüedad. |
| **Permisos** | Discrimina qué procesos tienen derecho a acceder a qué recursos. |
| **Reconciliación** | Detecta y resuelve divergencias de estado. |
| **Persistencia inicial** | El suelo de confianza no desaparece una vez arrancado el sistema. |

---

## El límite actual

Mientras ese bus no exista materialmente, el sistema seguirá dependiendo de soluciones software que, por elegantes que sean, arrastran el límite de:

> Querer gobernar desde dentro del mismo flujo que intentan someter a orden.

---

## Por qué initramfs es el parche legítimo

`initramfs` no es la culminación del proyecto ni la solución final. Pero representa, en las condiciones actuales del hardware, **el único espacio real** desde el cual imaginar una persistencia inicial del sistema que no dependa enteramente de la lógica tardía del espacio de usuario convencional.

En maGNUx, `initramfs` se entiende como:

- Un **parche ontológico y técnico**.
- Una **prótesis transitoria**.
- Una región inicial de Linux puro.
- Un soporte experimental para una soberanía del arranque que, en una evolución madura, no debería descansar solo en software.

> Mientras el hardware no incorpore mecanismos orientados expresamente a la soberanía del arranque, Linux e initramfs son el **laboratorio viable** para ensayar esa arquitectura.

---

## Relación con el hardware futuro

maGNUx reconoce explícitamente un límite: ciertos cambios no madurarán por completo si el hardware no acompaña.

> No basta con mejorar el software; hay que **orientar el hardware** hacia la arquitectura que el software ha revelado como necesaria.

La arquitectura **x86_64 CISC** aparece como punto de partida por:

- Su peso histórico.
- Su complejidad de arranque.
- Su relevancia real en entornos de propósito general.

No porque sea una solución definitiva, sino porque ofrece un terreno donde las tensiones entre **herencia, compatibilidad, privilegio y secuencia de arranque** se manifiestan con especial claridad.

La idea de fondo no es que x86_64 sea la meta, sino que constituye hoy un **laboratorio histórico y técnico** desde el que pensar una futura cooperación entre:

```
CPU
  └── firmware
        └── kernel
              └── buses de comunicación temprana
                    └── NPUs / aceleradores de decisión
```

---

*← [Inicio del sistema](04-inicio-sistema.md) | [Índice](../README.md) | Siguiente: [Capas POSIX →](06-capas-posix.md)*
