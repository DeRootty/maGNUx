# 03 — Reciprocidad económica, trazabilidad de contribuciones y soberanía contributiva en la Commonwealth del silicio

**Tipo:** artículo académico de propuesta teórica y protocolo de investigación (*working paper*, sin revisión por pares).  
**Autoría del proyecto:** Derootty — maGNUx.  
**Fecha:** 23 de noviembre de 2026.  
**Estado:** hipótesis conceptual y programa de validación; no constituye una regulación vigente, una plataforma financiera implantada ni un sistema de remuneración operativo.

> [⬆ Manifiesto](README.md) · [📚 Documentación](../README.md) · [🏠 Inicio](../../README.md) · [Volumen I](volumen-i-britania-roma-commonwealth.md) · [Volumen II](volumen-ii-commonwealth-del-silicio.md)

## Resumen

La infraestructura informática contemporánea depende de aportaciones de software libre y de código abierto que pueden generar valor social y empresarial sin que sus autores, mantenedores y comunidades perciban una compensación proporcional ni estable. Este artículo propone estudiar, dentro del manifiesto maGNUx, una dimensión de **soberanía contributiva** y **reciprocidad económica**: un sistema voluntario de reconocimiento, financiación y distribución de recursos sustentado en evidencias de contribución, contratos semiótico-operativos, métricas multidimensionales, asistencia de inteligencia artificial (IA) y registros verificables. La hipótesis no presupone que la blockchain sea indispensable ni que la IA deba fijar de manera irrevocable el valor de una persona. La arquitectura propuesta distingue la atribución verificable de un trabajo, su impacto contextual, la decisión distributiva y la procedencia efectiva de los fondos; establece límites de privacidad, compatibilidad con licencias libres, mecanismos de impugnación y condiciones de auditoría. Se presenta una comparación histórica restringida —y expresamente no una equivalencia moral— entre mecanismos de apropiación del producto del trabajo en estructuras imperiales y asimetrías de captación de valor en las cadenas actuales del software. Se define finalmente un programa de prueba empírica con hipótesis falsables y criterios de rechazo.

**Palabras clave:** maGNUx; GNU; software libre; bienes comunes digitales; soberanía contributiva; mantenimiento; reciprocidad económica; atribución; blockchain; IA responsable; gobernanza; Commonwealth del silicio.

## 1. Planteamiento y alcance histórico

El proyecto maGNUx ha descrito la «Commonwealth del silicio» como una posible asociación interoperable de dominios computacionales que conservan su autoridad técnica, mientras se comunican mediante contratos, identidades y evidencias verificables [1]. Esta formulación es una **analogía arquitectónica**, no una afirmación de que los ordenadores sean Estados con personalidad o soberanía jurídica.

La historia del Imperio británico permite examinar la relación entre producción, poder de decisión y distribución del excedente. En el régimen de esclavitud colonial, las personas esclavizadas eran objeto de coerción y desposesión; tras la legislación abolicionista de 1833, el Estado británico asignó compensaciones a propietarios de personas esclavizadas, no a las personas que habían soportado la esclavitud [2, 3]. La **Commonwealth moderna** surgió mucho después, con la Declaración de Londres de 1949 y el reconocimiento de miembros soberanos asociados voluntariamente [4]. No es historiográficamente correcto atribuir a la Commonwealth de 1949 la institucionalización previa de la esclavitud.

**Límite imprescindible de la comparación:** el programador que contribuye voluntariamente a GNU o a un proyecto libre no es una persona esclavizada. No existe equivalencia entre esclavitud —coerción y privación de libertad— y trabajo comunitario aceptado libremente. El paralelismo que se somete a discusión se restringe a una cuestión de economía política: **¿quién produce valor, quién puede apropiarse de él y mediante qué instituciones se establecen mecanismos de reconocimiento y redistribución?**

GNU, anunciado en 1983, concibe la libertad del software como facultad de usar, estudiar, modificar y redistribuir, no como obligación de que el trabajo o la distribución sean gratuitos. El propio proyecto GNU ha defendido que vender software libre es compatible con esas libertades [5, 6]. Por ello tampoco sería correcto afirmar que «GNU era una comunidad por definición no remunerada». Coexisten contribuyentes voluntarios, trabajadores asalariados, empresas, universidades, fundaciones y proveedores de servicios.

La hipótesis maGNUx no exige transformar retroactivamente esas relaciones en empleo. Propone investigar **formas de financiación voluntaria y reparto de fondos** que preserven las libertades existentes.

## 2. Problema de investigación

La producción y el mantenimiento de software constituyen formas diferentes de contribución. Un cambio puntual que introduce una función visible puede tener gran difusión; un parche de seguridad o una biblioteca crítica poco visible puede evitar daños extensos; la documentación, la revisión de código, la accesibilidad, la formación y la gestión de conflictos pueden sostener la continuidad del proyecto sin producir muchas líneas de código.

La literatura sobre mantenimiento señala que el trabajo de sostener los proyectos abiertos está integrado por tareas humanas, sociales y organizativas que no pueden reducirse a productividad cuantitativa [7, 8]. A su vez, los informes de financiación del software abierto reconocen la importancia económica de las aportaciones institucionales y empresariales [9].

Se identifican cuatro problemas relacionados:

1. **Atribución:** demostrar autoría, procedencia, colaboración y condiciones de licencia.
2. **Valoración:** estimar la utilidad y el impacto de aportaciones heterogéneas sin confundir popularidad, cantidad de cambios o capacidad publicitaria con beneficio real.
3. **Financiación:** disponer de recursos económicos efectivos y sostenibles para compensar las contribuciones; ni la IA ni una cadena de bloques crean por sí solas el dinero.
4. **Gobernanza:** impedir que la valoración y asignación de recursos queden bajo una autoridad técnica o económica sin rendición de cuentas.

La pregunta principal es: **¿puede un sistema comunitario de contratos, evidencias y valoración asistida por IA contribuir a financiar software libre de forma más transparente, sostenible y equitativa que los mecanismos existentes, sin lesionar las cuatro libertades del software?**

## 3. Marco constitutivo de maGNUx

La arquitectura de referencia conserva la secuencia conceptual **Kernel/ROOT → xGNUpeD/COMM → Dernel/ADMIN**, y habilita Trilobytes en arranque ordinario únicamente bajo las tres delegaciones positivas exigidas por el manifiesto [1]. La soberanía contributiva no se identifica con una supuesta potestad de ROOT para fijar precios o conceder pagos.

En esta propuesta, la infraestructura económica sería **un conjunto de servicios y contratos de espacio de usuario**, separada del arranque crítico y del núcleo. Su integración se distribuiría así:

| Entidad | Competencia propuesta y límites |
|---|---|
| ROOT / Kernel | Mecanismos nativos para proteger procesos, identidades, claves, almacenamiento y canales; **no determina precios ni adjudica fondos**. |
| COMM / xGNUpeD | Intercambio de pruebas, contratos y notificaciones entre participantes autorizados; no equivale exclusivamente a conectividad de red. |
| ADMIN / Dernel | Aplicación de las políticas locales de autorización y del marco contractual aceptado; no administra por sí mismo un fondo comunitario mundial. |
| Trilobytes | Representación autorizada del usuario y ayuda para consultar, registrar o impugnar aportaciones dentro de un mandato explícito. |
| IA sistémica accesoria | Obtención de indicios, estimaciones y explicaciones; **no es fuente autónoma de legitimidad** y sus decisiones deben poder revisarse. |
| Comunidad o fondo autónomo | Gobierno de criterios, presupuestos, revisión humana, apelaciones y desembolsos conforme a acuerdos válidos. |

El sistema operativo debe poder arrancar, mantener sus servicios y ofrecer recuperación aunque la IA, el registro externo o el fondo de financiación no estén disponibles.

## 4. Modelo de registro verificable de contribuciones

La propuesta separa **registro**, **prueba**, **interpretación** y **pago**.

### 4.1. Declaración mínima de contribución

Una declaración puede referirse a cambios de código, resolución de fallos, auditoría, documentación, accesibilidad, traducción, pruebas, mantenimiento, diseño, mentoría o moderación, con autorización para participar. Para cada evidencia se considerarían:

- identificador pseudónimo o identidad voluntariamente declarada;
- proyecto, versión, artefacto o incidencia;
- naturaleza de la contribución y participantes identificados;
- referencias a cambios o informes y huellas criptográficas;
- fecha, licencia aplicable y consentimiento para el tratamiento;
- firmas o attestaciones de procedencia;
- estado de revisión y posibilidad de impugnación;
- declaración de si la aportación ya está remunerada por otra vía, cuando sea relevante y lícito conocerlo.

Las especificaciones SPDX para información de materiales de software y SLSA para procedencia de artefactos muestran mecanismos de intercambio y verificación reutilizables como antecedentes técnicos; ninguno prueba por sí solo la autoría moral o el mérito económico [10, 11].

### 4.2. Libro mayor distribuido: opción, no dogma

Se propone comparar experimentalmente dos arquitecturas:

**A. Registro convencional verificable:** base de datos con controles de acceso, registros de sólo adición, firmas y pruebas criptográficas periódicas.

**B. Registro distribuido o blockchain autorizada:** consenso entre varios custodios independientes, con anclaje de hashes, estados de reclamación y resultados de distribución. El código, las claves sensibles y los datos personales permanecen fuera de la cadena siempre que sea viable.

La alternativa B sólo debe adoptarse si demuestra beneficios netos de resistencia a manipulación, independencia institucional y auditabilidad suficientes para compensar costes, complejidad, consumo de recursos, dificultad de rectificación y riesgos de correlación de identidades.

**Una huella criptográfica prueba integridad respecto de una evidencia presentada; no prueba que la declaración subyacente sea verdadera, ni convierte el número de contribuciones en valor económico.**

## 5. Valoración asistida por IA: de la métrica al juicio contextual

La propuesta distingue la utilidad de un **proyecto** de la atribución a una **persona**. Una biblioteca crítica puede ser utilizada indirectamente por miles de aplicaciones sin recibir muchas descargas directas. A la inversa, una aplicación muy popular puede basarse en componentes mantenidos por otras personas. La medición se realizará por ventanas temporales y familias de proyectos comparables.

CHAOSS ofrece métricas sobre atribución y salud de proyectos y advierte expresamente que su uso puede crear problemas de privacidad o inducir interpretaciones erróneas [12, 13]. OpenSSF Scorecard aporta indicadores de prácticas de seguridad, pero sus puntuaciones no deben confundirse con el mérito total de un proyecto [14].

### 5.1. Dimensiones observables

| Dimensión | Indicadores candidatos | Precaución |
|---|---|---|
| Uso efectivo | dependencias ascendentes, paquetes consumidores, adopción comprobable | descargas no equivalen a uso real; evitar vigilancia de usuarios |
| Impacto técnico | resolución de defectos, interoperabilidad, regresiones evitadas | atribuir causalidad es difícil |
| Seguridad | riesgos corregidos, evidencias de pruebas, procedimientos de publicación | vulnerabilidades divulgadas no siempre significan peor calidad |
| Continuidad | mantenimiento, revisiones, respuesta a incidencias, carga compartida | no penalizar descanso ni períodos sin commits |
| Bien comunitario | documentación, accesibilidad, traducción, tutoría | gran parte no es cuantificable automáticamente |
| Criticidad | dependencias indirectas, ausencia de alternativas, necesidad de soporte | riesgo de favorecer estructuras monopolísticas |
| Equidad | contribuciones invisibles, financiación previa, diversidad de actividades | no inferir atributos sensibles ni penalizar contribuciones voluntarias |

### 5.2. Modelo exploratorio

Puede estudiarse un **vector de evidencias**, no una medida absoluta del valor humano. Para una contribución c, un proyecto p y una ventana temporal t:

**V(c,p,t) = (uso, calidad, seguridad, continuidad, cooperación, criticidad, incertidumbre).**

Una regla distributiva inicial puede usar una agregación parametrizada:

**S(c,p,t) = Σᵢ wᵢ · nᵢ(c,p,t),** con **wᵢ ≥ 0**, **Σᵢ wᵢ = 1**,

donde nᵢ son métricas normalizadas sólo dentro de categorías comparables y wᵢ son pesos aprobados públicamente, versionados y discutibles. **No se propone una ponderación universal previa**. La incertidumbre y la procedencia de cada estimación deben acompañar los resultados. El reparto final exige una decisión institucional distinta del cálculo del indicador.

Para reducir efectos adversos se compararán alternativas multicriterio sin agregación en un único número, umbrales mínimos de sostenimiento para paquetes críticos, revisión por pares y cuotas transparentes para tareas invisibles.

### 5.3. Mecanismos contra manipulación y error

La IA puede introducir sesgos de idioma, popularidad, tamaño empresarial o composición del repositorio. Por ello, la evaluación propuesta incluye:

- detección de descargas artificiales, redes de identidades falsas y contribuciones triviales destinadas a optimizar métricas;
- pruebas de reproducibilidad, explicaciones de resultados y publicación de versiones del modelo;
- revisión humana e impugnación motivada;
- auditoría independiente sobre muestras y sobre sesgos;
- prohibición de pagos automáticos elevados únicamente por una salida probabilística;
- recálculo bajo versiones anteriores cuando se identifiquen fallos;
- separación entre beneficiario, evaluador y ejecutor de pagos.

El marco NIST AI RMF 1.0 es antecedente metodológico para gobernanza, medición y rendición de cuentas en sistemas de IA, sin constituir una validación específica de este proyecto [15].

## 6. Economía de la reciprocidad: origen y asignación de los fondos

Una **puntuación no es dinero**, y la redistribución no puede financiarse mediante la mera anotación de un token.

Se propone un fondo respaldado por recursos efectivamente aportados: donaciones, patrocinios, contratos, apoyo institucional, cuotas voluntarias de entidades que obtienen beneficios, becas o adquisiciones de servicios. La participación debe distinguir claramente derechos de usuario, obligaciones contractuales, subvenciones y relaciones laborales.

La economía experimental podría comparar:

- remuneración retrospectiva de impactos acreditados;
- garantías de mantenimiento mínimo y presupuestos para proyectos críticos;
- financiación de auditoría, seguridad y documentación;
- convocatorias con revisión por pares;
- aportaciones privadas con cofinanciación pública o filantrópica;
- técnicas de emparejamiento de donaciones (*matching*), incluida la financiación cuadrática, sujetas a controles contra identidades falsas y captura del proceso [16].

No se propone imponer regalías por uso del software ya publicado bajo licencias libres incompatibles con ellas. Tampoco se presupone un «derecho automático a remuneración» por cada commit. La financiación y las expectativas de reparto deben declararse antes de participar, admitir acuerdos alternativos y respetar obligaciones laborales, fiscales y contractuales existentes.

## 7. Ética, licencias, privacidad y resolución de conflictos

La propuesta se somete a las siguientes condiciones constitutivas:

**Compatibilidad con software libre.** No prohibir ejecutar, estudiar, compartir o modificar un programa por no haber realizado pagos; revisar cualquier contrato adicional para que no contradiga los derechos ya concedidos por las licencias correspondientes [5, 6].

**Privacidad por diseño.** La medición de adopción no justifica telemetría oculta ni identificación masiva de usuarios. Priorizar conteos agregados, declaraciones voluntarias y evidencias de dependencias; evitar datos personales inmutables en una cadena pública. En jurisdicciones sujetas al RGPD resultan relevantes la minimización de datos y los derechos de rectificación y supresión [17].

**Equidad y no captura.** Evitar que el mayor patrocinador determine por sí solo el valor del trabajo. Las reglas deben documentar incompatibilidades, conflicto de intereses, controles de representación y posibilidad de recurso.

**Derecho de réplica y corrección.** Todo participante afectado deberá poder conocer qué evidencias se utilizaron, objetar errores y solicitar revisión por personas independientes. Una blockchain no debe ser pretexto para hacer inmodificable una evaluación injusta; las rectificaciones pueden conservar trazabilidad sin mantener expuestos datos personales innecesarios.

**Pluralidad de funciones.** La programación comunitaria comprende producción, mantenimiento, cuidado organizativo y formación. Reducir el reconocimiento a código entregado incentivaría la invisibilización de tareas esenciales.

## 8. Diseño de una validación empírica

Se plantea un estudio piloto, no todavía un sistema implementado:

**Fase 0 — Gobernanza y consentimiento.** Constituir un grupo de participantes, definir presupuesto real o simulado, contrato y procedimiento de apelación. Determinar restricciones de licencias, protección de datos y posibles conflictos laborales.

**Fase 1 — Línea base.** Seleccionar proyectos de distinto tamaño y función (biblioteca crítica, aplicación de usuario, herramienta de mantenimiento, documentación), medir su financiación, tiempos de revisión, salud comunitaria y percepción de justicia antes de introducir el sistema.

**Fase 2 — Atribución y procedencia.** Registrar contribuciones mediante firmas y trazas Git/SBOM; contrastar manualmente la calidad de atribución y analizar falsos positivos y omisiones.

**Fase 3 — Comparación de registros.** Evaluar libro mayor verificable convencional frente a blockchain autorizada en costes, latencia, auditoría, seguridad y facultad de rectificación.

**Fase 4 — Evaluación sin pagos.** Ejecutar la valoración asistida por IA en «modo sombra», comparándola con valoraciones de pares y criterios previamente anunciados. Publicar errores, disensos y sensibilidades a los pesos.

**Fase 5 — Piloto con fondo limitado.** Asignar pequeñas cantidades mediante una regla aprobada con revisión humana; registrar reclamaciones, costes de gestión y efectos sobre colaboración y mantenimiento.

**Fase 6 — Revisión y decisión.** Mantener, modificar o descartar el mecanismo en función de criterios públicos y datos replicables.

### Hipótesis refutables

- **H1:** el registro verificable mejora la calidad de atribución sin una intrusión de privacidad desproporcionada.
- **H2:** una evaluación multidimensional mejora, frente a descargas/commits, la representación del trabajo crítico e invisible.
- **H3:** la IA puede reducir parte del coste de documentación y análisis sin empeorar sesgos, errores y posibilidad de impugnación.
- **H4:** la infraestructura distribuida aporta valor adicional demostrable frente a un registro convencional firmado; si no, se descarta.
- **H5:** un fondo gobernado comunitariamente mejora la sostenibilidad de mantenimiento y la percepción de justicia sin deteriorar las libertades de uso.

**Indicadores de rechazo:** aumento del fraude o de conflictos no resueltos, sesgos persistentes, inexactitudes de autoría relevantes, coste desproporcionado, pérdida de privacidad, deterioro del mantenimiento o restricciones contrarias a licencias libres.

## 9. Discusión: Commonwealth, institución y soberanía contributiva

La analogía con la Commonwealth sirve aquí para expresar una pluralidad de participantes que cooperan sin desaparecer como entidades autónomas. **No autoriza** trasladar soberanía estatal a un programa ni relativizar las diferencias entre esclavitud histórica y contribución voluntaria.

La dimensión económica complementa la arquitectura técnica: un contrato semiótico puede describir la identidad de una aportación, sus condiciones y evidencias, pero **no determina por sí solo qué distribución es socialmente justa**. Esa decisión requiere instituciones, recursos, legitimidad, revisión y capacidad de corregir sus propios errores.

La soberanía contributiva se define provisionalmente como la **capacidad de los participantes para conservar y hacer reconocer evidencias de su trabajo, comprender los criterios que afectan a su valoración y participar —en condiciones pactadas— en la gobernanza de los fondos comunes**. No representa un dominio del creador sobre todos los usos futuros del software libre ni una facultad de obligar retroactivamente a pagar a terceros.

La IA asistirá la investigación; los contratos delimitarán facultades; las evidencias serán contrastables; y la entidad responsable de los fondos conservará la obligación de fundamentar sus decisiones.

## 10. Declaración constitutiva provisional de maGNUx

> **Principio de reciprocidad económica y soberanía contributiva.** La Commonwealth del silicio aspira a preservar la libertad de los sistemas y de sus usuarios, y a la vez promover mecanismos voluntarios, verificables y revisables para reconocer y financiar la producción, el mantenimiento y la transmisión del conocimiento informático compartido.
>
> Las contribuciones podrán documentarse mediante evidencias y contratos semióticos. Su valoración considerará calidad, utilidad, criticidad, seguridad, continuidad y cooperación, con asistencia de IA subordinada a controles públicos y revisión humana. La distribución de recursos dependerá de fondos efectivamente constituidos y de reglas aceptadas por sus participantes.
>
> Ninguna puntuación algorítmica, blockchain o autoridad individual se presumirá legitimada para determinar de manera irrevocable el valor de las personas, imponer pagos incompatibles con las licencias libres o impedir la actividad ordinaria del sistema operativo.

## 11. Limitaciones

Este trabajo constituye una **propuesta normativa y un protocolo de investigación**, no un experimento concluido. No demuestra que blockchain sea superior a registros auditables convencionales, que la IA pueda medir el mérito económico con precisión suficiente, ni que exista una financiación estable para los resultados. Los valores a distribuir dependen de prioridades sociales, recursos disponibles, derechos legales y condiciones históricas. La implementación deberá realizar evaluaciones empíricas y jurídicas por separado.

## Referencias

[1] Derootty / maGNUx (2026). *Volumen II: La Commonwealth del silicio*. [Documento constitutivo del repositorio](volumen-ii-commonwealth-del-silicio.md).

[2] UK Parliament. *The Transatlantic Slave Trade*. https://heritagecollections.parliament.uk/stories/the-transatlantic-slave-trade/

[3] University College London, Centre for the Study of the Legacies of British Slavery. *Legacies of British Slave-Ownership*. https://www.ucl.ac.uk/social-historical-sciences/history/research/research-projects-and-centres/centre-study-legacies-british-slavery-cslbs/cslbs-projects-and-partners/legacies-british-slave-ownership

[4] Commonwealth Secretariat (1949). *London Declaration*. https://thecommonwealth.org/london-declaration-1949

[5] GNU Project (1985 y revisiones posteriores). *The GNU Manifesto*. https://www.gnu.org/gnu/manifesto.html

[6] GNU Project / Free Software Foundation. *Selling Free Software*. https://www.gnu.org/philosophy/selling.html

[7] Geiger, R. S., et al. (2021). *The Labor of Maintaining and Scaling Free and Open-Source Software Projects*. *Proceedings of the ACM on Human-Computer Interaction*, CSCW. https://escholarship.org/uc/item/3mz2d0kk

[8] Linåker, J., Link, G., y Lumbard, K. (2024). *Sustaining Maintenance Labor for Healthy Open Source Software Projects through Human Infrastructure: A Maintainer Perspective*. ESEM 2024. https://arxiv.org/abs/2408.06723

[9] Linux Foundation Research y colaboradores (2024). *Open Source Software Funding Report*. https://www.linuxfoundation.org/research/open-source-funding-2024

[10] SPDX Project. *SPDX Specifications — ISO/IEC 5962:2021*. https://spdx.dev/use/specifications/

[11] SLSA. *Supply-chain Levels for Software Artifacts — Provenance*. https://slsa.dev/spec/v1.2/provenance

[12] CHAOSS. *Contribution Attribution*. https://www.chaoss.community/kb/metric-contribution-attribution/

[13] CHAOSS. *Starter Project Health — Metrics Model*. https://www.chaoss.community/kb/metrics-model-starter-project-health/

[14] OpenSSF. *Scorecard*. https://openssf.org/projects/scorecard/

[15] NIST (2023). *Artificial Intelligence Risk Management Framework (AI RMF 1.0)*, NIST.AI.100-1. https://doi.org/10.6028/NIST.AI.100-1

[16] Buterin, V., Hitzig, Z., y Weyl, E. G. (2018). *A Flexible Design for Funding Public Goods*. https://arxiv.org/abs/1809.06421

[17] Unión Europea (2016). *Reglamento (UE) 2016/679, Reglamento General de Protección de Datos*. https://eur-lex.europa.eu/eli/reg/2016/679/oj

---

**Ubicación:** manifiesto constitutivo de maGNUx. **Distinción metodológica:** hechos documentados, propuestas normativas, arquitectura aún no implementada e hipótesis pendientes de contrastación se mantienen expresamente separados.
