> [⬆ Subir a Arranque temprano](initSoonrise.md) · [🏠 Inicio](README.md)

# Arranque temprano: hardware vivo, ralentí sistémico e inercia de estado

Este documento propone un mapa conceptual para interpretar el **arranque temprano** en maGNUx usando una analogía mecánica: el sistema como un vehículo que pasa de estar apagado, a arrancar en ralentí, a acelerar y finalmente a sostener un régimen estable de operación.

La finalidad de este documento no es describir cada instrucción real del firmware, UEFI, GRUB o el kernel, sino fijar una gramática conceptual para distinguir:

```text
hardware presente
hardware dormido
hardware despierto
hardware vivo
ralentí sistémico
aceleración del kernel
régimen estable
inercia de estado
```

---

## 1. Hardware presente no es hardware vivo

En maGNUx, un recurso físico no se considera vivo solo por existir.

Un módulo de RAM instalado, una CPU soldada en placa, un controlador NVMe o un bus PCIe pueden estar presentes, pero todavía no formar parte de una dinámica operativa real.

La distinción propuesta es:

```text
hardware presente
→ existe físicamente

hardware dormido
→ existe, pero aún no participa en la dinámica operativa

hardware despierto
→ ha sido inicializado hasta poder responder

hardware vivo
→ puede recibir trabajo, producir estado y quedar bajo administración
```

Por tanto:

```text
hardware vivo ≠ hardware detectado
hardware vivo = hardware capaz de responder dentro de una administración
```

---

## 2. El ejemplo del procesador x86_64

En una arquitectura x86_64, el arranque no comienza con todo el procesador plenamente vivo.

Comienza con un núcleo inicial, el **BSP** (*Bootstrap Processor*), que sostiene la primera ejecución. Los demás núcleos, llamados **APs** (*Application Processors*), no están todavía integrados en la dinámica operativa del sistema.

En maGNUx:

```text
BSP activo
→ primera voz ejecutiva del procesador
→ el procesador completo aún no está vivo
```

Mientras solo el núcleo maestro ejecuta el flujo inicial, la CPU existe, pero su vida sistémica está incompleta.

La CPU completa empieza a considerarse hardware vivo cuando:

```text
- el kernel reconoce la topología de CPU;
- se preparan estructuras por CPU;
- se configuran interrupciones;
- se despiertan los APs;
- el scheduler puede asignar tareas a los núcleos;
- los núcleos pueden quedar en idle esperando trabajo.
```

Un núcleo en `idle` no está dormido. Está vivo, integrado y disponible.

```text
idle ≠ dormido
idle = vivo, disponible, sin tarea asignada en ese instante
```

---

## 3. RAM presente, RAM descrita y RAM viva

La memoria RAM tampoco debe entenderse como viva solo por estar instalada en la placa.

La transición conceptual es:

```text
RAM instalada
→ existe físicamente

RAM inicializada
→ el firmware/controlador de memoria puede hablar con ella

RAM descrita
→ firmware/bootloader entregan un mapa de memoria

RAM asumida por el kernel
→ el kernel interpreta los rangos utilizables y reservados

RAM administrable
→ el kernel crea sus estructuras de memoria

RAM viva
→ puede ser asignada, liberada, protegida y usada por procesos/servicios
```

El firmware no entrega normalmente al kernel un fichero temporal de RAM. Entrega una estructura de datos en memoria: un mapa de rangos físicos utilizables, reservados o asignados a firmware, ACPI, MMIO u otros usos.

En modo BIOS clásico, esta información puede llegar mediante E820. En modo UEFI, el cargador obtiene el mapa de memoria mediante servicios de firmware antes de entregar el control definitivo al kernel.

En maGNUx:

```text
firmware
→ declara memoria física inicial

bootloader
→ transporta esa declaración

kernel
→ convierte la declaración en memoria administrable
```

---

## 4. La partición EFI/BOOT como puerta de arranque

En una máquina UEFI, el firmware debe poder detectar una partición de arranque, normalmente una **EFI System Partition** o una partición equivalente montada como `EFI/BOOT`.

Esa partición contiene el ejecutable que permite avanzar al siguiente eslabón:

```text
BOOTX64.EFI
GRUB
systemd-boot
rEFInd
kernel EFI Stub
```

La función de UEFI no es despertar todo el almacenamiento ni comprender todos los sistemas de ficheros del sistema operativo.

Su tarea mínima es:

```text
- detectar un dispositivo de arranque;
- encontrar una partición compatible;
- leer el ejecutable EFI;
- transferir el control al cargador o al kernel EFI Stub.
```

En lenguaje maGNUx:

```text
UEFI no despierta todo el almacenamiento.
UEFI encuentra la puerta de entrada.
```

El kernel será quien más tarde convierta el almacenamiento en recurso vivo administrable mediante drivers, dispositivos de bloque, tablas de particiones y políticas de montaje.

---

## 5. El menú de GRUB como ralentí sistémico

El menú de GRUB puede interpretarse como un estado de **ralentí sistémico**.

Usando la analogía de un motor de combustión interna:

```text
motor apagado
→ hardware presente pero dormido

motor arrancado a ralentí
→ hardware mínimo vivo, estable, sin carga operativa plena

motor bajo carga
→ kernel, drivers, scheduler, servicios y usuarios en operación
```

Cuando GRUB muestra su menú, el sistema no está muerto. Pero tampoco está bajo carga operativa completa.

Está en una situación intermedia:

```text
CPU inicial activa
memoria temprana disponible
salida gráfica o textual disponible
partición de arranque accesible
firmware aún como base de apoyo
cargador preparado para entregar el relevo
```

En maGNUx:

```text
GRUB no arranca sobre un motor apagado.
GRUB aparece cuando el motor sistémico está a ralentí.
```

---

## 6. El final del ralentí

El ralentí termina cuando se selecciona una ruta de arranque.

Mientras GRUB muestra el menú, el sistema sostiene un estado mínimo estable. Pero cuando el usuario elige una entrada, el kernel comienza a cargar y el sistema abandona el ralentí.

La cadena conceptual es:

```text
GRUB en menú
→ ralentí sistémico

selección de entrada
→ fin del ralentí

kernel cargando
→ aceleración sistémica

sistema operativo mínimo
→ régimen estable de conducción
```

A partir de la selección de arranque, el kernel empieza a ocupar RAM con estructuras vivas:

```text
imagen del kernel
initramfs
tablas de páginas
mapas de memoria
estructuras internas
controladores
buffers
cachés iniciales
procesos base
```

---

## 7. El kernel como aceleración del sistema

El kernel toma el relevo desde el estado de ralentí y comienza la aceleración sistémica.

Su función no es simplemente ocupar memoria. Su función es transformar recursos descritos en recursos administrables.

Durante esta aceleración, el kernel:

```text
- interpreta el mapa de memoria;
- reserva sus propias estructuras;
- inicializa la gestión de páginas;
- prepara subsistemas;
- configura interrupciones;
- inicializa drivers;
- detecta buses y dispositivos;
- despierta núcleos secundarios;
- prepara el scheduler;
- monta o recibe initramfs;
- entrega el control a PID 1.
```

En lenguaje maGNUx:

```text
el kernel convierte el ralentí de plataforma en régimen operativo
```

---

## 8. RAM como huella del estado vivo

En esta analogía, la RAM puede interpretarse como el espacio donde el sistema va cargando estado vivo.

Sin embargo, hay que evitar una lectura literal:

```text
más RAM usada ≠ siempre más esfuerzo real
más RAM usada = más estado vivo residente
```

Un sistema puede usar RAM como caché sin estar sometido a una carga crítica. Pero conceptualmente, cuanto más estado operativo reside en RAM, más lejos está el sistema del ralentí inicial.

La RAM ocupada representa:

```text
kernel cargado
servicios activos
procesos vivos
datos en uso
cachés
buffers
estado de dispositivos
contextos de ejecución
```

Fórmula conceptual:

```text
RAM ocupada = huella del estado vivo que el sistema ha decidido sostener
```

---

## 9. Régimen estable e inercia de estado

En un vehículo, cuando se alcanza cierta velocidad, aparece una inercia física. Aunque el conductor deje de acelerar, el vehículo mantiene durante un tiempo el estado alcanzado hasta que las condiciones físicas lo frenan.

En un sistema informático, la analogía no es literal. La RAM no se vacía por rozamiento físico. El sistema no vuelve al ralentí por el mero hecho de que el usuario deje de interactuar.

Una vez el kernel y los servicios mínimos han cargado el estado necesario, el sistema conserva una **inercia de estado**.

```text
estado cargado en RAM
→ inercia sistémica
→ mantenimiento estable mientras no cambie la demanda
```

Esa inercia de estado incluye:

```text
kernel
PID 1
servicios base
drivers
cachés
tablas
procesos
contexto de ejecución
```

Si no se solicita una nueva tarea, el sistema no acelera hacia una carga mayor, pero tampoco vuelve al ralentí temprano. Permanece en régimen estable, esperando eventos, interrupciones o nuevas órdenes.

---

## 10. Estados del vehículo sistémico

| Estado conceptual | Analogía mecánica | Estado del sistema |
|---|---|---|
| Apagado | Motor apagado | Hardware presente, sin vida operativa. |
| Despertar mínimo | Contacto/encendido | Firmware inicializando plataforma. |
| Ralentí | Motor encendido sin carga | GRUB/bootloader con hardware mínimo disponible. |
| Aceleración | Motor subiendo régimen | Kernel cargando estructuras, drivers y subsistemas. |
| Régimen estable | Vehículo manipulable | SO mínimo levantado, PID 1 activo, servicios base. |
| Carga operativa | Conducción bajo demanda | Usuarios, aplicaciones, servicios y tareas activas. |
| Inercia | Velocidad sostenida | Estado vivo residente en RAM mantenido sin nueva demanda. |

---

## 11. Secuencia maGNUx del arranque temprano

```text
[0] Hardware presente
    ↓
[1] Firmware/UEFI inicia plataforma
    ↓
[2] RAM inicializada y descrita
    ↓
[3] BSP sostiene la primera ejecución
    ↓
[4] UEFI localiza partición EFI/BOOT
    ↓
[5] GRUB/cargador aparece en ralentí sistémico
    ↓
[6] Usuario selecciona entrada de arranque
    ↓
[7] Kernel toma el relevo
    ↓
[8] Kernel interpreta RAM, drivers, buses y CPU
    ↓
[9] Kernel despierta núcleos secundarios y prepara scheduler
    ↓
[10] Kernel entrega control a PID 1
    ↓
[11] Sistema mínimo alcanza régimen estable
    ↓
[12] Servicios/usuarios/tareas añaden carga operativa
```

---

## 12. Relación con interfaces y cerraduras

Este mapa conceptual conecta con la bifurcación posterior del kernel:

```text
modo compatibilidad
→ el kernel entrega interfaces

modo soberano
→ el kernel entrega cerraduras
```

Durante el arranque temprano, el sistema todavía no está plenamente en ninguna de las dos formas. Está preparando el suelo material sobre el que el kernel tomará el relevo.

La secuencia conceptual completa sería:

```text
hardware presente
→ hardware despierto
→ hardware vivo
→ ralentí sistémico
→ kernel toma el relevo
→ interfaces compatibles o cerraduras soberanas
→ PID 1 tradicional o xGNUpeD
→ régimen operativo
```

---

## 13. Definición propuesta

Para maGNUx, el arranque temprano puede definirse así:

```text
Arranque temprano es el conjunto de fases que transforman hardware presente
en una plataforma mínima viva, estable y sin carga operativa plena,
capaz de entregar el relevo al kernel.
```

Y el ralentí sistémico puede definirse así:

```text
Ralentí sistémico es el estado en el que la plataforma mantiene activos
los recursos mínimos necesarios para elegir y transferir una ruta de arranque,
sin haber cargado todavía el sistema operativo como régimen estable.
```

La inercia de estado puede definirse así:

```text
Inercia de estado es la permanencia del estado vivo cargado en RAM una vez
el sistema ha alcanzado el régimen operativo solicitado por el arranque,
el usuario o una tarea sistémica.
```

---

## 14. Fórmula corta

```text
GRUB
→ ralentí sistémico

kernel
→ aceleración

SO mínimo
→ régimen estable

RAM ocupada
→ huella del estado vivo

sin nueva demanda
→ mantenimiento de la inercia, no vuelta al ralentí
```

---

> [⬆ Subir a Arranque temprano](initSoonrise.md) · [🏠 Inicio](README.md)
