# Manifiesto de MaKGNUux (Managed's Kernel GNU LinuX)
En este manifiesto, se trata de declarar la filosofia Linux, como un giro tangencial a la filosofia Unix.
Aprendemos de este pasado, que la fuerza está en las piezas simples conectadas por interfaces simples.
maGNUx mantiene eso, pero define diferentes capas de comunicacion, dando una identidad propia a maGNUx en relacion a Linux:
## Identidad centrada en procesadores con arquitectura CISC x86_64
La razon de este acotamiento tecnico, es no trivial, por razones historicas, al reconocer que el juego de instrucciones de este tipo de procesadores, es el resumen historico de lo que el usuario final en el hogar o en la oficina, ha necesitado para resolver sus necesidades de automatizacion de la informacion. maGNUx entiende que, estos procesasdores son ideales para la robotica del hogar o domotica, sea esta expresada en forma de hardware de proposito especifico o de proposito general. Para poder usar las ventajas de estos juegos de instrucciones en enta arquitectura, se reconoce la necesidad de gobernar al procesador central a traves de una NPU, la cual, necesita ser modulada por procesos imperaticos adecuadamente segmentados en las siguientes tres capas bien definidas:

### 1.- Comunicacion operativa.
### 2.- Comunicacion de seguridad o no trivial.
### 3.- Comunicacion administrativa o trivial.

Cada capa, esta protocolizada por la propia distro.
Las comunicaciones operativas, usan una zona de intercambio en RAM/swap montada como disco de trabajo.
y que ese espacio solo se vuelque al Sistema de Almacenamiento Masivo (SAM) en el cierre y se restaure en el arranque.

Así obtenemos simplicidad + trazabilidad.

Referencias de fondo:
“The Linux Kernel Archives” (kernel.org) para el modelo de arranque y subsistemas.
“Filesystem Hierarchy Standard” de Linux Foundation para el orden del árbol.
Documentación clásica de Unix philosophy (Bell Labs).

## Introducción
maGNUx hereda la filosofia Unix pero la acota a la realidad, mediante una arquitectura estratificada:
Son programas minimos, especializados, que hacen una cosa y la hacen bien, y que se conectan entre sí mediante protocolos definidos por la comunidad que mantiene la distro.
Prioriza y globaliza su compatibilidad con el hardware, buscando su mejor rendimiento, frente a la modularidad teorica de Unix, sin que esto suponga una ruptura con su filosofia.

maGNUx arranca por estratos, no por una secuencia que se descarta. Cada estrato queda vivo y sostiene al siguiente.
Estrato ROOT (máquina / kernel): privilegio absoluto, levanta los fundamentos de CPU, RAM, SAM y COMM.
Estrato ADMIN: orquesta, aplica políticas, vigila coherencia y habla con /loadD.
Estrato USER: ofrece el entorno que el usuario reconoce como “un Linux normal” (shell, servicios de usuario, /home).

La clave es que el estrato ROOT no desaparece: sigue siendo el suelo de confianza.

Cuando abordamos el concepto de unidad de trabajo, se hace enfrentando a la CPU como actor principal del trabajo, ya que sin ella, no hay trabajo de sistema posible. Desde este punto, dotamos al kernel de capacidad de entender que procesos estan sometidos a su capa ROOT y cuales no. Hasta que el kernel no este completamente levantado, solo entendera si el proceso tiene privilegios ROOT o no, denegando lo que no este privilegiado a ese nivel.

### Proceso de reconocimiento de unidades de trabajo (capa PRUT):
Usando para ello la memoria swap, que quedara montada como un disco ram, en la que solo, en el cierre del sistema, volcara su contenido al sistema anclado en SAM configurado como vinculo de almacenamiento. Los flujos en este protocolo, pueden ser de texto o no, para formar sistemas más complejos y flexibles, promoviendo la simplicidad, la modularidad y la reutilización del código.

Las colas que se generan en dichas comunicaciones, son referenciadas en el disco ram/swap y rescatadas en cada arranque del Sistema de Almacenamiento Masivo (SAM) montado como particion swap, la cual solo interviene en el arranque y en el cierre de sistema (la particion en disco, no la segmentacion logica).
Las modificaciones que se acometeran sobre el kernel de Linux para que sea coherente en su propia filosofia, y trazable hacia el punto de giro con la filosofia Unix (trazable hacia su punto de origen), esta basada en un kernel con las minimas modificaciones posibles, pero necesarias para que cumpla con estos objetivos:
Para eso, el kernel en su primer estrato, forma esta capa compuesta por tres fundamentos logicos:

#### Conjunto que define el primero de los fundamentos:
En este primer conjunto, hay tres miembros:
1.- La CPU - RAM como fundamento 0:
Puede parecer una tonteria, pero la gestion de la memoria RAM por el procesador, debe ser lo mas limipa, de cara al procesador. Para ello, los privilegios del kernel sobre la RAM son absolutos, y la demanda de trabajo por parte del kernel hacia la CPU es de prioridad insubordinable, cuando el canal de accion parte en origen con las credenciales adecuadas.

2.- La CPU - SAMs como fundamento 1:
La gestion de los sistemas de almacenamiento masivo, debe ser segmentada conforme a puntos de montaje, dando prioridad al aislamiento por segmento y la seguridad en cada acceso segmentado.

3.- La CPU - COMM como fundamento 2:
Lo que se entiende como COMM a este nivel, es la capacidad del kernel de conectar con el centro oficial de actualizaciones del kernel, para legitimar el estado actualizado del mismo, y verificar que no se ha violado la integridad conforme a lo que quedo firmado en la instalacion y las ultimas actualizaciones. Para ello, se usan normativas estandarizadas con IEEE 802.3, PCI / PCIe, PXE, IEEE 802.11 a/b/g/n/ac/ax (Wi-Fi 6), USB / PCIe / M.2 interfaces, USB-IF.
Se crea un espacio intermedio que actúa como bus de comunicación y sincronización entre el nivel máquina y el nivel administrativo.  
   - Reconoce hardware conectado a los buses PCIe, NVME, GPUs, NPUs, APUs, Ethernet, etc que se acopla en modo de expansión relativo al mapeo hecho por Paleolito
   - Gestiona permisos.  
   - Filtra interacciones entre periferia y procesos.  
   - Mantiene coherencia en la comunicación minima de seguridad.

#### El segundo de los fundamentos: Proceso de anclaje raiz segmentados (capa PARS):
Con los fundamentos anterioremente levantados, ahora se procede a instanciar el hardware con servicios a la escucha, atendiendo peticiones de nivel maquina o root. El servicio de comunicacion minima de seguridad, se mantiene aislado y no trivial. Se levanta un segundo puerto de comunicaciones trivial.
(proponer ejemplos)

#### El tercero de los fundamentos: Levantando los servicios BLEND:
Un servicio BLEND o servicio mezcla, es aquel que combina un acceso direco al hardware sin restricciones, obedeciendo a un protocolo de comunicacion que al ser atendido por por este servicio, ordena a la parte del hardware que ejecute la orden que le ha entrado. Los servicios BLEND estan definidos por la coherencia del hardware y los drivers que lo permiten.

Con esto, hemos terminado de levantar el kernel propiamente dicho.
Con todo lo anterior, ahora el kernel puede gestionar el aera administrativa y de usuario por segmentos.

### Levantando los demonios admin:
(rellenar por IA conforme a lo hablado)

### Levantando el host user:
(rellenar por IA conforme a lo hablado)

## Filosofía de maGNUx
maGNUx se fundamenta en:  
- **Seguridad estructural**: aislamiento entre capas mediante segmentación de memoria.  
- **Transparencia al usuario**: la experiencia en `/root-admin>` es equivalente a la de un sistema Linux clásico.  
- **Coherencia integral**: garantizada por Trilobytes, como núcleo de verificación y control.  
- **Evolución del kernel**: transición hacia un modelo gestionado (*managed kernel*), que mantenga compatibilidad con la tradición Linux pero avance hacia un diseño emergente de gestion del software GNU.

---

## Conclusión
maGNUx no pretende sustituir a Linux, sino **emergir de él** como un kernel gestionado, seguro y coherente.  
La introducción de la segmentación memoria y el rol de Trilobytes abre la posibilidad de redefinir el paradigma operativo:  
un sistema que no solo ejecuta procesos, sino que los **supervisa, valida y organiza** en capas jerárquicas.  
