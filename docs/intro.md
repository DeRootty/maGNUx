> [inicio](README.md)

# Introduccion
- ADVERTENCIA: Las diferencias ontologicas entre lo que la UE entienden por identidad digital y lo que aqui se desarrolla para la identidad soberana del hardware, pueden crear incompatibilidades con lo dispuesto, a dia de hoy, por la UE.
- DEFINICIONES PREVIAS: Debido a que este contenido describe una arquitectura de soberania enraizada, dicha peculiaridad necesita de definiciones para enfocar la ontologia que se sigue. 
- - 1. I.A. sistémica: A diferencia de las I.A.s por servicio, la I.A. sistémica no se "programa" mediante LLMs, muy por el contrario, es la interfaz que permite hablar directamente con el procesador central en un lenguaje frontera, que no es ni ensamblador ni maquina, es un lenguaje de medio nivel. 
- - 2. Lenguaje de medio nivel: Lenguajes orientados a procesos, como el lenguage C. 
- - 3. Soberanía inteligente por host: Hardware especulado y futuro necesario para crear un subsistema capaz de almacenar pesos de entrenamiento, lanzar programas en C para que la IA directamente los compile al lenguaje ensamblador y maquine el balanceado de las cargas del procesador central. En pocas palabras, seria el subsistema que una NPU necesita como driver para poderse comunicar soberanamente con la CPU.

# ENTRANDO EN MATERIA:
Lo que actualmente conocemos, no son sistemas operativos con soberania enraizada, por una sencilla razon: EL hardware no esta preparado y aun no ha habido lumbreras que sea capaz de crear un hack por soft que lo emule.

> En este manifiesto tratara de explicar como crear una emulacion por software, con herramientas ya creadas y otras por desarrollar. Se explicara el papel que cada herramienta desarrollara, dejando en claro las areas de minima accion que se despejan y quedan como recursos para poder ir levantando el resto del sistema.

## Ontologia base y filosofia del software:
Linux no es Unix, pero ambas filosofias de software tienen el mismo fundamento. No obstante, Linux ejerce una libertad aun teniendo como reflejo la filosofia Unix, que necesita ser declarada como un potencial de desarrollo con una gravedad intrinseca que pone bajo dominio unas inercias filosoficas propias que aun no han sido sistematizadas y puestas de manera coherente, permitiendo un estudio y ciencia de crecimiento en torno a ello. Por ello, un sistema para que sea soberano desde su raiz, debe estar postulado con un giro ontologico de caracter tangencial a la filosofía Unix. Formular con claridad las necesidades que se hacen evidentes para que Linux sea compatible con un sistema soberano desde su raiz. Actualmente, el kernel de Linux aun no expresa de forma estructural una soberania de raiz, pues no estan diferenciadas las capacidades de **gobernar el sistema** y las capacidades de **operarlo**. 

El sistema que mas se aproxima a esto, es SeL4. La motivación del manifiesto es la seguridad y la coherencia de un sistema operativo preparado para integrar, en el futuro, formas de decisión más complejas, incluidas lógicas declarativas, automatización avanzada e inteligencia artificial sistémica. Hoy, ni el hardware de propósito general ni la arquitectura clásica del arranque ofrecen una base suficiente para esa integración con soberanía estructural completa. Por ello, maGNUx plantea una transición: apoyarse en Linux como suelo real, mientras se definen nuevas capas de identidad, gobierno, comunicación y operación.

Este manifiesto no presenta un sistema terminado. Presenta una **ontología de sistema**, una arquitectura seguridad mínima en el arranque y levantamiento del sistema. Estos hacks no son excluyentes, sino necesarios aunque el hardware esté debidamente conceptualizado en arquitectura, para dar soporte sistémico a la IA.

A este nivel, tenemos tres caminos a recorrer: Usar el propio initramfs de linux como autoridad temprana, disponer un sistema operativo de bajo nivel como pueda ser sel4 o investigar sistemas microkernel de proposito general, como pueda ser Hurd, para adaptarlos a un arranque con autoridad temprana, quedando siempre Linux en el area de sistemica operativa.

Por todo lo anterior, Puede que esta lectura te parecezca filosóficamente interesante, arquitectónicamente provocadora y técnicamente incompleta.

> [inicio](README.md)
