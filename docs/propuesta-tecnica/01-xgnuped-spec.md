# Especificación técnica: xGNUpeD / HostID

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

**Estado:** Borrador técnico v0.2  
**Capa:** ROOT  
**Precedencia:** después del kernel/initramfs, antes del Dernel  
**Implementación inicial:** binario o módulo de usuario temprano en initramfs  

---

## En pocas palabras

xGNUpeD es la capa que declara identidad temprana del sistema.

En el prototipo v0.1, esa función se concreta como **HostID**:

```text
HostID
→ representación mínima y verificable de la identidad del Host
generada o leída durante initramfs
antes de entregar control al sistema raíz ordinario.
```

La especificación no intenta cerrar todo xGNUpeD. Define el subconjunto mínimo que puede probarse ahora.

---

## Objetivo técnico

El objetivo es producir una estructura de identidad capaz de responder:

1. qué Host está arrancando;
2. qué kernel lo sostiene;
3. qué distribución o linaje lo interpreta;
4. en qué contexto arranca;
5. qué política mínima se aplica;
6. qué eventos tempranos se registran;
7. qué integridad puede verificarse antes de continuar.

---

## No objetivos

xGNUpeD / HostID v0.1 no debe:

- gestionar servicios;
- reemplazar init;
- montar el sistema raíz final por sí solo;
- autenticar usuarios;
- implementar Trilobytes;
- modificar el kernel;
- prometer seguridad criptográfica completa;
- requerir hardware especializado.

---

## Posición en el arranque

```text
firmware
  ↓
bootloader
  ↓
kernel
  ↓
initramfs
  ↓
xGNUpeD / HostID
  ↓
boot-validator
  ↓
Dernel policy
  ↓
switch_root / pivot_root
```

---

## Modelo de identidad

La identidad xGNUpeD se compone de cuatro propiedades, ya definidas conceptualmente en `docs/identidad/07-xgnuped.md`.

Aquí se expresan como requisitos técnicos.

| Propiedad | Requisito técnico mínimo |
|---|---|
| Identidad distributiva | Registrar distribución, kernel, build o linaje base. |
| Identidad asociativa | Registrar relación con comunidad, repositorio, perfil o actualización. |
| Identidad conmutativa | Detectar contexto: bare metal, VM, contenedor, modo rescate o desconocido. |
| Identidad comunicativa | Emitir eventos tempranos estructurados y verificables. |

---

## Estructuras de datos propuestas

### Contexto del Host

```c
typedef enum {
    HOST_BARE_METAL = 0,
    HOST_VM         = 1,
    HOST_CONTAINER  = 2,
    HOST_RESCUE     = 3,
    HOST_UNKNOWN    = 255
} host_context_t;
```

### Identidad distributiva

```c
typedef struct {
    char distro_id[64];
    char distro_version[64];
    char kernel_version[64];
    char machine_id[64];
    unsigned char install_hash[32];
} distributive_id_t;
```

### Identidad asociativa

```c
typedef struct {
    char profile_id[64];
    char repository_id[64];
    unsigned int update_seq;
    unsigned char community_sig[64];
} associative_id_t;
```

### Evento temprano

```c
typedef enum {
    BOOT_EVENT_INFO    = 0,
    BOOT_EVENT_WARN    = 1,
    BOOT_EVENT_ERROR   = 2,
    BOOT_EVENT_DENY    = 3,
    BOOT_EVENT_ACCEPT  = 4
} boot_event_type_t;

typedef struct {
    unsigned long long timestamp_ns;
    unsigned char stage;
    boot_event_type_t type;
    char component[32];
    char message[160];
} boot_event_t;
```

### Identidad completa del Host

```c
#define XGNUPED_MAGIC 0x474E5558u /* GNUX */
#define XGNUPED_VERSION 1
#define XGNUPED_BOOT_LOG_SIZE 256

typedef struct {
    unsigned int magic;
    unsigned int version;
    distributive_id_t distributive;
    associative_id_t associative;
    host_context_t context;
    boot_event_t boot_log[XGNUPED_BOOT_LOG_SIZE];
    unsigned int boot_log_idx;
    unsigned char checksum[32];
} host_identity_t;
```

---

## Fuentes de datos v0.1

En initramfs, xGNUpeD / HostID puede obtener información desde:

| Dato | Fuente tentativa |
|---|---|
| Kernel | `/proc/version`, `uname`, cmdline. |
| Distro | `/etc/os-release` si está disponible en initramfs o declaración en `/boot/metal`. |
| Máquina | `/etc/machine-id`, DMI, fallback generado. |
| Contexto VM | `/sys/class/dmi/id/*`, CPUID, heurísticas simples. |
| Política | `scripts/policy.conf` o futuro `/boot/metal/policy.toml`. |
| Eventos | reloj monotónico, secuencia interna, early-comm. |

La especificación debe permitir fallback: si un dato no existe, se declara como `unknown`, no se inventa.

---

## Salidas esperadas

El prototipo debe producir, como mínimo:

```text
/run/maGNUx/host-id
/run/maGNUx/boot-events.log
/run/maGNUx/host-identity.toml
```

En fases tempranas, si `/run/maGNUx` aún no existe, puede usarse un destino provisional:

```text
/dev/shm/maGNUx/host-id
/tmp/maGNUx/host-id
```

pero el objetivo de Zalty debe ser `/run/maGNUx`.

---

## Formato TOML mínimo

```toml
[host]
id = "unknown-or-generated"
context = "bare-metal"
kernel = "6.x"
distro = "zalty"
policy = "default"

[identity]
distributive = true
associative = true
commutative = true
communicative = true

[status]
valid = true
checksum = "sha256:..."
```

---

## Interfaz C mínima

```c
int xgnuped_init(host_identity_t *out);
int xgnuped_detect_context(host_identity_t *id);
int xgnuped_load_distributive(host_identity_t *id);
int xgnuped_load_associative(host_identity_t *id);
int xgnuped_log_event(host_identity_t *id, boot_event_type_t type, const char *component, const char *message);
int xgnuped_calculate_checksum(host_identity_t *id);
int xgnuped_verify_integrity(const host_identity_t *id);
int xgnuped_write_report(const host_identity_t *id, const char *path);
```

---

## Códigos de retorno

| Código | Significado |
|---:|---|
| `0` | Identidad generada y verificada. |
| `1` | Identidad generada con campos desconocidos. |
| `2` | Fallo de integridad no fatal. |
| `10` | No se pudo crear salida. |
| `20` | Política incompatible. |
| `30` | Fallo fatal: no continuar. |

---

## Integración con boot-validator

HostID no decide por sí solo si el sistema continúa. Entrega datos al validador.

```text
xGNUpeD / HostID
→ declara identidad

boot-validator
→ evalúa continuidad

Dernel policy
→ autoriza operación inicial
```

El validador debe poder leer:

- `host_identity_t`;
- reporte TOML;
- eventos tempranos;
- estado de integridad.

---

## Integración con Dernel

Dernel recibe identidad de Host como precondición.

```c
int dernel_runtime_init(const host_identity_t *host_id);
```

Dernel no debe iniciar si:

- `magic` no coincide;
- `version` no es compatible;
- `checksum` falla de forma fatal;
- la política exige un contexto distinto;
- el estado del Host se marca como no válido.

---

## Criterios de aceptación v0.1

La especificación xGNUpeD / HostID se considera implementable si el prototipo puede:

1. ejecutarse desde initramfs;
2. generar una estructura `host_identity_t`;
3. detectar al menos `HOST_VM` y `HOST_UNKNOWN`;
4. registrar kernel y distro si están disponibles;
5. registrar eventos tempranos;
6. escribir un reporte legible;
7. calcular una suma de integridad;
8. devolver códigos de estado claros;
9. alimentar al boot-validator;
10. alimentar al Dernel policy.

---

## Criterios de rechazo

El prototipo debe fallar o degradar si:

- no puede escribir ningún estado;
- la política exige identidad completa y faltan campos críticos;
- se detecta manipulación de la estructura;
- el contexto detectado contradice la política;
- la secuencia de arranque no permite continuidad.

---

## Relación con documentos conceptuales

| Documento | Relación |
|---|---|
| `docs/identidad/07-xgnuped.md` | Define el sentido conceptual de xGNUpeD. |
| `docs/arquitectura/04-inicio-sistema.md` | Sitúa xGNUpeD en el arranque temprano. |
| `docs/arquitectura/05-bus-arranque.md` | Explica cómo comunica eventos tempranos. |
| `docs/propuesta-tecnica/02-dernel-spec.md` | Consume la identidad generada. |

---

*← [Resumen ejecutivo](00-resumen-ejecutivo.md) | Siguiente: [Especificación Dernel →](02-dernel-spec.md)*
