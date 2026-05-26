# 04 — El inicio estratificado del sistema

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> maGNUx arranca por estratos, no por una secuencia que simplemente se descarta.  
> **Cada estrato permanece vivo y sostiene al siguiente.**

---

## La pregunta fundamental

> ¿Quién gobierna el sistema **antes** de que el sistema aparezca como espacio operativo gobernable?

Ahí es donde maGNUx se separa de systemd. No porque niegue el valor de systemd, sino porque entiende que el problema ya no consiste solo en **ordenar servicios**, sino en establecer una **soberanía estructural del arranque** que anteceda a la administración convencional.

> systemd no es el enemigo de maGNUx, sino su **antecedente incómodo**: la prueba de que la historia del sistema empuja hacia formas cada vez más explícitas de coordinación, pero también la prueba de que esa coordinación aún no ha alcanzado su fundamento último.

---

## Secuencia de arranque

### 1. La CPU

El núcleo principal de la CPU se reinicia y el contador de programa se fija en una dirección de memoria predefinida en la flash ROM (BIOS/UEFI).

A partir de ese momento, se ejecuta un pseudosistema de operativa de inicio, declarando en RAM (en la parte más baja) las direcciones base usadas para la carga del bootloader.

---

### 2. El bootloader

Toma el control del estado bootstrap:

- Escribe, de forma contigua, en la parte disponible más baja de la RAM.
- Su objetivo es habilitar la partición boot.
- Hace disponibles los binarios del kernel Linux que el usuario solicitará en su proceso de carga.

> El bootloader define el **chasis**. El kernel debería otorgarle un número y matricular a la máquina, dotándola de una **identidad de Host**.

---

### 3. initramfs o SEL4

Su objetivo final es dar un resultado tan parecido como sea posible a lo que una carga de demonio gestor ACPI pueda resolver:

- Instanciar cuántos núcleos están en modo bajo consumo.
- Dotarles de una puerta de llamada o invocación.
- Aún no se han ejecutado los procesos INIT IPI.

En otras palabras: se debe cargar el initramfs, permitiendo una interfaz de comunicación con el demonio que discrimina si al otro lado de su puerta hay **hardware físico real**.

> Aunque actualmente es volátil, se pretende hacer evidente la necesidad de que **no desaparezca mientras el computador esté encendido**. Vital para definir parte de la identidad droide.

---

### 4. El kernel

#### Estrato host

La parte de reconocimiento de host:

- Lanza los procesos INIT IPI.
- Los esclaviza a la identidad host: solo pueden recibir instrucciones de aquellos demonios levantados por el bootloader.
- El kernel carga en memoria demonios que gestionan el modo de funcionamiento de los núcleos: de modo heredado → modo real → modo largo.
- Dichos demonios quedan a la escucha y a la espera.

#### Estrato run time

La parte de reconocimiento del ciclo Turing:

- Inicia solicitudes.
- Balancea la carga.
- Adjudica tareas.

> Solo el kernel que haya sido instalado en la máquina cuando ésta carecía de sistema operativo podrá acceder a los recursos ACPI.

---

### 5. El Dernel

En pocas palabras: **hace lo que systemd hace, pero solo y únicamente lo que debería de hacer en un entorno de ejecución de seguridad heredada**.

- Da licencia operativa sobre el host al guest.
- Define un host temprano y volutivo, que va ganando áreas de dominio mientras el arranque hace disponible todo el hardware.

#### Por qué mejora la seguridad frente a systemd

Los scripts en bash producen tiempos de ejecución lentos y en ocasiones generan idle en el procesador. En esa época, un idle era hackeable: una ventana para crear una interrupción de solicitud.

SystemD mantiene al procesador principal atareado, sin tiempos para respirar. maGNUx propone una alternativa:

> Para que un proceso se ejecute, las directrices tempranas del levantamiento del host detectarán si es una pieza crítica para continuar con el levantamiento del host, o si sencillamente no aporta nada.  
> Si no aporta → es un exploit.  
> Si aporta → es un proceso válido.

Un arranque de este estilo sería **virtualmente invulnerable a los idle**.

---

## Inicio estratificado: resumen

| Estrato | Función | Estado |
|---|---|---|
| **ROOT** | CPU, memoria, almacenamiento masivo, comunicación mínima de seguridad. | Privilegio absoluto y continuidad material. |
| **COMM** | Orquesta, aplica políticas, vigila coherencia, media entre nivel máquina y nivel administrativo. | Activo durante todo el ciclo de vida. |
| **ADMIN** | Entorno que el usuario reconoce como "un Linux normal": servicios, shell, herramientas, procesos. | Subordinado a ROOT, coordinado por COMM. |

> La clave es que el fundamento inicial **no desaparece**. El suelo de confianza permanece.

---

## La insuficiencia del arranque heredado

### Antes de systemd
- Scripts, convenciones, prioridades implícitas.
- Piezas difíciles de unificar.

### Con systemd
- Orden, gramática y capacidad de administración declarativa.
- Un paso decisivo, pero sigue siendo un orden de software **dentro del host**.

### Con maGNUx
- Soberanía estructural del arranque.
- Identidad del sistema que **antecede** a la administración convencional.

---

*← [Los tres estratos](03-estratos.md) | [Índice](../README.md) | Siguiente: [Bus de arranque →](05-bus-arranque.md)*
