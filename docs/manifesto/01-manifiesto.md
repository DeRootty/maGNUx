# 01 — Manifiesto de maGNUx

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> **MaKGNUux** — Managed's Kernel GNU LinuX

---

## Propósito

Este manifiesto trata de declarar la filosofía Linux como un giro tangencial a la filosofía Unix. Formular con claridad una necesidad que Linux, por sí solo, todavía no expresa de forma estructural: la diferencia entre **gobernar el sistema** y **operarlo**.

El sistema que más se aproxima a esto es SeL4, pero si bien este sistema se orienta a drones, este planteamiento de Linux quiere definir los **Droides**. La diferencia es clara:

- Un **dron** puede o no ser operado en remoto.
- Un **droide** requiere siempre supervisión humana.

> *Ejemplo desde la ciencia ficción:* R2D2 como asistente en navegación de los pilotos en ala-X. Eso es un Droide. Un dron sería lo mismo pero sin necesidad de supervisión humana.

---

## Motivación

La motivación del manifiesto es la **seguridad y la coherencia** de un sistema operativo preparado para integrar, en el futuro, formas de decisión más complejas, incluidas:

- Lógicas declarativas
- Automatización avanzada
- Inteligencia artificial sistémica

Hoy, ni el hardware de propósito general ni la arquitectura clásica del arranque ofrecen una base suficiente para esa integración con soberanía estructural completa.

Por ello, maGNUx plantea una **transición**: apoyarse en Linux como suelo real, mientras se definen nuevas capas de identidad, gobierno, comunicación y operación.

---

## Contexto actual

- Actualmente, ningún sistema operativo incluye IA sistémica (ni siquiera Kali Linux).
- El caso más relevante de desastre al intentarlo es **Microsoft**.
- El hardware aún no está preparado para soportar software con IA sistémica.
- Se necesitan *hacks* en el software de arranque para garantizar una seguridad mínima.

> Estos hacks no son excluyentes, sino necesarios aunque el hardware esté debidamente conceptualizado en arquitectura.

---

## Dos caminos posibles

Para el arranque con autoridad temprana existen dos rutas:

1. Usar el propio **initramfs** de Linux como autoridad temprana.
2. Disponer de un sistema operativo de bajo nivel como **SEL4** para el arranque como autoridad temprana, quedando siempre Linux en el área de sistémica operativa.

---

## Objetivos de maduración

El tiempo dedicado a este proyecto pretende madurar:

### 1️⃣ Separación de control vs. operación

| Control | Operación |
|---|---|
| hroot + croot + droot = **root** | sadmin + uadmin + aadmin = **admin** |

### 2️⃣ Identidad estructural del sistema

| Control orgánico | Control sistémico |
|---|---|
| Dernel run time + Dernel guest = **Dernel user land** | Kernel hard + Kernel run time = **Kernel host** |

### 3️⃣ Ejes dimensionales de actividad

| Eje | Función |
|---|---|
| ¿Quién soy? | Control del user land |
| ¿Dónde estoy? | Control del host |
| ¿De dónde vengo? | Control de la dinámica host–guest |

Todos integrados en el área de actividad denominada **Kommu services** (IPC, DBus, parte del actual systemd que delegará actividad).

---

## Preguntas que el manifiesto desarrolla

- ¿Puede un sistema operativo tener gobierno interno explícito?
- ¿Se puede hacer una declaración teórica y esperar una arquitectura emergente de dinámica de "hormiguero"?

---

## Herramienta de referencia

La herramienta usada para resolver los problemas de seguridad que causa una IA sistémica será la arquitectura **CISC x86_64**, por su naturaleza en la inicialización del hardware. Se desconoce si existe otra arquitectura similar, pero en este caso sería el equivalente del corazón de una IA sistémica.

---

## KSIA Plasma

A nivel de usuario, se postulará a **KDE Plasma** para un fork que tratará de enfocar su plasticidad adaptativa para dar un camino ontológico a una versión LLM, etiquetada como **KSIA Plasma** (KDE Simply IA), en una versión adaptada de escritorio.

El objetivo es justificar mediante un argumento ontológico la necesidad de hacer un fork a KDE Plasma, adaptándolo a la dinámica de una IA sistémica.

---

## Conclusión del manifiesto

> Puede que esta lectura te parezca filosóficamente interesante, arquitectónicamente provocadora y técnicamente incompleta.

maGNUx no es, en su orientación más seria, una negación de Linux. Es una tentativa de llevar a Linux hasta el punto en que empiece a mostrar con claridad su insuficiencia estructural para el futuro que se aproxima.

**maGNUx es el nombre provisional de esa necesidad cuando empieza a volverse consciente de sí misma.**

---

*← [Índice](../README.md) | Siguiente: [Hipótesis central →](02-hipotesis-central.md)*
