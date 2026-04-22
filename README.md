# Manifiesto de MaKGNUux (Managed's Kernel GNU LinuX)
En este manifiesto trata de declarar la filosofía Linux, como un giro tangencial a la filosofía Unix.

Lo que motiva este manifiesto de ideas, es la seguridad ante un futuro sistema operativo con IA sistémica. Actualmente, ningún sistema operativo la incluye, y el caso mas relevante de desastre, al intentarlo, es Microsoft. El hardware aún no está preparado para soportar software con IA sistemica, y se necesitan hacks en el software de arranque para poder soportar una seguridad mínima en el arranque y levantamiento del sistema. Estos hacks no son excluyentes, sino necesarios aunque el hardware esté debidamente conceptualizado en arquitectura, para dar soporte sistémico a la IA.

Esta lectura puede parecerte filosóficamente interesante, arquitectónicamente provocadora y técnicamente incompleta.
El tiempo que le dedico a estudiar este tema, pretende madurar:
* 1️⃣ Separación de: control vs operación.
* * Identidades especificas destinadas al control (hroot + croot + droot = root)
* * Identidades especificas destinadas a la operacion (sadmin + uadmin + aadmin = admin)
* 2️⃣ Dotar de identidad estructural al sistema.
* * Control orgánico (Dernel run time + Dernel guest = Dernel user land )
* * Control sistémico (Kernel hard + kernel run time = kernel host)
* 3️⃣ Dotar de ejes dimensionales que marquen un limite o area a la actividad
* * Eje quien soy (control del user land)
* * Eje donde estoy (control del host)
* * Eje de donde vengo (control de la dimanica host - guest)
* Se integraran en el area de actividad denominada Kommu services (IPC, Dbus, parte del actual sistemd que delegará actividad)

Traataré de desarrollar la respuesta a:
* ¿Puede un sistema operativo tener gobierno interno explícito?
* ¿Se puede hacer una declaración teórica y esperar una arquitectura emergente de dinámica de "hormiguero"?

Desde un punto de vista epistemológico, se tratará de resolver tres problemas reales:
* 1 - complejidad histórica de Linux
* 2 - El "objeto" actual que define el kernel de Linux, converge en una version que no contempla una arquitectura de sistema global (cual "hormiguero"), pero que deja bien definido los "aposentos reales de la reina".
* 3 - El manifiesto intenta crear caminos bien definidos que dotan de estructura a las dierferentes "galerias" creadas por la comunidad (las hormigas obreras, que tratamos de entenderlo y abstraerlo).

# Un poco de abstraccion, para entender el motivo de la inspiración:
## Lo que aprendemos
La fuerza está en las "piezas" u "objetos" con objetivos bien claros y definidos, sin complegidades innecesarias, que están, conectadas por interfaces simples, bien documentadas y sin ofuscaciones.

### El trabajo de un hormiguero, el esfuerzo de una hormiga.
De la misma forma que, una sola hormiga no tiene idea de la ingenieria general de como emergen las propiedades de su hormiguero, porque no es consciente de la colaboracion entera de la colonia (se rije por señales bioquimicas), en Linux sucee algo similar (se rije por politicas de sistema y registros de volución sistémica), con el planteamieto de la filosofia Unix, cada colaborador se ha centrado en un objetivo simple y sencillo pero integrable y escalable, de tal forma que, se pueda usar, debidamente documentado, como pieza útil dentro de un sistema POSIX.

### El guirigai montado en un sistema tipo "hormiguero".
La naturaleza no entiende de lineas rectas, entiende de rutas de bajo consumo y matrices de posibilidades integrables en las que emergen áreas de minimo esfuerzo (en donde la identidad juega el papel de base y la confidencialidad el papel de punto dinamico de interacción). 

#### Teoria de juegos aplicada al silogismo "hormiguero - código libre":
Toda hormiga hace hormigueros distribuidos bajo tierra y el sistema funciona, de la misma forma, sea que contribuyas a las galerias de tu propio hormiguero o sea que existan otras hormigas que quieran entender el sistema colaborativo para mejorar los suyos propios respectivos, lo cierto es que, cuando dos hormigueros entran en conflicto, lo decisivo no va de la mano de como sea el propio hormiguero (que también, pero esa seguridad es más estructural que incursiva. Cuando esos niveles de seguridad se ven comprometidos, hablamos de fuerza bruta), sino de las comunicaciones bioquimicas y feromónicas emitidas por cada individuo y de la reina (en este caso, hablamos de seguridad por estrategia).
Por lo tanto, es de beneficio táctico que toda hormiga entienda que su instinto la permitirá crear galerias que se integraran en la naturaleza de su comunidad, y sin grandes invenciones ni magia iluminativa, sabrá como hacer bien su trabajo, aportando a su hormiguero, porque la seguridad no esta en la ingenieria ni en la arquitectura, sino en las comunicaciones.

De la misma forma, los sistemas privativos, son verdaderas lineas rectas, sin galerias, sin colaboraciones, sin libertad en que aportar a la arquitectura con una ingenieria incipiente, novedosa, inocente pero resolutiva, porque esto viene de la mano de los sistemas libres, que son verdaderas rutas de bajo consumo. El equilibrio reside en encontrar el verdadero punto medio, para que los límites del área informativa no se disipe en pura entropía, o esfuerzos en la nada: como calentar el vacio sin un objetivo concreto ni documentado (porque con la física actual, hasta calentar el vacio puede ser un descubrimiento innovador, si se tiene un posutlado y teoria que pronostiquen resultados matemáticamente demostrables). Así es que o se tiene un postulado a elevaaar a teoría, o me parece a mi, que las líneas rectas estan por converger en su extincion (a mi muy pesar por los dispositivos Apple).

#### La identidad: del silogismo a lo material - El Host
¿Como una hormiga entiende cual es su hormiguero? De la misma forma ¿Como se puede recrear la decisión de un servicio, demonio o programa, los límites de su objetivo algoritmico? ¿Es la ruptura con la filosofía tradicional Unix, iniciado por SystemD, la solución? La arquitetucta de Linux, yo la llamo "de madeja de galerias de hormiguero". Tras el inicio del sistema, levantar el user space suponia una obra de ingenieria bastantante idealizada y poco aterrizada en la realidad. Las arquitecturas que dotan de coherencia al hardware CISC x86 sea de 64 o 32 bits, eran una verdadera pesadilla, en relacion al hardware y su potencia. Por un lado debian lidiar con las colas fifo, lifo, filo y lilo, que se encargaban de gestionar el registro de arranque, por otro lado, los xploits de seguridad que se heredan con la sinergia a la hora de hacer funcionar la arquitectura planteada del hardware con el modo de arrancar del software y, por todo esto, se vino a la luz SystemD, que de un plumazo dio una hoja de ruta por la cual avanzar, a costa de romper la pureza Unix. SystemD es una linea recta que alcanza una manera de abrir vias de trabajo para ir afrontando las inclemencias del malware y poder ir parchenando los xploits con un exito razonable para infraestructuras criticas.

Los scripts en bash requieren tiempos de ejecucion bastante lentos, y en ocasiones producen idle en el procesador. En esa época, un idle era hackeable: una ventana para crear una interrupcion de solicitud, y si dicha intromision abarcaba el tiempo natural de idle planteado por el sistema, al administrador le pasaba completamente desapercibido, salvo si era capaz de balancear el consumo del procesador principal, o encontraba versiones de otros complementos que, haciendo lo mismo, dentro de la cadena de arranque del procesador, no le producián idle.

SystemD mantiene al procesador principal atareado, sin tiempos para respirar, pero en maGNUx, se propone una alternativa: Definir un host temprano y volutivo, que vaya ganando areas de dominio mientras el arranque acaba por hacer disponible todo el hardware. Un arranque de este estilo, seria virtualmente invulnerable a los idle, debido a que para que un proceso se ejecute, las directrices tempranas del levantamiento del host, detectaran si es una pieza critica para continuar con el levantamiento del host, o sencillamente no aporta nada. Si no aporta, es un xploit, pero si por el contrario, aporta, entonces es un proceso válido.

La identidad del host, se definen entre dos areas y media:
* Kernel host
* Kommu services
* Dernel run time

#### la identidad Guest
Actualmente tenemos a SystemD que parchea la inestabilidad de un sistema de arquitectura de madeja de galerias de hormiguero con un punto o nexo de cruce, aliviando los xploits y las subsiguientes escaladas de privilegios asociados a ellos.
Por otro lado, en el area admin (actualmente difusa y cargada en el userspace) teníamos a los servicios X11 y actualmente a Wayland, que hace lo propio en el entorno gráfico, dotanto de entidad a cada ventana gestionada en el entorno gráfico.

La identidad del guest emerge de los resultados obtenidos a través de:
* Dernel guest
* Logon service
* Login sesion
 
### maGNUx: Ser y no Ser, el área de minima acción materializada.
En maGNUx separamos identidad de la maquina conceptualizada como Host (o el tipo de "coche" que circula), de la identidad del conductor o entidad organica definida como Guest, que lleva al Host a interaccionar con servicios pensados para trafico orgánico.
El kernel debería matricular a la máquina que está dándole una identidad de Host. 
El dernel debería dar licencia operativa sobre el host al guest.

* Una minima acción para el control y otra minima accion para la operacion.
* Se entiende control, como el sometimiento del hardware a una autoridad máxima, y esta la hemos definido como root.
* Se entiende como protección la capacidad de evaluación de la autoridad que ha emergido del proceso que comunica ambas areas y suministra un criterio. A la autoridad materializada la hemos denominado como AdComm.
* Se entiende como acción la materialización de cara al usuario o a la entidad solicitante de servicio, en forma de resultado útil y significativo, de tal modo, que no es necesaria una nueva iteración entre el area de control y la de acción. A esta entidad la hemos denominado Administrador, y tomara la forma .
Se entiende como sistema de 
* lo que sí es: Un grupo de tareas que habilitan servicios útiles entre el hardware, el software, las entidades emergentes y las identidades con autoridad relativa y/o absoluta, un punto de rotacion de varios ejes donde la informacion y su forma de ser tratada tiene como eje el mismo corazón de linux.
* lo que no es: Una lista secuencial de instrucciones que dejan en abierto el uso del hardware. 

#### Un sistema para gobernarlos a todos.
En este punto, mi pregunta es: ¿Podrá la filosofía Unix servir para reutilizar el software usado en levantar las actuales distros de Linux, pero hacerlo de forma que conecten con las adaptaciones qye se necesiten para cumplir con el manifiesto propuesto por maGNUx?
¿Cuanto de original habrá que aportar? ¿Las versiones actuales, podrán actualizarse sin que pierdan la esencia de sus versiones anteriores?

#### Lo que sí es razonable esperar

Y es en este punto, donde se diferencia de lo hasta ahora visto: Si bien el init ramfs no crea dependencia sobre el resultado final de cara al usuario, o en otras paralabras, Linux no pretende ni desea crear una compatibilidad GNU, la carga final crea un entorno operativo de vcara al usuario final, sobre la que queda claro que Linux no depente de maGNUx. Si no se aborda una reestructuración de la arquitectura que permite ser levantado, al tiempo de redactar este documento, expone al kernel a una gran vulnerabilidad sin posibilidad de evitar su colapso.
Levantar maGNUx requiere de la definicion de un initramfs (primitivas) o formas base con las que se construirán los grafos de traza, que permiten al sistema ser auditado.

Se propone un regimen de compatibilidad inspirado en POSIX, que dotará de integración en las partes contributivas por la comunidad, en los estratos pensados para este manifiesto:
* Estandánres de todos los modulos que pretendan tenerse en cuenta:
* Capa maPOSIXd00 para la carga del kernel core en el initramfs.
* Capa maPOSIXd01 para la carga del kernel runtime en el area comm.
* Capa de abstracción Dernel, es como un kernel, con la misma filosofía, pero orientado al software que cualquier usuario acreditado pueda pretender para el host.
* Capa maPOSIXd02 para la carga del dernel core en el area admin.

#### Lo que no es razonable esperar
maGNUx no es un sistema operativo, es un conjunto de normas que dan suelo a una estandarización de como abordar la creacion de una distribucion, tal como si fuese una receta de cocina, con la confianza de que nos abre camino para que el kernel se autogobierne en una dinamica integrada con la IA. En este punto, entendemos la diferencia entre kernel core y kernel comm. Con esta diferencia, ya sabemos que maGNUx no es el Linux tradicional. Debido a esta dualidad, se entiende al Root como la entidad formada por cuatro dominios. Si no se tiene autoridad en los 4 dominios, no hay formacion de Root. 

## El antes y el después

* maGNUx no nace para sustituir Linux.
* maGNUx nace porque Linux, siendo suficientemente potente para sostener el presente, no basta por sí solo para expresar con claridad la arquitectura del porvenir.
* Linux ha demostrado una fertilidad histórica extraordinaria. 

- Se entiende dominio a las caracteristicas definidas por una serie de servicos y el conjunto de todos los servicios y su dominio, definen al Root. Por lo tanto, Root comienza su levantamiento en el momento que se incia el primer servicio operativo, por muy primitivo que sea, o por muy abstraido que llegue a ser su carga:

### Los cuatro dominios de root.

* Servicios primitivos (Dominio directo insubordinable. Acceso directo a los recursos).
* Servicios de comunicacion LAN - INET (Dominio directo subordinado. Abstraccion a nivel estandares hardware).
* Servicios administrativos (Dominio indirecto insubordinable. Abstraccion a nivel drivers. Se carga SystemD y queda establecido el host).
* Servicios de usuario (Dominio indirecto subordinado. Abstraccion a nivel virtualizado directo: El usuario accede en forma de VM a los recursos, tipo Guest (no tiene privilegios directos sobre los drivers ni sobre los servicios que gestionan las colas y prioridades. Mediante las herramientas de SystemD pudiera realizar tareas administrativas)).

- Directo insubordinable: Acceso directo al hardware, para ello se requiere una consulta directa a una funcion del firmware, que liste todo el hardware susceptible de estar a la escucha. Por ejemplo, tenemos el servicio de audio, que en el hardware se hace peticion a una direccion hex: h:FF23-241D-3E4A-B88C de tal forma que, seguidamente se debe hablar el idioma del controlador primario del firmware, para indicarle al hardware que hacer, o lo que es lo mismo, es como si en un motor de combustion interna movieramos a mano el volante motor, para poner todo el bloque el posiscion de inicio o encendido o cambiarle la correa de distribución.
- Directo subordinado: Acceso directo a la memoria donde estan ya los drivers cargados, pues el lanzador de driver ha localizado el enlace directo insubordinable al que llamar y poder lanzar el blob o el bin adecuado (se requieren permisos comm acreditados).
- Indirecto insubordinable: gestion de colas en peticiones y evaluacion de prioridades que gestionan el trafico al driver. Puro trabajo administrativo (se requieren permisos admin acreditados).
- Indirecto subordinado: gestion de paquetes de aplicaciones completas, en la solicitud de instalacion, ejecucion y desinstalacion de los mismos. Gestion de permisos a archivos de usuario generados por sofware de terceros (se requiere soberania de cuenta de usuario).

* Antes Linux arrancaba iniciando initramfs y luego lanzando el kernel, ahora initramfs se pretende persistente con identidad root, denominado kernel maquina, y acto seguido se lanza el keernel system.

### El impass de la inercia de las comunidades: 
Su fuerza no procede de una pureza geométrica original, sino de una capacidad casi biológica para absorber complejidad, crecer por capas, adaptarse a nuevas necesidades y sobrevivir a cambios que habrían fracturado otros sistemas. Esa misma fortaleza, sin embargo, ha dejado al descubierto un límite: la complejidad emergente no equivale necesariamente a soberanía estructural. Un sistema puede funcionar, escalar, extenderse y seguir careciendo de una ontología explícita de gobierno.
Desde esa constatación parte maGNUx.

* No para negar Linux.
* No para reemplazar Linux.
* No para despreciar la función histórica de piezas como init, systemd, dbus, namespaces, cgroups o las múltiples capas del userspace contemporáneo.
* Si para contextualizar el userspace dentro de la coherencia de un sistema que opera tanto de forma imperativa como declarativa.

Con todo lo anteerior, afirmar que, en el contexto adecuado, nos podemos permitir clarear y hacer visible una exigencia nueva: el sistema operativo ya no puede entenderse únicamente como kernel más userland; debe empezar a pensarse como identidad, gobierno, persistencia, comunicación y operación integradas en una arquitectura artificiosamente inteligente de sí misma.

Este es el punto de giro de maGNUx.

I. initramfs: Linux como suelo, no como obstáculo
maGNUx no pretende destruir Linux porque Linux constituye hoy el único suelo real sobre el que puede pensarse esta transición. El proyecto no se formula como un “nuevo sistema operativo” en el sentido clásico, sino como una arquitectura transicional apoyada sobre Linux puro, capaz de usar lo que ya existe para anticipar lo que todavía falta.

* Por eso initramfs adquiere aquí una relevancia radical.
* No porque initramfs sea la culminación del proyecto.
* No porque deba confundirse con la solución definitiva.

Sino porque, en las condiciones actuales del hardware, initramfs representa el único espacio real desde el cual puede imaginarse una persistencia inicial del sistema que no dependa enteramente de la lógica tardía del userspace convencional.
En maGNUx, initramfs no es venerado como forma final; es aceptado como parche ontológico y técnico. Es el soporte provisional de una capa que, en una evolución más madura del sistema, no debería descansar únicamente en software. Su uso proyectado en este documento, constituye una prótesis necesaria: una región inicial de Linux puro que permite dar cuerpo experimental a lo que en el futuro deberá apoyarse en hardware orientado expresamente a la soberanía del arranque.

Dicho de otro modo: Un kernel Linux con filosofia emergente.
maGNUx proyecta cambios menores y medios en el initramfs, con el propósito de demostrar lo que todavía no existe en relación a la infraestructura material que haría coadyuvante a ese parche en la gobernanza interna del sistema.

initramfs carga un sistema puro linux, en su esencia mas original, pero con autoridad root sobre el hardware, que le dota de una dinámica con identidad propia, necesaria para tratar a Linux como lo que es, un núcleo con dinámicas imperativas inherentes a los fundamentos del hardware desde los que emerge, suministrando un dialogo que lo hace compatible y con la misma inercia de seguridad (o al menos en potencia) necesarias para establecer negociaciones declarativos desde los que funcionan las IAs.

II. La insuficiencia del arranque heredado
La historia de Linux ha producido mecanismos de arranque cada vez más sofisticados, pero esa sofisticación no ha resuelto del todo el problema de fondo. Antes de systemd, el inicio del sistema descansaba en una constelación de scripts, convenciones, prioridades implícitas y piezas difícilmente unificables. systemd impuso orden donde había dispersión, dio gramática al arranque y al ciclo de vida de los servicios, y convirtió buena parte del userspace moderno en un entorno declarativo razonablemente administrable.
Ese paso fue decisivo.
Pero no agota la cuestión.
Porque el orden que introduce systemd sigue siendo, en lo esencial, un orden de software dentro del host. Un orden importante, pero todavía tardío respecto a la pregunta más profunda: quién gobierna el sistema antes de que el sistema aparezca como userspace gobernable.
Ahí es donde maGNUx se separa.
No porque niegue el valor de systemd, sino porque percibe que el problema ya no consiste solo en ordenar servicios, sino en establecer una soberanía estructural del arranque y de la identidad del sistema que anteceda a la administración convencional. En ese sentido, systemd no es el enemigo de maGNUx, sino su antecedente incómodo: la prueba de que la historia del sistema empuja hacia formas cada vez más explícitas de coordinación, pero también la prueba de que esa coordinación aún no ha alcanzado su fundamento.

III. La necesidad de una arquitectura de gobierno
Si el sistema va a incorporar procesos declarativos cada vez más complejos, si va a convivir con lógicas de decisión más autónomas, si va a integrar más adelante mecanismos apoyados en NPU u otras formas de cómputo orientadas a política, predicción o reconciliación de estado, entonces ya no basta con sumar capas imperativas. Hace falta una arquitectura capaz de reconciliar:
* lo que el sistema es,
* lo que el sistema declara querer ser,
* y lo que el sistema está efectivamente ejecutando.
* Sin esa reconciliación, lo declarativo queda reducido a estilo.
* Sin esa reconciliación, lo imperativo sigue siendo soberano de facto.
* Sin esa reconciliación, el sistema continúa siendo una agregación de piezas intentando encajar “como pueden”.

Por eso maGNUx necesita algo más que nuevos módulos, nuevos scripts o nuevas abstracciones semánticas. Necesita una teoría del gobierno del sistema.
Ahí aparecen los nombres propios del manifiesto: xGNUpeD, Trilobytes, COMM, ROOT, ADMIN, PRUT, PARS, SAM, intramfs y demás términos en formación. Su valor no reside todavía en una implementación acabada, sino en que intentan designar funciones que en Linux permanecen repartidas, implícitas o insuficientemente distinguidas.

IV. ROOT, COMM y ADMIN
La arquitectura maGNUx puede entenderse, en su estado actual, como una tentativa de distinguir tres estratos:

ROOT
No como simple privilegio clásico, ni como mera equivalencia con “kernel”, sino como raíz estructural del sistema: la instancia desde la cual el sistema posee continuidad, legitimidad inicial, base material, orientación y posibilidad de persistencia.

COMM
No como simple red o intercambio entre procesos, sino como plano de mediación y coherencia, donde la comunicación deja de ser solo transporte y se convierte en orden de gobierno, reconciliación, validación y coordinación.

ADMIN
No como usuario superpotente, sino como entorno operativo subordinado: el Linux reconocible, el espacio en el que se despliegan servicios, procesos, shells, herramientas y tareas cotidianas.
Esta distinción no busca multiplicar nombres. Busca establecer una diferencia que el sistema moderno necesita con urgencia: la diferencia entre gobernar y operar.

V. xGNUpeD y la cuestión de la identidad
Entre las intuiciones más fértiles de maGNUx está la noción de que el sistema necesita una identidad estructural previa a su aparición como entorno operativo convencional. Esa función está insinuada en xGNUpeD.
xGNUpeD no debe entenderse como un “nuevo init” ni como un clon de systemd.
Tampoco como una simple base de datos de arranque.
Su sentido más profundo apunta a ser una capa de identidad, legitimación y continuidad, capaz de dar forma al sistema antes de que este se despliegue como userspace ordinario.
La hipótesis es poderosa: el sistema no debería empezar a existir solo cuando ya ejecuta servicios, sino desde el momento en que puede afirmar de forma verificable su condición, su estado y su raíz.
A día de hoy, esa intuición solo puede expresarse de manera parcial en software. Pero su dirección es clara: sin una identidad del arranque, no hay auténtica soberanía del sistema.

VI. Trilobytes y la coherencia integral
Toda arquitectura declarativa real necesita una instancia que no solo observe, sino que verifique, compare, decida y eventualmente niegue. En maGNUx, esa función se proyecta en la abstracción llamada Trilobytes.
Más allá de su nombre, lo importante es la necesidad que expresa:
el sistema requiere un núcleo de coherencia integral que no sea simplemente logging, ni simple supervisión, ni mera policía de errores. Debe ser un principio de consistencia, una mediación entre identidad, política, operación y materialidad.
No se trata únicamente de seguridad.
Se trata de veracidad estructural.

VII. El bus de comunicación de arranque
Todo lo anterior conduce a una exigencia que, en nuestro tiempo, todavía solo puede formularse parcialmente: la necesidad de un bus de comunicación de arranque.
No un bus en el sentido banal de interconexión de dispositivos, sino una infraestructura protocolizada desde la que el sistema pueda articular, en fase temprana:
identidad,
estado deseado,
validación,
secuenciación,
permisos,
reconciliación,
y persistencia inicial.
Mientras ese bus no exista materialmente, el sistema seguirá dependiendo de soluciones software que, por muy elegantes que sean, arrastran el límite de querer gobernar desde dentro del mismo flujo que intentan someter a orden.
Por eso maGNUx insiste —implícita o explícitamente— en que ciertos cambios no terminarán de madurar si el hardware no acompaña. El software puede anticipar, simular, parchear, prototipar y revelar la necesidad. Pero llega un momento en que la soberanía del arranque exige apoyo material.
Aquí se encuentra una de las tesis más importantes del proyecto:
no basta con mejorar el software; hay que orientar el hardware hacia la arquitectura que el software ha hecho visible como necesaria.

VIII. El papel transitorio de estas primeras versiones
Las primeras versiones ontológicas y descriptivas de maGNUx deben entenderse precisamente como eso: versiones transitorias. No son todavía la forma completa del sistema. No son aún una arquitectura cristalizada en buses, protocolos, controladoras ni soporte físico específico. Son el momento en que una necesidad intenta adquirir lenguaje.
Su tarea no es impresionar por completitud.
Su tarea es llegar a estar lo bastante bien definidas como para permitir una primera versión abordable.
Eso exige disciplina.
Exige separar:
la metáfora útil de la niebla retórica,
la intuición fértil de la declaración hueca,
la ontología del mecanismo,
la arquitectura de la implementación,
y la ambición final del núcleo mínimo viable.

IX. La maduración necesaria
Para que maGNUx gane músculo deberá asumir un trabajo paciente de orden conceptual:
definir qué entidades existen realmente;
distinguir qué pertenece a ontología, qué a política, qué a operación y qué a materialidad;
establecer grupos de desarrollo coherentes;
diferenciar claramente el plano provisional en software del horizonte futuro apoyado en hardware;
y aceptar que la primera versión no puede contenerlo todo.
En esa maduración, el objetivo inmediato no debería ser “hacer el sistema entero”, sino dejar resuelto, con suficiente claridad, al menos lo siguiente:
qué es maGNUx;
qué no es maGNUx;
qué papel cumple Linux en él;
por qué initramfs es un parche legítimo;
qué representa xGNUpeD;
qué función exige Trilobytes;
qué significa COMM;
y qué parte del proyecto pertenece ya al campo de una primera implementación.

X. Conclusión
maGNUx no es, en su orientación más seria, una negación de Linux.
Es una tentativa de llevar a Linux hasta el punto en que empiece a mostrar su propia insuficiencia estructural para el futuro que se avecina.
No pretende destruir el suelo.
Pretende usar el suelo para fundar una nueva capa de soberanía.
No identifica initramfs con la meta.
Lo reconoce como parche necesario mientras el hardware no alcance la forma que esta arquitectura reclama.
No propone simplemente más servicios.
Propone una ontología del sistema.
No afirma que la complejidad emergente de Linux carezca de valor.
Afirma que ha llegado el momento de dotarla de una gramática superior.
Y, sobre todo, no declara que el sistema esté ya hecho.
Declara que ha aparecido una necesidad para la que el sistema actual solo ofrece respuestas parciales.
maGNUx es el nombre provisional de esa necesidad cuando empieza a volverse consciente de sí misma.

-----------------------------------
Antes Linux era Linux en su initramfs y en su inicio mediante linuz.bin lo mismo, el mismo kernel, pero con un contexto diferente. Despúes de aplicar las definicones de maGNUx, deja de ser eso, para ser un fundamento base que dota de operativida a otras entidades lógicas que son actores con privilegios en areas donde root arrasaria, pero con estos nuevos actores instanciados en areas de visibilidad estratificadas a su ontologia informativa.

## La identidad e maGNUx - procesadores CISC x86_64
Definir a initramfs con un orden de capas primitivas de comunicación, para poder delegar una identidad propia a maGNUx en relación a Linux (residente en ese initramfs):

El kernel cargado en initramfs, necesita conectar con un servicio que he llamado xGNUpeD. No es un SystemD, debido a que este último se despliega después de que el kernel haya adoptado la identidad distributiva otorgada por xGNUpeD.

Así pues, el initramfs necesita dejar definidos los siguientes conceptos:
* Identidad distributiva. Identidad comunitaria de distribución.
* Identidad conmutativa. Identidad con capacidad de filtrar y asegurar su identidad de forma directa e inversa en relación a un sistema GNU Linux tradicional. Para poder suplantarlo, hay que usar la fuerza, no se puede suplantar desde su naturaleza.
* Identidad asociativa. El usuario final podrá expresarse con total libertad, pudiendo asociar su capacidad creativa y productiva, a la comunidad que le da soporte, con integridad y coherencia a la hora de conmutador a un sistema GNU Linux tradicional.
* Identidad comunicativa: Toda instalación de sistema, tendrá una matricula de registro que le dotará de libertad, con capacidad de sertrazadoy auditado en lo relativo al funcionamiento del sistema.

## xGNUpeD: el puente hacia la identidad inteligente
Estas cuatro propiedades otorgadas por xGNUpeD se deben cumplir en relación a su herencia y proyectando hacia su superficie identificativa. Cuanto mayor sea la linea temporal sobre la que basamos la identidad, mayor es la superficie en identificación sumando dificultad en la suplantación.

La razón de este acotamiento técnico, es no trivial, por razones históricas, al reconocer que el juego de instrucciones de este tipo de procesadores, es el resumen histórico de lo que el usuario final en el hogar o en la oficina, ha necesitado para resolver sus necesidades de automatización de la información. maGNUx entiende que, estos procesadores son ideales para la robótica del hogar o domótica de propósito general, integrando a la NPU en un contexto bastante robusto. Para poder usar las ventajas de estos juegos de instrucciones en este vector de ingenieria, se reconoce la necesidad de gobernar al procesador central a través de una NPU, la cual, necesita ser modulada por procesos imperativos adecuadamente segmentados en las siguientes tres capas bien definidas:

### compatibilidad por herencia

* 1.- Comunicación operativa.
  ** Los servicios
* 2.- Comunicación de seguridad o no trivial.
* 3.- Comunicación administrativa o trivial.

Con estas tres propiedades aseguramos la integridad en los procesos identificación, que en lugar de reducirse a un inicio de sesión, se amplian, ofreciendo una mayor superficie de confianza.

Cada capa, está protocolizada por la propia distro.
Las comunicaciones operativas, usan una zona de intercambio en RAM/swap montada como disco de trabajo.
y que ese espacio solo se vuelque al Sistema de Almacenamiento Masivo (SAM) en el cierre y se restaure en el arranque.

Así obtenemos simplicidad + trazabilidad.

Referencias de fondo:
“The Linux Kernel Archives” (kernel.org) para el modelo de arranque y subsistemas.
“Filesystem Hierarchy Standard” de Linux Foundation para el orden del árbol.
Documentación clásica de Unix philosophy (Bell Labs).

---

## Introducción dura
Desde este punto en adelante, se tratará de ir enfocando sin ambigüedades filosoficas, pero con foco epistemologico, la volución de lo anteriormente dicho.
Se hace evidente a estas alturas de la declaración de intenciones, que maGNUx hereda la filosofía Unix pero la acota a la realidad mediante una arquitectura estratificada: Son programas mínimos, especializados, que hacen una cosa y la hacen bien, y que se conectan entre sí mediante protocolos definidos por las directrices marcadas en xGNUpeD. Prioriza y globaliza su compatibilidad con el hardware, buscando su mejor rendimiento, frente a la modularidad teórica de Unix, sin que esto suponga una ruptura con su filosofía.

### Inicio de maGNUx
maGNUx arranca por estratos, no por una secuencia que se descarta. Cada estrato queda vivo y sostiene al siguiente.

initramfs se encarga de:
* Estrato ROOT (máquina / kernel): privilegio absoluto, levanta los fundamentos de CPU, RAM, SAM y COMM. (Desplegado por initramfs y persistente)
* Estrato COMM: orquesta, aplica políticas, vigila coherencia y habla con /loadD. (Desplegado por initramfs y persistente)
* Estrato ADMIN: ofrece el entorno que el usuario reconoce como “un Linux normal” (shell, servicios de usuario, /home); pero no es un usuario normal. (Desplegado por initramfs y persistente)

La clave es que el estrato ROOT no desaparece (initramfs no se volatiliza): sigue siendo el suelo de confianza.

Cuando abordamos el concepto de unidad de trabajo, se hace enfrentando a la CPU como actor principal del trabajo, ya que sin ella, no hay trabajo de sistema posible. Desde este punto, dotamos al kernel de capacidad de entender que procesos están sometidos a su capa ROOT y cuáles no. Hasta que el kernel no esté completamente levantado, solo entenderá si el proceso tiene privilegios ROOT o no, denegando lo que no esté privilegiado a ese nivel.

### Proceso de reconocimiento de unidades de trabajo (capa PRUT):
Usando para ello la memoria swap, que quedará montada como un disco ram, en la que solo, en el cierre del sistema, volcará su contenido al sistema anclado en SAM configurado como vínculo de almacenamiento. Los flujos en este protocolo, pueden ser de texto o no, para formar sistemas más complejos y flexibles, promoviendo la simplicidad, la modularidad y la reutilización del código.

Las colas que se generan en dichas comunicaciones, son referenciadas en el disco ram/swap y rescatadas en cada arranque del Sistema de Almacenamiento Masivo (SAM) montado como partición swap, la cual solo interviene en el arranque y en el cierre de sistema (la partición en disco, no la segmentación lógica).
Las modificaciones que se acometerán sobre el kernel de Linux para que sea coherente en su propia filosofía, y trazable hacia el punto de giro con la filosofía Unix (trazable hacia su punto de origen), está basada en un kernel con las mínimas modificaciones posibles, pero necesarias para que cumpla con estos objetivos:
Para eso, el kernel en su primer estrato, forma esta capa compuesta por tres fundamentos lógicos:

#### Conjunto que define el primero de los fundamentos:

En este primer conjunto, hay tres miembros:
1.- La CPU - RAM como fundamento 0:
Puede parecer una tontería, pero la gestión de la memoria RAM por el procesador, debe ser lo más limpia, de cara al procesador. Para ello, los privilegios del kernel sobre la RAM son absolutos, y la demanda de trabajo por parte del kernel hacia la CPU es de prioridad insubordinable, cuando el canal de acción parte en origen con las credenciales adecuadas.

2.- La CPU - SAMs como fundamento 1:
La gestión de los sistemas de almacenamiento masivo, debe ser segmentada conforme a puntos de montaje, dando prioridad al aislamiento por segmento y la seguridad en cada acceso segmentado.

3.- La CPU - COMM como fundamento 2:
Lo que se entiende como COMM a este nivel, es la capacidad del kernel de conectar con el centro oficial de actualizaciones del kernel, para legitimar el estado actualizado del mismo, y verificar que no se ha violado la integridad conforme a lo que quedó firmado en la instalación y las últimas actualizaciones. Para ello, se usan normativas estandarizadas con IEEE 802.3, PCI / PCIe, PXE, IEEE 802.11 a/b/g/n/ac/ax (Wi-Fi 6), USB / PCIe / M.2 interfaces, USB-IF.
Se crea un espacio intermedio que actúa como bus de comunicación y sincronización entre el nivel máquina y el nivel administrativo.
- Reconoce hardware conectado a los buses PCIe, NVME, GPUs, NPUs, APUs, Ethernet, etc que se acopla en modo de expansión relativo al mapeo hecho por Paleolito
- Gestiona permisos.
- Filtra interacciones entre periferia y procesos.
- Mantiene coherencia en la comunicación mínima de seguridad.

#### El segundo de los fundamentos: Proceso de anclaje raíz segmentados (capa PARS):
Con los fundamentos anteriormente levantados, ahora se procede a instanciar el hardware con servicios a la escucha, atendiendo peticiones de nivel máquina o root. El servicio de comunicación mínima de seguridad, se mantiene aislado y no trivial. Se levanta un segundo puerto de comunicaciones trivial.
(proponer ejemplos)

#### El tercero de los fundamentos: Levantando los servicios BLEND:
Un servicio BLEND o servicio mezcla, es aquel que combina un acceso directo al hardware sin restricciones, obedeciendo a un protocolo de comunicación que al ser atendido por por este servicio, ordena a la parte del hardware que ejecute la orden que le ha entrado. Los servicios BLEND están definidos por la coherencia del hardware y los drivers que lo permiten.

Con esto, hemos terminado de levantar el kernel propiamente dicho.
Con todo lo anterior, ahora el kernel puede gestionar el área administrativa y comunicaciones, por segmentos, dejando al usuario subordinado a un admin. 

Para entender el impacto de esto: Todo usuario, necesita un admin que le reconozca de confianza, todo admin necesita de una firma que sea reconocida por ROOT, todo ROOT necesita una coheremcia proxy y otra remota, para poder actualizarse.

### Levantando los demonios admin:
(rellenar por IA conforme a lo hablado)

### Levantando el host user:
(rellenar por IA conforme a lo hablado)

---

## Filosofía de maGNUx

maGNUx se fundamenta en:
- **Seguridad estructural**: aislamiento entre capas mediante segmentación de memoria.
- **Transparencia al usuario**: la experiencia en `/root-admin>` es equivalente a la de un sistema Linux clásico.
- **Coherencia integral**: garantizada por **Trilobytes**, como núcleo de verificación y control.
- **Evolución del kernel**: transición hacia un modelo gestionado (*managed kernel*), que mantenga compatibilidad con la tradición Linux pero avance hacia un diseño emergente de gestión del software GNU.

---

## Puntos Críticos a Desarrollar (Tareas Pendientes)

Esta sección define los conceptos clave que deben ser aclarados y detallados técnicamente para que el manifiesto sea implementable y coherente.

### 🔴 Conceptos Fundamentales
* **Aclaración sobre la NPU y el Gobierno de la CPU:**
    * Definir el **rol exacto de la NPU**. ¿Es un coprocesador de seguridad (TPM/PSP avanzado) o se utiliza para el *scheduling* y la gestión de políticas? Debe explicarse **cómo** esta NPU "gobierna" la CPU central de x86_64.
* **Definición del Protocolo de las Capas de Comunicación:**
    * Definir el **protocolo específico** de la capa de **Comunicación Operativa**. ¿Se usa *memory-mapped files*, *shared memory* con semáforos, o un sistema de colas de mensajes (IPC) de baja latencia?
* **Especificación de la Capa PRUT (Disco RAM/Swap):**
    * Detallar el mecanismo de **persistencia** y **restauración** de la unidad de trabajo. Clarificar si el "disco RAM" es una porción dedicada de memoria principal, y cómo se garantiza la atomicidad y la integridad de los datos volcados al SAM durante el cierre.

### 🟡 Estructura y Coherencia del Kernel
* **Definición Técnica de "Trilobytes":**
    * Crear una sección para **Trilobytes**. Debe ser definido como el **componente de seguridad y *policy-enforcement***. Explicar su ubicación (¿kernel *namespace* o módulo raíz?) y su función en la **validación de interacciones** entre estratos y servicios BLEND.
* **Mecanismo de 'Prioridad Insubordinable' (CPU-RAM):**
    * Explicar cómo se implementa esta "prioridad" en relación con los niveles de privilegio de hardware x86_64 (Ring 0, etc.). Debe justificarse la modificación necesaria al *scheduler* del kernel estándar.
* **Seguridad del Fundamento 2 (CPU-COMM/Legitimación):**
    * Detallar cómo se **aísla** la comunicación con el "centro oficial de actualizaciones" para evitar vectores de ataque a nivel de red. Debe ser un proceso **solo de verificación (hash/firma)** y no de recepción de código ejecutable.

### 🟢 Servicios de Aplicación
* **Justificación y Seguridad de los Servicios BLEND:**
    * El acceso "sin restricciones" al *hardware* **contradice la seguridad por segmentación**. Es crucial explicar: **1)** ¿Quién otorga el permiso de acceso? (Probablemente Trilobytes/ADMIN). **2)** ¿Cómo se **aísla** el servicio BLEND para que un fallo no comprometa el estrato ROOT? (Posiblemente usando una *sand-box* a nivel de *hardware* o un *memory protection key* específico).
    * *Proponer ejemplos concretos para PARS y BLEND.*
* **Relleno de Estratos ADMIN y USER:**
    * Desarrollar las secciones de **"Levantando los demonios admin"** y **"Levantando el host user"** especificando los demonios clave (ej: *policy enforcer*, *service manager*) y cómo garantizan la segmentación de memoria para el usuario final.

---

## Conclusión

maGNUx no pretende sustituir a Linux, sino **emergir de él** como un kernel gestionado, seguro y coherente. La introducción de la segmentación memoria y el rol de Trilobytes abre la posibilidad de redefinir el paradigma operativo: un sistema que no solo ejecuta procesos, sino que los **supervisa, valida y organiza** en capas jerárquicas.
