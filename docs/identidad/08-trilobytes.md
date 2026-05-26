# 08 — Trilobytes: coherencia integral

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> Toda arquitectura declarativa real necesita una instancia que no solo observe, sino que también **verifique, compare, decida y, llegado el caso, niegue**.

---

## En pocas palabras

Trilobytes hereda tareas que hasta ahora hace systemd, pero enmarcándolas en un contexto con una **filosofía Unix más enfocada**.

Su sentido más profundo es ser una **capa de integración de la identidad, legitimación y continuidad**, capaz de dar forma al login del usuario antes de que este se despliegue como espacio operativo ordinario.

---

## La función de Trilobytes

En maGNUx, esa función se proyecta en la abstracción llamada **Trilobytes**.

Más allá del nombre, Trilobytes expresa la necesidad de un principio de **coherencia integral**. No se trata solo de:

- Registro.
- Supervisión.
- Seguridad reactiva.

Se trata de una **mediación** entre:

| Elemento | Rol |
|---|---|
| **Identidad** | Quién dice ser el sistema. |
| **Política** | Qué se le permite hacer. |
| **Operación** | Lo que efectivamente ejecuta. |
| **Estado efectivo** | La realidad del sistema en cada momento. |
| **Materialidad** | El hardware y sus restricciones reales. |

---

## La misión

La misión de Trilobytes sería garantizar la **veracidad estructural**:

> Que lo que el sistema declara ser, lo que debe ser y lo que efectivamente ejecuta **no diverjan de forma ilegítima**.

---

## Cuándo actúa

Trilobytes se carga en el proceso de **login en el sistema**.

Es el guardián del umbral entre la identidad estructural del host y la sesión operativa del guest.

---

## Posición en la secuencia

```
Kernel
  └── xGNUpeD
        └── Dernel
              └── Trilobytes  ← aquí (proceso de login)
                    └── Sesión del usuario (guest)
```

---

## Analogía

De la misma forma que en una carrera de relevos, cuando las partes sistémicas llegan a su final de carrera, deben pasar su testigo al siguiente corredor.

Para ello se necesitan **roles e identidades** bien definidos. Trilobytes es el momento en que el testigo pasa del sistema al usuario.

---

*← [xGNUpeD](07-xgnuped.md) | [Índice](../README.md) | Siguiente: [Dernel →](09-dernel.md)*
