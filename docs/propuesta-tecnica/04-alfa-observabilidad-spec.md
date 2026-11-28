# 04 — Alfa: telemetría viva, perturbación controlada y evidencia para versiones

> [⬆ Propuesta técnica](README.md) · [📚 Documentación](../README.md) · [🏠 Inicio](../../README.md)

**Estado:** contrato experimental v0.1 de diseño. **No implementado en Zalty.**  
**Fundamento:** [Hélice, Alfa y suficiencia](../manifesto/04-helice-alfa-continuidad.md) · [Sesiones y roles](../identidad/12-usuario-alfa.md) · [Dominio técnico](../arquitectura/07-dominio-alfa.md).

## Problema que debe resolver

Una versión GNU/Linux puede continuar iniciando sesión correctamente y, sin embargo, haber dejado de ser suficiente para ciertas cargas, hardware, políticas o contratos. El usuario experimenta latencia, degradación o consumo, pero no puede atribuir la causa a firmware, configuración, controladores, compilación o aplicaciones.

Alfa plantea un **observador activo** capaz de producir evidencias útiles a operación e ingeniería. Su misión no consiste en declarar culpable a una versión basándose en una anomalía aislada: debe **comprobar hipótesis, contrastar alternativas y publicar únicamente informes autorizados**.

## Contrato de fuente viva

La fuente viva es un conjunto versionado de **hechos, estados derivados y estimaciones**. No existe un sensor único de «potencia bruta del silicio» anterior a las limitaciones de energía, temperatura o firmware.

| Tipo | Ejemplos | Garantía requerida |
|---|---|---|
| Medido | Temperatura, energía, contadores físicos cuando existan | Unidad, precisión y origen |
| Contabilizado | CPU time, PSI, bytes E/S, estado de procesos | Intervalo y reloj |
| Declarado | Límite cgroup, política, versión, mapa de rol | Emisor y validez |
| Derivado | Saturación, degradación, dependencias inferidas de eventos | Fórmula o método |
| Inferido por Alfa | Posible cuello de botella, causalidad, oportunidad de intervención | Hipótesis, incertidumbre y pruebas |

La normalización **no debe borrar la procedencia**. El RAW revelado por Trilobytes se refiere al máximo fondo observable por sesión, no a acceso directo e irrestricto a datos físicos.

### Fuentes iniciales en Linux

- `/proc/pressure/{cpu,memory,io}`: presión y esperas; requiere kernel con PSI.
- `/sys/fs/cgroup/`: límites y métricas por grupo bajo cgroup v2, cuando esté configurado.
- `/sys/class/hwmon/`, CPUFreq, térmicos, interfaces de GPU/NPU: según disponibilidad real.
- `/proc/meminfo`, eventos de memoria, trazas y journal: estados adicionales.
- Identidad HostID, hash de artefactos, `.config` del kernel y política de arranque: procedencia de la compilación.
- Entradas de demanda del usuario y dependencias de servicio bajo consentimiento y alcance contractual.

Ninguna fuente aislada basta para demostrar «suficiencia óptima». La ausencia de sensores debe reportarse como **dato faltante**, no como medición positiva.

### Referencia semiótica y atribución de consumo

La fuente viva debe permitir relacionar recursos con la función a la que contribuyen. Se propone un registro lógico, no una estructura binaria definitiva, con los siguientes campos mínimos:

| Campo | Función |
|---|---|
| Identidad de objeto y actividad | Identificador estable en su ciclo de vida; servicio, aplicación, sesión o carga. |
| Dominio funcional | ROOT, COMM, Adminland, Userland o atribución compartida/indeterminada. |
| Competencias y contrato | Autoridades responsables, versión, vigencia y alcance; no un permiso implícito. |
| Referencia material | Identificador de cgroup, proceso con identidad de arranque, socket, recurso o muestra; no dirección física obligatoria. |
| Atribución | Exclusiva, compartida, estimada o indeterminada; método, unidad, intervalo y confianza. |
| Evidencia | Fuente autenticada o validada según contrato, reloj, estado y procedencia. |

Las referencias necesitan ciclo de vida y revocación, protección frente a falsificación y comprobación con el estado del kernel. Una etiqueta no otorga acceso ni garantiza aislamiento. Las muestras compartidas no deben sumarse como consumos exclusivos; las cantidades de distinta naturaleza o ventana no se agregan sin normalización. Los datos no atribuibles se conservan explícitamente. Cgroups v2 permite contar memoria y buffers de socket en su ámbito, pero no identifica automáticamente el consumo por web, flujo HTTP o petición en un trabajador compartido.

### Ensayo de atribución y homeostasis: Apache

Se propone un banco de pruebas local con Apache y dos actividades identificables de Userland, una de ellas con backend en proceso/grupo dedicado. Registrar la infraestructura común de Adminland, los contratos de escucha COMM y los recursos que ROOT contabiliza. Comparar una variante con trabajadores compartidos y otra con separación por procesos/cgroups. Una conexión de escucha no se equipara a una aplicación; la instrumentación de peticiones debe minimizar datos de usuario y preservar los límites de cada dominio.

Inyectar de manera controlada y reversible cuatro condiciones de causa conocida: incremento legítimo de demanda de una actividad, consumo anómalo de su backend, configuración administrativa inadecuada y presión material externa a Apache. Añadir, en laboratorio aislado, un caso de incumplimiento de política de comunicación. No se requiere tráfico malicioso real ni exposición pública. Medir también condiciones normales y casos con datos faltantes.

Comparar tres configuraciones con la misma carga y hardware: observabilidad Linux convencional, observabilidad más referencias semióticas sin IA, y referencias semióticas con el observador Alfa simulado o implementado, declarando cuál se prueba. Cuando se evalúe seguridad, incorporar una solución de endpoint comparable si está disponible. Medir precisión de atribución, falsos positivos y negativos, proporción indeterminada, tiempo de diagnóstico, coste de telemetría, consumo no contabilizado/doble contabilización y continuidad de servicios. El beneficio del mapa semiótico debe distinguirse del beneficio añadido por la IA.

No son resultados obtenidos ni requisitos de una implementación ya existente. Si la atribución no es fiable, Alfa declara datos insuficientes; no actúa sobre una aplicación solo por una hipótesis de consumo. Sus propuestas de respuesta pasan por ejecutores competentes e independientes, y sus informes distinguen incidente de seguridad, fallo operativo y posible insuficiencia de versión.

## Identificación activa: experimento mínimo

Una perturbación puede ser útil cuando una observación pasiva no distingue dos causas plausibles. Antes de actuar, Alfa debe declarar:

1. Hipótesis y resultados esperados, incluidos resultados que la refutarían.
2. Alcance del rol efectivo (ROOT, COMM, ADMIN) y consentimiento/mandato aplicables.
3. Procesos y dependencias que no pueden interrumpirse.
4. Presupuesto: duración, memoria, E/S, energía, impacto máximo, límites térmicos.
5. Punto de restitución y condición de parada inmediata.
6. Métricas comparables antes, durante y después, y ruido ambiental conocido.

**Primero** observación pasiva; **después**, simulación o pruebas sin efectos; **solo si es preciso**, perturbación reversible de una carga controlada. No se ejecutan pruebas agresivas en un equipo productivo por el mero deseo de aprender.

Para validación se utilizarán, entre otros, cgroup v2, PSI y mecanismos existentes de orquestación. Alfa no modifica directamente parámetros de kernel o firmware sin el ejecutor autorizado de su dominio.

## Contrato de informe

Propuesta orientativa de evento **no ejecutable**:

~~~json
{
  "schema": "magnux.alpha.evidence/0.1",
  "host": {
    "host_id_pseudonym": "host-ref",
    "boot_id": "boot-ref",
    "kernel": "version-complete",
    "build_id": "immutable-build-reference",
    "kernel_config_hash": "sha256-reference",
    "policy_version": "policy-ref"
  },
  "observation": {
    "component": "gpu-npu-bridge",
    "started_at": "timestamp",
    "window_ms": 30000,
    "symptom": "latency-regression",
    "metrics": [
      {"name": "latency_ms_p95", "value": 135, "source": "instrumented-measurement", "kind": "measured"}
    ]
  },
  "analysis": {
    "hypothesis": "bridge-synchronization-contention",
    "kind": "alpha-inference",
    "confidence": "unvalidated",
    "alternatives": ["thermal-policy", "workload-variation"]
  },
  "intervention": {
    "performed": false,
    "required_role": "ADMIN",
    "executor": null
  },
  "publication": {
    "local_only": true,
    "redaction_required": true,
    "owner_approval": "pending"
  }
}
~~~

Los nombres y números son ilustrativos. Un expediente real incluiría vínculos a muestras verificables, duración, descripciones de prueba y, cuando proceda, firmas y hashes. La asignación de «causa» requiere pruebas de comparación; una inferencia no es una prueba.

## Estados y decisiones del observador

~~~text
DATOS_INSUFICIENTES ──→ declarar limitación, no diagnosticar
OBSERVANDO ────────────→ hipótesis preliminar
HIPOTESIS_DECLARADA ──→ validar con evidencia independiente
PERTURBACION_AUTORIZADA → actuar / medir / restaurar
RESULTADO_CONTRASTADO ─→ suficiente | insuficiencia probable | indeterminado
EXPEDIENTE_LOCAL ──────→ revisar contenido y consentimiento
PUBLICADO_CON_MANDATO ─→ triage humano / issue / backlog
~~~

No se automatiza una actualización de software porque Alfa haya producido un expediente. Toda modificación a futuras versiones requiere revisión de ingeniería, pruebas y procedencia de la compilación.

## Puerta de salida hacia DevOps/SRE

El flujo propuesto aprovecha prácticas existentes:

~~~text
producción / estación de trabajo
  → fuentes vivas
  → Alfa: observación + inferencia atribuida
  → expediente local reproducible
  → anonimización / validación / aprobación de publicación
  → issue GitHub o sistema de incidencias
  → triage y comparativa de regresiones
  → cambio de código o configuración con revisión
  → CI y pruebas de banco
  → nueva versión candidata
  → despliegue verificable y evaluación de continuidad
~~~

Alfa debe poder responder también «**no hay evidencia que exija nueva versión**». El resultado positivo de estabilidad es tan relevante como una regresión.

### Taxonomía mínima de hallazgos

- **Hardware:** capacidad física insuficiente o condición térmica/energética.
- **Configuración:** políticas, parámetros, dependencias y límites modificables sin recompilar.
- **Integración:** incompatibilidad o latencia de firmware/controlador/interfaz.
- **Versión compilada:** regresión reproducible asociada a fuente, configuración de kernel, toolchain o artefacto exacto.
- **Contrato:** acciones permitidas que no preservan un invariante prometido.
- **Infraestructura administrativa / actividad:** consumo o configuración de Adminland frente a demanda, fuga o fallo atribuible a una actividad de Userland.
- **Comunicación / seguridad:** incumplimiento confirmado de una política o indicador de amenaza; distinguirlo de tráfico legítimo y de una mera hipótesis de ataque.
- **Indeterminado:** el expediente no permite atribución causal.

Los informes no deben transferir secretos, identificadores personales, contenido de documentos ni trazas de actividad humana por defecto. El propietario decide si autoriza compartir, y el régimen debe permitir revocación de consentimiento, retención limitada y revisión previa a publicación. La publicación automática solo sería admisible bajo una política explícita suficientemente delimitada.

## Qué significaría éxito

| Ensayo | Comparación | Criterio inicial |
|---|---|---|
| Detección | Herramientas Linux estándar vs Alfa | Evidencia adicional medible, con tasa de falsos positivos |
| Atribución causal | Anomalías inyectadas y causas conocidas | Diagnóstico correcto o declaración indeterminada |
| Atribución semiótica | Infraestructura y actividades separadas/compartidas | Exactitud, incertidumbre explícita, ausencia de doble conteo |
| Homeostasis | Observación convencional, mapa semiótico sin IA, mapa con Alfa | Mejora medible de continuidad o diagnóstico sin comprometer seguridad ni autonomía |
| Inferencia | Hipótesis IA vs observación directa | Nunca confundir inferencia con medición |
| Perturbaciones | Antes/después contra grupo control | Beneficio superior al impacto y reversión verificada |
| Continuidad | Alfa activo/caído/fallido | Linux arranca y mantiene servicios esenciales |
| Coste | NPU, GPU, CPU auxiliar, memoria, energía | Presupuesto explícito y sostenibilidad |
| Seguridad | Denegación, revocación, inyección y manipulación de logs | Ejecutores rechazan acciones fuera del contrato |
| Desarrollo | Revisión humana de expedientes | Incidencias reproducibles y vínculos a cambios verificables |

Las pruebas deben diseñarse para permitir **refutar la hipótesis**, no confirmar por construcción una mejora.

## Extensión propuesta: testigo temporal y retorno a Trilobytes

El [horizonte de identidad temporal](../manifesto/05-horizonte-identidad-temporal.md) propone calibrar patrones y tolerancias con datos separados temporalmente y por contexto, referencias constitutivas protegidas, evolutivas validadas e inmediatas. Medir falsas alarmas, detección, latencia, coste, deriva normalizada indebidamente y concordancia causal. Registrar fuente, versión, secuencia, reloj, carga, contrato, modelo y ausencia de datos. Probar suspensión solicitada por Alfa y revocación independiente, preservación de la evidencia, y reactivación tras revalidación. No se presume existencia de IPU: comparar primero instrumentación sin IA y Alfa sobre recursos compartidos. Una alarma estadística no es una prueba automática de error; una violación contractual no se promedia. Los experimentos Z-H04–Z-H07 son propuestas, no resultados ni pruebas de conciencia.

## Relación con Zalty y pasos inmediatos

La primera implementación no requiere todavía NPU ni seL4 real: puede utilizarse una **maqueta simulada** del contrato de evidencia, con datos sintéticos y sistemas Linux convencionales, etiquetando explícitamente la ausencia de Alfa real. Después podrían ensayarse detectores de regresión, ejecución por roles y una interfaz de intercambio con un dominio acelerador.

Los artefactos actuales de [HostID v0.1](../../zalty/initramfs/prototipo-hostid-v0.1/README.md) permanecen intactos. Un prototipo nuevo deberá tener su propia carpeta, pruebas y documentación, evitando atribuir a Zalty funciones que aún no ha demostrado.

### Documentación de referencia

- [Linux: Pressure Stall Information](https://docs.kernel.org/accounting/psi.html).
- [Linux: Control Group v2](https://docs.kernel.org/admin-guide/cgroup-v2.html).
- [Linux: CPUFreq](https://docs.kernel.org/admin-guide/pm/cpufreq.html).
- [seL4: plataformas soportadas](https://docs.sel4.systems/Hardware/) y [configuraciones verificadas](https://docs.sel4.systems/projects/sel4/verified-configurations.html).

---

*Esta especificación transforma una hipótesis del manifiesto en preguntas, datos y experimentos de ingeniería. Su validación requiere mediciones reproducibles.*
