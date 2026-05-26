# 03 — Los tres estratos: ROOT, COMM, ADMIN

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> El principio rector de maGNUx es la **separación entre control y operación**.

---

## 5.1 Control

Se entiende por **control** la capacidad de someter el hardware y los fundamentos del sistema a una autoridad estructural máxima.

Esta autoridad no debe confundirse simplemente con el privilegio tradicional de `root`, sino con una raíz más profunda: la instancia desde la que el sistema obtiene **legitimidad, continuidad y capacidad de persistencia**.

---

## 5.2 Operación

Se entiende por **operación** la materialización útil del sistema para usuarios, servicios, procesos y administradores.

Es el plano donde aparecen:
- Las tareas cotidianas.
- Los entornos reconocibles.
- La experiencia administrativa.
- La interacción ordinaria.

---

## 5.3 La consecuencia

La arquitectura contemporánea suele **mezclar ambos planos**.

maGNUx propone separarlos con claridad para evitar que la operación cotidiana absorba o diluya la autoridad estructural del sistema.

---

## Los tres estratos

```
┌─────────────────────────────────────┐
│              ADMIN                  │  ← Operación cotidiana
│  (shells, servicios, herramientas)  │
├─────────────────────────────────────┤
│               COMM                  │  ← Mediación y coherencia
│  (IPC, DBus, Kommu services)        │
├─────────────────────────────────────┤
│               ROOT                  │  ← Autoridad estructural
│  (kernel, initramfs, identidad)     │
└─────────────────────────────────────┘
```

---

### 6.1 ROOT

ROOT no es solo el superusuario clásico ni una mera equivalencia con el kernel. Es la **raíz estructural del sistema**: la instancia que garantiza:

- Continuidad.
- Legitimidad inicial.
- Base material.
- Orientación del arranque.
- Persistencia del fundamento.

#### Dominios de autoridad de ROOT

La autoridad plena exige **concurrencia de cuatro ámbitos**:

| Dominio | Función |
|---|---|
| **Servicios primitivos** | Acceso directo a recursos fundamentales del sistema. |
| **Servicios de comunicación** | Abstracción y gobierno de los canales LAN, INET y otras formas de conectividad. |
| **Servicios administrativos** | Gestión del tráfico interno, prioridades, colas y políticas. |
| **Servicios de usuario** | Ejecución subordinada de tareas, aplicaciones y sesiones. |

> La raíz efectiva del sistema solo emerge cuando estos dominios quedan articulados bajo una misma coherencia estructural.

---

### 6.2 COMM

COMM no es solo red ni transporte entre procesos. Es el **plano de mediación y coherencia**.

En COMM, la comunicación deja de ser mero intercambio y pasa a convertirse en:
- Coordinación.
- Validación.
- Reconciliación de estado.
- Secuenciación.
- Gobierno.

---

### 6.3 ADMIN

ADMIN es el **entorno operativo subordinado**. Es el Linux reconocible: shells, servicios, herramientas, procesos de usuario, espacio administrativo y experiencia funcional cotidiana.

> No es irrelevante; al contrario, es el lugar donde el sistema se vuelve útil. Pero **no debe confundirse con el fundamento que lo legitima**.

---

## Qué sí es y qué no es maGNUx

### ✅ Sí es

- Una arquitectura conceptual para pensar el gobierno explícito del sistema.
- Una tentativa de dotar al arranque de identidad y soberanía.
- Una separación entre fundamento, mediación y operación.
- Una propuesta transicional apoyada en Linux.
- Una teoría del sistema orientada a la trazabilidad, la coherencia y la legitimidad del estado.
- Una gramática emergente para ordenar piezas ya existentes y otras aún por definir.

### ❌ No es

- Un reemplazo inmediato de Linux.
- Una implementación terminada.
- Un sistema operativo clásico ya cerrado.
- Una negación del valor de `systemd`, `dbus`, namespaces, cgroups o el userland contemporáneo.
- Una simple secuencia nueva de instrucciones de arranque.
- Una promesa de invulnerabilidad absoluta.

---

*← [Hipótesis central](../manifesto/02-hipotesis-central.md) | [Índice](../README.md) | Siguiente: [Inicio del sistema →](04-inicio-sistema.md)*
