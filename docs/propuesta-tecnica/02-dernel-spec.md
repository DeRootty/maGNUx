# Especificación técnica: Dernel

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

**Estado:** Borrador inicial  
**Capa:** Entre ROOT y ADMIN  
**Dependencia:** xGNUpeD debe estar activo  

---

## Qué es

El Dernel es la **capa de licencia operativa**: la instancia que traduce la soberanía material del host (establecida por xGNUpeD) en capacidad operativa legítima para el guest.

No sustituye al kernel. No es systemd. Es la capa que actualmente **no existe** en Linux: el contrato explícito entre el hardware soberano y el software que quiere usarlo.

---

## División interna

```
Dernel
  ├── run time   (área del host)
  │     → gestiona el ciclo de ejecución acreditado
  │     → solo recibe instrucciones del kernel + xGNUpeD
  │
  └── guest      (área de transición)
        → otorga licencia operativa al entorno del usuario
        → es el límite entre ROOT y ADMIN
```

---

## Contrato Dernel run time

### Precondiciones

- xGNUpeD ha completado su ejecución con éxito.
- `host_identity_t` es válida y verificable.
- No hay procesos de usuario activos.

### Responsabilidades

1. Recibir la identidad de host de xGNUpeD.
2. Establecer las **políticas de ejecución acreditada**: qué binarios pueden ejecutarse en esta fase.
3. Levantar Kommu services (IPC mínimo, canal de comunicación entre estratos).
4. Pasar el testigo al Dernel guest cuando el host esté completamente estabilizado.

### Interfaz

```c
typedef struct {
    uint8_t  allowed_binaries_hash[MAX_BINARIES][32]; // lista blanca
    uint32_t n_allowed;
    uint8_t  policy_version;
} dernel_policy_t;

// Inicializar el Dernel con la identidad del host
int dernel_runtime_init(const host_identity_t* host_id);

// Verificar si un binario tiene licencia para ejecutarse
int dernel_runtime_authorize(const char* binary_path, uint8_t* binary_hash);

// Activar Kommu services
int dernel_runtime_start_kommu(void);
```

---

## Contrato Dernel guest

### Precondiciones

- Dernel run time ha completado su inicialización.
- Kommu services está activo.

### Responsabilidades

1. Recibir la licencia operativa del run time.
2. Preparar el entorno para el Logon service (Trilobytes).
3. Establecer el límite entre lo que el guest puede y no puede hacer sobre el host.

### Interfaz

```c
typedef struct {
    uint32_t  guest_capabilities;   // bitmask de capacidades permitidas
    uint32_t  guest_restrictions;   // bitmask de restricciones
    uint8_t   session_nonce[16];    // nonce único por sesión
} guest_license_t;

// Generar la licencia del guest a partir de la política del host
guest_license_t dernel_guest_generate_license(const dernel_policy_t* policy);

// Pasar el testigo a Trilobytes / Logon service
int dernel_guest_handoff(const guest_license_t* license);
```

---

## El problema del idle: cómo lo resuelve el Dernel

En el arranque actual, los scripts bash generan idle en el procesador — una ventana de vulnerabilidad.

El Dernel resuelve esto con una política simple:

```
Para cada proceso que solicita ejecutarse durante el arranque:

  SI el proceso está en la lista blanca del host
    → autorizar (es una pieza crítica del host)
  SI NO
    → denegar (es un exploit potencial)
```

Esto hace el arranque **virtualmente invulnerable a idle injection**: no hay ventana de oportunidad porque no hay procesos no autorizados ejecutándose.

---

## Integración en initramfs (prototipo v0.1)

En el prototipo, el Dernel se implementa como una **política en fichero** leída por el init, antes de ejecutar cualquier binario del sistema de ficheros real.

```
init
  ├── xgnuped-init         ← establece identidad
  ├── dernel-runtime-init  ← carga política, autoriza binarios
  ├── [pivot_root]         ← montaje del sistema real
  └── dernel-guest-init    ← otorga licencia al entorno de usuario
```

### Fichero de política (prototipo)

```ini
# /etc/dernel/policy.conf (en initramfs)
[runtime]
policy_version = 1
allow = /sbin/init
allow = /sbin/udevd
allow = /sbin/xgnuped-init
deny_unknown = true

[guest]
capabilities = BASIC_SESSION
restrictions = NO_RAW_SOCKET, NO_KERNEL_MODULE
```

---

*← [Especificación xGNUpeD](01-xgnuped-spec.md) | [Índice](../README.md)*
