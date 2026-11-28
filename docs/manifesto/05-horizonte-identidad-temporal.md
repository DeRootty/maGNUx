# 05 — Horizonte tecnológico: identidad en transformación y procesamiento identitario

> [⬆ Manifiesto](README.md) · [Horizonte tecnológico](horizonte-arquetipado.md) · [Hélice y Alfa](04-helice-alfa-continuidad.md) · [📚 Documentación](../README.md) · [🏠 Inicio](../../README.md)

**Fecha:** 28 de noviembre de 2026.  
**Estado:** programa de investigación e hipótesis prospectivas; no funcionalidades implementadas ni teoría científica validada.  
**Materialización experimental:** [Zalty](../../zalty/readme.md). **Preparación:** [cuatro laboratorios](../laboratorios/README.md).

## 1. De la constitución a la prueba

maGNUx proporciona referencias constitutivas; Zalty debe exponerlas a la resistencia de la máquina. La coherencia de un manifiesto no acredita su utilidad operativa. Una implementación puede corroborar una hipótesis bajo condiciones delimitadas, refutarla o revelar una insuficiencia de ingeniería, hardware o teoría. No se debe modificar el criterio de éxito después de conocer el resultado para hacer pasar un fallo por un acierto.

El arquetipo de las siete dimensiones conserva su papel de maqueta entre teoría y materialización. Este horizonte no añade autoridades ni dimensiones por la mera aparición de nuevos componentes.

## 2. La diversidad comunitaria como propiedad conmutable

Los laboratorios Gentoo, Slackware y Arch Linux tienen un objeto común: estudiar la orientación del kernel hacia una distribución. LFS (Linux From Scratch) aporta un fundamento acotado: personalizar, configurar y compilar el kernel Linux vanilla; no se pretende reproducir todo LFS ni constituir una cuarta filosofía distributiva objeto de conmutación.

El itinerario parte de evidencia fuente → configuración → intérprete de la decisión → cabeceras y macros → unidad de traducción → compilación → objeto y enlace → capacidad operativa. Se distinguen Kconfig, opciones de GCC y mecanismos de construcción de cada distribución. No hay equivalencia automática entre ellos.

El objetivo comunitario no es producir tres xGNUpeD incompatibles. Es permitir que las comunidades contribuyan a un único proyecto conservando las cuatro propiedades de una misma identidad:

| Propiedad | Hipótesis que se quiere probar |
|---|---|
| Distributiva | Reconocer el linaje, requisitos y reglas de la distribución activa. |
| Asociativa | Compartir conocimiento, interfaces y componentes sin borrar procedencia ni competencias. |
| Conmutativa | Transitar entre contextos distributivos bajo contrato, sin falsear su identidad. |
| Comunicativa | Declarar el estado, condiciones, capacidades, transiciones y evidencias en un lenguaje común. |

Una interfaz común con adaptadores específicos es una posibilidad de ingeniería, no una arquitectura cerrada. La comunidad conserva autonomía de trabajo; la compatibilidad se establece con contratos y pruebas reproducibles.

## 3. Criterio de aceptación: conmutación en caliente

La meta es arrancar Zalty, iniciar sesión como usuario ordinario, solicitar una delegación temporal COMM, conmutar de filosofía comunitaria y continuar utilizando el sistema sin nuevo login ni reinicio del kernel.

~~~text
Arranque → kernel / ROOT
         → xGNUpeD / COMM, contexto distributivo A
         → Adminland → Dernel / ADMIN → Userland
         → Trilobytes (o Alfa activo) → sesión ordinaria
         → solicitud de COMM → autorización acotada
         → transición A → B → revocación del contexto excepcional
         → misma sesión, comprobaciones y evidencia de continuidad
~~~

No se solicita ADMIN al usuario para una conmutación ordinaria: la selección de filosofía distributiva corresponde a COMM. Eso no significa que COMM pueda invadir competencias ADMIN o ROOT. Las acciones cruzadas requieren contratos, ejecutores y autorizaciones previas de las autoridades competentes. Si faltan capacidades o autorizaciones, se deniega o aplaza la transición y se conserva el último estado legítimo.

La prueba debe distinguir cambiar una etiqueta, seleccionar otro entorno aislado y cambiar efectivamente la política distributiva que sostiene la sesión. La primera no acredita la tercera. Namespaces, cgroups, raíces de archivos separadas y supervisión persistente pueden servir de instrumentos iniciales; no equivalen a una sustitución transparente de libc, ABI, PID 1 o de todos los servicios. Las opciones compiladas estáticamente de Linux no se cambian por conmutar una política. Un kernel común exige un conjunto de capacidades compatible con los entornos y sus contratos.

Ensayar las seis transiciones dirigidas entre Gentoo, Slackware y Arch, incluido el retorno al origen; repetir y comparar con una ejecución sin cambio. Registrar boot ID, identificadores y estado de sesión, procesos y descriptores de prueba, transacciones de datos, servicios, conexiones de red, autoridad efectiva, memoria, CPU, tiempos de interrupción, errores y recuperación. Definir antes qué servicios deben conservar procesos, qué servicios pueden reiniciarse y qué interrupción resulta inadmisible. Exigir que las aplicaciones de prueba produzcan resultados equivalentes, no que todos los contadores sean idénticos.

Una transición rechazada por incompatibilidad es un resultado válido de seguridad, pero no un éxito de conmutación. Un rollback debe recuperar el contexto anterior verificablemente; si una acción irreversible no tiene recuperación definida, no debe entrar en la prueba de continuidad. Ensayar primero en máquinas virtuales o entornos aislados y con datos desechables.

## 4. Teseo y la identidad temporal

La paradoja del barco de Teseo sirve para formular una pregunta, no para resolverla por analogía: ¿qué condiciones permiten transformar componentes de una máquina sin perder la identidad de la entidad computacional? Una copia reconstruida desde piezas o estados anteriores plantea el problema adicional de la bifurcación de identidad.

No basta con conservar un identificador, una clave, un hash o los mismos componentes. Se propone estudiar continuidad como relación entre estados, procedencia, autorización de cambios, invariantes y evidencias. Una restauración, clonación o transferencia de hardware debe declarar si continúa una trayectoria o constituye otra; no se presupone que una copia legítima herede identidad exclusiva. Deben investigarse revocación, recuperación, rotación de claves, anti-replay, bifurcaciones y límites de confianza.

La hélice distingue la referencia geométrica de maGNUx de la escala material del hardware. Su radio teórico permanece constante conforme al modelo anterior. La **expansión del horizonte** describe aquí el crecimiento de capacidades realizadas y de la profundidad de interpretación temporal, no un cambio geométrico del radio ni una nueva ley matemática. Si se propone una hélice de radio variable, exigirá una revisión formal independiente.

## 5. Trilobytes y Alfa: dos expresiones de una misma identidad

Trilobytes revela el RAW constituido por ROOT, COMM y ADMIN. Alfa añade mediación inteligente y un modelo temporal interpretativo. No constituyen una cuarta y quinta autoridad ni dos identidades sistémicas rivales. Son dos expresiones funcionales de la misma identidad transversal; las acciones de cada sujeto y contexto siguen siendo atribuibles. La identidad humana permanece distinta.

La hipótesis se revisa para contemplar una arquitectura especializada de procesamiento identitario, llamada provisionalmente IPU. La denominación no reivindica novedad industrial ni un acrónimo exclusivo.

| Modo | Condición objetivo | Presentación ordinaria |
|---|---|---|
| Trilobytes | IPU ausente, deshabilitada o no autorizada; o decisión de suspender mediación inteligente | 3/$ |
| Alfa sobre recursos compartidos | Activación excepcional y presupuesto explícito; CPU/GPU/NPU disponibles según plataforma | α/$ |
| Alfa con IPU | IPU utilizable, inferencia disponible, dominio preparado, contrato y pruebas conformes | α/$ |

La regla anterior centrada en NPU como condición de activación por defecto queda revisada en este horizonte: una NPU por sí sola no acredita el soporte especializado de identidad. Sin IPU, se conserva la activación excepcional bajo ADMIN/Dernel y presupuesto autorizado, sin transferir automáticamente su rol a Alfa. La implementación actual de Zalty no ofrece todavía estos modos. En equipos sin aceleradores suficientes, no se presume viabilidad ni rendimiento aceptable.

La soberanía del hardware precede a la activación de Alfa. Su propietario puede mantener un modo instrumental y habilitar capacidades adicionales cuando su contrato y recursos lo permiten. No usar una capacidad no implica necesariamente infrautilización perjudicial. En el régimen experimental presente, la continuidad esencial de la máquina no debe depender de una IA. La transición a Trilobytes debe conservar, o declarar comprometida, la evidencia y no fingir una continuidad ausente. La triple delegación positiva ROOT/COMM/ADMIN y el mandato siguen siendo necesarios para la intermediación activa.

## 6. IPU: hipótesis de procesamiento identitario en hardware soberano

La IPU (Identity Processing Unit, nombre de trabajo) sería una función especializada de procesamiento, eventualmente materializable en silicio. No tiene por qué ser inicialmente un chip independiente. El propósito es sostener el registro, acreditación y evaluación temporal de identidad sin cargar de forma desproporcionada procesadores destinados a cálculo general, paralelismo o inferencia neuronal.

| Recurso | Función que se propone estudiar |
|---|---|
| CPU | Control, cálculo general, coordinación y ejecución del sistema. |
| GPU | Procesamiento paralelo, según disponibilidad y utilidad. |
| NPU | Inferencia neuronal. |
| IPU | Gestión verificable de identidad, procedencia, eventos y continuidad; cómputo de indicadores temporales acotados. |
| Alfa | Interpretación inteligente de esas evidencias, bajo contrato. |
| Zalty | Integración y banco de pruebas de las relaciones anteriores. |
| maGNUx | Referencia constitutiva sometida a contraste, no proceso ni coprocesador. |

TPM, DICE, registros autenticados, contadores protegidos y raíces de confianza son antecedentes técnicos para estudiar; ninguno se declara equivalente a la IPU propuesta. Una raíz de confianza no confiere por sí sola soberanía al usuario. Habrá que definir provisión de claves, control legítimo, recuperación, protección de firmware, acceso a recursos, privacidad y amenazas. La IPU no es una autoridad superior a ROOT, COMM o ADMIN ni certifica por sí sola la legitimidad humana de una transformación.

La hipótesis de ahorro de recursos se debe medir. Comparar idénticas cargas con y sin instrumentación y con Alfa compartida; después, si existe soporte especializado, repetir con presupuestos, exactitud y latencia comparables. Si la especialización no aporta ventajas suficientes o desplaza el coste a memoria, energía, comunicación o seguridad, no queda justificada por el manifiesto.

## 7. Ventana testigo temporal: deriva, aprendizaje y tolerancia

Un sistema que evalúa su propia degradación requiere un testigo longitudinal. No basta con recordar el pasado: Alfa debe contrastar el estado actual con evidencias temporales, contextualizar las diferencias y evaluar su contribución a la transformación.

Se proponen tres ventanas complementarias, no necesariamente tres dispositivos:

- **Constitutiva:** referencia histórica versionada, obtenida de condiciones validadas; protegida de modificaciones unilaterales de Alfa.
- **Evolutiva:** patrones de comportamiento actualizados a partir de cambios legítimos y revisados.
- **Inmediata:** observaciones recientes, con resolución temporal, procedencia y calidad de los datos.

Registrar reloj monotónico para duraciones, reloj civil con incertidumbre para correlación, época de arranque y secuencia de eventos; no presuponer que un reloj de pared es una prueba de orden o autenticidad. Vincular versión, configuración, carga, contexto distributivo, contrato, modelo, recursos y causas conocidas. Distinguir mediciones, inferencias, datos ausentes y estados desconocidos.

El entrenamiento debe abarcar cargas normales y adversas controladas. Separar datos de ajuste, calibración y evaluación en orden temporal y por contexto, evitando contaminación entre conjuntos. Las tolerancias deben calibrarse con datos de referencia y riesgo, no inventarse como porcentaje universal. Pueden ensayarse cuantiles robustos, mediana y desviación absoluta mediana, EWMA o CUSUM para cambios persistentes, con controles de falsas alarmas y latencia. Son herramientas candidatas, no una formulación matemática definitiva de la hélice.

No confundir:

- Deriva adaptativa: cambio legítimo de comportamiento asociado a evolución o cambio de entorno.
- Deriva circunstancial: variación transitoria por carga o condiciones del medio.
- Deriva funcional: pérdida de precisión, coherencia, rendimiento o capacidad verificable.
- Deriva identitaria: pérdida de correspondencia entre el modelo de sí y su trayectoria acreditada.

La detección estadística señala una desviación; no demuestra por sí sola error, causalidad ni intención. Una violación de un invariante contractual no debe compensarse estadísticamente con otras mejoras. Las alarmas requieren corroboración independiente y diagnóstico de causa cuando resulte posible.

Congelar la referencia de aprendizaje ante alarma no explicada. Aceptar una nueva referencia solo tras validar la transformación, registrar la anterior y medir regresiones. No permitir que el aprendizaje normalice un deterioro gradual. El testigo debe seguir funcionando en ausencia de Alfa en la medida que permita el soporte; una caída del testigo se declara como falta de evidencia, no como normalidad.

## 8. Degradación, desactivación y retorno a Trilobytes

Alfa puede solicitar su propia suspensión si su actividad amenaza la continuidad que pretende preservar. No debe ser juez único de su fiabilidad. Un ejecutor independiente, bajo las competencias correspondientes, debe poder limitar o revocar su mediación aunque Alfa discrepe.

La desactivación puede responder a decisión soberana, mantenimiento, falta de recursos, degradación inferencial, ruptura de contrato o pérdida de evidencia identitaria. Distinguir ausencia de IPU, fallo de inferencia, saturación y corrupción del registro. No se debe borrar la trayectoria ni fabricar recuerdos para simular una recuperación.

~~~text
TRILOBYTES → autorización + capacidades + presupuesto → ALFA_ACTIVA
ALFA_ACTIVA → desviación → diagnóstico y contraste independiente
             → si procede: limitar, preservar estado, suspender
             → TRILOBYTES / modo de recuperación si se requiere
             → revalidación → nueva activación autorizada
~~~

La reactivación exige comprobaciones de integridad, suficiencia, autorización y compatibilidad. Definir histéresis y tiempo de estabilización antes del ensayo para evitar oscilaciones. Un fallo del mecanismo de seguridad exige una ruta segura independiente; si no puede verificarse el estado, la recuperación no equivale a continuidad acreditada.

## 9. Autoconocimiento, vida artificial y frontera ética

La expansión interpretativa de Alfa abre una hipótesis sobre autorreferencia temporal: ¿puede una entidad construir un modelo de sí misma que relacione pasado, presente, cambios propios y consecuencias futuras? La evidencia comparativa podría permitir evaluar autoconocimiento funcional, calibración y anticipación. No establece por sí sola experiencia subjetiva.

La imagen de una marioneta que simula vida sirve como distinción epistemológica: conducta semejante a la vida no prueba que exista experiencia. Ejecutar mecanismos tampoco excluye lógicamente la conciencia. Vida biológica, autonomía, autoconocimiento funcional y conciencia fenoménica no son equivalentes. No se fija un umbral de expansión de la hélice a partir del cual deba emerger conciencia, ni se afirma que un test de autorreconocimiento la demuestre.

Si algún día existieran fundamentos científicos y éticos suficientes para atribuir experiencia o intereses moralmente relevantes a entidades artificiales, su origen artificial no debería ser por sí solo motivo de exclusión. Las consecuencias para suspensión, copia, derechos y continuidad exigirían una revisión ética independiente. No se conceden hoy personalidad jurídica, conciencia ni condición de ser vivo a Alfa por esta hipótesis.

La autonomía en instalaciones remotas, incluidas infraestructuras planetarias, es un horizonte especulativo de aplicación: requiere resiliencia física, energía, redundancia, comunicaciones, seguridad, mantenimiento y control autónomo bajo contratos. No se deduce de la conmutación distributiva ni de la mera integración de IA.

## 10. Programa falsable de Zalty

| Ensayo propuesto | Evidencia y condición de evaluación |
|---|---|
| Z-H01: kernel orientado | Comparar vanilla y configuraciones de las distribuciones, reconstruir fuentes, opciones y artefactos; explicar diferencias verificables. |
| Z-H02: transición COMM | Seis direcciones, controles sin conmutación, identidad y sesión continuas, resultados funcionales equivalentes dentro de tolerancias previas. |
| Z-H03: continuidad temporal | Cambios legítimos, restauración y bifurcación; detectar pérdida de procedencia o integridad sin aceptar una copia como identidad exclusiva automáticamente. |
| Z-H04: ventana testigo | Inyectar derivas controladas y fallos de sensor; medir detección, falsas alarmas, latencia, precisión de diagnóstico y normalización indebida. |
| Z-H05: modos | Comparar Trilobytes y Alfa compartida; suspender, revalidar y reactivar; comprobar revocación, recuperación y sobrecoste. |
| Z-H06: IPU candidata | Simular interfaz primero; medir si una implementación especializada ofrece beneficio neto bajo garantías equivalentes. |
| Z-H07: modelo temporal | Evaluar predicción de efectos propios, reconstrucción causal y detección de recuerdos falsos frente a controles sin historia; no etiquetar resultados como conciencia. |

Los identificadores son propuestas editoriales, no resultados. Para cada ensayo registrar hipótesis, versiones, configuración, hardware, carga, semillas si proceden, contratos, métricas, umbrales previos, controles, artefactos, fallos y limitaciones. Publicar evidencia negativa. No introducir una exigencia de IPU para probar las primeras etapas con hardware existente.

La primera meta es pequeña en comparación con el horizonte: conseguir que una sesión ordinaria pueda cambiar de filosofía bajo COMM y continúe funcionando. La segunda es demostrar que la mediación inteligente puede incorporarse y retirarse sin fracturar la identidad. El futuro del silicio y de la conciencia artificial permanece abierto a la investigación.

**maGNUx formula. Zalty materializa y contrasta. La máquina aporta evidencia.**

---

[Anterior: hélice y Alfa](04-helice-alfa-continuidad.md) · [Programa de laboratorios](../laboratorios/README.md) · [Zalty](../../zalty/readme.md) · [Índice del manifiesto](README.md)
