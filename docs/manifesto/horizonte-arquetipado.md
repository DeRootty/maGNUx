# Horizonte tecnológico — Arquetipar sistemas operativos

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> **Estado:** desarrollo conceptual del manifiesto. Las relaciones geométricas y los criterios experimentales que se describen son hipótesis de trabajo, no propiedades ya demostradas en Zalty.

---

## De la teoría al arquetipo

maGNUx parte de una dificultad conocida: un sistema operativo puede funcionar correctamente sin que el conjunto de sus mecanismos responda a una misma declaración de identidad, autoridad, contrato y continuidad. La acumulación de soluciones eficaces no constituye por sí sola una teoría integradora. Donde sus relaciones permanecen implícitas, puede ampliarse la **superficie fragmentaria**.

La respuesta de maGNUx no es imponer un sistema operativo único. Es proponer una teoría desde la que puedan **concebirse, comparar y contrastar** diferentes sistemas operativos. Esa teoría debe permitir construir algo más concreto que un conjunto de intenciones: un **arquetipo**.

En este corpus, **el arquetipo es la maqueta del sistema operativo construida conforme a las referencias dimensionales de maGNUx**. No es la teoría misma ni la máquina que termina ejecutándolo. Articula las relaciones que habrán de reconocerse en una materialización concreta.

```text
maGNUx
→ teoría y referencias constitutivas

arquetipo
→ maqueta articulada conforme a esas referencias

hardware y software
→ condiciones de materialización

Zalty
→ laboratorio donde se ensayan algunas consecuencias
```

No hay que saltar de la teoría al silicio sin pasar por la maqueta: primero se declara qué relaciones deben existir y qué significan; después se determina cómo podrían realizarse, observarse y comprobarse.

---

## Las siete dimensiones se siguen unas de otras

La maqueta no surge de colocar siete etiquetas sobre un diagrama. Cada dimensión abre una necesidad que conduce a la siguiente.

### 1. Identidad: el encuentro con la materialidad

Antes de materializarse, una arquitectura es una posibilidad definida. La identidad operativa del sistema solo puede resolverse cuando esa posibilidad aterriza sobre una arquitectura de procesamiento y un hardware concretos.

El silicio fija las condiciones materiales de ejecución: conjunto de instrucciones, organización de procesadores, memoria, dispositivos y mecanismos efectivos de control. Una familia de procesadores no identifica por sí sola un Host individual; la constitución exige reconocer también la máquina y el contexto en que arranca.

Por eso [xGNUpeD](../identidad/07-xgnuped.md) no inventa una identidad desde una etiqueta. Propone declarar, durante el arranque temprano, la relación entre Host, kernel, distribución, política y contexto real.

La identidad constituida plantea inmediatamente la pregunta siguiente: **¿quién tiene competencia legítima para intervenir sobre ella?**

### 2. Autoridad: competencia y protección de la identidad

La referencia soberana del proyecto es **la persona que legítimamente usufructúa el hardware**. Los mecanismos internos se justifican por el servicio que prestan a esa relación, no por la apariencia de un rango.

La autoridad técnica no equivale automáticamente a autoridad legítima. Disponer de medios para ejecutar una acción no demuestra que a una entidad le corresponda decidirla. En maGNUx, la autoridad se reconoce **por competencia, ámbito y responsabilidad**; no por un nombre, una jerarquía aparente o la posesión aislada de privilegios.

La seguridad cumple aquí una función semejante a la de los amortiguadores o airbags de un vehículo: no sustituye a quien lo utiliza ni decide su destino, sino que trata de limitar las consecuencias de situaciones capaces de comprometer su integridad. La protección no garantiza invulnerabilidad, pero intenta preservar la identidad constituida frente a impactos evitables.

Esta lectura es compatible con los tres ámbitos [ROOT, COMM y ADMIN](../arquitectura/03-estratos.md): sus competencias son distinguibles. Ninguno obtiene automáticamente las atribuciones de los otros. La [triple delegación positiva de Trilobytes](../propuesta-tecnica/03-trilobytes-mediacion-spec.md) es una consecuencia concreta de esa independencia.

Pero reconocer competencias obliga a formular qué las delimita, concede y condiciona. De ahí nace el contrato.

### 3. Contrato: coherencia general y acuerdos por ámbitos

maGNUx no presupone un único contrato plano. Parte de un **corpus general de principios** que proporciona coherencia y admite contratos distintos para cada ámbito, entidad, operación o relación.

El contrato expresa qué se reconoce, qué se permite, qué se delega, en qué condiciones y qué ocurre si tales condiciones dejan de cumplirse. Su función no es borrar las diferencias entre capas, sino hacerlas compatibles sin que una autoridad pueda aparentar competencias ajenas.

Una operación puede ser técnicamente posible y, sin embargo, quedar fuera del contrato que habilita a realizarla. La separación entre capacidad y legitimidad debe permanecer visible.

Así surge la pregunta siguiente: **¿qué puede hacer realmente el sistema sobre el que esos contratos pretenden actuar?**

### 4. Capacidades: lo posible dentro del hardware vivo

Virtualmente entendido, el sistema puede organizar cuanto sea realizable dentro de las posibilidades de su **hardware vivo**, sin que ello signifique poseer facultades físicas ilimitadas.

Hardware vivo no equivale a hardware simplemente instalado, detectado o encendido. Es el hardware **integrado y capaz de responder a la dinámica de administración del sistema**: recibir trabajo, producir estados y permanecer disponible. Un procesador o núcleo que se encuentra en reposo operativo (*idle*) puede continuar vivo; su disponibilidad no exige actividad permanente.

Las capacidades efectivas dependen también del kernel, los controladores, la configuración y las interfaces disponibles. Las opciones `CONFIG_*` y las pruebas de ejecución permiten estudiar la distancia entre la capacidad potencial del silicio y la capacidad realmente expuesta al sistema.

Saber lo que el sistema puede hacer no basta. Importa conocer **en qué condición se encuentra su identidad** mientras actúa.

### 5. Estado: integridad y transformaciones de la identidad

El estado no se agota en un listado de procesos, servicios o recursos ocupados. Expresa asimismo la condición que atraviesa la identidad del sistema.

Puede encontrarse íntegra o comprometida; puede estar inmersa en una **desfragmentación sistémica**, entendida como reorganización de relaciones para recuperar coherencia; o puede experimentar un **giro tangencial de su filosofía de servicio contractual**.

Estas condiciones no tienen por qué excluirse entre sí. Una identidad puede conservar su integridad durante una reorganización legítima. Una transformación contractual puede modificar el servicio sin representar por sí sola una intrusión. Aquí «desfragmentación» no se reduce a la reorganización física de archivos: se refiere a las relaciones constitutivas del sistema.

Para diferenciar una declaración de estado de una mera afirmación, necesitamos evidencia.

### 6. Evidencia: del requisito declarado al banco de pruebas

La maqueta debe expresar requisitos de calidad y conformidad susceptibles de comprobación. La demostración de que una implementación satisface sus requisitos básicos se busca en **bancos de pruebas**, con ensayos sintéticos, escenarios controlados, resultados registrables y repetibilidad.

Una prueba acredita lo que ha sido probado, bajo las condiciones en que se probó. No demuestra perfección universal. Por eso las pruebas de integración, regresión y condiciones adversas complementan los ensayos sintéticos cuando el requisito lo exige.

En la operación cotidiana se contrasta la continuidad de esas condiciones. Las desviaciones pueden exigir diagnóstico de fiabilidad, compatibilidad o mantenimiento; **cuando amenazan la integridad, la autoridad, el contrato o la confianza, entran en el ámbito de la ciberseguridad**. La seguridad actúa entonces como protección de una identidad cuya conformidad de referencia había sido previamente examinada.

Hasta aquí hemos descrito lo que se constituye, quién puede intervenir, bajo qué contrato, con qué capacidades, en qué estado y con qué pruebas. Falta explicar algo decisivo: **cómo transcurre esa constitución en el tiempo**.

### 7. Continuidad: los sistemas convolucionan

La continuidad no queda descrita suficientemente por una relación lineal de versiones o por una simple sucesión de cambios. Desde la observación propuesta por maGNUx, **los sistemas no evolucionan: convolucionan**.

Esta afirmación nombra una perspectiva propia del proyecto. No niega que existan cambios, mejoras o degradaciones históricas; propone observar su materialización mediante una **trayectoria temporal de paso helicoidal**.

Una circunferencia puede cerrar su perímetro al proyectarse sobre un plano. La hélice, en cambio, al completar una vuelta, vuelve a una posición angular equivalente **un lapso de tiempo después**: ya no ocupa el mismo punto del recorrido. La continuidad no se reduce a regresar a una versión ni a repetir una configuración. Lo ocurrido permanece situado en otro momento de la trayectoria.

En este modelo, **el radio es constante y queda fijado por maGNUx como referencia teórica**. No lo redefine cada máquina ni cada actualización. **La escala en que se interpretan sus unidades depende del tipo de silicio y del hardware** sobre el que se proyecta el arquetipo. Esto permite conservar una referencia teórica común sin exigir identidad material entre sistemas diferentes.

```text
teoría maGNUx        → fija la referencia y su radio
arquetipo            → organiza las siete dimensiones en una maqueta
hardware concreto    → determina la escala material de interpretación
continuidad          → trayectoria helicoidal, abierta en el tiempo
```

La circunferencia **se cierra en la proyección**, pero **la trayectoria no se cierra en el mismo plano temporal**. El paso de la hélice todavía no ha sido definido como una magnitud fija: será necesario determinar su significado antes de pretender medirlo.

La palabra «convolución» se utiliza aquí en el sentido conceptual del manifiesto; **no debe confundirse, sin una definición adicional, con el operador matemático de convolución entre funciones**. La descripción helicoidal constituye una hipótesis geométrica de observación que necesita formalización.

---

## De la maqueta a los estratos

Las siete dimensiones no sustituyen ROOT, COMM y ADMIN. Explican **qué relaciones debe resolver una maqueta**, mientras que los estratos describen **cómo maGNUx propone organizar esas relaciones** en su arquitectura.

ROOT se relaciona con el fundamento material y las condiciones de autoridad estructural. COMM articula identidad comunicativa, mediación y coherencia entre entidades. ADMIN materializa la operación y los servicios bajo contrato. Estas asociaciones no convierten cada dimensión en una capa ni establecen una transferencia automática de autoridad entre ámbitos.

Tampoco convierten Trilobytes en una cuarta soberanía: su eventual intermediación sigue sometida a las tres delegaciones positivas independientes y al mandato de representación.

El arquetipo permite formular preguntas antes de construir: qué identidad tendrá esta máquina; qué competencias se concederán; cuáles son sus contratos; qué capacidades materiales estarán vivas; qué estados se admitirán; qué evidencias se exigirán; y cómo se observará su continuidad.

La arquitectura de estratos es una respuesta propuesta a esas preguntas. [Zalty](../../zalty/readme.md) constituye el terreno experimental donde parte de la respuesta puede confrontarse con Linux real.

---

## Qué puede contrastarse y qué sigue abierto

La utilidad disciplinaria del arquetipo depende de no confundir una geometría convincente con una demostración técnica.

**Ya puede investigarse** la identidad temprana de un Host, la declaración de contratos, la comprobación de capacidades expuestas, las transiciones de estado, el registro de evidencias y la denegación de operaciones sin competencia o delegación suficiente.

**Queda por formalizar** qué representa exactamente el radio teórico, cómo se define la posición angular, qué determina el paso temporal de la hélice y cómo se traducen sus unidades a arquitecturas materiales distintas. Tampoco se ha demostrado que una trayectoria helicoidal describa mejor todas las clases de continuidad de un sistema operativo: ese alcance pertenece a la investigación.

Una primera comprobación deberá distinguir entre la maqueta declarada y lo que realmente puede ejecutar la máquina, registrar sus divergencias y contrastar sus consecuencias con las predicciones de maGNUx. La **superficie fragmentaria** ofrece una de las preguntas que esa contrastación deberá estudiar.

```text
maGNUx teoriza.
El arquetipo construye la maqueta.
El silicio permite materializarla.
Zalty ensaya.
La continuidad se observa en el tiempo.
```

Arquetipar sistemas operativos no significa imponer una máquina única. Significa poder concebir una constitución sistémica, proyectarla sobre materialidades diferentes y disponer de criterios para examinar si la realización conserva las relaciones que declara.

---

*← [Hipótesis central](02-hipotesis-central.md) | [Índice](../README.md) | Siguiente: [Los tres estratos →](../arquitectura/03-estratos.md)*
