# 09 — Dernel: licencia operativa

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> Dernel expresa una intuición importante: el sistema necesita una capa capaz de **traducir soberanía material en capacidad operativa legítima**.

---

## En pocas palabras

**Dernel** es la capa que convierte la identidad estructural del Host en **licencia operativa** para el Guest.

No sustituye al kernel. No es un init completo. No es simplemente un gestor de servicios.

Su función es más concreta:

```text
recibir una identidad de sistema ya declarada por xGNUpeD,
y decidir bajo qué condiciones el entorno operativo puede usar el Host.
```

En la lectura antigua aparecía como Dernel/ZaltID. En esta refundición, **ZaltID** queda entendido como el modelo de identidad del Dernel: la forma en que el Dernel reconoce, delimita y concede autoridad operativa.

---

## Qué problema resuelve

En Linux tradicional, el sistema pasa del kernel al espacio de usuario mediante mecanismos muy eficaces, pero la frontera entre autoridad estructural y operación cotidiana no siempre queda formulada como contrato.

El resultado es que muchas piezas acaban mezcladas:

- init;
- supervisor de servicios;
- sesiones;
- permisos;
- comunicación;
- política;
- administración;
- entorno gráfico;
- servicios de usuario;
- privilegios root.

Dernel intenta separar dos preguntas:

```text
¿quién sostiene materialmente el sistema?
```

Y:

```text
¿quién tiene licencia para operar sobre ese sistema?
```

La primera pregunta pertenece al Host. La segunda pertenece al Guest autorizado.

---

## Qué no es Dernel

Dernel no es:

- un nuevo kernel;
- un microkernel;
- un init universal;
- un reemplazo completo de systemd;
- un gestor de escritorio;
- un demonio de sesión;
- un simple policy manager.

Dernel no intenta hacer todo. Precisamente intenta evitar que una sola pieza mezcle autoridad, operación, sesión, comunicación y política sin una separación explícita.

---

## Qué sí es Dernel

Dernel es una **capa de licencia operativa**.

Media entre:

```text
Host estructural
(kernel + xGNUpeD + identidad temprana)

        ↕

Guest operativo
(entorno de usuario, servicios, sesión, administración)
```

Su tarea es responder:

1. qué parte del Host puede ser usada;
2. por qué entidad Guest;
3. bajo qué política;
4. con qué límites;
5. durante qué estado del sistema;
6. con qué trazabilidad;
7. y bajo qué posibilidad de revocación.

---

## Dernel run time y Dernel guest

El Dernel se divide conceptualmente en dos áreas:

### Dernel run time

Pertenece al área del Host.

Gestiona:

- ciclo de ejecución acreditado;
- relación con hardware disponible;
- continuidad entre identidad temprana y operación;
- validación de procesos críticos;
- estado del sistema desde el punto de vista de autoridad estructural.

### Dernel guest

Pertenece al área Guest.

Gestiona:

- licencia recibida por el entorno operativo;
- límites del usuario o sesión;
- condiciones de ejecución;
- permisos derivados;
- relación con Logon, Login y Trilobytes.

```text
Host:
  ├── Kernel host
  ├── xGNUpeD
  ├── Kommu services
  └── Dernel run time

Guest:
  ├── Dernel guest
  ├── Trilobytes
  ├── Logon service
  └── Login sesión
```

---

## ZaltID como modelo del Dernel

ZaltID no debe entenderse como un nombre decorativo. Es el modelo de identidad que permite al Dernel operar con una pregunta precisa:

```text
¿qué identidad está solicitando licencia operativa sobre este Host?
```

ZaltID concentra:

- identidad del Host;
- identidad del Guest;
- relación entre distribución y sistema;
- política de arranque;
- contrato operativo;
- estado de confianza;
- legitimación de la sesión;
- capacidad de revocación.

Dernel sin ZaltID sería una capa de permisos sin teoría de identidad.

ZaltID sin Dernel sería una identidad sin capacidad operativa.

---

## Relación con el idle y los procesos no legítimos

El corpus anterior planteaba una intuición importante: los tiempos muertos o zonas difusas del arranque pueden convertirse en ventanas de ataque.

No se trata de afirmar que todo idle sea vulnerable por sí mismo, sino de reconocer una idea sistémica:

```text
si el sistema no sabe distinguir qué proceso aporta al levantamiento
y qué proceso solo aparece durante una ventana ambigua,
entonces la legitimidad del arranque queda debilitada.
```

Dernel introduce una pregunta temprana:

```text
¿este proceso contribuye a levantar el Host
o intenta aprovecharse de una fase no declarada?
```

Por eso la distinción es:

| Resultado | Interpretación |
|---|---|
| Aporta a la continuidad del Host | Proceso candidato a validación. |
| No aporta y aparece en fase crítica | Proceso sospechoso o exploit. |
| Aporta pero excede contrato | Proceso degradable, aislable o rechazable. |

---

## Relación con systemd

systemd mantiene una línea de continuidad operativa muy potente: servicios, unidades, dependencias, logs, cgroups, sesiones y activación.

Dernel no niega esa utilidad. La reubica.

La crítica conceptual es que systemd puede terminar siendo:

```text
arranque + supervisión + sesión + política + operación
```

Dernel propone separar:

```text
identidad temprana  → xGNUpeD
licencia operativa  → Dernel
coherencia de sesión → Trilobytes
servicios concretos → init/supervisor compatible
```

Así, un sistema podría usar systemd, OpenRC, runit, dinit u otro supervisor, pero ya no como fundamento semántico de identidad. Solo como pieza operativa dentro de un contrato mayor.

---

## Contrato operativo

El Dernel concede licencia bajo contrato.

Ese contrato puede incluir:

- identidad del Host;
- identidad del Guest;
- capacidades concedidas;
- servicios disponibles;
- límites administrativos;
- comunicación permitida;
- acceso a hardware;
- política de escalada;
- reglas de revocación;
- trazabilidad mínima.

Ejemplo conceptual:

```text
Host reconocido: sí
xGNUpeD válido: sí
política de arranque: dev/test
Guest solicitado: sesión orgánica local
licencia Dernel: limitada
Trilobytes: requerido
```

---

## Relación con Trilobytes

Dernel no autentica por sí solo la actividad orgánica. Concede el marco.

Trilobytes verifica la coherencia del paso hacia sesión.

```text
Dernel
→ concede licencia operativa

Trilobytes
→ comprueba que la actividad orgánica respeta la licencia
```

---

## Relación con Root

Dernel root (`droot`) forma parte de la composición de autoridad raíz descrita en maGNUx:

```text
hroot + croot + droot = root
```

El Dernel no es toda la raíz. Es el dominio que gobierna la licencia operativa.

- `hroot` gobierna la materialidad del hardware.
- `croot` gobierna el plano de comunicación.
- `droot` gobierna la licencia operativa.

La raíz completa emerge cuando esos dominios se coordinan.

---

## Secuencia conceptual

```text
Kernel
  ↓
xGNUpeD
  ↓
Dernel run time
  ↓
Dernel guest
  ↓
Trilobytes
  ↓
Logon
  ↓
Login
  ↓
Sesión operativa
```

---

## Criterio de aceptación conceptual

Dernel existe correctamente si permite responder:

1. qué Host se ofrece como base material;
2. qué identidad xGNUpeD lo declara;
3. qué Guest solicita operar;
4. qué licencia se concede;
5. qué capacidades se limitan;
6. qué procesos son críticos;
7. qué procesos son sospechosos;
8. qué comunicación queda permitida;
9. qué revocación es posible;
10. cómo se entrega la licencia a Trilobytes.

---

*← [Trilobytes](08-trilobytes.md) | [Índice](../README.md) | Siguiente: [Host y Guest →](10-host-guest.md)*
