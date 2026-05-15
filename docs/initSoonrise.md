> [⬆ Subir al índice principal](README.md) · [🏠 Inicio](README.md)

# Arranque temprano: hardware vivo, ralentí sistémico e inercia de estado

Este documento desarrolla el punto **2. Arranque temprano** dentro de maGNUx.

Su objetivo es fijar una gramática conceptual para explicar cómo una plataforma pasa de tener hardware físicamente presente a sostener un estado mínimo vivo, estable y preparado para entregar el relevo al kernel.

La analogía central es mecánica: el sistema se interpreta como un vehículo que pasa por varios estados:

```text
apagado
→ despertar mínimo
→ ralentí
→ aceleración
→ régimen estable
→ carga operativa
→ inercia de estado
```

La finalidad de este documento no es describir cada instrucción real del firmware, UEFI, GRUB o el kernel, sino distinguir con precisión:

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

El arranque temprano no debe limitarse a preguntar qué hardware existe, sino qué hardware está suficientemente despierto para sostener el relevo posterior del kernel.

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

Esta distinción permite separar tres ideas:

```text
CPU presente
→ existe físicamente

CPU parcialmente despierta
→ el BSP sostiene el arranque inicial

CPU viva
→ todos los núcleos integrables pueden recibir trabajo o permanecer en idle controlado
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

Por tanto, la RAM no se vuelve viva por estar instalada, sino cuando el sistema puede administrarla como espacio de estado, ejecución, caché, datos y contexto.

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

La partición EFI/BOOT representa, por tanto, una puerta mínima de arranque: no es todavía el sistema operativo, sino el punto de acceso desde el que el sistema puede escoger una ruta de carga.

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

Ese ralentí no representa administración plena del sistema. Representa una estabilidad mínima que permite decidir cómo se va a cargar el sistema.

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

El sistema deja de estar en espera temprana y entra en una fase de aceleración organizada.

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

El kernel no recibe hardware plenamente administrable. Recibe una plataforma mínima viva y comienza a transformarla en un sistema capaz de sostener servicios, procesos, memoria viva, dispositivos y políticas.

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

Por tanto, la RAM no se interpreta solo como consumo. También puede interpretarse como la memoria material del régimen que el sistema ha alcanzado.

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

En maGNUx, esa inercia no es física, sino administrativa: el sistema sostiene el estado vivo que ha decidido cargar.

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

Esta distinción permite ubicar el punto 2 como antesala del punto 3:

```text
2. Arranque temprano
→ prepara hardware vivo y ralentí sistémico

3. Carga del kernel
→ transforma ese suelo vivo en interfaces compatibles o cerraduras soberanas
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

## 15. Relación con los documentos siguientes

Este documento actúa como puerta conceptual para los documentos que desarrollan el arranque temprano:

| Punto | Documento | Relación |
|---|---|---|
| 2.1 | [Protosistema raíz](systemProt.md) | Define la primera base de autoridad sistémica. |
| 2.1.1 | [Postulado de Hurd](Hurd.MD) | Explora una hipótesis multiserver sobre microkernel. |
| 2.1.2 | [Postulado de initramfs](initramfs.MD) | Estudia la autoridad temprana viable sobre Linux actual. |
| 2.1.3 | [Postulado de seL4](seL4.MD) | Considera una raíz mínima verificable y basada en capacidades. |
| 2.1.4 | [Postulado de inicio nativo con init_ID](initID.MD) | Propone una identidad inicial nativa para el arranque. |
| 2.2 | [Host: Soberanía enraizada](hostroot.md) | Sitúa la identidad material de la máquina como host soberano. |
| 2.3 | [Kommu: Sistema de comunicaciones tempranas](kommu.md) | Define la comunicación inicial entre capas sistémicas. |
| 2.4 | [Levantamiento del VMKZ](VMKZ.md) | Describe el levantamiento del plano raíz/host. |
| 2.4.1 | [Declaración de un contrato de sistema operativo](contractOS.md) | Formaliza condiciones de validez para el sistema operativo. |

---

> [⬆ Subir al índice principal](README.md) · [🏠 Inicio](README.md)
