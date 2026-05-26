# 08 — Trilobytes: coherencia integral

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> Toda arquitectura declarativa real necesita una instancia que no solo observe, sino que también **verifique, compare, decida y, llegado el caso, niegue**.

---

## En pocas palabras

**Trilobytes** es la capa de coherencia integral entre identidad, política, operación y sesión orgánica.

Si xGNUpeD declara la identidad inicial del sistema, y Dernel concede licencia operativa, Trilobytes comprueba que la actividad que va a desplegarse en el entorno de usuario es coherente con ambas cosas.

No es solo login. No es solo autenticación. No es solo auditoría.

Es el punto donde el sistema pregunta:

```text
¿esta actividad orgánica que va a comenzar
está legitimada por la identidad del sistema,
por la política vigente
y por la licencia operativa concedida?
```

---

## Qué problema resuelve

En sistemas tradicionales, varias operaciones quedan separadas:

- autenticación de usuario;
- inicio de sesión;
- carga del entorno gráfico;
- permisos;
- sesiones;
- políticas;
- servicios por usuario;
- logs;
- límites de recursos;
- comunicación con DBus, PAM, systemd-logind o equivalentes.

Funcionan, pero no forman necesariamente una sola declaración semántica.

Trilobytes propone que el paso hacia la actividad del usuario no sea una suma de piezas, sino un **umbral coherente**.

---

## Logon y Login absorbidos

El corpus anterior distinguía dos ideas que aquí quedan integradas:

| Concepto | Función refundida en Trilobytes |
|---|---|
| **Logon** | Servicio que legitima la actividad orgánica antes de que exista sesión plena. |
| **Login** | Declaración explícita de la dinámica orgánica: inicio efectivo de la operación del usuario. |

La diferencia es importante:

```text
Logon
→ comprueba si la entidad orgánica puede ser reconocida.

Login
→ despliega la sesión operativa bajo una identidad ya legitimada.
```

Trilobytes contiene ambos momentos dentro de una misma lógica:

```text
identidad del sistema
→ licencia operativa
→ legitimación orgánica
→ sesión operativa
```

---

## Qué verifica Trilobytes

Trilobytes compara cinco planos:

| Plano | Pregunta |
|---|---|
| Identidad | ¿Quién dice ser el sistema? |
| Política | ¿Qué permite el contrato declarado? |
| Licencia | ¿Qué ha concedido el Dernel al guest? |
| Operación | ¿Qué se está intentando ejecutar? |
| Estado efectivo | ¿Qué está ocurriendo realmente? |

La misión es garantizar la **veracidad estructural**:

> Que lo que el sistema declara ser, lo que debe ser y lo que efectivamente ejecuta no diverjan de forma ilegítima.

---

## Trilobytes como delimitador administrativo

Trilobytes actúa como delimitador administrativo porque evita que la sesión de usuario se confunda con la raíz estructural del sistema.

En un sistema clásico, la frontera entre:

- root;
- administración;
- usuario;
- servicios;
- entorno gráfico;
- sesión;
- aplicaciones;

puede quedar repartida entre muchas capas.

Trilobytes intenta formular esa frontera explícitamente:

```text
el usuario puede operar,
pero no porque el sistema se abra sin más,
sino porque la actividad orgánica ha sido legitimada.
```

---

## Coherencia integral

Trilobytes no observa únicamente credenciales. Observa coherencia.

Una credencial correcta puede no bastar si:

- el host no está en estado legítimo;
- la identidad xGNUpeD no coincide con la política esperada;
- la licencia Dernel no permite ese tipo de sesión;
- la sesión solicita capacidades fuera del contrato;
- la actividad se presenta como usuario, pero actúa como explotación;
- la política de distribución no reconoce ese flujo.

Por eso Trilobytes no es un login bonito: es una instancia de coherencia.

---

## Relación con systemd, PAM y sesiones

En Linux actual, partes de este problema se reparten entre:

- PAM;
- systemd-logind;
- gestores de sesión;
- display managers;
- DBus;
- políticas de escritorio;
- permisos de grupos;
- polkit;
- cgroups;
- logs.

Trilobytes no niega esas piezas. Las reinterpreta desde una pregunta más alta:

```text
¿qué significa que una actividad orgánica quede legitimada por el sistema?
```

En una implementación inicial, Trilobytes podría apoyarse en mecanismos existentes. En una madurez futura, podría ordenar esos mecanismos bajo una semántica más explícita.

---

## Cuándo actúa

Trilobytes actúa en el umbral entre Host y Guest:

```text
Host estructural
  → xGNUpeD
  → Dernel
  → Trilobytes
  → Guest operativo
  → sesión del usuario
```

Su lugar natural es el proceso de entrada a la sesión, pero su alcance conceptual empieza antes del escritorio y continúa durante la sesión.

---

## El testigo de carrera

Una forma intuitiva de entender Trilobytes es la carrera de relevos.

Cada capa del sistema corre un tramo:

```text
kernel
→ xGNUpeD
→ Dernel
→ Trilobytes
→ sesión
```

El problema no es solo correr. El problema es **pasar el testigo sin falsear identidad**.

Trilobytes verifica que el testigo que llega desde la autoridad estructural es el mismo que recibe la actividad orgánica.

---

## Decisión y negación

Trilobytes debe poder hacer tres cosas:

| Resultado | Significado |
|---|---|
| Aceptar | La sesión es coherente con identidad, política y licencia. |
| Degradar | La sesión puede abrirse con capacidades reducidas. |
| Negar | La actividad no es legítima y no debe convertirse en sesión. |

La capacidad de negar es esencial. Sin negación, Trilobytes sería solo un registrador pasivo.

---

## Relación con Dernel

Dernel concede licencia operativa al guest.

Trilobytes comprueba que esa licencia no se convierta en actividad incoherente.

```text
Dernel
→ concede marco operativo

Trilobytes
→ verifica que la actividad orgánica respeta ese marco
```

---

## Criterio de aceptación conceptual

Trilobytes existe correctamente si permite responder:

1. qué entidad orgánica intenta operar;
2. bajo qué identidad de sistema opera;
3. qué licencia Dernel recibe;
4. qué política de sesión se aplica;
5. qué capacidades se conceden;
6. qué divergencias se detectan;
7. qué se acepta, degrada o niega;
8. cómo queda registrada la legitimación.

---

## Posición en la secuencia

```text
Kernel
  └── xGNUpeD
        └── Dernel
              └── Trilobytes
                    ├── Logon
                    ├── Login
                    └── Sesión del usuario
```

---

*← [xGNUpeD](07-xgnuped.md) | [Índice](../README.md) | Siguiente: [Dernel →](09-dernel.md)*
