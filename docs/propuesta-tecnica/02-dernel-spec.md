# Especificación técnica: Dernel

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

**Estado:** Borrador técnico v0.2  
**Capa:** Entre ROOT, COMM y ADMIN  
**Dependencia:** xGNUpeD / HostID debe haber producido identidad válida  
**Implementación inicial:** política leída por initramfs + validador mínimo  

---

## En pocas palabras

Dernel es la capa de **licencia operativa**.

En el prototipo v0.1 no se implementa todavía como subsistema completo. Se expresa como una política mínima que decide:

```text
qué puede continuar,
qué debe detenerse,
qué queda degradado,
y qué condiciones deben cumplirse
antes de entregar control al sistema ordinario.
```

---

## Objetivo técnico

El objetivo del Dernel v0.1 es recibir una identidad HostID/xGNUpeD y aplicar una política inicial de continuidad.

Debe responder:

1. si la identidad del Host es aceptable;
2. si el contexto de arranque coincide con la política;
3. qué binarios o fases pueden ejecutarse;
4. qué capacidades se conceden al Guest inicial;
5. qué restricciones quedan activas;
6. si se permite pivot/switch hacia el sistema raíz;
7. qué debe registrarse en `/run/maGNUx`.

---

## No objetivos

Dernel v0.1 no debe:

- reemplazar systemd;
- gestionar todos los servicios;
- autenticar usuarios;
- implementar Trilobytes;
- administrar entorno gráfico;
- modificar el kernel;
- implementar un LSM propio;
- prometer aislamiento completo.

---

## Posición en el flujo

```text
xGNUpeD / HostID
  ↓
boot-validator
  ↓
Dernel policy
  ├── autoriza continuidad
  ├── deniega continuidad
  └── degrada modo de arranque
  ↓
switch_root / pivot_root
  ↓
ADMIN inicial
```

---

## División conceptual

```text
Dernel
  ├── run time
  │     área del Host
  │     valida continuidad y ejecución acreditada
  │
  └── guest
        área de transición
        genera licencia inicial para el entorno operativo
```

En v0.1, ambas partes pueden estar representadas por una misma política y funciones auxiliares.

---

## Precondiciones

Antes de iniciar Dernel policy debe cumplirse:

| Precondición | Fuente |
|---|---|
| HostID existe | xGNUpeD / HostID. |
| Identidad tiene versión compatible | `host_identity_t.version`. |
| Integridad no fatal | checksum o validación equivalente. |
| Política cargable | `policy.conf` o futura política TOML. |
| Ruta runtime disponible | `/run/maGNUx` o fallback temporal. |
| Eventos tempranos accesibles | early-comm / boot log. |

Si alguna precondición falla, Dernel debe decidir entre:

- continuar degradado;
- detener el arranque;
- abrir modo rescate;
- registrar fallo y devolver control al initramfs.

---

## Política mínima

### Formato INI v0.1

```ini
[runtime]
policy_version = 1
mode = permissive
require_host_id = true
require_integrity = false
deny_unknown = false

[context]
allow = HOST_VM
allow = HOST_BARE_METAL
allow = HOST_UNKNOWN

[binaries]
allow = /sbin/init
allow = /sbin/udevd
allow = /sbin/xgnuped-init
allow = /bin/busybox

[guest]
capabilities = BASIC_SESSION, READ_ONLY_BOOT_REPORT
restrictions = NO_RAW_SOCKET, NO_KERNEL_MODULE

[report]
path = /run/maGNUx/dernel-report.toml
```

### Modos de política

| Modo | Significado |
|---|---|
| `permissive` | Registra fallos pero permite continuar salvo error fatal. |
| `enforcing` | Deniega continuidad ante incumplimientos críticos. |
| `rescue` | Solo permite shell o flujo mínimo de recuperación. |
| `audit` | No bloquea, pero registra todo para análisis. |

---

## Estructuras propuestas

### Política Dernel

```c
#define DERNEL_MAX_BINARIES 128
#define DERNEL_MAX_CONTEXTS 8

typedef enum {
    DERNEL_MODE_PERMISSIVE = 0,
    DERNEL_MODE_ENFORCING  = 1,
    DERNEL_MODE_RESCUE     = 2,
    DERNEL_MODE_AUDIT      = 3
} dernel_mode_t;

typedef struct {
    unsigned int policy_version;
    dernel_mode_t mode;
    int require_host_id;
    int require_integrity;
    int deny_unknown;
    host_context_t allowed_contexts[DERNEL_MAX_CONTEXTS];
    unsigned int n_contexts;
    char allowed_binaries[DERNEL_MAX_BINARIES][160];
    unsigned int n_binaries;
} dernel_policy_t;
```

### Licencia Guest

```c
typedef struct {
    unsigned int capabilities;
    unsigned int restrictions;
    unsigned char session_nonce[16];
    unsigned int valid;
} guest_license_t;
```

### Resultado de autorización

```c
typedef enum {
    DERNEL_ALLOW    = 0,
    DERNEL_DENY     = 1,
    DERNEL_DEGRADE  = 2,
    DERNEL_RESCUE   = 3,
    DERNEL_FATAL    = 255
} dernel_decision_t;
```

---

## Interfaz C mínima

```c
int dernel_load_policy(const char *path, dernel_policy_t *policy);
int dernel_runtime_init(const host_identity_t *host_id, const dernel_policy_t *policy);
dernel_decision_t dernel_check_context(const host_identity_t *host_id, const dernel_policy_t *policy);
dernel_decision_t dernel_authorize_binary(const dernel_policy_t *policy, const char *path);
guest_license_t dernel_guest_generate_license(const host_identity_t *host_id, const dernel_policy_t *policy);
int dernel_write_report(const char *path, const host_identity_t *host_id, const dernel_policy_t *policy, dernel_decision_t decision);
```

---

## Decisiones esperadas

| Decisión | Acción |
|---|---|
| `ALLOW` | Continúa el arranque. |
| `DENY` | Deniega la fase o binario solicitado. |
| `DEGRADE` | Continúa con capacidades reducidas. |
| `RESCUE` | Entra en modo rescate. |
| `FATAL` | Detiene continuidad y registra error crítico. |

---

## Contrato Dernel run time

Dernel run time pertenece al área del Host.

Responsabilidades:

1. recibir HostID;
2. validar política;
3. comprobar contexto;
4. autorizar binarios críticos;
5. levantar o habilitar canal COMM mínimo;
6. emitir reporte;
7. decidir continuidad.

Precondiciones:

- `host_identity_t.magic` válido;
- versión compatible;
- política cargada;
- modo de arranque reconocido;
- salida runtime disponible.

Postcondiciones:

- decisión emitida;
- reporte escrito;
- licencia Guest creada si procede;
- eventos registrados.

---

## Contrato Dernel guest

Dernel guest pertenece al área de transición hacia ADMIN.

Responsabilidades:

1. recibir licencia desde runtime;
2. exponer capacidades iniciales;
3. aplicar restricciones declaradas;
4. preparar el futuro paso a Trilobytes;
5. no confundirse con root estructural.

En v0.1, Dernel guest puede ser solo una estructura exportada:

```text
/run/maGNUx/guest-license.toml
```

---

## Reporte TOML mínimo

```toml
[dernel]
policy_version = 1
mode = "permissive"
decision = "allow"

[host]
id = "..."
context = "HOST_VM"
integrity = "ok"

[guest]
license = "generated"
capabilities = ["BASIC_SESSION"]
restrictions = ["NO_RAW_SOCKET", "NO_KERNEL_MODULE"]

[continuity]
allow_switch_root = true
reason = "policy accepted"
```

---

## Relación con boot-validator

boot-validator comprueba la secuencia.

Dernel decide licencia.

```text
boot-validator
→ ¿la secuencia es aceptable?

Dernel policy
→ ¿el sistema puede continuar operando?
```

Ambos deben coordinarse, pero no son lo mismo.

---

## Relación con systemd e init tradicionales

Dernel no sustituye necesariamente al init final.

Puede entregar control a:

- systemd;
- OpenRC;
- sysVinit;
- runit;
- dinit;
- un init mínimo;
- un entorno de rescate.

La diferencia es que ese init ya no aparece como fundamento semántico del sistema, sino como pieza operativa autorizada.

```text
Dernel autoriza.
init opera.
```

---

## El problema del idle y de procesos no acreditados

La versión conceptual anterior hablaba del idle como ventana de ataque.

En la especificación técnica, la idea se formula así:

```text
durante el arranque temprano,
todo binario o fase no reconocida por política
se considera no acreditada.
```

No se afirma que todo idle sea explotable. Se afirma que la ambigüedad temprana debe reducirse.

Dernel v0.1 reduce ambigüedad mediante lista de autorización, contexto y reporte.

---

## Códigos de retorno

| Código | Significado |
|---:|---|
| `0` | Continuidad autorizada. |
| `1` | Continuidad autorizada con advertencias. |
| `2` | Modo degradado. |
| `3` | Modo rescate. |
| `10` | Binario no autorizado. |
| `20` | Contexto no permitido. |
| `30` | HostID inválido. |
| `40` | Política inválida. |
| `255` | Fallo fatal. |

---

## Criterios de aceptación v0.1

La especificación Dernel se considera implementable si el prototipo puede:

1. leer `policy.conf`;
2. recibir HostID;
3. validar contexto;
4. autorizar o denegar un binario de prueba;
5. generar una licencia Guest mínima;
6. escribir `dernel-report.toml`;
7. devolver código de estado claro;
8. permitir modo `permissive` y `enforcing`;
9. distinguir fallo fatal de degradación;
10. entregar control al init final solo si la política lo permite.

---

## Criterios de rechazo

Dernel debe denegar o degradar si:

- HostID falta y la política lo exige;
- la integridad falla y `require_integrity = true`;
- el contexto no está permitido;
- el binario solicitado no está autorizado y `deny_unknown = true`;
- no puede escribirse reporte en modo enforcing;
- la política está corrupta;
- el modo de arranque contradice la licencia Guest.

---

## Relación con documentos conceptuales

| Documento | Relación |
|---|---|
| `docs/identidad/09-dernel.md` | Define el sentido conceptual del Dernel. |
| `docs/identidad/10-host-guest.md` | Define la relación Host/Guest que Dernel licencia. |
| `docs/arquitectura/06-capas-posix.md` | Sitúa Dernel entre maPOSIXd01 y maPOSIXd02. |
| `docs/propuesta-tecnica/01-xgnuped-spec.md` | Proporciona HostID como entrada. |
| `zalty/initramfs/prototipo-hostid-v0.1/` | Primer laboratorio técnico. |

---

*← [Especificación xGNUpeD](01-xgnuped-spec.md) | [Índice](../README.md)*
