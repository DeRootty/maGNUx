# 01 — Manifiesto de maGNUx

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> **maGNUx** — arquitectura conceptual para sistemas GNU/Linux con soberanía enraizada.

---

## En pocas palabras

maGNUx nace de una intuición sencilla: Linux funciona extraordinariamente bien y dispone de mecanismos de control, seguridad y auditoría. Pero la existencia de esos mecanismos no constituye por sí sola una teoría común que explique quién gobierna el sistema, desde dónde se legitima el arranque y cómo se distingue la autoridad estructural de la operación cotidiana.

El manifiesto propone una lectura nueva:

```text
Linux no es insuficiente por débil.
Linux es insuficiente porque ha crecido tanto
que necesita una teoría explícita de gobierno interno.
```

maGNUx no niega Linux. Lo toma como suelo real para estudiar cómo un sistema GNU/Linux podría declarar identidad, autoridad, contrato, comunicación y operación desde el arranque temprano. No reclama haber descubierto los mecanismos existentes: propone una gramática para relacionarlos, razonar sobre ellos y comprobar las consecuencias de su articulación.

---

## Por qué GNU/Linux

La referencia a GNU no es ornamental.

GNU aporta:

- cultura de libertad;
- herramientas de userland;
- tradición de composición;
- licencia y responsabilidad comunitaria;
- relación entre software, usuario y soberanía;
- una forma de entender el sistema como cooperación de piezas.

Linux aporta:

- kernel real;
- drivers;
- soporte masivo de hardware;
- distribuciones;
- comunidad;
- madurez técnica;
- compatibilidad;
- capacidad de experimentación.

maGNUx se sitúa entre ambos:

```text
GNU aporta horizonte ético y cultural.
Linux aporta suelo técnico.
maGNUx intenta declarar la arquitectura de soberanía que falta entre ambos.
```

---

## GPL y soberanía enraizada

El proyecto se gobierna bajo una lectura fuerte de la GPL: el sistema no debe ser una caja opaca donde el usuario solo consume una operación, sino un espacio donde la comunidad pueda estudiar, modificar, distribuir y auditar.

La GPL no se entiende solo como licencia de código. En maGNUx funciona como inspiración de soberanía:

```text
si el usuario y la comunidad deben poder estudiar el sistema,
el sistema también debe poder declarar con claridad
qué es,
qué gobierna,
qué permite,
y qué delega.
```

Por eso la soberanía enraizada no es únicamente seguridad. Es también legibilidad, trazabilidad y responsabilidad.

---

## Linux como giro tangencial a Unix

Unix formuló una filosofía poderosa:

- piezas pequeñas;
- composición;
- texto;
- herramientas especializadas;
- separación de responsabilidades;
- claridad funcional.

Linux heredó esa filosofía, pero la llevó a un terreno mucho más complejo:

- hardware masivo;
- arquitecturas heterogéneas;
- drivers innumerables;
- initramfs;
- entornos gráficos completos;
- redes modernas;
- contenedores;
- virtualización;
- seguridad multinivel;
- supervisores complejos;
- integración con servicios permanentes.

El resultado ya no es simplemente “Unix aumentado”. Es un ecosistema de sistemas.

maGNUx interpreta Linux como un giro tangencial a Unix: conserva su potencia comunitaria, pero necesita una gramática nueva para distinguir control, comunicación y operación.

---

## Microsoft como referencia crítica: políticas, continuidad y límites de la integración

La necesidad que maGNUx intenta formular se hace más visible al examinar la experiencia histórica de los sistemas operativos de gran implantación. Microsoft representa un caso especialmente significativo: ha dispuesto de décadas de desarrollo, una posición industrial estratégica y capacidad para definir políticas comunes sobre un ecosistema extraordinariamente amplio. Pese a ello, la continuidad de Windows continúa requiriendo intervenciones correctivas ante incompatibilidades, regresiones y fallos que pueden afectar a la experiencia del usuario.

Con la estrategia *Windows as a Service*, introducida con Windows 10, Microsoft apostó por un mantenimiento continuado mediante actualizaciones de funciones, seguridad y calidad. Esta estrategia no debe confundirse con una teoría formal de sistemas operativos: constituye, ante todo, **un modelo de gobierno del producto articulado mediante políticas, procesos de ingeniería y mecanismos de mantenimiento**. Véanse la [presentación de Windows 10 y su servicio continuado](https://blogs.windows.com/windows-insider/2015/01/21/the-next-generation-of-windows-windows-10/) y la [documentación técnica de actualización](https://learn.microsoft.com/en-us/windows/deployment/update/waas-overview).

La propia documentación pública de Microsoft muestra los límites prácticos de ese gobierno. Las [retenciones preventivas de actualización (*safeguard holds*)](https://learn.microsoft.com/en-us/windows/deployment/update/safeguard-holds) impiden temporalmente que determinados equipos reciban nuevas versiones cuando se detectan problemas graves de compatibilidad. Las [incidencias resueltas de Windows 11, versión 25H2](https://learn.microsoft.com/en-us/windows/release-health/resolved-issues-windows-11-25h2) registran, entre otros casos de 2026, fallos en conexiones remotas, audio o relaciones de confianza con dominios asociados a determinadas actualizaciones. El [centro de comunicaciones de Windows](https://learn.microsoft.com/en-us/windows/release-health/windows-message-center) documenta además actualizaciones extraordinarias (*out-of-band*) para corregir incidencias surgidas después de entregas ordinarias, incluidas las relativas a operaciones de licencia y activación notificadas el 13 de noviembre de 2026.

Estos hechos no hacen de Windows un sistema incapaz de funcionar, ni permiten afirmar que cualquier vulnerabilidad se deba a una misma causa. La reparación y las medidas de contención también son prácticas responsables de ingeniería. Pero **sí evidencian que la continuidad mantenida mediante políticas y correcciones sigue expuesta a interacciones que no siempre quedan resueltas de antemano**.

La discusión no es exclusivamente técnica. La confianza y la experiencia de uso importan. En enero de 2026, una [crónica de *The Verge* sobre la necesidad de recuperar la confianza en Windows](https://www.theverge.com/tech/870045/microsoft-windows-11-issues-rebuilding-trust-notepad) recogió críticas a los fallos de fiabilidad, el rendimiento y las decisiones de producto, así como el reconocimiento por responsables de Microsoft de que debían responder mejor a las preocupaciones de sus usuarios. Eso documenta una controversia pública real; **no autoriza a atribuir la misma percepción a todos los usuarios**.

### El límite que maGNUx observa

Desde la perspectiva crítica de maGNUx, la experiencia de Windows ilustra el riesgo de **confundir un corpus de políticas de mantenimiento con una teoría explícita de constitución y continuidad**. Una política establece qué debe permitirse, restringirse o corregirse. Una teoría debería también explicar *por qué* determinadas relaciones producen esas exigencias, *cómo* interactúan en el conjunto y *qué consecuencias permite anticipar* su transformación.

Cuando una arquitectura necesita añadir nuevas capas de compatibilidad, rutas de recuperación, excepciones, bloqueos preventivos o correcciones extraordinarias, maGNUx propone preguntarse si tales intervenciones atienden únicamente al incidente inmediato o revelan relaciones cuya coherencia general no había sido suficientemente expresada. Desde este punto de vista pueden denominarse, **en sentido metafórico**, *prótesis funcionales*: mecanismos añadidos para sostener una continuidad que el sistema no ha logrado garantizar anticipadamente en todas sus condiciones de uso.

La metáfora no debe convertirse en acusación automática. Una prótesis puede ser necesaria y beneficiosa; una mitigación puede evitar daños importantes. La cuestión investigable es **cuándo una intervención mejora de forma sostenible la coherencia y cuándo el conjunto de excepciones y dependencias incrementa la complejidad, los recursos necesarios o la superficie fragmentaria**.

Esta lectura plantea una hipótesis de maGNUx, no una causalidad histórica ya demostrada: **la acumulación de políticas y soluciones localmente correctas podría dejar sin resolver relaciones constitutivas que solo se vuelven visibles durante las transformaciones del sistema**.

### Dos fundamentos distintos para afrontar un mismo problema

Microsoft gobierna Windows fundamentalmente mediante decisiones de plataforma, ingeniería y políticas del proveedor, aunque usuarios, administradores, desarrolladores y organizaciones también intervengan dentro de los márgenes disponibles. maGNUx propone un fundamento diferente: **partir de las libertades promovidas por GNU y del trabajo plural de las comunidades Linux para construir una teoría abierta a discusión, refutación y mejora colectiva**. La [definición de software libre de GNU](https://www.gnu.org/philosophy/free-sw.en.html) sitúa en primer plano las libertades de ejecutar, estudiar, modificar y compartir el software.

Esas libertades no aseguran por sí solas estabilidad, integridad ni ausencia de fragmentación; GNU/Linux también necesita ingeniería, pruebas, mantenimiento y mecanismos correctivos. Lo que maGNUx propone añadir es una gramática común para **arquetipar** sistemas operativos: construir maquetas según las dimensiones de identidad, autoridad por competencia, contrato, capacidades, estado, evidencia y continuidad; materializarlas sobre hardware concreto; y someterlas a tensiones rigurosas en un banco de pruebas.

```text
Windows como referencia crítica
→ políticas de plataforma y mantenimiento continuo
→ incidencias observables, mitigaciones y costes de compatibilidad
→ pregunta por las relaciones no suficientemente anticipadas

maGNUx como programa de investigación
→ filosofía GNU y cooperación entre comunidades Linux
→ teoría explícita y arquetipos dimensionales
→ pruebas de tensión, fractura y continuidad
→ evidencias contrastables y predicciones revisables
```

maGNUx **no declara demostrado un fracaso universal de Windows**, ni sostiene que Microsoft carezca de conocimientos teóricos o que sus políticas carezcan de utilidad. Su crítica se dirige a **los límites de una estrategia de continuidad cuyo éxito práctico no equivale, por sí mismo, a disponer de una teoría constitutiva explícita, debatible y predictiva**. Del mismo modo, maGNUx todavía debe demostrar que su propia teoría reduce fallos, ambigüedades o sobrecargas frente a alternativas existentes.

Ahí reside el vínculo con el [horizonte tecnológico de los arquetipos](horizonte-arquetipado.md): el banco de pruebas deberá distinguir las transformaciones absorbidas de las que fracturan la maqueta y registrar evidencias suficientes para comparar resultados. El objetivo no es sustituir una política corporativa por un manifiesto sin pruebas, sino investigar **si una teoría abierta permite anticipar mejor las tensiones y mitigar los acontecimientos que hoy obligan a corregir, contener o reconstruir la continuidad del sistema**.

---

## Apple como referencia de integración material: éxito relativo y límites de soberanía

Tras considerar las limitaciones de la continuidad sostenida mediante políticas, surge una referencia distinta: **Apple**, cuya integración estrecha de hardware, sistema operativo y herramientas de desarrollo permite observar una estrategia de transformación tecnológica más concentrada sobre sus propias plataformas.

La [transición anunciada en 2020 de los Mac a Apple Silicon](https://www.apple.com/newsroom/2020/06/apple-announces-mac-transition-to-apple-silicon/) ofrece un ejemplo verificable. Apple diseñó una familia de procesadores y preparó simultáneamente macOS, compiladores, binarios universales, herramientas de desarrollo y mecanismos de compatibilidad para trasladar aplicaciones a esa materialidad. Su [documentación de seguridad](https://support.apple.com/en-euro/guide/security/sec114e4db04/web) describe además una cadena de confianza que comienza en el silicio y continúa durante el arranque, las actualizaciones y la ejecución. Son manifestaciones públicas de una **coordinación deliberada entre decisiones materiales y operativas**.

Desde maGNUx, esta experiencia puede leerse como un **éxito relativo de orquestación sistémica**. Los cambios de procesador, sistema y herramientas no aparecen exclusivamente como decisiones aisladas: forman parte de transiciones planificadas que permiten conservar determinadas capacidades y abrir otras nuevas. La imagen del *paso helicoidal* resulta sugerente para observarlas, pero su uso aquí es **analógico**, no la constatación de que Apple aplique el modelo geométrico de maGNUx o haya medido su radio, su paso o su tensión especulativa.

Este juicio debe conservar sus límites. Apple opera sobre un conjunto de configuraciones que controla más estrechamente, mientras que Windows presta servicio a numerosas arquitecturas y combinaciones de componentes de terceros. No sería riguroso concluir una superioridad integral sin comparar estabilidad, seguridad, soporte, compatibilidad y costes bajo condiciones equivalentes. Tampoco la integración evita la aparición de *prótesis funcionales*: [Rosetta](https://developer.apple.com/documentation/Apple-Silicon/about-the-rosetta-translation-environment) fue un mecanismo transitorio de traducción para preservar aplicaciones Intel durante la migración a Apple Silicon, y Apple anunció el cierre progresivo de su soporte general. Las [correcciones de seguridad de macOS](https://support.apple.com/en-us/149035) confirman, asimismo, que su arquitectura no está libre de fallos ni tensiones.

### Lo observable no autoriza a presumir una teoría idéntica

Apple publica una parte relevante de su ingeniería, incluidas [descripciones de seguridad de plataforma](https://support.apple.com/guide/security/apple-soc-security-sec87716a080/web) y [componentes de código abierto](https://opensource.apple.com/). Al mismo tiempo, conserva decisiones internas y componentes propietarios cuya fundamentación completa no es pública. **La existencia de resultados técnicos coordinados no basta para afirmar que Apple posea una teoría de sistemas operativos equivalente a maGNUx.**

Puede contar con criterios integradores sólidos, con modelos internos especializados o con procedimientos de ingeniería que producen resultados semejantes desde otra lógica. El manifiesto no necesita elegir una explicación que la evidencia disponible no permite distinguir. Apple es una referencia para **estudiar relaciones de integración observables**, no una prueba de coincidencia teórica.

### Coherencia, precio y libertad no son la misma magnitud

La integración vertical también concentra capacidad de decisión sobre el hardware, las interfaces y el ecosistema. El precio comercial de los productos suscita una crítica legítima cuando se pregunta qué parte remunera costes e innovación, qué parte refleja diferenciación y qué margen de elección conserva el comprador.

La [información financiera presentada por Apple para el ejercicio 2026](https://www.sec.gov/Archives/edgar/data/320193/000032019326000026/aapl-20260926.htm) recoge un margen bruto del 39,3 % en productos y del 76,2 % en servicios. Son magnitudes económicas pertinentes, pero **no equivalen al beneficio neto, ni prueban un sobreprecio fraudulento, ni permiten deducir que la empresa oculte una teoría que abarataría necesariamente sus dispositivos**. El conocimiento técnico y la estructura de costes no determinan por sí solos cuál debe ser el precio de mercado.

La tensión entre integración y libertad de elección tampoco es meramente filosófica. En 2025, la [Comisión Europea sancionó restricciones de Apple a la posibilidad de que los desarrolladores informaran de ofertas externas a la App Store](https://digital-strategy.ec.europa.eu/en/news/commission-finds-apple-and-meta-breach-digital-markets-act). Este caso permite examinar condiciones concretas de gobernanza y competencia sin extrapolarlas a una acusación general de engaño.

Desde el fundamento GNU, la pregunta de maGNUx no es si Apple sabe diseñar sistemas coherentes —sus resultados documentados muestran decisiones de integración relevantes—, sino **si esa coherencia puede formularse mediante principios discutibles, verificables y reutilizables sin depender necesariamente del control exclusivo de un fabricante**.

```text
Apple como referencia
→ integración material y software coordinados
→ transiciones con resultados observables
→ límites de compatibilidad, seguridad y libertad de elección

maGNUx como propuesta
→ teoría abierta de constitución y continuidad
→ arquetipos dimensionales materializables en hardware diverso
→ pruebas de tensiones y límites de fractura
→ conocimiento contrastable al servicio de las comunidades
```

Así, Microsoft y Apple no aparecen como polos morales opuestos. Representan **dos estrategias industriales con desafíos distintos** que ayudan a formular una pregunta común: qué condiciones permiten sostener transformaciones complejas, cuáles producen dependencia o fractura y qué parte de ese conocimiento puede hacerse explícita para que otros sistemas lo estudien, reproduzcan o refuten.

La hipótesis de maGNUx permanece abierta: mediante el [arquetipado y los bancos de pruebas](horizonte-arquetipado.md), aspira a expresar tales relaciones antes de que sus tensiones se manifiesten únicamente como incompatibilidades, pérdidas de control o correcciones posteriores.

---

## El vacío disciplinario y la superficie fragmentaria

Un sistema puede resolver correctamente miles de problemas particulares sin disponer de una teoría integradora que permita explicar sus relaciones en conjunto. Permisos, políticas, mecanismos de arranque verificado y auditoría cumplen funciones reales; su existencia, sin embargo, no responde por sí sola a la pregunta de cómo se reconocen mutuamente sus autoridades, sus límites y sus contratos a lo largo del ciclo de vida del sistema.

maGNUx denomina **vacío disciplinario** a esa falta de una gramática sistémica suficientemente explícita para relacionar, examinar y poner a prueba las decisiones de identidad, gobierno, comunicación y operación. No significa que Linux carezca de teorías, normas o ingeniería rigurosa. Señala el problema concreto que maGNUx quiere estudiar: la ausencia de un marco integrador compartido no se resuelve por la sola acumulación de mecanismos eficaces.

Desde esa perspectiva aparece una noción: **superficie fragmentaria**. Es el conjunto de relaciones entre componentes, interfaces, autoridades, políticas, dependencias y transiciones de estado cuya coherencia común no está suficientemente declarada o no puede comprobarse con claridad.

La hipótesis es que el vacío disciplinario **aumenta la superficie fragmentaria**: multiplica las oportunidades de que decisiones localmente válidas diverjan al relacionarse. No produce inevitablemente fragmentación efectiva, ni permite deducir que toda diferencia entre distribuciones sea una deficiencia. La diversidad puede ser legítima, fértil y compatible con la soberanía.

Por eso la superficie fragmentaria **no se mide simplemente contando componentes**. Un sistema extenso, con contratos explícitos y verificables, podría presentar menos relaciones ambiguas que otro pequeño cuyas autoridades se superponen o cuyas dependencias permanecen implícitas.

La teoría debe poder hacer algo más que nombrar el problema:

- **Describir** qué entidad actúa, bajo qué identidad y con qué autoridad.
- **Relacionar** sus contratos, delegaciones y condiciones de continuidad.
- **Predecir** dónde una relación sin coherencia declarada puede admitir divergencias.
- **Comprobar** mediante implementaciones y pruebas si esas divergencias pueden detectarse, rechazarse o reducirse.

No basta con que la explicación resulte coherente en el papel. Sus consecuencias deben poder contrastarse. maGNUx formula el marco; Zalty ensaya una parte de sus hipótesis sobre Linux real. La relación propuesta entre vacío disciplinario, superficie fragmentaria y fragmentación efectiva seguirá abierta a revisión mientras no se definan criterios de observación y pruebas reproducibles.

```text
La diversidad no es la fragmentación.
La coherencia no exige uniformidad.
La soberanía empieza cuando las relaciones
pueden declararse, examinarse y ponerse a prueba.
```

---

## El problema de fondo

Un sistema operativo moderno puede arrancar, ejecutar servicios, gestionar usuarios y actualizar paquetes sin responder explícitamente:

```text
¿quién soy?
¿desde dónde arranco?
¿qué autoridad me legitima?
¿qué parte de mí gobierna?
¿qué parte de mí opera?
¿qué parte de mí comunica?
¿qué parte puede ser delegada?
```

Que esas respuestas se distribuyan entre herramientas y capas no impide funcionar. maGNUx pregunta si, además, forman una declaración común, persistente y verificable. Donde esa coherencia queda implícita, puede ampliarse la superficie fragmentaria.

maGNUx surge para formular esas preguntas de forma arquitectónica.

---

## Control y operación

El primer principio del manifiesto es la separación entre control y operación.

| Control | Operación |
|---|---|
| Autoridad estructural. | Actividad cotidiana. |
| Raíz material y comunicativa. | Administración y uso. |
| Identidad del Host. | Actividad del Guest. |
| Contrato y licencia. | Sesión, servicios y aplicaciones. |

Una forma sintética del corpus inicial era:

```text
hroot + croot + droot = root
sadmin + uadmin + aadmin = admin
```

Esta fórmula expresa que ni `root` ni `admin` deben entenderse como identidades planas.

- `root` es autoridad compuesta.
- `admin` es operación compuesta.

Confundir ambas produce sistemas poderosos, pero conceptualmente peligrosos.

---

## Identidad estructural

maGNUx propone que el sistema necesita una identidad anterior al uso ordinario.

Esa identidad no es solo:

- hostname;
- nombre de distribución;
- usuario;
- UUID;
- versión de kernel;
- `/etc/os-release`.

Es una estructura que relaciona:

```text
Host
→ máquina constituida

Kernel
→ base material de ejecución

Distribución
→ interpretación comunitaria y política

Dernel
→ licencia operativa

Guest
→ actividad delegada
```

El sistema no debería empezar a existir solo cuando el usuario inicia sesión. Debe empezar a declararse desde el arranque.

---

## Droides, no drones

El manifiesto usa la distinción entre dron y droide para explicar el horizonte del proyecto.

Un dron puede operar con autonomía instrumental.

Un droide, en cambio, implica relación con una supervisión orgánica, una misión, un contexto y una identidad funcional dentro de un sistema mayor.

maGNUx no busca un sistema que simplemente automatice más. Busca un sistema que pueda integrar automatización avanzada o IA sistémica sin perder:

- supervisión humana;
- trazabilidad;
- contrato;
- identidad;
- límites;
- legitimidad operativa.

R2D2 como asistente de navegación es una metáfora útil: no es una herramienta tonta, pero tampoco una soberanía sin control.

---

## IA sistémica como tensión futura

maGNUx no afirma que actualmente exista una IA sistémica integrada a bajo nivel en un sistema operativo generalista.

La tesis es más prudente:

```text
si algún día se integra IA a bajo nivel,
el sistema necesitará una teoría explícita de identidad,
gobierno,
contrato,
comunicación
y operación.
```

Sin esa teoría, la IA sería una capa añadida sobre una arquitectura que no sabe declararse a sí misma.

Por eso maGNUx empieza antes de la IA: empieza por la soberanía del sistema.

---

## Dos rutas de autoridad temprana

El manifiesto reconoce dos rutas conceptuales:

| Ruta | Función | Estado en maGNUx |
|---|---|---|
| initramfs | Ensayar autoridad temprana sobre Linux real. | Ruta práctica inicial. |
| seL4 / microkernel verificado | Pensar autoridad fuerte, aislamiento y garantías formales. | Hipótesis de madurez. |

La ruta inmediata es initramfs, porque permite experimentar sin abandonar Linux.

seL4 queda como horizonte arquitectónico: no como sustitución inmediata, sino como recordatorio de que la autoridad temprana puede formularse con garantías más estrictas.

---

## KDE Plasma y KSIA Plasma

El manifiesto conserva la intuición sobre KDE Plasma como posible campo futuro de experimentación.

La idea no es convertir el escritorio en fundamento del sistema. Al contrario:

```text
el escritorio debe recibir identidad,
no inventarla.
```

Un eventual KSIA Plasma tendría sentido solo si las capas inferiores ya declaran:

- Host;
- Guest;
- Dernel;
- Trilobytes;
- licencia operativa;
- identidad de sesión;
- límites de actividad orgánica.

La interfaz gráfica sería una expresión de esa arquitectura, no su origen.

---

## Representación computacional: Trilobytes

La separación entre soberanía estructural y operación cotidiana abre una nueva pregunta:

~~~text
¿la máquina entrega al usuario los servicios previstos por el proveedor,
o puede actuar legítimamente para buscar servicios en su nombre?
~~~

La ampliación de **Trilobytes** propone ambos modelos mediante un agente de representación computacional. En uno coordina la **oferta** hacia el usuario; en el otro representa su **demanda** y procura servicios dentro del contrato autorizado.

Se preservan los tres ámbitos de maGNUx: **ROOT / Kernel**, **COMM / xGNUpeD** y **ADMIN / Dernel**. Trilobytes se relaciona transversalmente con los tres, como una *escalera de incendios* de un edificio de tres plantas, sin constituir una cuarta soberanía.

La intermediación activa necesita **tres delegaciones positivas independientes** —ROOT, COMM y ADMIN—, más un mandato que determine a quién representa. Esta autorización conjunta **no somete ROOT a Dernel** ni transfiere irrestrictamente privilegios al agente.

Se conserva la función previa de Trilobytes como verificador de coherencia de identidad, licencia y sesión. La intermediación es su ampliación funcional, todavía **hipótesis arquitectónica**: [Trilobytes](../identidad/08-trilobytes.md) y [especificación técnica propuesta](../propuesta-tecnica/03-trilobytes-mediacion-spec.md).

---

## Qué pretende madurar maGNUx

maGNUx pretende madurar seis áreas:

| Área | Pregunta |
|---|---|
| Identidad | ¿Quién es el sistema? |
| Gobierno | ¿Quién puede declarar autoridad? |
| Comunicación | ¿Cómo se coordinan las capas? |
| Operación | ¿Qué se permite hacer al Guest? |
| Compatibilidad | ¿Cómo se conserva Linux/POSIX sin quedar limitado por ellos? |
| Coherencia sistémica | ¿Cómo se identifica y contrasta la superficie fragmentaria sin confundir diversidad con fragmentación? |

Estas áreas se despliegan después en:

```text
Manifiesto
→ Arquitectura
→ Identidad
→ Filosofía
→ Zalty como laboratorio
```

El [horizonte de arquetipado](horizonte-arquetipado.md) desarrolla el paso entre teoría y arquitectura: las siete dimensiones permiten construir una maqueta antes de proyectarla sobre hardware concreto. Se lee después de la [hipótesis central](02-hipotesis-central.md), sin sustituir la organización del corpus.

---

## Qué no pretende maGNUx

maGNUx no pretende:

- negar Linux;
- reemplazar inmediatamente el kernel;
- inventar un sistema operativo completo desde cero;
- prometer invulnerabilidad;
- reducir todo a IA;
- convertir systemd en enemigo;
- sustituir la comunidad por una arquitectura cerrada.

maGNUx pretende formular una necesidad: la de un GNU/Linux capaz de declararse a sí mismo de forma más explícita.

---

## Conclusión

maGNUx puede parecer filosóficamente interesante, arquitectónicamente provocador y técnicamente incompleto.

Esa incompletitud no es un fallo accidental. Es el estado natural de una arquitectura que está intentando nombrar un problema antes de cerrarlo prematuramente. Su maduración exige que la teoría no solo describa el sistema, sino que permita deducir consecuencias y someterlas a comprobación, sin presentar como resultados demostrados lo que todavía son hipótesis.

```text
maGNUx no es una negación de Linux.
maGNUx es una tentativa de llevar Linux hasta el punto
en que empiece a mostrar con claridad
qué teoría estructural necesita para el futuro.
```

**maGNUx es el nombre provisional de esa necesidad cuando empieza a volverse consciente de sí misma.**

---

*← [Índice](../README.md) | Siguiente: [Hipótesis central →](02-hipotesis-central.md)*


---

## Ampliación constitutiva: Commonwealth del silicio

Esta formulación del manifiesto debe leerse junto con el [Volumen I — De la Britania romana a la Commonwealth](volumen-i-britania-roma-commonwealth.md) y el [Volumen II — La Commonwealth del silicio](volumen-ii-commonwealth-del-silicio.md).

El capítulo 23 del Volumen II afina la secuencia de constitución **kernel/ROOT → xGNUpeD/COMM → Dernel/ADMIN** y distingue los arranques excepcionales de mantenimiento del arranque ordinario que activa **Trilobytes** bajo la concurrencia de tres delegaciones positivas. En régimen cotidiano, Dernel habilita una identidad operativa de usuario **no ADMIN** y Trilobytes media la coordinación entre Dernel y kernel: el usuario decide la actividad; las autoridades mantienen límites y continuidad verificables.

La analogía de conquista del silicio, fundamentos militarizados y Commonwealth es conceptual: no constituye reivindicación de poder político ni afirmación de viabilidad ya demostrada.
