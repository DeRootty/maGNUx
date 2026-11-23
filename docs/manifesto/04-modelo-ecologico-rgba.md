# 04 — Constitución ecológica y composición RGBA de las sesiones maGNUx

> [⬆ Manifiesto](README.md) · [📚 Índice de documentación](../README.md) · [🏠 Inicio](../../README.md)
>
> **Estado:** borrador constitutivo para revisión, rama `feature/rgba-trilobytes-alpha`.  
> **Fecha:** 2026-11-23. **Autoría del planteamiento:** Derootty / maGNUx.  
> **Naturaleza:** hipótesis de arquitectura, no implementación ni demostración experimental.

## 1. Tesis

maGNUx concibe el sistema operativo como un ecosistema material y funcional. El kernel constituye el entorno natural que reconoce y administra recursos finitos; xGNUpeD/COMM y Dernel/ADMIN forman estructuras de identidad, interacción, organización y vida operativa que se sostienen sobre ese entorno y sus límites.

Una sesión no es la simple suma de procesos iniciados tras una autenticación. Es una **composición contractual**, revelada por Trilobytes a partir de identidades, recursos, servicios, dependencias, políticas y estado. La metáfora elegida es el revelado de un archivo RAW hasta obtener una imagen RGBA.

La IA sistémica, cuando está disponible, aporta un **usuario α**: identidad computacional especial, funcionalmente sustentada en la NPU, que colabora en paralelo con la persona sin ser ROOT, COMM ni ADMIN, y sin adquirir privilegios superiores por su procedencia material.

La finalidad es producir una sesión coherente y auditable que pueda degradarse de forma segura cuando falte la IA, y evaluar la **capacidad de carga** de toda la organización, no solo la salud del kernel.

## 2. Los tres estratos permanentes: R, G, B

| Canal | Dominio | Competencia y objetos |
| --- | --- | --- |
| **R (rojo)** | **ROOT / kernel** | Autoridad estructural, recursos materiales reconocidos, primitivas e interfaces del sistema. |
| **G (verde)** | **COMM / xGNUpeD** | Identidad, comunicación, mediación y objetos funcionales constituidos al consumir recursos del kernel. |
| **B (azul)** | **ADMIN / Dernel** | Licencia, administración y objetos organizativos constituidos al utilizar recursos R y servicios G. |

Esta relación expresa **dependencia funcional**, no una escalera de privilegios CPU ni una sumisión de ROOT a Dernel. El kernel es el sustrato técnico que permite ejecutar y proteger los demás dominios; cada uno mantiene su ámbito y sus contratos.

Un objeto de Dernel puede carecer de representación nativa como objeto del kernel, aunque dependa de procesos, memoria, archivos y comunicaciones que este soporta. xGNUpeD ocupa una posición intermedia: transforma recursos en servicios y relaciones con significado propio. En consecuencia, el sistema revela **existencia material y existencia funcional emergente**. La trazabilidad debe conservar el enlace entre ambas.

Ejemplo ilustrativo: el kernel reconoce una interfaz de red y sockets; COMM constituye una identidad y un servicio de conectividad; ADMIN agrupa ese servicio en una política de funcionamiento para una actividad autorizada. La política no existe como «objeto kernel», pero sí como entidad operativa de Dernel respaldada por recursos materiales.

## 3. Los contratos son iluminación, no creación material

Los contratos iluminan aquello que las autoridades competentes declaran que existe. En la metáfora fotográfica, la iluminación puede proceder de un marco general (como el Sol) o de varios focos locales (contratos específicos de servicio, identidad o actividad).

Un contrato determina **en qué condiciones** un objeto o relación puede ser conocido, presentado, solicitado o utilizado por una sesión. Puede quedar iluminado para una identidad y fuera del campo visible para otra, sin desaparecer del sistema.

Esta iluminación puede recaer sobre recursos primarios reconocidos por el kernel y sobre entidades funcionales declaradas por COMM y ADMIN. No es lícito reducir todas las entidades superiores al inventario nativo del kernel ni atribuir a un contrato la capacidad de crear hardware o soberanía por decreto.

Los permisos son verificables y discretos allí donde los mecanismos nativos así lo exigen: la luz es una **metáfora de alcance contextual**, no una mezcla aritmética de privilegios. En caso de conflicto contractual no se suman autorizaciones indiscriminadamente; deben aplicarse reglas explícitas de prioridad, incompatibilidad, denegación y revisión.

## 4. Trilobytes es el motor de revelado de una sesión

El RAW sistémico es la entrada declarativa, todavía no «revelada», de una sesión: identidad del sistema y del sujeto, contratos vigentes, recursos, objetos de COMM, entidades ADMIN, dependencias y estado.

**Trilobytes carga, valida e interpreta ese RAW** y produce una «imagen renderizada»: un descriptor operativo de la sesión. Esta descripción especifica el contexto visible y utilizable, las rutas autorizadas de interacción y la cooperación disponible. El resultado debe ser aplicado por mecanismos reales —kernel, seL4 donde corresponda, procesos, políticas y controles de acceso—; el mero renderizado no es una barrera de seguridad.

Trilobytes conserva su identidad anterior como **verificador de coherencia** entre identidad, política, licencia y sesión. La función de **intermediación con representación activa** mantiene la regla ya declarada: requiere delegaciones positivas, explícitas y vigentes de ROOT, COMM y ADMIN, además del mandato pertinente. Verificar o componer una sesión no confiere automáticamente una autorización ilimitada de intermediación.

El cambio de autoridad o de contrato exige **reevaluar la sesión**, no simplemente cambiar su prompt. El RAW constitutivo y el descriptor revelado deben poder distinguirse y auditarse.

## 5. El canal α: usuario IA en paralelo

El canal α toma su analogía del canal alfa fotográfico: no añade un cuarto color al RGB, sino una dimensión de **participación en la composición**. En maGNUx tampoco representa un cuarto soberano.

Trilobytes reconoce a la IA como **otra identidad de usuario**, con privilegios base ordinarios comparables a USER. Es especial por su origen funcional en hardware de inferencia neuronal y por su concurrencia con el usuario humano; **no** por recibir facultades ROOT, COMM o ADMIN.

La IA puede observar señales accesibles, correlacionar eventos, interpretar dependencias, proponer acciones y realizar operaciones ordinarias expresamente autorizadas. La colaboración puede ser silenciosa o comunicarse por terminal. Ambas identidades siguen siendo distintas: mismo rango base no significa compartir automáticamente credenciales, archivos privados, ni contratos.

La intensidad de la colaboración alfa puede variar según la sesión, tarea y contrato; ello no cuantifica los privilegios en porcentajes ni autoriza por implicación una acción privilegiada. Una inferencia tampoco reemplaza la comprobación determinista de política.

## 6. Gramática de sesión y prompt

| Sufijo | Modo |
| --- | --- |
| `/$` | USER ordinario sin privilegios especiales |
| `/>` | ADMIN / Dernel |
| `/&` | COMM / xGNUpeD |
| `/#` | ROOT en arranque o mantenimiento especial |

Prefijos de presencia funcional:

- `3/$`: Zalty/maGNUx con Trilobytes y **sin IA α disponible**. Es el prompt ordinario previsto de Zalty sin IA.
- `α/$`: misma categoría ordinaria de usuario, con el canal α constituido y habilitado para colaborar a través de Trilobytes.

Por extensión conceptual pueden evaluarse `3/>`, `α/>`, `3/&` y `α/&` **solo** donde existan contratos que las legitimen. El modo `/#` queda expresamente reservado a mantenimiento ROOT; no se presume su combinación automática con prefijos.

El prompt es un **indicador** del estado validado, nunca su fuente de autoridad. Su representación debería actualizarse cuando cambie la disponibilidad efectiva de α o la condición contractual de la sesión.

Al aparecer α, Trilobytes puede presentar en la terminal humana eventos producidos por el usuario IA en cualquier momento, mediante un canal seguro que no corrompa la entrada en curso y distinga evidencia, sugerencia, solicitud y actuación autorizada.

## 7. Arranque propuesto de α y `/boot/metal/`

El diseño sitúa en `/boot/metal/` el anclaje persistente de identidad material, manifiestos, contratos y dependencias de arranque del dominio α. La **constitución de α debe preceder al montaje de la raíz definitiva `/` de GNU/Linux** según la intención arquitectónica del proyecto.

La ubicación escrita `/boot/metal/` es un **punto de montaje lógico del sistema ya constituido**. Las fases previas deben localizar su soporte mediante identificadores o rutas accesibles al firmware/cargador, y verificar integridad y procedencia antes de confiar en los datos.

Se propone seL4 como micronúcleo para el dominio α y la NPU como motor de cálculo neuronal. En equipos convencionales, **seL4 ejecuta en CPU** y necesitaría un mecanismo de acceso a la NPU; no puede asumirse que la NPU ejecute seL4 directamente.

Para sostener seL4 y Linux en paralelo debe definirse y comprobarse una arquitectura concreta de coexistencia (virtualización, reparto de núcleos, hipervisor u otra variante viable). «Antes de montar `/`» **no equivale necesariamente** a «antes de ejecutar cualquier kernel Linux», y una secuencia de nombres no resuelve por sí sola la propiedad del hardware.

El almacén sólido persistente no debe confundirse con RAM compartida o memoria coherente CPU–NPU. Hacen falta reglas de propiedad, escritura y recuperación, y posiblemente canales distintos para datos de arranque y mensajes en ejecución.

## 8. Ecología, carga y continuidad

Una arquitectura superior puede colapsar funcionalmente aunque el kernel permanezca operativo. Por eso maGNUx distingue el estado del ecosistema material y el estado de sus «formas de vida» funcionales.

La **capacidad de carga sistémica** es una hipótesis de medición de consumo, latencia, dependencias, bloqueo, acumulación de deuda de recursos, recuperación e impacto cruzado de servicios. No se reduce a porcentaje de CPU o RAM.

El usuario α puede observar y anticipar tensiones, conservando su papel coadyuvante. Sus predicciones deben registrar evidencia, incertidumbre y contexto, sin imponer automáticamente decisiones administrativas.

Si falla o se deshabilita la NPU o el dominio α, la sesión ordinaria debería continuar: `α/$` → `3/$`, tras revocar capacidades activas de α, gestionar operaciones pendientes y notificar la degradación. La IA es **accesoria a la continuidad**, no requisito de supervivencia del sistema.

## 9. Ruta de comprobación

Este texto expone **principios e hipótesis**, no código en producción. Antes de declarar la arquitectura verificada se requiere:

1. Un formato versionado de RAW constitutivo y descriptor de sesión renderizada, con identidades, objetos y relaciones de dependencia.
2. Contratos evaluables, reglas de conflicto y trazabilidad de autorizaciones, sin capacidad de inventar autoridad.
3. Un prototipo de Trilobytes que permita crear y recomponer sesiones en Linux ordinario, aun sin NPU.
4. Un sujeto IA ordinario simulado que coopere sin escalar privilegios y emita eventos separadamente identificados.
5. Una prueba reproducible de `3/$`, `α/$`, pérdida de α y restauración con continuidad humana.
6. Una validación física posterior de la coexistencia seL4/Linux, el acceso NPU y el almacenamiento `/boot/metal/`, separada del prototipo conceptual.

**Criterio de revisión:** debe poder recorrerse una sesión de extremo a extremo, identificando origen de cada objeto, contrato que lo ilumina, autoridad que puede autorizar su acción, intervención de Trilobytes y evidencia que permite auditar el resultado.

## 10. Relación con el corpus actual

Este documento **complementa**, no sustituye, la [hipótesis central](02-hipotesis-central.md), los [tres estratos](../arquitectura/03-estratos.md), el [arranque](../arquitectura/04-inicio-sistema.md), el [bus y `/boot/metal/`](../arquitectura/05-bus-arranque.md), la [identidad Trilobytes](../identidad/08-trilobytes.md), la [especificación de intermediación](../propuesta-tecnica/03-trilobytes-mediacion-spec.md) y el [volumen II de la Commonwealth del silicio](volumen-ii-commonwealth-del-silicio.md).

La refundición de esos textos se realizará en una fase posterior, mediante decisiones documentadas y un Pull Request, preservando mientras tanto sus versiones originales en `master`.
