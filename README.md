# Manifiesto de MaKGNUux (Managed's Kernel GNU LinuX)

En este manifiesto, se trata de declarar la filosofía Linux, como un giro tangencial a la filosofía Unix. Aprendemos de este pasado, que la fuerza está en las piezas simples conectadas por interfaces simples. maGNUx, es un linux con filosofia propia, necesaria para transmitir el legado, pero entendiendo que, la parte imperativa inherente a los fundamentos desde los que emerge, necesitan de los fundamentos declarativos desde los que funcionan las IAs. Si bien el uno no depende del otro, hacerlo sin una reestructuración de la arquitectura que permite ser levantado, es una gran vulnerabilidad sin posibilidad de evitar su colapso.
Levantar maGNUx requiere de la definicion de primitivas o formas base con las que se construiran los grafos de traza, que permiten al sistema ser auditado.
En maGNUx se entiende al Root como la entidad formada por cuatro dominios. Si no se tiene autoridad en los 4 dominios, no hay formacion de Root. Un dominio se caracteriza por una serie de servicios y el conjunto de todos los servicios y su dominio, definen al Root. Por lo tanto, Root comienza su levantamiento en el momento que se incia el primer servicio operativo, por muy primitivo que sea, o por muy abstraido que llegue a ser su carga:

* Servicios primitivos (Dominio directo insubordinable. Acceso directo a los recursos).
* Servicios de comunicacion LAN - INET (Dominio directo subordinado. Abstraccion a nivel estandares hardware).
* Servicios administrativos (Dominio indirecto insubordinable. Abstraccion a nivel drivers. Se define el host).
* Servicios de usuario (Dominio indirecto subordinado. Abstraccion a nivel virtualizado directo: El usuario accede en forma de VM a los recursos, tipo Guest).


## Identidad centrada en procesadores con arquitectura CISC x86_64
Definir un orden de capas primitivas de comunicación, dando una identidad propia a maGNUx en relación a Linux:

El kernel necesita conectar con un servicio que he llamado xGNUpeD. No es un SystemD, debido a que este último se despliega después de que el kernel haya adoptado la identidad distributiva otorgada por xGNUpeD.

* Identidad distributiva. Identidad comunitaria de distribución.
* Identidad conmutativa. Identidad con capacidad de filtrar y asegurar su identidad de forma directa e inversa en relación a un sistema GNU Linux tradicional. Para poder suplantarlo, hay que usar la fuerza, no se puede suplantar desde su naturaleza.
* Identidad asociativa. El usuario final podrá expresarse con total libertad, pudiendo asociar su capacidad creativa y productiva, a la comunidad que le da soporte, con integridad y coherencia a la hora de conmutador a un sistema GNU Linux tradicional.
* Identidad comunicativa: Toda instalación de sistema, tendrá una matricula de registro que le dotará de libertad, con capacidad de sertrazadoy auditado en lo relativo al funcionamiento del sistema.

Estas cuatro propiedades otorgadas por xGNUpeD se deben cumplir en relación a su herencia y proyectando hacia su superficie identificativa. Cuanto mayor sea la linea temporal sobre la que basamos la identidad, mayor es la superficie en identificación sumando dificultad en la suplantación.

La razón de este acotamiento técnico, es no trivial, por razones históricas, al reconocer que el juego de instrucciones de este tipo de procesadores, es el resumen histórico de lo que el usuario final en el hogar o en la oficina, ha necesitado para resolver sus necesidades de automatización de la información. maGNUx entiende que, estos procesadores son ideales para la robótica del hogar o domótica de propósito general, integrando a la NPU en un contexto bastante robusto. Para poder usar las ventajas de estos juegos de instrucciones en este vector de ingenieria, se reconoce la necesidad de gobernar al procesador central a través de una NPU, la cual, necesita ser modulada por procesos imperativos adecuadamente segmentados en las siguientes tres capas bien definidas:

## compatibilidad por herencia

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

## Introducción

maGNUx hereda la filosofía Unix pero la acota a la realidad, mediante una arquitectura estratificada: Son programas mínimos, especializados, que hacen una cosa y la hacen bien, y que se conectan entre sí mediante protocolos definidos por las directrices marcadas en xGNUpeD. Prioriza y globaliza su compatibilidad con el hardware, buscando su mejor rendimiento, frente a la modularidad teórica de Unix, sin que esto suponga una ruptura con su filosofía.

maGNUx arranca por estratos, no por una secuencia que se descarta. Cada estrato queda vivo y sostiene al siguiente.

* Estrato ROOT (máquina / kernel): privilegio absoluto, levanta los fundamentos de CPU, RAM, SAM y COMM.
* Estrato COMM: orquesta, aplica políticas, vigila coherencia y habla con /loadD.
* Estrato ADMIN: ofrece el entorno que el usuario reconoce como “un Linux normal” (shell, servicios de usuario, /home); pero no es un usuario normal.

La clave es que el estrato ROOT no desaparece: sigue siendo el suelo de confianza.

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
