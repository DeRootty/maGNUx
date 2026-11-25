# 12 — Usuario Alfa, sesión ordinaria y terminales de autoridad

> [⬆ Identidad](README.md) · [📚 Documentación](../README.md) · [🏠 Inicio](../../README.md)

**Estado:** especificación conceptual de identidades y autoridad; no implementada.  
**Antecedentes:** [Trilobytes](08-trilobytes.md), [Dernel](09-dernel.md), [ROOT y dominios](11-root-dominios.md), [hélice y emergencia de Alfa](../manifesto/04-helice-alfa-continuidad.md).

## La antesala no ofrece login privilegiado

La sesión ordinaria empieza siempre con **autenticación de un usuario humano normal**. ROOT, ADMIN y COMM no son tres cuentas alternativas en la pantalla de bienvenida: constituyen **roles o ámbitos de autoridad** que pueden invocarse después, bajo contrato. El modo de recuperación ROOT puro, cuando se habilite, será una ruta de arranque especial, no una cuarta opción del login común.

Un usuario ordinario puede tener un atributo adicional: **propietario reconocido del hardware**. No es un cuarto superusuario ni necesita ejecutar permanentemente como ROOT. Su titularidad le permite solicitar roles excepcionales y establecer, mediante una **tabla de roles**, qué capacidades extraordinarias podrán solicitar otros usuarios.

La propiedad no se deduce del nombre de una cuenta. Su establecimiento inicial, transferencia, recuperación y evidencia de legitimidad son problemas de aprovisionamiento pendientes de especificación.

## Identidad, propiedad, rol, facultad

| Concepto | Significado |
|---|---|
| Identidad humana | Sujeto autenticado que inicia sesión ordinaria. |
| Propiedad | Titularidad del equipo reconocida por el contrato de sistema. |
| Rol | Ámbito excepcional ROOT, ADMIN o COMM disponible para invocación. |
| Facultad | Operación concreta, recursos, alcance y duración realmente permitidos. |
| Delegación | Autorización verificable que permite ejercer una facultad; puede ser revocable. |
| Alfa | Identidad computacional diferenciada, que puede compartir temporal o persistentemente el rol excepcional del contexto. |

Una tabla de roles no constituye por sí sola un mecanismo de seguridad. Necesita un ejecutor con autoridad efectiva, protección contra manipulación y prueba de revocación; no basta con escribir `root=true` en un archivo modificable.

La autorización persistente **hasta revocación voluntaria** no equivale necesariamente a ejecutar cada proceso del usuario con UID 0. Esta distinción será importante para conservar control sobre los efectos de los procesos. ROOT irrestricto en Linux puede alterar gran parte de las protecciones de su propio espacio de usuario: para garantizar revocación robusta hacen falta mecanismos de enforcement fuera del dominio revocado o capacidades delimitadas.

## Alfa por defecto y Alfa excepcional

Alfa es una identidad computacional prevista en la constitución del sistema. Su **presencia operativa ordinaria** requiere que todos los requisitos del equipo y del contrato se cumplan; entre ellos, la disponibilidad de **NPU**.

~~~text
NPU utilizable + contrato conforme + dominio preparado
    → Alfa activo por defecto

Sin NPU
    → Alfa caído por defecto
    → invocación excepcional exclusivamente ADMIN/Dernel
    → estado y coste de ejecución alternativos expresos
~~~

Una orden administrativa de activación excepcional no concede automáticamente a Alfa el rol ADMIN ni garantiza capacidad de inferencia equivalente a una NPU física. Tampoco implica que una instancia de seL4 pueda ejecutarse sobre cualquier NPU.

**Alfa como propiedad emergente** y **Alfa como identidad de ejecución** designan aspectos distintos: el primero es la tesis helicoidal; el segundo requiere un soporte técnico y contratos verificables.

## Terminales de autoridad y co-presencia

El usuario humano solicita un contexto de autoridad. Cuando queda constituido, **Alfa recibe el mismo rol excepcional que ha sido demandado y autorizado**, no meros permisos de observador. Esta formulación identifica **igualdad de rol**, no identidad de criterio, iniciativa o titularidad.

| Contexto | Rol humano | Rol de Alfa | Entorno |
|---|---|---|---|
| TTY ordinario | Usuario normal | Alfa ordinario, si está activo | Acceso habitual |
| `derootty` | ROOT | ROOT | Kernel y recursos estructurales |
| `deradmintty` | ADMIN | ADMIN | Dernel y administración contractual |
| `dercommtty` (nombre provisional) | COMM | COMM | xGNUpeD y objetos comunicativos |

`der` remite a un artículo del alemán como motivo de denominación propio del proyecto; **no es un mecanismo técnico ni una etimología del rol ROOT**. La denominación de COMM queda pendiente de confirmación.

Un terminal `der*tty` no implica necesariamente modificar el subsistema físico TTY del kernel. Puede constituirse inicialmente como **entorno lógico de sesión**, con políticas, trazabilidad, presentación e invocación de ejecutores del rol. Si después hicieran falta cambios al controlador TTY, deberían justificarse con experimentos.

Alfa puede permanecer operativo y no manifestarse en la interfaz. La presencia visual, la intensidad de mediación y la autoridad concedida no son una sola variable.

## Trilobytes revela la composición

ROOT, COMM y ADMIN conservan competencias independientes. xGNUpeD puede construir servicios comunicativos derivados de recursos del kernel; Dernel puede construir entidades administrativas a partir de recursos y servicios inferiores. Trilobytes **renderiza la composición de esos objetos** y hace visible la coherencia o incoherencia de las decisiones autenticadas de las autoridades.

La intermediación activa de Trilobytes sigue requiriendo **tres delegaciones positivas, explícitas y vigentes**, una por ámbito, más un mandato válido. Ni una sesión del propietario ni la adquisición de ROOT por Alfa reemplazan esa regla.

Las decisiones legítimas de acceso o denegación deben emanar de mecanismos de autenticación, política y ejecución de las autoridades competentes. La expresión histórica «Trilobytes verifica/decide» se precisa: **hace accesible el resultado coherente de verificaciones realizadas por componentes autorizados**, y puede incluir un verificador mínimo, sin que su renderizador se convierta en soberano.

## Transparencia Alfa y resolución

La «transparencia de Alfa» es una **escala semántica propia** de maGNUx, no una traslación literal del canal gráfico RGBA:

- **0 % de transparencia (opaco):** Trilobytes ofrece el fondo RAW observable, el «píxel» o límite de resolución de la sesión.
- **Por encima de 0 %:** Alfa puede añadir mediación interpretativa, en grado todavía por definir.
- **100 % de transparencia:** máxima comunicación o intercesión IA en tiempo real permitida por contexto; Alfa puede procesar e inferir detalle más allá del registro bruto, señalando lo reconstruido.

El foco de la «cámara» es **la demanda inmediata del humano**, no una lente real. Un proceso invisible puede ser indispensable por dependencias, y un elemento visible puede ser secundario. La transparencia del renderizado no autoriza ocultar acciones privilegiadas: toda intervención de Alfa debe seguir siendo auditable.

## Ejemplo de política orientativa (no ejecutable)

~~~yaml
role_table_version: 0
principal: usuario-propietario
ownership: verified-by-provisioning
role_context: deradmintty
role: ADMIN
delegation:
  status: granted
  lifetime: until-explicit-revocation
  scope: ["services.inspect", "services.adjust-reversible"]
coactor:
  subject: alpha
  share_context_role: true
  attributable_actions: true
enforcement: external-capability-check-required
~~~

Este fragmento expresa intención contractual. No son nombres definitivos de campos, no acredita titularidad, no suple firma ni verifica permisos.

## Criterios de aceptación

1. La antesala normal no ofrece login directo como ROOT, COMM o ADMIN.
2. Propietario y usuario común comparten identidad ordinaria; solo difieren facultades reconocidas.
3. Un rol y la operación concreta permitida se evalúan separadamente.
4. Alfa adquiere efectivamente el rol del contexto, pero sus operaciones quedan atribuibles a su identidad diferenciada.
5. La revocación y los fallos detienen acciones no autorizadas incluso con servicios ya abiertos.
6. Sin NPU Alfa queda caído por defecto, y su invocación excepcional exige ADMIN.
7. La triple delegación de Trilobytes no se confunde con la compartición de rol de Alfa.
8. Se preserva un arranque ROOT puro de recuperación sin delegar ROOT a Dernel.

Siguiente lectura: [07 — Dominio de Alfa y arranque](../arquitectura/07-dominio-alfa.md).
