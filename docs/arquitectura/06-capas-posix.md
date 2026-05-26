# 06 — Capas de compatibilidad POSIX

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> maGNUx propone un régimen de compatibilidad inspirado en POSIX, orientado a preservar la capacidad contributiva de la comunidad y a ordenar sus aportaciones dentro de estratos bien definidos.

---

## Las capas conceptuales propuestas

```
┌──────────────────────────────────────────────┐
│         maPOSIXd02                           │
│  Carga del núcleo operativo (ADMIN)          │
│  Entorno administrativo estándar             │
├──────────────────────────────────────────────┤
│         Dernel                               │
│  Capa de abstracción: software operativo     │
│  acreditado para el host                     │
├──────────────────────────────────────────────┤
│         maPOSIXd01                           │
│  Carga del runtime del kernel (COMM)         │
│  Área de comunicación                        │
├──────────────────────────────────────────────┤
│         maPOSIXd00                           │
│  Carga del núcleo base en initramfs (ROOT)   │
│  Fundamento soberano del arranque            │
└──────────────────────────────────────────────┘
```

---

## Descripción de cada capa

### maPOSIXd00

- **Ubicación:** initramfs.
- **Función:** carga del núcleo base y establecimiento del fundamento soberano del arranque.
- **Equivalencia actual:** etapa pre-init, ACPI temprano, detección de hardware físico.

### maPOSIXd01

- **Ubicación:** área de comunicación / kernel runtime.
- **Función:** carga del runtime del kernel en el plano COMM.
- **Equivalencia actual:** parte de systemd relacionada con la orquestación de servicios del sistema.

### Dernel

- **Ubicación:** entre maPOSIXd01 y maPOSIXd02.
- **Función:** capa de abstracción orientada al software operativo **acreditado** para el host.
- **Nota:** no sustituye al kernel; prolonga su filosofía hacia el plano operativo legitimado.

### maPOSIXd02

- **Ubicación:** entorno administrativo / userspace.
- **Función:** carga del núcleo operativo del entorno administrativo.
- **Equivalencia actual:** lo que el usuario percibe como "un Linux normal".

---

## Nota sobre estas capas

> Estas capas **no deben leerse como especificación cerrada**, sino como primeros marcadores de una futura arquitectura de compatibilidad.

Su valor actual es conceptual: establecer que la secuencia de arranque debe tener **estratos diferenciados con identidad y responsabilidad propias**, no una cascada monolítica que mezcla fundamento con operación.

---

## Áreas funcionales en maduración

El manifiesto identifica cinco áreas que deberán madurar de forma coherente:

| Área | Descripción |
|---|---|
| **Identidad** | Define quién es el sistema, cómo se legitima, cómo persiste y cómo puede ser auditado. |
| **Gobierno** | Determina qué instancia posee autoridad estructural sobre el hardware, el arranque, la validación y la continuidad. |
| **Comunicación** | Ordena las relaciones entre procesos, servicios, buses, validaciones, permisos y reconciliación de estados. |
| **Operación** | Abarca el entorno administrativo y de usuario, donde aparecen herramientas útiles y trabajo cotidiano. |
| **Compatibilidad** | Busca reutilizar el legado Linux y POSIX sin renunciar a una reorganización más profunda de la arquitectura. |

Estas áreas no son compartimentos estancos. Forman una evolución:

```
Fundamento → Coordinación → Operación
```

---

*← [Bus de arranque](05-bus-arranque.md) | [Índice](../README.md) | Siguiente: [xGNUpeD →](../identidad/07-xgnuped.md)*
