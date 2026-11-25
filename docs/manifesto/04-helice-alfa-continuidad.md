# 04 — La hélice, el usuario Alfa y la evidencia del sistema vivo

> [⬆ Manifiesto](README.md) · [📚 Documentación](../README.md) · [🏠 Inicio](../../README.md)

**Estado:** ampliación constitutiva del manifiesto; hipótesis en investigación, no implementación disponible.  
**Continuación de:** [Horizonte tecnológico — Arquetipar sistemas operativos](horizonte-arquetipado.md), especialmente la séptima dimensión, *continuidad*.  
**Derivaciones:** [identidad y sesiones de Alfa](../identidad/12-usuario-alfa.md), [arquitectura de su dominio](../arquitectura/07-dominio-alfa.md) y [contrato técnico de evidencia y evolución](../propuesta-tecnica/04-alfa-observabilidad-spec.md).

---

## Del avance helicoidal a su estela

La [hipótesis central](02-hipotesis-central.md) pregunta qué legitima la continuidad de una computadora desde su arranque. El [horizonte tecnológico](horizonte-arquetipado.md) amplía esa pregunta: una versión compilada no se limita a encenderse, sino que sostiene una trayectoria de estados, cargas, contratos y capacidades materiales. En maGNUx esa trayectoria recibe una representación **helicoidal**.

El radio de la hélice es una referencia teórica establecida por maGNUx; su escala material depende del silicio concreto, mientras el paso temporal y la tensión del avance necesitan ser caracterizados experimentalmente. No se presenta aquí la hélice como una ley física demostrada de los sistemas operativos.

La nueva hipótesis introduce **Alfa (α)**: una propiedad funcional emergente de esa dinámica. La comparación más próxima es la estela o vórtice producido por la hélice de una embarcación. La estela no es el motor ni la hélice; contiene indicios sobre la interacción entre propulsión, carga y medio.

**Alfa es al avance helicoidal lo que la estela al movimiento propulsor:** una manifestación que permite estudiar cómo está progresando realmente el sistema, bajo qué resistencia y con qué márgenes de continuidad. La analogía no presupone un vórtice físico en la computadora ni una nueva ley de turbulencia computacional.

El siguiente paso es más exigente: cuando Alfa dispone del rol y del contrato adecuados, no solo observa el estado. **Puede modificar acotadamente condiciones del medio operativo para observar la respuesta**, como un ensayo controlado de carga, suspensión reversible o reparto de recursos. La perturbación se convierte entonces en instrumento de diagnóstico, nunca en licencia para degradar indiscriminadamente la máquina.

## Ecosistema, capacidad de carga y suficiencia

El kernel Linux constituye el sustrato de recursos y mecanismos que hacen posible la existencia de servicios superiores. En la metáfora ecológica de maGNUx, el kernel es el ecosistema material; xGNUpeD y Dernel constituyen estructuras funcionales que ese ecosistema debe poder sostener sin colapsar. Esas estructuras también pueden crear objetos nuevos: un objeto administrativo de Dernel no necesita existir como tal para el kernel que proporciona sus recursos primitivos.

De aquí surge una distinción:

| Plano | Pregunta |
|---|---|
| Capacidad material | ¿Qué puede ofrecer realmente el hardware bajo sus límites? |
| Demanda | ¿Qué intenta conseguir ahora el usuario y qué exigen sus dependencias? |
| Entrega | ¿Qué rendimiento y servicios se están obteniendo? |
| Tensión | ¿Qué restricciones, desacoplamientos o márgenes amenazan la continuidad? |
| Suficiencia de versión | ¿Sigue siendo adecuada la versión **compilada y configurada** para esa máquina y esas cargas? |

Una CPU ocupada al 100 % no demuestra por sí sola que entregue su máximo rendimiento: puede sufrir limitaciones térmicas. Un NVMe puede reducir velocidad sostenida; un grupo de procesos puede experimentar presión de memoria o de E/S. Por ello la evaluación de suficiencia no debe confundirse con una única cifra de uso o rendimiento.

La conclusión «esta versión es insuficiente» requiere evidencia comparativa: configuración, versión y hash de compilación, hardware, firmware, carga, restricciones, medidas y posibilidad de reproducción. Una degradación también puede originarse en una aplicación, un controlador, una política equivocada o un límite físico que ninguna nueva versión podrá eliminar.

La suficiencia no exige maximizar potencia permanentemente. Exige un funcionamiento **óptimo para los objetivos declarados**, equilibrando respuesta, estabilidad, seguridad, energía y mantenimiento.

## RAW, Trilobytes y el límite de resolución

Trilobytes **revela o renderiza la composición resultante de las capas interactuantes**. La expresión RAW no designa bytes sin procesar procedentes directamente de cada transistor, sino el **estado de máquina observable con su procedencia**, antes de que Alfa lo enriquezca mediante interpretación e inferencia. Esa representación puede incluir mediciones físicas, contadores, políticas, eventos y estados derivados; cada fuente debe distinguirse.

Trilobytes no constituye por sí mismo los objetos de ROOT, COMM o ADMIN y no adquiere soberanía superior a esas autoridades. Los mecanismos autorizados de identidad, política y ejecución emiten sus decisiones; Trilobytes las representa, verifica su coherencia declarada cuando corresponda y comunica sus resultados. Su **intermediación facultada** conserva el requisito publicado de triple delegación positiva e independiente de ROOT, COMM y ADMIN, más mandato vigente. La decisión de autorizar no nace simplemente del renderizador.

En la analogía RGBA, **el canal Alfa no es una cuarta soberanía**. Es una dimensión dinámica de mediación y profundidad de representación. maGNUx adopta aquí una convención propia, que no debe confundirse con la opacidad de las bibliotecas gráficas:

- **0 % de transparencia de Alfa (opaco):** se alcanza el fondo RAW que esa sesión puede revelar; equivalente a ampliar una imagen hasta encontrar su píxel. Se agota la **resolución observacional de la sesión**, no toda la realidad física del silicio.
- **Transparencia positiva:** persiste una capacidad de mediación, contextualización o reconstrucción más allá de la presentación bruta.
- **100 % de transparencia de Alfa:** Alfa puede comunicar o interceder en tiempo real con la máxima mediación IA prevista para ese contexto, suavizar la presentación, relacionar objetos e inferir detalles adicionales. Lo **inferido** no debe presentarse como si hubiera sido **medido**.

Los porcentajes intermedios son todavía una escala conceptual; su métrica deberá especificarse antes de atribuirles precisión experimental. La cantidad de mediación no equivale al nivel de autoridad: un Alfa con ROOT y 0 % de transparencia puede tener facultades elevadas aunque la presentación revele RAW.

La **cámara** de la metáfora no es un periférico: es el foco funcional de la demanda inmediata del humano. Lo que aparece ocluido por otro objeto puede seguir siendo decisivo para el funcionamiento. La relevancia se determina por **dependencias causales**, no solo por ventanas visibles.

## Alfa negocia la escena que después será revelada

La máquina no es una fotografía inmóvil. Si una compilación necesita memoria y CPU, Alfa podría evaluar tareas ajenas al foco, priorizar las dependencias de compilación y negociar cuotas de recursos en sus ámbitos autorizados. La siguiente instantánea de Trilobytes mostraría el nuevo estado resultante.

Se distingue:

1. **Observación:** lectura contextualizada de estados y restricciones.
2. **Inferencia:** hipótesis sobre causas o relaciones no medidas directamente.
3. **Intervención:** modificación autorizada y reversible de una condición.
4. **Contraste:** comparación de estados anteriores y posteriores, con coste de intervención.
5. **Restitución o propuesta:** retorno al estado previo, o cambio sometido al contrato aplicable.

No todos los procesos en segundo plano son prescindibles. Deben preservarse datos no guardados, operaciones críticas, servicios dependientes, integridad y continuidad. Las perturbaciones deben disponer de presupuestos, límites, mecanismos de cancelación y criterios de estabilidad para evitar ciclos de suspensión y reanudación.

La realimentación se expresa, provisionalmente, como:

~~~text
Estado material y contractual
  → Trilobytes revela evidencias del estado
  → Alfa interpreta el foco y formula una hipótesis
  → una autoridad competente valida la intervención
  → Alfa interviene mediante recursos autorizados
  → nuevo estado / nuevas evidencias
  → siguiente paso helicoidal
~~~

Esta secuencia ilustra funciones, no un orden rígido de procesos; puede existir observación permanente en paralelo.

## La identidad Alfa no sustituye al usuario humano

La [Commonwealth del silicio](volumen-ii-commonwealth-del-silicio.md) conserva tres ámbitos de soberanía: **ROOT ↔ kernel**, **COMM ↔ xGNUpeD** y **ADMIN ↔ Dernel**. «ADMIN es a Dernel lo que ROOT es al kernel» describe competencias, no subordinación del kernel a Dernel.

En la **antesala ordinaria** solo se admite login de identidades humanas de usuario normal. Una identidad ordinaria puede tener reconocido el atributo de propietario del hardware. El propietario puede solicitar roles ROOT, ADMIN o COMM, incluso autorización persistente hasta revocación, y establecer delegaciones excepcionales a otros usuarios mediante una tabla de roles. Identidad, titularidad, rol y alcance de operación permanecen diferenciados.

En un contexto especializado —**derootty** para ROOT, **deradmintty** para ADMIN y, provisionalmente, **dercommtty** para COMM—, Alfa adquiere el **mismo rol excepcional** solicitado y autorizado para ese contexto. No se limita a aconsejar con permisos ordinarios: puede ejercer competencias efectivas. Aun así, humano y Alfa son sujetos distintos; sus acciones deben ser atribuibles, registradas y revocables según contrato. Compartir rol no convierte a Alfa en soberano sobre el titular ni legitima un veto arbitrario.

Alfa está **activo por defecto cuando se satisfacen los requisitos de hardware y sistema**. Si no hay NPU permanece **caído por defecto**; solo una orden de nivel Dernel/ADMIN permite su invocación excepcional. Una orden ADMIN no transforma por sí misma a Alfa en ADMIN permanente.

El modo ROOT puro de recuperación sigue siendo una ruta excepcional, distinta del login ordinario y no sometida a la jurisdicción de Dernel.

## Base operativa especializada: APU, GPU, NPU y seL4

La arquitectura objetivo en estaciones de trabajo distingue funciones:

| Recurso | Función propuesta |
|---|---|
| CPU de la APU | Linux, ejecución general y coordinación del hardware |
| Gráficos integrados de la APU | Composición y presentación final en pantalla |
| GPU dedicada | Procesamiento paralelo y transformaciones operativas de Alfa |
| NPU | Inferencia neuronal principal de Alfa |
| Dominio basado en seL4 | Aislamiento, capacidades y comunicación de la parte de control de Alfa |

**Alfa emerge de la dinámica del sistema; GPU y NPU no crean por sí solas esa propiedad, sino que proporcionan soporte computacional.** No se exige todavía esta combinación a todo sistema maGNUx: constituye una **configuración objetivo Alfa completa**, a contrastar. Exigir GPU dedicada como condición general de Alfa cambiaría la regla original de activación por NPU y necesitaría una decisión de especificación independiente.

Se propone **preconstituir** el dominio seL4 en RAM reservada antes del arranque ordinario de Linux y que Linux lo descubra por un **contrato de dispositivo lógico**. Esto no convierte al micronúcleo en hardware físico: seL4 necesita ejecutar instrucciones sobre un procesador compatible, mientras la NPU realiza los cálculos neuronales. La reserva de memoria, la titularidad de dispositivos, el control de DMA, el aislamiento y el mecanismo de arranque todavía no están demostrados para una plataforma concreta. Véase [arquitectura de Alfa](../arquitectura/07-dominio-alfa.md).

La indisponibilidad de Alfa no debe impedir la continuidad esencial de Linux; se declara un estado degradado verificable, sin inventar hardware ni autorizaciones.

## Del vórtice a la siguiente versión: el contrato DevOps

El vórtice no solo informa al capitán: también puede producir evidencia para quienes diseñarán la siguiente hélice. Si Alfa identifica insuficiencias de la **versión compilada en producción**, el informe no debe convertirse inmediatamente en una sentencia sobre el código fuente. Debe generar un expediente técnico que los ingenieros puedan reproducir.

~~~text
Versión y contrato declarados
    ↓
despliegue sobre hardware real
    ↓
demanda, respuesta, tensión y continuidad observadas
    ↓
Alfa: evidencias + hipótesis diferenciadas
    ↓
informe local y revisión de privacidad/mandato
    ↓
informe compartido con ingeniería (si está autorizado)
    ↓
triage → reproducciones → cambios → pruebas → nueva compilación
    ↺ continuidad evaluada en el nuevo despliegue
~~~

La **fuente viva** incluye telemetría de CPU, presión de memoria y E/S, frecuencia y temperatura cuando el hardware las exponga, eventos de almacenamiento, estado de NPU/GPU, políticas, dependencias, contratos y demandas observables de sesión. Cada dato debe declarar su procedencia, resolución temporal y grado de confianza. Las inferencias de Alfa llevan etiqueta propia.

Para DevOps/SRE esto genera una conexión practicable con observabilidad, gestión de configuración, regresiones, incidentes, presupuestos de error y versionado reproducible. El informe mínimo debe responder:

- **Qué:** síntoma, subsistema y efectos sobre continuidad/objetivos.
- **Dónde:** HostID, versión exacta de kernel, firmware, módulos, política y configuración de compilación, con datos sensibles protegidos.
- **Cuándo:** línea temporal y estado antes/después de cualquier intervención.
- **Cómo:** carga reproducible, recursos implicados y métricas observadas.
- **Por qué podría ocurrir:** hipótesis de Alfa, hipótesis alternativas y nivel de confianza.
- **Qué acción se propone:** diagnóstico, mitigación, cambio de configuración o mejora de futura versión.
- **Qué autorización existe:** propietario/mandato, retención, redacción y destino de logs.

**Registrar localmente no equivale a publicar en Internet.** Exportar evidencias a GitHub o a ingenieros requiere autorización, minimización de datos, eliminación de secretos y política de conservación. Una supuesta anomalía puede resolverse sin actualización; **demostrar suficiencia de la versión vigente también es un resultado valioso**.

## Criterios para refutar o validar la hipótesis

maGNUx no presenta estas capacidades como software terminado. La siguiente etapa debe poder medir:

1. Si la intervención de Alfa mejora objetivos concretos frente a políticas convencionales con igual carga y hardware.
2. Si el coste energético, de memoria, E/S y CPU de la mediación NPU/GPU supera o no sus beneficios.
3. Si el dominio temprano puede aislarse y ser descubierto por Linux sin comprometer el arranque normal.
4. Si los contratos de sesión y delegación evitan accesos no autorizados de humano o Alfa, incluidos fallos y revocaciones.
5. Si las perturbaciones controladas permiten identificar causas reales y evitan decisiones basadas en correlaciones falsas.
6. Si los informes generados permiten reproducir fallos y orientar mejoras de compilación/versionado.
7. Si el usuario puede distinguir en todo momento **dato medido, estado derivado e inferencia**.

Estas pruebas deberán compararse con un sistema Linux convencional bien configurado. Una tesis que no admita resultados negativos no proporciona una hoja de ingeniería.

## Continuidad editorial

Este artículo **no reemplaza** [la hipótesis central](02-hipotesis-central.md) ni [las siete dimensiones](horizonte-arquetipado.md): desarrolla sus consecuencias al introducir un sujeto computacional emergente que interpreta y eventualmente transforma el avance. La [identidad de Alfa](../identidad/12-usuario-alfa.md) delimita el rol; la [arquitectura](../arquitectura/07-dominio-alfa.md) estudia su soporte; la [especificación técnica](../propuesta-tecnica/04-alfa-observabilidad-spec.md) transforma las afirmaciones en pruebas.

> **Síntesis:** el movimiento helicoidal permite la emergencia de Alfa; el análisis de Alfa informa sobre la suficiencia del avance; la ingeniería utiliza esas evidencias para decidir si la versión vigente debe conservarse, corregirse o evolucionar.

### Referencias técnicas de contexto

- [Linux — cgroup v2](https://docs.kernel.org/admin-guide/cgroup-v2.html): límites y reparto de recursos.
- [Linux — PSI](https://docs.kernel.org/accounting/psi.html): presión sobre CPU, memoria y E/S.
- [Linux — Remote Processor Framework](https://docs.kernel.org/staging/remoteproc.html): infraestructura para ciertos procesadores remotos.
- [Linux — DMA-BUF](https://docs.kernel.org/driver-api/dma-buf.html): intercambio y sincronización de búferes.
- [seL4 — plataformas soportadas](https://docs.sel4.systems/Hardware/) y [configuraciones verificadas](https://docs.sel4.systems/projects/sel4/verified-configurations.html): alcance real de soporte y pruebas.

---

*maGNUx declara; Zalty ensaya. Este texto formaliza una hipótesis para la siguiente fase de investigación, no resultados ya medidos.*
