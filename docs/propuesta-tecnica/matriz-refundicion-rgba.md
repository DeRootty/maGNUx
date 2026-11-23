# Matriz de correspondencias: refundición ecológica RGBA / Trilobytes / α

> [⬆ Propuesta técnica](README.md) · [📖 Borrador constitutivo RGBA](../manifesto/04-modelo-ecologico-rgba.md) · [🏠 Inicio](../../README.md)

**Control de integración:** rama `feature/rgba-trilobytes-alpha`  
**Punto de partida `master`:** `973674aebcddc2d5539334663a5c5ef47a4541ac`  
**Fecha de corte:** 2026-11-23  
**Estado:** análisis inicial; **no** es aprobación de la nueva arquitectura ni evidencia de implementación.

## Propósito y reglas

Esta matriz registra cómo encaja la formulación ecológica RGBA con el corpus existente. Evita que la refundición produzca un segundo manifiesto incompatible o borre fundamentos ya adquiridos.

Reglas para la siguiente fase:

1. **Conservar** las decisiones constitutivas ya vigentes que no entren en contradicción.
2. **Ampliar** las definiciones cuando RGBA aporte una relación nueva y explicativa.
3. **Reformular** únicamente tras identificar la contradicción exacta y dejar una razón auditable.
4. **Marcar como hipótesis** aquello que exige pruebas no realizadas.
5. **No modificar `master` ni los textos consolidados** durante el hito de establecimiento de rama y documentos de comparación.
6. Mantener la separación publicada: maGNUx declara, `docs/` especifica, Zalty ensaya.

## Correspondencias por documento

| Documento existente | Fundamento previo | Aporte RGBA / α | Tratamiento propuesto |
| --- | --- | --- | --- |
| [`docs/manifesto/01-manifiesto.md`](../manifesto/01-manifiesto.md) | Soberanía enraizada, IA futura y representación computacional | Ecología del kernel, composición y usuario α | **Ampliar** la tesis general y remitir al nuevo capítulo; no duplicarlo íntegramente. |
| [`docs/manifesto/02-hipotesis-central.md`](../manifesto/02-hipotesis-central.md) | Identidad, legitimidad, contrato, autoridades tempranas | Sesión como resultado de composición contractual | **Ampliar** la consecuencia arquitectónica; preservar soberanía previa a la operación. |
| [`docs/manifesto/horizonte-arquetipado.md`](../manifesto/horizonte-arquetipado.md) | Identidad → autoridad → contrato → capacidades → estado → evidencia → continuidad | «RAW → sesión revelada» como artefacto del arquetipo; carga ecológica | **Vincular** explícitamente las siete dimensiones a los descriptores de sesión y sus pruebas. |
| [`docs/arquitectura/03-estratos.md`](../arquitectura/03-estratos.md) | ROOT, COMM y ADMIN como estratos persistentes | R/G/B; existencia material y funcional emergente | **Ampliar** sin convertir canales en niveles CPU ni borrar las competencias. |
| [`docs/arquitectura/04-inicio-sistema.md`](../arquitectura/04-inicio-sistema.md) | Linux + initramfs como laboratorio; seL4 como hipótesis | α antes de montar raíz Linux; dependencia NPU/seL4 | **Reformular condicionalmente** dos rutas: prototipo actual y arquitectura futura por comprobar. |
| [`docs/arquitectura/05-bus-arranque.md`](../arquitectura/05-bus-arranque.md) | Comunicación temprana, `/boot/metal/`, `/run/maGNUx/`, `/upLoad/`, nodos | Referencias de α, contratos del revelado, separación estado persistente/runtime | **Ampliar** y especificar integridad y concurrencia sin confundir flash con RAM compartida. |
| [`docs/identidad/07-xgnuped.md`](../identidad/07-xgnuped.md) | Identidad y mediación COMM | Objetos funcionales surgidos del consumo de recursos kernel | **Ampliar** ciclo de vida y trazabilidad de entidades G. |
| [`docs/identidad/09-dernel.md`](../identidad/09-dernel.md) | Licencia operativa y ADMIN | Objetos administrativos compuestos desde recursos R y servicios G | **Ampliar** composición y alcance de las políticas B. |
| [`docs/identidad/08-trilobytes.md`](../identidad/08-trilobytes.md) | Logon/login, coherencia, representación, triple delegación | Trilobytes como revelador del RAW de sesión | **Ampliar**, conservando verificación e intermediación como funciones distintas. |
| [`docs/propuesta-tecnica/03-trilobytes-mediacion-spec.md`](03-trilobytes-mediacion-spec.md) | Intermediación por mandato, motor de estados, esquema Go | Revelado del descriptor, reconfiguración y eventos α | **Extender** interfaz y pruebas; **no** autorizar intermediación mediante el mero revelado. |
| [`docs/manifesto/volumen-ii-commonwealth-del-silicio.md`](../manifesto/volumen-ii-commonwealth-del-silicio.md) | Commonwealth, semiótica, nodos despiertos, IA accesoria | Identidad α y composición RGBA de una sesión | **Remitir** a la nueva formulación mediante un puente de lectura; conservar el ensayo histórico. |
| [`zalty/initramfs/`](../../zalty/initramfs/README.md) | Laboratorio Linux de arranque temprano y HostID | Ensayos de descriptores y pruebas `3/$` / `α/$` | **No tocar en fase 1**; abrir hipótesis de prototipo posterior. |

## Puntos de tensión que requieren decisión explícita

### T1. IA como servicio accesorio frente a usuario α especial

**Texto anterior:** la IA es un servicio sistémico opcional, consultable por nodos semióticos.

**Nueva definición:** Trilobytes trata al usuario α como identidad computacional singular que concurre con USER y depende funcionalmente de NPU.

**Resolución propuesta:** ambos niveles pueden coexistir: *servicios de inferencia* son capacidades; *usuario α* es la identidad que solicita/consigue esas capacidades bajo contratos. La presencia IA sigue siendo accesoria para la continuidad. Falta fijar relación de una identidad α con múltiples sesiones humanas y sus permisos de datos.

**Estado:** abierta para especificación.

### T2. «El kernel declara existencia» frente a objetos emergentes

**Texto anterior:** kernel ofrece recursos y superficies técnicas.

**Nueva precisión:** los dominios G y B pueden declarar objetos funcionales significativos que no existen como tipos del kernel.

**Resolución propuesta:** dos clases de existencia —material/primaria y funcional/derivada— con grafo de procedencia verificable. Ninguna entidad derivada escapa a controles nativos.

**Estado:** coherencia conceptual favorable; formalización pendiente.

### T3. Trilobytes verificador frente a motor de revelado

**Texto anterior:** verifica coherencia y puede intermediar bajo triple aprobación.

**Nuevo énfasis:** transforma definiciones RAW en sesiones RGBA efectivas.

**Resolución propuesta:** tres funciones lógicamente separadas: validación → revelado/compilación de descriptor → intermediación activa autorizada. El revelado no ejecuta por sí mismo operaciones privilegiadas; la triple luz verde sigue aplicando a intermediación, no necesariamente a lectura o verificación de un descriptor.

**Estado:** coherencia conceptual favorable; delimitar API y responsabilidades.

### T4. Secuencia de arranque Linux frente a seL4/α antes de `/`

**Texto anterior:** Linux + initramfs es referencia inmediata; seL4, vía futura.

**Nueva pretensión:** raíz de dependencias en `/boot/metal/`; seL4 sostiene el dominio α antes de montar `/`.

**Resolución propuesta:** mantener **ruta A** (Zalty actual Linux+initramfs) y **ruta B** (arquitectura objetivo seL4+NPU+Linux) como variantes dentro del mismo manifiesto, con estatus distintos. Verificar orden real de ejecución, propiedad de CPU/NPU, acceso a dispositivos, virtualización y recuperación.

**Estado:** hipótesis de hardware por demostrar; no fusionar como hecho implementado.

### T5. Composición fotográfica y permisos efectivos

**Riesgo:** interpretar «luz», «alfa» o «imagen final» como permisos concedidos mediante cálculo visual o caracteres del prompt.

**Resolución propuesta:** contratos formales y decisiones de autorización verificables; Trilobytes produce un descriptor, el sistema operativo aplica restricciones; el prompt muestra un estado, no lo cambia.

**Estado:** restricción indispensable, aprobable conceptualmente.

### T6. Almacenamiento común y memoria compartida

**Riesgo:** asumir que la partición SSD/FAT de `/boot/metal/` basta como memoria de coordinación en tiempo real.

**Resolución propuesta:** distinguir repositorio persistente de manifiestos y credenciales frente a transporte runtime. Definir propietario de escritura, recuperación tras interrupción, integridad, aislamiento y mensajes/colas en memoria cuando corresponda.

**Estado:** pendiente de diseño técnico.

### T7. Nombres y símbolos de sesión

Se mantienen las identidades de rol `/$` (USER), `/>` (ADMIN), `/&` (COMM) y `/#` (mantenimiento especial ROOT). `3/$` representa Trilobytes sin IA; `α/$` añade usuario IA coadyuvante. No se presupone una regla automática para `α/#` ni para cambios de rango: deben mediar permisos y condiciones explícitas.

**Estado:** convención constitutiva; implementación pendiente.

## Qué debe contener la siguiente iteración

La **fase 2: auditoría de coherencia** tendrá como entregable una relación de decisiones (ADR) y ejemplos concretos del ciclo de vida de una sesión:

- Entrada: identidad, objeto primario R, objeto derivado G/B, contrato y estado.
- Resultado: descriptor RAW validado y sesión revelada sin concesiones implícitas.
- Ciclo: creación de sesión `3/$`, activación contractual de α, evento de Trilobytes, caída α y retorno a `3/$`.
- Evidencias: registros de autorización/denegación, origen de objetos y trazas de los cambios.
- Prueba negativa: fallo de α no escala privilegios ni impide el uso ordinario.

**No se debe actualizar el corpus original en masa** hasta cerrar T1–T7 o declarar explícitamente cuáles siguen como experimentos y por qué no bloquean la integración conceptual.

## Registro de hito 1

- [x] Identificar rama principal y fijar el commit de partida.
- [x] Crear rama de refundición sin modificar `master`.
- [x] Redactar el nuevo modelo RGBA como documento independiente.
- [x] Crear matriz de correspondencias con documentos preexistentes.
- [ ] Resolver tensiones T1–T7 y diseñar especificaciones de prueba.
- [ ] Actualizar navegación de la rama, revisar y abrir Pull Request.
- [ ] Fusionar a `master` tras revisión.

La rama no debe mantenerse como manifiesto rival: es un **espacio de revisión temporal** destinado a volver a una única línea principal de referencia.

---

## Resultado de la fase 2 — Auditoría y especificación provisional (2026-11-23)

**Estado:** documentación de auditoría completada; decisiones **propuestas**, pendientes de verificación y posible ajuste en la refundición. No es una declaración de código implementado ni de pruebas ejecutadas.

### Documentos de salida

- [ADR-0001 — Composición RGBA y límites de autoridad](adr-0001-composicion-rgba.md): tratamiento propuesto de T1–T7, compromisos de seguridad y rutas A/B.
- [04 — Especificación provisional de sesión RGBA](04-sesion-rgba-spec.md): RAW, descriptor revelado, estados independientes, trazas de sesión S1–S4 y pruebas negativas NEG-01–NEG-10.

### Revisión del registro

- [x] Formular resolución técnica **propuesta** para T1–T7.
- [x] Mantener IA accesoria sin negar la identidad especial USER-α.
- [x] Separar verificación, revelado e intermediación de Trilobytes.
- [x] Distinguir ruta A (Linux/Zalty) de ruta B (seL4/NPU), sin afirmar coexistencia demostrada.
- [x] Documentar el recorrido `3/$` → `α/$` → `3/$` y un intento de acceso ADMIN.
- [x] Definir pruebas negativas de privilegios, pérdida de recursos y continuidad.
- [ ] Aceptar/revisar formalmente las decisiones con pruebas o fundamentos adicionales.
- [ ] Refundir los documentos principales y actualizar la navegación (fase 3).
- [ ] Abrir Pull Request, revisar y fusionar a `master` cuando proceda.

### Preguntas de investigación que NO bloquean la refundición documental

1. ¿Cómo se relacionarán una o varias identidades α con múltiples sesiones humanas?
2. ¿Qué protocolo hace cumplir el descriptor y cómo se protege de modificaciones y condiciones de carrera?
3. ¿Qué plataforma concreta ofrece NPU accesible desde el dominio seL4 y qué método permite coexistir con GNU/Linux?
4. ¿Qué esquema de almacenamiento/medición de arranque ofrecerá integridad, autenticidad y protección contra rollback?
5. ¿Qué métricas permitirán medir capacidad de carga ecológica y el valor predictivo de α?

**Criterio del próximo paso:** conservar el material original y enriquecerlo por cambios pequeños, coherentes y revisables, no añadir otro corpus paralelo.

---

## Resultado de la fase 3 — Refundición controlada (2026-11-23)

**Estado:** integración documental efectuada en la rama; revisión técnica y eventual Pull Request necesarios antes de incorporar cambios a `master`.

Se han modificado sin borrar su corpus anterior: `docs/manifesto/01-manifiesto.md`, `02-hipotesis-central.md`, `docs/arquitectura/03-estratos.md`, `04-inicio-sistema.md`, `05-bus-arranque.md`, `docs/identidad/07-xgnuped.md`, `08-trilobytes.md` y `09-dernel.md`.

Los índices de arquitectura e identidad también enlazan la reformulación; la documentación del manifiesto y la propuesta técnica enlazaban ya los documentos de nueva creación.

### Equivalencias conservadas

| Antes | Después de la refundición |
| --- | --- |
| ROOT es fundamento soberano | R describe el sustrato kernel y respeta su soberanía previa; no pasa a estar sometido a ADMIN. |
| xGNUpeD declara identidad y media la comunicación | COMM/G añade objetos funcionales derivados con dependencias materiales. |
| Dernel concede licencia operativa | ADMIN/B puede declarar entidades administrativas a partir de recursos R y G. |
| Trilobytes verifica y puede intermediar con triple delegación | Se añade el revelado RAW, sin transformar verificación en intermediación autorizada. |
| IA como servicio accesorio | USER-α aparece como identidad ordinaria que utiliza servicios IA sin reemplazarla como infraestructura opcional. |
| initramfs como ensayo real, seL4 como hipótesis | Ruta A prototipable separada de Ruta B seL4/NPU todavía no demostrada. |
| Continuidad sistémica | Se concreta la diferencia entre fallo del kernel y fallo funcional de COMM o ADMIN. |

### Comprobación automática del corpus modificado

Se inspeccionó el conjunto de archivos Markdown alterados en la rama para comprobar:

- Un título Markdown principal por archivo.
- Resolución de las rutas Markdown locales enlazadas a ficheros del repositorio.
- Conservación de la base de `master` y su historial.

**Resultado de la inspección realizada:** 18 archivos Markdown revisados; sin títulos de documento duplicados ni enlaces relativos a archivos inexistentes detectados. Esta comprobación **no** valida el significado de todas las afirmaciones ni representa pruebas de software.

### Pendientes reales antes de fusionar

1. Revisión editorial de consistencia terminológica en todo el corpus, especialmente la interpretación de la triple delegación cuando se representa al usuario.
2. Revisión técnica de factibilidad de seL4+NPU y separación entre política declarativa y privilegios nativos; puede mantenerse como hipótesis sin bloquear la publicación.
3. Pruebas de ejecución para el descriptor RAW, las sesiones y la degradación `α/$` → `3/$`, todavía **no implementadas**.
4. Revisión humana del Pull Request de refundición. No fusionar por inercia o por un simple resultado positivo de enlaces.

**Siguiente paso:** abrir un Pull Request **en borrador** desde `feature/rgba-trilobytes-alpha` hacia `master` con esta matriz y sus criterios de aceptación. El objetivo es un solo `master` consolidado cuando la revisión lo permita.
