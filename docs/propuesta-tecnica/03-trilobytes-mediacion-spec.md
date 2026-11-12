# 03 — Trilobytes: legitimación e intermediación computacional

> [⬆ Propuesta técnica](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

**Estado:** propuesta arquitectónica v0.3, pendiente de implementación y validación.  
**Lenguaje de referencia propuesto:** Go.  
**Dependencias conceptuales:** [xGNUpeD](../identidad/07-xgnuped.md), [Dernel](../identidad/09-dernel.md), [ROOT y dominios](../identidad/11-root-dominios.md), [Trilobytes](../identidad/08-trilobytes.md).

---

## Objetivo y alcance

Ampliar el Trilobytes publicado —verificador de coherencia entre identidad, política, licencia y sesión— con un **agente de intermediación computacional** que represente intereses bajo mandato legítimo.

La nueva función no sustituye Logon/Login, la verificación de sesión, xGNUpeD, Dernel, ROOT ni el init de Linux. El prototipo HostID v0.1 de Zalty permanece intacto y no implementa todavía esta especificación.

## Dos momentos, no dos soberanías

| Momento | Función | Requisito |
|---|---|---|
| Coherencia | Verificar identidad, estado, política, licencia y legitimidad de sesión; aceptar, degradar o negar. | Validaciones que ya establece el manifiesto. |
| Intermediación | Interpretar peticiones; representar intereses; descubrir, proponer y coordinar servicios. | Triple delegación positiva vigente y mandato concreto. |

**Verificar** una sesión no equivale a **estar habilitado** para intermediar. Si no se obtiene la triple delegación, la segunda función permanece deshabilitada; las verificaciones necesarias para el funcionamiento seguro pueden continuar.

## Tres ámbitos y metáfora del edificio

- **Planta baja — Kernel / ROOT:** fundamento y autoridad estructural.
- **Planta media — xGNUpeD / COMM:** identidad y comunicación; COMM opera en su ámbito.
- **Planta alta — Dernel / ADMIN:** licencia y administración contractual del Guest.
- **Escalera de incendios — Trilobytes:** conexión transversal y representación, sin convertirse en una cuarta autoridad.

La metáfora describe **dominios y relaciones funcionales**, no necesariamente tres niveles Unix de privilegio ni una jerarquía física de procesos. La conexión transversal no evita los controles de cada ámbito.

## La triple luz verde

La habilitación como intermediario requiere tres delegaciones **positivas, explícitas, independientes, verificables y simultáneamente vigentes**:

1. **ROOT** delega desde su autoridad estructural. No queda subordinado a Dernel ni a COMM.
2. **COMM** delega las facultades correspondientes al ámbito xGNUpeD.
3. **ADMIN** delega las facultades administrativas correspondientes a Dernel.

Se propone la condición:

~~~text
intermediacion_habilitada =
    grant(ROOT).valido
 && grant(COMM).valido
 && grant(ADMIN).valido
 && mandato.valido
~~~

No se confunde con la composición soberana ya definida en maGNUx: `hroot + croot + droot = root`. Aquella describe dominios de la raíz; esta nueva conjunción describe la **autorización del agente**. La triple aprobación habilita la intermediación, **no suma privilegios ni autoriza ilimitadamente sus acciones**.

Si una delegación falta, caduca o es revocada, Trilobytes deja de iniciar nuevas operaciones de intermediación. Las ya comenzadas requieren una política explícita de cancelación, compensación o finalización segura. No se considera válida una aprobación por silencio.

## Mandato y dirección de la representación

Distinguir siempre:

- **Delegante:** autoridad que entrega una facultad de su ámbito.
- **Mandante:** sujeto que encarga una tarea.
- **Representado:** cuyos intereses debe defender Trilobytes.
- **Beneficiario:** quien recibe el servicio.
- **Ejecutor:** componente autorizado que aplica una operación concreta.

El agente no decide por sí solo a quién representa. Lo decide el mandato válido dentro del alcance de las delegaciones.

### Servicios hacia el usuario

En un entorno orientado al proveedor, Trilobytes puede coordinar los servicios que un fabricante, empresa o administrador legítimo ofrece al usuario. El usuario puede ser beneficiario sin ser mandante.

~~~text
Proveedor / organización → Trilobytes → Usuario
~~~

Android sirve aquí únicamente como analogía de un dispositivo con políticas del proveedor: no se afirma que todos los Android tengan idéntico reparto de competencias.

### Servicios buscados para el usuario

En un entorno orientado al usuario, Trilobytes puede descubrir, comparar, solicitar e integrar recursos o servicios en representación de sus necesidades, conforme al mandato.

~~~text
Usuario → Trilobytes → Servicios internos / externos
~~~

**La máquina puede llevar servicios al usuario o buscarlos en su nombre.** El sentido del servicio cambia; la soberanía y los mecanismos de seguridad no.

## Contrato técnico propuesto

Una concesión no debería consistir en un simple `root=true` guardado en un archivo editable por el agente. Cada delegación deberá vincularse criptográfica o equivalentemente a su emisor auténtico y a su alcance.

Campos mínimos propuestos para cada concesión:

| Campo | Propósito |
|---|---|
| `issuer` | ROOT, COMM o ADMIN; emisor identificado por su dominio. |
| `subject` | Identidad de la instancia de Trilobytes receptora. |
| `host_id` y `boot_id` | Evitar reutilizar autorizaciones entre máquinas o arranques no compatibles. |
| `scope` | Operaciones y recursos concretos permitidos. |
| `not_before`, `expires_at` | Vigencia temporal. |
| `grant_id` y `policy_version` | Auditoría y coherencia de versiones. |
| `proof` | Evidencia verificable de origen e integridad; mecanismo por diseñar. |
| `revocation_state` | Estado de revocación verificable, no declaración unilateral del agente. |

Ejemplo ilustrativo de **referencias** a concesiones, no una credencial funcional:

~~~toml
[trilobytes]
schema = 1
host_id = "host-id-reference"
boot_id = "boot-id-reference"
mode = "intermediary"

[grants]
root = "grant-reference-root"
comm = "grant-reference-comm"
admin = "grant-reference-admin"

[mandate]
principal = "user"
beneficiary = "user"
scope = ["service.discover", "service.propose"]
~~~

Este fichero, por sí solo, **no prueba autorización ni concede privilegios**. La verificación real deberá consultar fuentes autenticadas y mecanismos de aplicación independientes del proceso agente.

## Modelo de estados propuesto

~~~text
SIN_IDENTIDAD
    ↓ identidad y contrato verificados
COHERENCIA_VALIDADA
    ↓ concesiones positivas ROOT + COMM + ADMIN y mandato válido
INTERMEDIACION_HABILITADA
    ↓ revocación / caducidad / fallo de integridad
INTERMEDIACION_SUSPENDIDA
~~~

Un estado degradado o de rescate puede conservar comprobaciones y diagnóstico; no debe inventar la delegación ausente. La ruta ROOT pura se define fuera de la jurisdicción de Dernel: su existencia no supone que Trilobytes reciba automáticamente la luz verde.

## Descomposición inicial en Go

- **`trilobytes-guard`:** consume identidad xGNUpeD, licencia Dernel y evidencias de concesión; publica una decisión verificable. Debe mantenerse mínimo y auditable.
- **`trilobytes-agent`:** interfaz conversacional o CLI, descubrimiento y propuestas de orquestación; no se activa como intermediario sin decisión válida del guard.
- **Ejecutores externos:** servicios privilegiados con facultades propias que verifican las autorizaciones relevantes antes de actuar. El agente no ejecuta por sí mismo operaciones ROOT solo por tener una luz verde.

En una primera iteración puede aprovecharse systemd, OpenRC u otro supervisor. La hipótesis de un `init` o gestor distribuido en Go requiere pruebas separadas de PID 1, señales, procesos huérfanos, cgroups y continuidad del arranque.

## Pruebas mínimas de aceptación

1. Identidad xGNUpeD inválida: no habilitar intermediación.
2. Licencia Dernel incompatible: no habilitar intermediación ordinaria.
3. ROOT + COMM sin ADMIN: denegar intermediación.
4. ROOT + ADMIN sin COMM: denegar intermediación.
5. COMM + ADMIN sin ROOT: denegar intermediación.
6. Tres delegaciones válidas, pero mandato ausente o vencido: denegar.
7. Tres delegaciones válidas y mandato limitado: permitir solo los servicios incluidos en su alcance.
8. Revocación de una delegación: detener nuevas intermediaciones y registrar la transición.
9. Fallo del agente: no comprometer PID 1 ni la continuidad esencial del Host.
10. Intento de usar la luz verde como elevación de privilegios: rechazar en el ejecutor.
11. Modo ROOT puro: conservar soberanía ROOT sin atribuir a Trilobytes permisos automáticos.
12. Todas las decisiones quedan vinculadas a identidad, estado y trazas auditables.

## Roadmap y exclusiones

**v0.1 (existente):** HostID, boot-validator, early-comm y Dernel policy en initramfs/QEMU; no modificar su alcance.  
**v0.2/v0.3 (propuesta):** contrato de delegaciones, guard en Go, agente CLI, simulación controlada de servicios y revocación.  
**Posteriormente:** integración con gestores de servicios reales, interfaces reforzadas en ZLinux solo si se demuestra su necesidad.

No se afirma que estas propuestas estén ya implementadas ni que las garantías de seguridad estén demostradas. Deben validarse con código y pruebas reproducibles.

---

*Especificación propuesta para incorporar la función de intermediación al corpus oficial de maGNUx, conservando las responsabilidades previas de identidad, contrato y coherencia.*
