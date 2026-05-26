# 10 — Dinámica de identidades: Host y Guest

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> maGNUx: **Ser y no Ser** — el área de mínima acción materializada en la arquitectura CISC x86_64.

---

## La separación fundamental

En maGNUx separamos:

| Concepto | Definición |
|---|---|
| **Host** | Identidad de la máquina conceptualizada (el tipo de "coche" que circula). |
| **Guest** | Identidad del conductor o entidad orgánica que lleva al Host a interaccionar con servicios pensados para tráfico orgánico. |

---

## ¿Cómo nace el concepto de identidad droide?

> ¿Cómo una hormiga entiende cuál es su hormiguero?

De la misma forma: ¿Cómo se puede recrear la decisión de un servicio, demonio o programa acerca de los límites de su objetivo algorítmico?

¿Es la ruptura con la filosofía tradicional Unix, iniciada por SystemD, la solución?

La arquitectura de Linux es una **"madeja de galerías de hormiguero"**. Tras el inicio del sistema, levantar el user space suponía una obra de ingeniería bastante idealizada y poco aterrizada en la realidad.

Las arquitecturas que dotan de coherencia al hardware CISC x86 (sea de 64 o 32 bits) eran una verdadera pesadilla en relación al hardware y su potencia:

- Por un lado debían lidiar con las colas FIFO, LIFO, FILO y LILO, que se encargaban de gestionar el registro de arranque.
- Por otro lado, los exploits de seguridad que se heredan con la sinergia a la hora de hacer funcionar la arquitectura planteada del hardware con el modo de arrancar del software.

Por todo esto vino a la luz **SystemD**, que de un plumazo dio una hoja de ruta por la cual avanzar, a costa de romper la pureza Unix.

> SystemD es una línea recta que alcanza una manera de abrir vías de trabajo para ir afrontando las inclemencias del malware y poder ir parcheando los exploits con un éxito razonable para infraestructuras críticas.

---

## La identidad del Host

### ¿Cómo se forma?

```
Bootloader
  └── define el chasis
        └── Kernel
              └── matricula a la máquina
                    └── xGNUpeD
                          └── consolida la identidad de Host
```

### Componentes

| Componente | Función en el Host |
|---|---|
| **Kernel host** | Reconocimiento de hardware, esclavización de núcleos. |
| **Kommu services** | IPC, DBus, mediación de comunicaciones del sistema. |
| **Dernel run time** | Ejecución acreditada. Ciclo de licencia operativa. |

---

## La identidad del Guest

Actualmente tenemos a SystemD que parchea la inestabilidad del sistema con un punto o nexo de cruce, aliviando los exploits y las subsiguientes escaladas de privilegios asociadas a ellos.

Por otro lado, en el área admin (actualmente difusa y cargada en el userspace) teníamos:
- **X11** y actualmente **Wayland**, que hace lo propio en el entorno gráfico, dotando de entidad a cada ventana gestionada en el entorno gráfico.

### La identidad del Guest emerge de:

| Componente | Función en el Guest |
|---|---|
| **Dernel guest** | Recibe la licencia operativa del host. |
| **Logon service** | Autenticación estructural del guest. |
| **Login sesión** | Sesión operativa desplegada para el usuario. |

---

## Diagrama completo de identidades

```
┌─────────────────────────────────────────────┐
│                   HOST                       │
│                                              │
│  ┌─────────────┐  ┌──────────────────────┐  │
│  │ Kernel host │  │   Kommu services     │  │
│  │             │  │  (IPC, DBus, COMM)   │  │
│  └──────┬──────┘  └──────────┬───────────┘  │
│         │                    │              │
│         └────────┬───────────┘              │
│                  │                          │
│          ┌───────▼────────┐                 │
│          │ Dernel run time│                 │
│          └───────┬────────┘                 │
├──────────────────┼──────────────────────────┤
│                  │           GUEST          │
│          ┌───────▼────────┐                 │
│          │  Dernel guest  │                 │
│          └───────┬────────┘                 │
│                  │                          │
│          ┌───────▼────────┐                 │
│          │ Logon service  │                 │
│          └───────┬────────┘                 │
│                  │                          │
│          ┌───────▼────────┐                 │
│          │ Login sesión   │                 │
│          └────────────────┘                 │
└─────────────────────────────────────────────┘
```

---

*← [Dernel](09-dernel.md) | [Índice](../README.md) | Siguiente: [Root y dominios →](11-root-dominios.md)*
