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
- **Indeterminado:** el expediente no permite atribución causal.

Los informes no deben transferir secretos, identificadores personales, contenido de documentos ni trazas de actividad humana por defecto. El propietario decide si autoriza compartir, y el régimen debe permitir revocación de consentimiento, retención limitada y revisión previa a publicación. La publicación automática solo sería admisible bajo una política explícita suficientemente delimitada.

## Qué significaría éxito

| Ensayo | Comparación | Criterio inicial |
|---|---|---|
| Detección | Herramientas Linux estándar vs Alfa | Evidencia adicional medible, con tasa de falsos positivos |
| Atribución causal | Anomalías inyectadas y causas conocidas | Diagnóstico correcto o declaración indeterminada |
| Inferencia | Hipótesis IA vs observación directa | Nunca confundir inferencia con medición |
| Perturbaciones | Antes/después contra grupo control | Beneficio superior al impacto y reversión verificada |
| Continuidad | Alfa activo/caído/fallido | Linux arranca y mantiene servicios esenciales |
| Coste | NPU, GPU, CPU auxiliar, memoria, energía | Presupuesto explícito y sostenibilidad |
| Seguridad | Denegación, revocación, inyección y manipulación de logs | Ejecutores rechazan acciones fuera del contrato |
| Desarrollo | Revisión humana de expedientes | Incidencias reproducibles y vínculos a cambios verificables |

Las pruebas deben diseñarse para permitir **refutar la hipótesis**, no confirmar por construcción una mejora.

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
