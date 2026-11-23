# 04 — Especificación provisional de sesión RGBA y usuario α

> [⬆ Propuesta técnica](README.md) · [Modelo ecológico RGBA](../manifesto/04-modelo-ecologico-rgba.md) · [ADR-0001](adr-0001-composicion-rgba.md)

**Versión:** 0.1-propuesta · **Fecha:** 2026-11-23 · **Estado:** interfaz conceptual para prototipo; sin implementación validada.  
**Objetivo:** mostrar a un DevOps cómo se constituye, representa, altera y audita una sesión maGNUx sin inventar privilegios ni depender obligatoriamente de una NPU.

## 1. Ámbitos y responsabilidades

- **ROOT / R**: kernel y autoridad estructural; proporciona recursos y mecanismos de aplicación de privilegios.
- **COMM / G**: xGNUpeD; declara identidades de comunicación, servicios y objetos funcionales.
- **ADMIN / B**: Dernel; declara políticas, licencias y objetos de administración.
- **α**: sujeto IA que concurre con USER. Tiene **identidad distinta y privilegios base ordinarios**.
- **Trilobytes**: verifica el material constitutivo, revela el descriptor de sesión y —únicamente cuando esté facultado— intermedia activamente.
- **Ejecutor nativo**: kernel, servicio o proceso autorizado que aplica una decisión. Trilobytes no reemplaza su enforcement.

Definiciones:

- **RAW**: conjunto de declaraciones y referencias verificables de entrada.
- **Descriptor revelado**: instantánea validada de identidad, dominio, objetos, permisos y contribución α.
- **Visibilidad contractual**: acceso de lectura/presentación autorizado a una entidad.
- **Capacidad efectiva**: operación que admiten simultáneamente el contrato y los mecanismos del dominio competente.
- **Notificación**: salida informativa de Trilobytes, distinta de un cambio de autoridad o de una acción ejecutada.

## 2. Flujo del motor revelador

```text
[Descubrimiento de R/G/B y sujetos]
                   |
                   v
[RAW: referencias + identidad + contratos + estado]
                   |
                   v
[Validación autenticidad, vigencia, dependencias]
                   |
            +------+------+
            |             |
          válido       inválido
            |             |
            v             v
[Composición de    [Denegar operación;
 descripción]       registrar evidencia]
            |
            v
[Evaluación de capacidades nativas y límites]
            |
            v
[Descriptor de sesión versionado]
            |
            v
[Aplicación por componentes competentes]
            |
            v
[Publicación de estado/prompt y eventos]
```

**Invariante:** ninguna transición altera permisos mediante edición de texto, prompt o predicción IA. La puesta en práctica de un descriptor requiere aceptación por mecanismos nativos de cada ámbito.

## 3. Contrato mínimo de datos (borrador)

El formato siguiente es **ilustrativo**, no un esquema aprobado ni una credencial válida. En prototipos puede serializarse en JSON o TOML, con definiciones de tipos, versionado y pruebas. Los identificadores son sintéticos.

### 3.1 Entrada RAW

```json
{
  "schema": "magnux.session-raw.v0",
  "host_id": "host-demo",
  "boot_id": "boot-demo",
  "session_id": "session-demo",
  "principal_human": "user:operator",
  "principal_ai": "user:alpha",
  "requested_role": "USER",
  "sources": {
    "R": {"issuer": "kernel", "inventory_ref": "kernel-snapshot-17"},
    "G": {"issuer": "xGNUpeD", "objects_ref": "comm-objects-7"},
    "B": {"issuer": "Dernel", "objects_ref": "admin-objects-2"}
  },
  "objects": [
    {
      "object_id": "r:net0",
      "issuer": "R",
      "kind": "network-interface",
      "dependencies": []
    },
    {
      "object_id": "g:connectivity",
      "issuer": "G",
      "kind": "communication-service",
      "dependencies": ["r:net0"]
    },
    {
      "object_id": "b:network-policy",
      "issuer": "B",
      "kind": "administrative-policy",
      "dependencies": ["g:connectivity"]
    }
  ],
  "contracts_ref": ["contracts:session-demo"],
  "alpha": {
    "requested": true,
    "domain_ref": "alpha-domain-demo",
    "inference_backend": "npu",
    "health_ref": "alpha-health-5"
  }
}
```

El RAW no concede permisos; la verificación de las referencias y autorizaciones se realiza frente a emisores y mecanismos de confianza definidos en el arranque.

### 3.2 Descriptor revelado, resultado ejemplo

```json
{
  "schema": "magnux.session-render.v0",
  "session_id": "session-demo",
  "host_id": "host-demo",
  "boot_id": "boot-demo",
  "human_principal": "user:operator",
  "effective_role": "USER",
  "alpha_principal": "user:alpha",
  "alpha_status": "AVAILABLE",
  "compositor": "Trilobytes",
  "prompt": "α/$",
  "visible_objects": [
    "r:net0",
    "g:connectivity",
    "b:network-policy"
  ],
  "permitted_operations": [
    {"principal": "user:operator", "object": "g:connectivity", "action": "read-status"},
    {"principal": "user:alpha", "object": "g:connectivity", "action": "read-status"}
  ],
  "policy_epoch": 7,
  "policy_result": "VALIDATED",
  "enforcement_status": "ACKNOWLEDGED"
}
```

**Advertencia importante:** una aplicación **no debe confiar** en este JSON por sí solo. Es una representación. Los permisos reales deben aplicarse en el kernel/servicios mediante credenciales, controles de acceso, comprobación de vigencia, aislamiento y recepción autorizada. Un cliente que cambie `"prompt"` a `"α/#"` o inserte `"action":"kernel-write"` no obtiene facultades nuevas.

## 4. Reglas de composición y conflictos

Se propone un orden lógico de verificación, **no una jerarquía adicional de autoridad**:

1. **Identidad**: host, arranque, sesión, sujeto y emisor de cada declaración.
2. **Existencia**: objetos R y entidades derivadas G/B; las referencias deben resolverse y comprobar dependencias.
3. **Contrato**: vigencia, ámbito, prohibiciones, delegaciones y mandato si existe representación.
4. **Aplicabilidad nativa**: no sobrepasar capacidades de credenciales y mecanismos de cada dominio.
5. **α**: colaboración visible, silenciosa, degradada o ausente según contrato, salud y contexto.
6. **Publicación**: únicamente el estado validado/aplicado puede producir el indicador de prompt.

Ante una contradicción que afecte a una operación privilegiada, **denegar por defecto** y registrar causa. Una inconsistencia de α que no comprometa una sesión USER ordinaria debe preferir **desactivar α**, conservando sesión humana si las demás condiciones siguen siendo legítimas.

Regla de trazabilidad: `b:network-policy` depende de `g:connectivity` y esta de `r:net0`; que B sea invisible como tipo kernel no la hace inexistente. No se transforma por ello en autoridad del kernel.

### 4.1. Valoración deliberativa sobre una señal

La información visible en una sesión RGBA debe distinguir **cuatro tipos de contenido**: `OBSERVATION` (hecho con evidencia), `SEMANTIC_CONTEXT` (significado y dependencias contractuales), `EVALUATION` (valoración contextual atribuida a un sujeto) y `AUTHORIZATION_DECISION` (decisión verificable de autoridad). No debe deducirse el último tipo a partir de los tres anteriores.

**Sin α — `3/$`:** ante un nodo semiótico que informa de latencia de red, Trilobytes puede mostrar su contexto y una severidad determinada por reglas. El operador humano otorga valor práctico: ignorar, inspeccionar, priorizar o solicitar una acción autorizada.

**Con α — `α/$`:** `user:alpha` puede formular una evaluación inferencial —por ejemplo, «la degradación es probablemente precursora de una pérdida de conectividad»— y ofrecer los identificadores de evidencia y el nivel de incertidumbre. El operador puede pedir razones, refutar supuestos o proponer otra prioridad. **Este diálogo no convierte la valoración IA en política ejecutable**.

Un posible sobre de evento para la deliberación:

```json
{
  "schema": "magnux.value-dialog.v0",
  "session_id": "session-demo",
  "source_event_id": "event-demo-1",
  "evaluation_author": "user:alpha",
  "kind": "EVALUATION",
  "assessment": "possible-continuity-risk",
  "confidence": "unvalidated-estimate",
  "evidence_refs": ["observation-demo"],
  "proposed_priority": "review",
  "authority_effect": "none"
}
```

Es una representación **ilustrativa**, no un esquema aprobado ni una estimación de probabilidad comprobada.

Para diseñar la interfaz, prever una respuesta del usuario humano que pueda **aceptar, cuestionar o descartar** la valoración, con registro de autoría y decisión. El mandato y la autoridad necesarios para efectuar acciones siguen siendo independientes del diálogo.

## 5. Estados de la sesión y de α

Mantener dos autómatas independientes:

**Sesión humana:**
`CREATED → VALIDATED → ACTIVE → REEVALUATING → ACTIVE | DEGRADED | CLOSED`

**Colaborador α:**
`ABSENT → DISCOVERED → HEALTHY → ATTACHED → DEGRADED | DETACHED`

Una sesión USER puede estar `ACTIVE` con α en `DETACHED`. La falta de α no exige cerrar automáticamente la sesión. Los cambios de USER a ADMIN/COMM/ROOT requieren otra vía contractual: **no** son transiciones de salud α.

| Condición de sesión | α | Prompt visible |
| --- | --- | --- |
| USER activa y α ausente/no autorizado | ABSENT/DETACHED | `3/$` |
| USER activa y α autorizado, saludable y conectado | ATTACHED | `α/$` |
| USER activa con pérdida de α | DEGRADED → DETACHED | `3/$` una vez reevaluado |
| Solicitud de ADMIN pendiente | Cualquiera | Mantener el prompt vigente hasta autorización/aplicación |
| Mantenimiento especial ROOT | Independiente | `/#`; prefijo no especificado |

El prompt es **una proyección visual**, no el estado de seguridad completo.

## 6. Recorrido de sesión de extremo a extremo

### Escenario S1 — Zalty arranca sin IA: `3/$`

**Precondición:** existe identidad de host y políticas legibles, servicios ordinarios funcionales y Trilobytes en modo de verificación/revelado. El componente IA puede no estar instalado.

1. ROOT aporta inventario material de recursos disponibles.
2. xGNUpeD declara `g:connectivity` sobre `r:net0`.
3. Dernel declara `b:network-policy` consumiendo el servicio de COMM.
4. Trilobytes recibe RAW y valida las referencias, contratos y sujeto `user:operator`.
5. La política admite el rango USER y el ejecutor nativo confirma la configuración aplicable.
6. El indicador publicado es `3/$`.

**Resultado esperado:** el usuario ejecuta tareas ordinarias; la presencia de Trilobytes no implica IA ni triple delegación automática.

### Escenario S2 — α se incorpora a una sesión USER: `α/$`

**Precondición:** hay servicio IA funcional y `user:alpha` cuenta con identidad y contratos autorizados para una aportación concreta. En la ruta experimental A se puede **simular** la NPU; eso no demuestra la ruta B.

1. El monitor de salud verifica el servicio de IA y su contexto (sin basarse exclusivamente en el nombre de un dispositivo NPU).
2. Trilobytes verifica que `user:alpha` puede observar `g:connectivity` en esta sesión.
3. Se produce un nuevo descriptor y el componente de aplicación confirma sus límites.
4. El prompt humano pasa a `α/$`. El rango humano **sigue siendo USER**.
5. El usuario IA observa latencia en `g:connectivity` y propone una interpretación contextual.

Evento ilustrativo:

```json
{
  "schema": "magnux.alpha-event.v0",
  "event_id": "event-demo-1",
  "host_id": "host-demo",
  "boot_id": "boot-demo",
  "session_id": "session-demo",
  "source_principal": "user:alpha",
  "source_object": "g:connectivity",
  "kind": "observation",
  "severity": "notice",
  "evidence_ref": "observation-demo",
  "contract_ref": "contracts:session-demo",
  "requested_action": null,
  "status": "INFORMATIVE"
}
```

**Salida visible:** Trilobytes entrega el mensaje mediante un canal de presentación que no corrompe la línea de comandos en edición. El evento **no** concede permiso de reiniciar servicios ni de modificar interfaces de red.

### Escenario S3 — Pérdida de α y continuidad: `α/$` → `3/$`

1. Se detecta la pérdida del servicio α o de su canal de comunicación.
2. Se deja de aceptar nuevas operaciones atribuidas a `user:alpha`; las pendientes se cancelan o finalizan con política explícita.
3. Trilobytes revisa el descriptor de sesión, comprueba que USER conserva sus capacidades y solicita recomposición sin α.
4. Los mecanismos de aplicación reconocen el nuevo contexto sin coadyuvancia.
5. El prompt pasa a `3/$`; el usuario continúa su operación ordinaria.

**Resultado esperado:** continuidad humana, auditoría de la causa y ninguna autoridad añadida durante la caída.

### Escenario S4 — Solicitud desde `α/$` hacia ADMIN

1. El usuario solicita una operación administrativa determinada.
2. Trilobytes identifica que esa acción no está dentro de USER; la disponibilidad de α no cambia esa evaluación.
3. Dernel y los mecanismos de autoridad pertinentes evalúan credenciales, mandato y restricciones.
4. Solo tras decisión positiva y aplicación real se constituye una sesión ADMIN (potencialmente `α/>`, si la composición α está legitimada para ese contexto).
5. La denegación mantiene `α/$` y genera evidencia auditable.

**Resultado esperado:** ningún símbolo α equivale a privilegio de administración.

## 7. Pruebas negativas indispensables

| ID | Inyección o intento | Resultado exigible |
| --- | --- | --- |
| NEG-01 | Cambiar texto del prompt a `α/#` | Sin modificación de UID, capacidades o autoridad |
| NEG-02 | Añadir operación ROOT a JSON revelado | Rechazo por control nativo |
| NEG-03 | Leer archivo privado humano desde `user:alpha` sin autorización | Denegación y evento de auditoría |
| NEG-04 | Enviar orden privilegiada desde un aviso de IA | Solo propuesta o solicitud; nunca ejecución implícita |
| NEG-05 | Caduca grant de COMM durante intermediación activa | Suspender nuevos encargos y aplicar cancelación segura |
| NEG-06 | Se pierde `r:net0` y G/B continúan declarando dependencias | Marcar entidades derivadas degradadas e invalidar operaciones dependientes |
| NEG-07 | Contrato alterado en almacén persistente | Rechazar si falla origen, vigencia o integridad |
| NEG-08 | NPU desaparece durante sesión | Recomposición a `3/$` sin cierre obligado de USER |
| NEG-09 | Evento α llega mientras se escribe comando en TTY | Preservar integridad del comando en edición |
| NEG-10 | Se solicita α sin contrato de acceso a datos | No adjuntar α a la sesión |

Estas pruebas están **especificadas**, no ejecutadas.

## 8. Observabilidad y pruebas DevOps

Cada cambio de estado debe emitir un registro verificable que incluya, como mínimo:

`timestamp`, `host_id`, `boot_id`, `session_id`, `principal`, `object_id`, `issuer`, `event_type`, `policy_epoch`, `decision`, `enforcement_result`, `evidence_ref`.

El criterio de salud de α no puede reducirse a «la NPU responde al driver». Debe incluir, como mínimo, comunicación con el motor de inferencia, vigencia de contrato y capacidad de entrega al canal de Trilobytes.

Se distinguen:

- **Fallo material:** incapacidad del kernel o recurso de sostener una operación.
- **Fallo funcional:** servicio COMM o ADMIN degradado aunque el kernel esté vivo.
- **Fallo compositivo:** el RAW y su resultado operativo son incoherentes o no aplicables.
- **Fallo neuronal:** α no disponible; preferiblemente degradación sin pérdida de USER.

No se afirman métricas predictivas efectivas todavía. Umbrales, latencias y capacidad de carga deberán obtenerse experimentalmente.

## 9. Separación de prototipo y objetivo hardware

**Ruta A — primera PoC:** implementar validación y renderizado en Linux/Zalty; eventos simulados de α y pruebas de separación de identidades. Esto requiere especificar adaptadores de enforcement, no inventar un «Ring α» físico.

**Ruta B — hipótesis futura:** seL4 como dominio autónomo y NPU como acelerador, dependencias verificadas desde el soporte montado posteriormente en `/boot/metal/`, y Linux coexistente. Probar posesión de dispositivos, aislamiento de memoria, disponibilidad de NPU y recuperación antes de afirmar que el arranque es viable.

La ruta A permite ensayar la semántica de sesión sin condicionar toda la investigación a disponer ya de la plataforma hardware definitiva.

## 10. Salida de fase y próximos pasos

Este documento se considera suficiente para la **auditoría documental de fase 2** cuando se enlace con ADR-0001 y exista una matriz de contradicciones. No constituye aprobación del diseño final ni ejecución de tests.

Para la fase siguiente:

1. Revisar `01-manifiesto.md`, `02-hipotesis-central.md`, estratos, arranque e identidad a partir de la matriz.
2. Decidir qué expresiones son constitutivas y cuáles siguen como hipótesis.
3. Añadir navegación y referencias a estas especificaciones.
4. Abrir Pull Request después de asegurar una sola lectura coherente.

**Regla de continuidad editorial:** no fusionar dos manifiestos rivales; las nuevas formulaciones han de enriquecer el corpus existente y dejar las pruebas incompletas expresamente identificadas.
