# Especificación técnica: xGNUpeD

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

**Estado:** Borrador inicial  
**Capa:** ROOT (finalización del kernel)  
**Precedencia:** después del kernel, antes del Dernel  

---

## Qué es

xGNUpeD es el **driver del sistema**: la última etapa de la carga del kernel antes de que comience cualquier actividad del espacio operativo.

No es un nuevo `init`. Es la instancia que permite al kernel **reconocerse a sí mismo** y comunicar esa identidad al Dernel en un lenguaje base universal.

---

## Responsabilidades

1. Asociar la máquina a la distribución instalada y a la versión de kernel.
2. Generar y persistir la **identidad de Host** en una región de memoria protegida.
3. Establecer el **lenguaje base** de comunicación Dernel ↔ kernel.
4. Articular las cuatro propiedades de identidad (ver abajo).

## Fuera de responsabilidad

- No gestiona servicios.
- No monta sistemas de ficheros de usuario.
- No ejecuta ningún proceso del espacio de usuario.

---

## Las cuatro propiedades de identidad

### P1 — Identidad distributiva
El sistema registra su linaje: distribución, versión de kernel, hash de instalación.

```c
typedef struct {
    char distro_id[64];       // e.g. "maGNUx-base"
    char kernel_version[32];  // e.g. "6.x.x-magnux"
    uint8_t install_hash[32]; // SHA-256 de la instalación base
} distributive_id_t;
```

### P2 — Identidad conmutativa
El sistema puede distinguir su propia naturaleza frente a despliegues compatibles (VM, container, bare metal).

```c
typedef enum {
    HOST_BARE_METAL = 0,
    HOST_VM         = 1,
    HOST_CONTAINER  = 2,
    HOST_UNKNOWN    = 255
} host_context_t;
```

### P3 — Identidad asociativa
Registro de contribuciones y actualizaciones, manteniendo coherencia estructural.

```c
typedef struct {
    uint32_t update_seq;      // secuencia de actualizaciones
    uint8_t  community_sig[64]; // firma de la comunidad/distribución
} associative_id_t;
```

### P4 — Identidad comunicativa
Log estructurado y auditable desde la primera instrucción del arranque.

```c
typedef struct {
    uint64_t timestamp_ns;
    uint8_t  stage;           // 0=pre-init, 1=kernel, 2=xgnuped, 3=dernel
    uint8_t  event_type;
    char     message[128];
} boot_event_t;
```

---

## Estructura de datos: host_identity_t

```c
typedef struct {
    uint32_t         magic;           // 0x474E5558 ("GNUX")
    uint32_t         version;         // versión de la estructura
    distributive_id_t distributive;
    host_context_t   context;
    associative_id_t associative;
    boot_event_t     boot_log[256];   // ring buffer de arranque
    uint32_t         boot_log_idx;
    uint8_t          checksum[32];    // integridad de la estructura
} host_identity_t;
```

Esta estructura se persiste en una **región de memoria reservada** durante todo el ciclo de vida del sistema.

---

## Interfaz con el Dernel

xGNUpeD expone al Dernel una interfaz mínima:

```c
// Obtener la identidad del host (solo lectura desde el Dernel)
const host_identity_t* xgnuped_get_identity(void);

// Verificar que la identidad es válida y no ha sido alterada
int xgnuped_verify_integrity(void);

// Registrar un evento de arranque
void xgnuped_log_event(uint8_t stage, uint8_t type, const char* msg);
```

---

## Integración en initramfs (prototipo v0.1)

En el prototipo, xGNUpeD se implementa como un binario estático en C ejecutado desde el `init` de initramfs, **antes** de cualquier montaje de sistema de ficheros de usuario.

```
init
  └── exec /sbin/xgnuped-init
        ├── detecta contexto (bare metal / VM)
        ├── genera host_identity_t
        ├── la escribe en /dev/shm/host-identity (temporal)
        └── retorna control al init con código de estado
```

---

*← [Resumen ejecutivo](00-resumen-ejecutivo.md) | Siguiente: [Especificación Dernel →](02-dernel-spec.md)*
