# ADR-0001 — Composición RGBA y límites de autoridad en maGNUx

> [⬆ Propuesta técnica](README.md) · [Modelo ecológico RGBA](../manifesto/04-modelo-ecologico-rgba.md) · [Matriz de refundición](matriz-refundicion-rgba.md)

- **Fecha:** 2026-11-23
- **Rama:** `feature/rgba-trilobytes-alpha`
- **Estado:** **propuesto para revisión técnica** (no aceptado como implementación)
- **Decisión de producto:** conservar **una única línea principal en `master`**; esta rama es temporal.
- **Ámbito:** reconciliar las tensiones T1–T7 detectadas en la matriz sin alterar el corpus original de `master`.

## Contexto

maGNUx ya declara ROOT, COMM, ADMIN, contratos, identidad temprana y Trilobytes como verificador de coherencia e intermediario bajo triple delegación. La formulación nueva añade: ecosistema material/funcional; composición de sesiones RGBA; Trilobytes como revelador RAW; usuario IA α de privilegios ordinarios; dependencia funcional de NPU; y objetivo de arranque con seL4 antes del montaje de raíz GNU/Linux.

La metáfora **explica la arquitectura**, pero no sustituye los mecanismos nativos que tienen que hacerla cumplir.

## Decisiones y su grado de madurez

### ADR-01 / T1 — Servicio de IA e identidad usuario α

**Decisión conceptual propuesta:** separar **identidad**, **ejecución**, **aceleración** y **disponibilidad de servicios**:

1. `USER-α` es un principal independiente, con rango base USER ordinario.
2. La NPU proporciona capacidad de inferencia; la existencia de un acelerador no crea una credencial ni un anillo de privilegio físico.
3. Los servicios que materializan la IA pueden ejecutarse en CPU y solicitar cálculo NPU; la identidad α los vincula a un dominio contractual y de auditoría.
4. El trabajo α concurre con el humano, pero un mismo rango no implica compartir automáticamente UID, credenciales, claves, espacio de archivos o acceso a información humana.
5. Los permisos efectivos son intersección de capacidades nativas y contratos vigentes, con denegación cuando falte legitimidad.

**Compatibilidad:** conserva el principio de accesoriedad de la IA y amplía la noción anterior de «servicio sistémico» con un sujeto computacional auditable.

**Pendiente:** cardinalidad de instancias α frente a sesiones humanas; propietario de cada contexto de datos.

### ADR-02 / T2 — Existencia material y objetos emergentes

**Decisión conceptual propuesta:** mantener dos nociones complementarias:

- `R`: inventario de recursos del kernel y sus referencias;
- `G` y `B`: entidades declaradas por la capa competente, con identidad estable y dependencias trazables hasta recursos o servicios inferiores.

Una entidad B no tiene por qué figurar entre los tipos del kernel para existir como objeto administrativo. Su vínculo con el ecosistema material **no le confiere** permisos adicionales.

**Invariante:** todo objeto derivado debe exponer `issuer`, `object_id`, `kind`, `dependencies` y `lifecycle_state`; la pérdida de una dependencia crítica provoca reevaluación, no existencia ficticia.

### ADR-03 / T3 — Trilobytes como verificador, revelador e intermediario

**Decisión conceptual propuesta:** distinguir tres operaciones, no tres soberanías:

1. **Verificar** identidad, estado, firmas/referencias y contratos.
2. **Revelar** una sesión compilando un descriptor efectivo desde el RAW validado.
3. **Intermediar activamente** en nombre de un principal, solo si existe mandato válido **y** concesiones positivas independientes de ROOT, COMM y ADMIN.

No se utiliza la triple delegación como un requisito global para cualquier lectura, observación o comprobación. Tampoco se permite usar el revelado para saltarse un control.

**Invariante:** el descriptor es una **propuesta verificable de configuración**; los mecanismos nativos aplican restricciones reales. El prompt nunca es una fuente de permisos.

### ADR-04 / T4 — Arranque de α y coexistencia seL4/Linux

**Decisión de alcance:** establecer dos rutas, con estatus explícito y sin confundirlas:

- **Ruta A — prototipo viable actual:** Linux + initramfs + Zalty, datos declarativos en `/boot/metal/`, observabilidad y simulación de α. No afirmar que incorpora seL4/NPU.
- **Ruta B — arquitectura objetivo a investigar:** dominio seL4 sobre CPU y servicio IA asistido por NPU, constituido antes del montaje de la raíz GNU/Linux definitiva, con Linux ejecutándose mediante una estrategia de coexistencia verificable (p. ej. virtualización adecuada a la plataforma).

`/boot/metal/` nombra una ruta de montaje lógica; su contenido se descubre en arranque temprano a través de un volumen identificable, sin presuponer que `/` ya existe.

**No decidido:** hardware/SoC objetivo, gestión de MMU/IOMMU, propiedad de NPU/DMA, secuencia precisa del bootloader, virtualización y aislamiento de procesos. No afirmar como hecho que seL4 y Linux ya coexisten.

### ADR-05 / T5 — RGBA y política de autorización

**Decisión conceptual propuesta:** la composición de canales significa combinación de **declaraciones y significados** bajo política explícita, no adición numérica de permisos.

- Cada canal presenta objetos, límites y contratos desde su competencia.
- Los contratos permiten visibilidad y operaciones dentro de su alcance, pero no crean soberanía ni hardware.
- La autorización de una acción exige validación del principal, objeto, operación, entorno y evidencia de vigencia.
- Las inconsistencias entre declaraciones generan **denegación o degradación segura**, con causa auditable.

El canal α modula la participación y la notificación de la IA, no concede privilegios ROOT.

### ADR-06 / T6 — Persistencia, transporte y estado vivo

**Decisión conceptual propuesta:** separar tres espacios:

| Espacio | Propósito | Cautela |
| --- | --- | --- |
| `/boot/metal/` | Identidades, manifiestos, contratos, dependencias y referencias de arranque persistentes | Integridad, autenticidad, identificadores estables y propiedad de escritura |
| `/run/maGNUx/` | Resultados, inventario semiótico runtime y evidencias transitorias (Ruta A) | No constituye fuente soberana persistente |
| Canal runtime futuro α–Linux | Eventos, solicitudes y observaciones entre dominios | Memoria/IPC con aislamiento; no asumir que FAT32 aporta coherencia concurrente |

**No decidido:** formato de partición definitivo, protocolo de acceso concurrente, protección contra rollback, secreto de claves y método de intercambio de memoria entre kernels.

### ADR-07 / T7 — Sesiones, roles y estado del prompt

**Decisión conceptual propuesta:** separar el **rango contractual efectivo** de la **disponibilidad del compositor α**:

| Rango | Sintaxis base | Significado |
| --- | --- | --- |
| USER | `/$` | Actividad ordinaria |
| ADMIN | `/>` | Facultades Dernel verificadas |
| COMM | `/&` | Facultades xGNUpeD verificadas |
| ROOT | `/#` | Arranque/mantenimiento especial |

`3/$` indica Trilobytes sin α; `α/$` indica usuario α disponible y legitimado para colaborar con esa sesión. La disponibilidad del canal α puede variar sin cambiar el rango del humano. Las formas combinadas para ADMIN/COMM son **extensiones a verificar**; no se asigna automáticamente prefijo α o 3 a ROOT de mantenimiento.

Al solicitar cambios de rango, Trilobytes exige autorización y **nuevo revelado**; nunca basta con alterar caracteres del terminal.

## Invariantes transversales de seguridad

1. **No escalada:** USER-α no puede adquirir más autoridad por usar NPU, por emitir un evento, por componer RGBA ni por acceder a `/boot/metal/`.
2. **No suplantación:** un actor no puede afirmar que es otro únicamente mediante un descriptor editable o texto presentado en terminal.
3. **Mediación reglada:** la triple luz verde y mandato son necesarios para la intermediación activa que define el corpus original.
4. **Trazabilidad:** cada objeto emergente y cada decisión señalan fuente, versión, dependencias, políticas y resultado.
5. **Continuidad:** fallar α no interrumpe obligatoriamente la actividad USER; operaciones de α pendientes se cancelan o finalizan por política.
6. **Diferenciación:** el kernel puede continuar vivo mientras COMM o ADMIN tienen fallo funcional; no confundir ambas categorías.
7. **Separación de planos:** identidad, dato, contrato, inferencia, decisión autorizadora, aplicación nativa y presentación son responsabilidades distintas.

## Riesgos y criterios para levantar dudas

| Riesgo | Consecuencia | Mitigación o prueba mínima |
| --- | --- | --- |
| Descriptor presentado como autorización ejecutable | Escalada de privilegios | Negación de una operación aunque el descriptor adulterado la declare permitida |
| α comparte UID o datos privados sin permiso | Exposición indebida | Denegar lectura de recurso humano no compartido |
| Contratos contradictorios | Confusión de autoridad | Denegación registrable, selección de política documentada |
| Doble escritura en SSD persistente | Corrupción/rollback | Escritor único o protocolo transaccional verificable |
| Eventos α escriben sobre entrada TTY | Pérdida de integridad de órdenes | Cola/renderer aislado o UI que no modifique la línea en edición |
| seL4 no soporta NPU de prueba | Arquitectura no ejecutable | Prototipo independiente de hardware y selección explícita posterior |
| IA deja de responder | Interrupción de sesión | Transición segura `α/$` → `3/$` |

## Efectos de esta decisión

**Se conserva:** los tres dominios ROOT/COMM/ADMIN, soberanía del kernel, xGNUpeD intermediario, Dernel administrativo, los contratos, la triple delegación de Trilobytes, arranque experimental Linux de Zalty y la accesoriedad de IA.

**Se amplía:** identidad USER-α, compositor de sesiones, entidades funcionales emergentes, iluminación contractual, notificaciones semióticas, ecología y capacidad de carga.

**No se da por demostrado:** la convivencia real seL4/Linux en el dispositivo final, la actividad continua de una NPU, la seguridad formal de todo el stack ni que los contratos ya apliquen permisos nativos.

## Siguiente entregable y salida de fase

La especificación complementaria [`04-sesion-rgba-spec.md`](04-sesion-rgba-spec.md) debe formalizar formatos y un recorrido completo de sesión. La fase 2 se considera documentalmente cerrada cuando:

- las siete tensiones tienen resolución **propuesta** u obstáculo señalado con claridad;
- existe una traza completa `3/$` → `α/$` → `3/$`;
- se describen pruebas negativas de privilegios y dependencia;
- los documentos originales permanecen sin modificar.

**Aceptar un ADR como principio revisable no equivale a declarar implementado su mecanismo.**
