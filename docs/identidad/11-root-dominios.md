# 11 — Root y los dominios de autoridad

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> El manifiesto reinterpreta `root` no como una cuenta aislada, sino como una **formación estructural de varios dominios**.

---

## La tesis de fondo

No basta con tener un privilegio abstracto; la **autoridad plena exige concurrencia de ámbitos distintos**.

---

## Los cuatro dominios conceptuales

### 1. Servicios primitivos

Acceso directo a recursos fundamentales del sistema.

- Hardware físico.
- Memoria base.
- CPU en modo privilegiado.
- Almacenamiento de bajo nivel.

### 2. Servicios de comunicación

Abstracción y gobierno de los canales de conectividad:

- LAN.
- INET.
- Otras formas de conectividad del sistema.

### 3. Servicios administrativos

Gestión del tráfico interno del sistema:

- Prioridades.
- Colas.
- Políticas.
- Entorno operativo de administración.

### 4. Servicios de usuario

Ejecución subordinada de:

- Tareas.
- Aplicaciones.
- Sesiones.
- Producción cotidiana.

---

## La identidad de ROOT emerge de la concurrencia

```
                    ROOT
                     │
     ┌───────────────┼───────────────────┐
     │               │                   │
     ▼               ▼                   ▼
Servicios      Servicios de        Servicios
primitivos     comunicación       administrativos
     │               │                   │
     └───────────────┼───────────────────┘
                     │
                     ▼
              Servicios de usuario
              (subordinados a ROOT)
```

> La raíz efectiva del sistema solo emerge cuando estos dominios quedan articulados bajo una **misma coherencia estructural**.

---

## Separación explícita: control vs. operación

### Identidades de control (= ROOT)

```
hroot + croot + droot = root
```

| Identidad | Ámbito probable |
|---|---|
| `hroot` | Hardware root — autoridad sobre el hardware físico. |
| `croot` | Communication root — autoridad sobre las comunicaciones del sistema. |
| `droot` | Dernel root — autoridad sobre la capa de licencia operativa. |

### Identidades de operación (= ADMIN)

```
sadmin + uadmin + aadmin = admin
```

| Identidad | Ámbito probable |
|---|---|
| `sadmin` | System admin — administración del sistema operativo. |
| `uadmin` | User admin — administración de usuarios y sesiones. |
| `aadmin` | Application admin — administración de aplicaciones y servicios. |

---

## Sin identidad del arranque, no hay soberanía

Una de las intuiciones más fértiles de maGNUx es que el sistema necesita una **identidad estructural previa** a su aparición como entorno operativo convencional.

Esta identidad no equivale al nombre de una distribución ni a un simple identificador administrativo. Debe ser una forma verificable de afirmar:

- Qué sistema está arrancando.
- Desde qué fundamento lo hace.
- Cuál es su estado legítimo.
- Qué continuidad mantiene respecto a su instalación, actualizaciones e integridad material.

> El sistema no debería "empezar a existir" solo cuando ya ejecuta servicios visibles, sino desde el momento en que puede afirmar de forma verificable su condición, su raíz y su estado.

---

*← [Host y Guest](10-host-guest.md) | [Índice](../README.md) | Siguiente: [Filosofía Unix y GNU →](../filosofia/12-filosofia-unix-gnu.md)*
