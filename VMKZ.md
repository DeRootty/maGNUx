> [Inicio](README.md)

# VMKZ: Mapa Vivo de Kernelización de Zonas

Durante el arranque temprano de un sistema, antes de que existan drivers completos, servicios de usuario, procesos de escucha avanzados o abstracciones de alto nivel, el sistema necesita responder una pregunta elemental:

**¿Qué hardware físico existe realmente, dónde responde y bajo qué condiciones puede ser usado?**

En esta fase, el sistema aún no dispone de una estructura operativa madura. No existe todavía una capa completa de drivers, no hay una gestión avanzada de dispositivos y muchas de las garantías habituales del sistema operativo aún no están disponibles. Sin embargo, dentro de la dinamica de arranque estructurada, ya tenemos el host definido, que no es mas que una lista descriptiva pasiva del hardware que ya esta presente. VMKZ asocia el host a una declaracion de recursos, establece unas minimas garantias de respuesta a rangos de memoria concretos, genera interrupciones y accede a la relacion de lo que aparece descrito mediante mecanismos proporcionados por el firmware o la plataforma.

El **VMKZ** nace para representar esa fase.

VMKZ puede definirse como el **mapa temprano de zonas vivas de memoria asociadas a hardware real**. Su función es registrar, durante el levantamiento inicial del sistema, qué regiones de memoria, interrupciones y recursos físicos corresponden a dispositivos existentes, declarados o verificados. Al mismo tiempo, actúa como una capa mínima de arbitraje: un semáforo primitivo que controla qué componente del sistema puede tocar cada recurso mientras todavía no existe una infraestructura completa de drivers. Hace uso del kommu para la firma verificada en el destino definido en la fuente de obtencion de la licencia del sistema.

En otras palabras, VMKZ no es un driver. Tampoco es un sustituto del kernel ni del sistema de gestión de dispositivos. Es una capa previa de conocimiento, registro y control.

Su propósito es permitir que el sistema sepa:

```text
Obtengo licencia de garantia de host.
Este hardware existe.
Responde en esta zona de memoria.
Puede generar interrupciones en este vector o línea.
Su estado actual es conocido.
Nadie debe escribir aquí sin reservar antes el recurso.
Estas directrices quedan al servicio de las siguientes etapas del levantamiento del sistema.
```

## Función dentro del arranque temprano

En el arranque temprano, el sistema no puede asumir todavía que todos los dispositivos estén disponibles de forma segura. Antes de inicializar drivers complejos, necesita construir una visión mínima del hardware presente.

Según la arquitectura, esa información puede proceder de diferentes fuentes:

```text
BIOS / UEFI
ACPI
Device Tree
tablas entregadas por el bootloader
enumeración PCI / PCIe
sondeo controlado de MMIO
parámetros del kernel
tablas propias del sistema
```

VMKZ no debe entenderse como una capa mágica que descubre todo por sí misma. Su papel es más realista y más importante: **unificar, registrar y custodiar la información temprana sobre los recursos físicos disponibles**.

Puede recibir información declarada por firmware, verificar rangos de memoria cuando sea seguro hacerlo, registrar interrupciones asociadas a dispositivos y marcar el estado inicial de cada recurso. De esta manera, cuando posteriormente se carguen drivers completos, estos no parten de la nada, sino que consultan una base temprana de recursos previamente localizada, anotada y protegida.

## VMKZ como semáforo

Una de las funciones centrales de VMKZ es actuar como semáforo de acceso.

En sistemas de bajo nivel, una dirección de memoria no es simplemente un número. Puede representar RAM, memoria reservada, registros de un dispositivo, una ventana MMIO, una tabla de control, una zona DMA o un recurso sensible del hardware. Escribir en una dirección equivocada, hacerlo demasiado pronto o permitir que dos componentes accedan al mismo recurso sin coordinación puede provocar bloqueos, corrupción de estado o fallos silenciosos muy difíciles de depurar.

Por eso, VMKZ debe registrar no solo la existencia de un recurso, sino también su estado operativo mínimo:

```text
Recurso: UART0
Rango MMIO: 0x09000000 - 0x09000FFF
IRQ: 33
Estado: detectado
Propietario: ninguno
Bloqueo: libre
Fase: pre-driver
Permisos: lectura/escritura temprana controlada
Origen: Device Tree / ACPI / sondeo verificado
```

Con esta información, el sistema puede impedir accesos prematuros, duplicados o incoherentes. VMKZ permite saber si una zona está libre, reservada, en uso, bloqueada, pendiente de verificación o ya cedida a un driver posterior.

Esta función es especialmente importante porque, durante el arranque temprano, todavía no existe una autoridad plenamente madura que gobierne todos los accesos al hardware. VMKZ introduce una primera disciplina: antes de usar un recurso físico, este debe estar identificado, registrado y, si procede, reservado.

## Relación con los drivers

VMKZ no pretende reemplazar a los drivers. Su función es anterior.

Un driver completo sabe operar un dispositivo: inicializarlo, configurarlo, gestionar interrupciones, exponer interfaces al sistema, manejar errores y proporcionar servicios a capas superiores.

VMKZ, en cambio, solo responde a preguntas previas:

```text
¿Existe este dispositivo?
¿Dónde responde?
¿Qué interrupción declara o utiliza?
¿Qué rango de memoria ocupa?
¿Está libre o reservado?
¿Quién lo ha tocado durante el arranque?
¿En qué fase se encuentra?
```

Cuando el driver se carga, puede reclamar formalmente el recurso. En ese momento, VMKZ puede transferir el control (caso de compatibilidad de sistema operativo tradicional) o, actualizar el estado del recurso si asi compete o denegar el uso del mismo:

```text
Estado anterior: detectado, pre-driver, libre
Estado nuevo: reclamado por driver UART0
Propietario: uart_driver
Bloqueo: gestionado por subsistema de drivers
```

De este modo, VMKZ actúa como puente entre el hardware bruto y la gestión madura del sistema operativo.

## Trazabilidad y soberanía del levantamiento

El valor de VMKZ no está únicamente en mapear direcciones. También está en ofrecer trazabilidad.

Un sistema soberano no solo debe funcionar; debe poder explicar cómo ha llegado a estar funcionando. Debe poder reconstruir qué recursos fueron detectados, en qué orden, por qué fuente, con qué estado y bajo qué autoridad fueron entregados a capas superiores.

VMKZ permite registrar esa transición desde el hardware bruto hacia el sistema operativo organizado.

En este sentido, VMKZ forma parte de una arquitectura de levantamiento soberano: una arquitectura donde el arranque temprano no es tratado como una fase opaca y desechable, sino como una etapa crítica de constitución del sistema.

Antes de que existan procesos de usuario, antes de que existan servicios, antes de que el sistema tenga una identidad operativa completa, VMKZ contribuye a crear una primera identidad material:

```text
Estos son los recursos físicos presentes.
Estas son las zonas vivas.
Estos son los accesos permitidos.
Estos son los recursos reservados.
Este es el estado inicial del hardware.
```

## Diferencia entre memoria y hardware vivo

Una distinción importante dentro de VMKZ es que no toda dirección de memoria representa lo mismo.

Durante el arranque temprano, el sistema debe diferenciar entre:

```text
RAM utilizable
RAM reservada
memoria ocupada por firmware
regiones del kernel
initramfs
tablas de arranque
zonas MMIO
registros de dispositivos
memoria DMA
zonas prohibidas
zonas no verificadas
```

VMKZ se centra especialmente en las zonas donde existe una relación directa entre dirección y hardware real. Es decir, aquellas regiones que no son simplemente memoria general, sino puntos de contacto con dispositivos físicos.

Estas zonas vivas deben ser tratadas con más cuidado que la RAM ordinaria. Leer o escribir en ellas puede activar comportamientos del hardware, borrar flags, lanzar operaciones, modificar estados internos o provocar interrupciones.

Por eso, VMKZ no solo mapea: también clasifica.

## Definición formal

Una definición técnica compacta podría ser la siguiente:

```text
VMKZ es una estructura temprana de mapeo, clasificación y arbitraje de zonas de memoria asociadas a hardware físico durante el arranque inicial del sistema.

Su función es registrar recursos detectados o declarados, asociar rangos de memoria e interrupciones a dispositivos reales, controlar el acceso inicial mediante un mecanismo de semáforo y proporcionar trazabilidad hasta que los drivers completos asuman la gestión de dichos recursos.
```

## Definición simple

En términos más directos:

```text
VMKZ es el mapa de las zonas de memoria donde vive el hardware antes de que existan drivers completos.
```

Y como metáfora:

```text
VMKZ es como el plano provisional de una ciudad recién encendida.

Antes de que lleguen los especialistas, el sistema mira qué edificios existen, qué puertas responden, qué cables están activos y qué salas no deben ser tocadas por dos personas a la vez. Luego coloca señales, reservas y avisos para que el resto del sistema pueda entrar sin romper nada.
```

## Papel dentro de maGNUx

Dentro de maGNUx, VMKZ puede entenderse como una pieza del protosistema raíz. No pertenece todavía al mundo completo de usuarios, servicios y drivers maduros. Pertenece a la fase en la que el sistema empieza a reconocerse a sí mismo sobre el hardware.

Su papel es ayudar a que el levantamiento no sea una sucesión ciega de llamadas, sino una construcción ordenada:

```text
1. El sistema arranca.
2. Se recibe o verifica información temprana del hardware.
3. VMKZ registra las zonas vivas.
4. VMKZ clasifica memoria, MMIO, interrupciones y recursos.
5. VMKZ actúa como semáforo de acceso.
6. Los componentes tempranos consultan y reservan recursos.
7. Los drivers posteriores reclaman formalmente dichos recursos.
8. El sistema conserva trazabilidad del proceso.
```

Con esto, maGNUx no trata el arranque temprano como una simple antesala del sistema operativo, sino como una fase con identidad propia. VMKZ es una de las piezas que permite convertir esa fase en algo auditable, ordenado y técnicamente gobernable.

## Conclusión

VMKZ representa una idea central: antes de operar el hardware, el sistema debe reconocerlo, mapearlo y regular su acceso.

En el arranque temprano, el peligro no está solo en no saber programar un dispositivo, sino en no saber todavía qué zonas son seguras, qué recursos están vivos, qué direcciones tienen efectos físicos y qué componente tiene autoridad para usarlas.

VMKZ propone una respuesta a ese problema: construir un mapa temprano de hardware real, asociado a memoria e interrupciones, con estado, bloqueo, origen y trazabilidad.

No sustituye a los drivers. No sustituye al kernel. No elimina la necesidad de ACPI, Device Tree, PCI, firmware o mecanismos propios de cada arquitectura.

Su función es otra: actuar como una capa inicial de conciencia material del sistema.

Antes de que el sistema pueda decir “estoy funcionando”, debe poder decir:

```text
Sé qué hardware tengo.
Sé dónde responde.
Sé quién puede tocarlo.
Sé en qué estado está.
Y sé cómo he llegado hasta aquí.
```
> [Inicio](README.md)
