# 04 — El inicio estratificado del sistema

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> maGNUx arranca por estratos, no por una secuencia que simplemente se descarta.  
> **Cada estrato permanece vivo y sostiene al siguiente.**

---

## En pocas palabras

Este documento absorbe la línea antigua de arranque temprano, protosistema raíz, initramfs, seL4, Hurd e init_ID dentro de una sola lectura.

La pregunta central es:

```text
¿quién gobierna el sistema antes de que exista un sistema operativo plenamente gobernable?
```

maGNUx responde que el arranque no debe entenderse como una simple cadena técnica:

```text
firmware → bootloader → kernel → init → servicios
```

sino como una formación progresiva de autoridad:

```text
metal → ruta de arranque → autoridad temprana → identidad → licencia → operación
```

---

## La pregunta fundamental

Antes del userspace, antes de systemd, antes de OpenRC, antes de una shell, el sistema ya está tomando decisiones.

Se decide:

- qué firmware arranca;
- qué dispositivo se considera válido;
- qué bootloader se ejecuta;
- qué kernel se carga;
- qué initramfs acompaña al kernel;
- qué raíz se montará;
- qué proceso recibirá continuidad.

La pregunta soberana es:

```text
¿bajo qué legitimidad se acepta esa continuidad?
```

systemd no es el enemigo de maGNUx. Es su antecedente incómodo: demostró que la coordinación del sistema necesitaba una gramática más explícita, pero todavía opera dentro de un sistema que ya presupone su propia existencia.

maGNUx intenta formular lo anterior:

```text
la legitimidad antes de la administración.
```

---

## Secuencia estratificada de arranque

### 1. Metal y firmware

El hardware despierta desde una programación de metal:

- CPU;
- firmware;
- BIOS/UEFI;
- configuración de placa;
- orden de arranque;
- dispositivos disponibles.

Aquí todavía no hay sistema operativo. Pero tampoco hay pura inercia. La máquina ya está siguiendo reglas.

Este nivel pregunta:

```text
¿dónde debo buscar continuidad?
```

---

### 2. Bootloader

El bootloader toma el control del estado bootstrap.

Su función técnica es cargar el kernel y sus artefactos asociados. Su función conceptual, en maGNUx, es definir el **chasis de continuidad**.

El bootloader no debería ser solo un lanzador. Debería formar parte del contrato inicial:

- qué kernel se carga;
- qué parámetros se pasan;
- qué initramfs se adjunta;
- qué raíz se espera;
- qué modo de arranque se declara;
- qué identidad inicial puede verificarse.

```text
bootloader
→ define la ruta de continuidad
```

---

### 3. Kernel

El kernel reconoce la máquina como superficie técnica:

- CPU;
- memoria;
- dispositivos;
- interrupciones;
- almacenamiento;
- buses;
- controladores;
- modos de ejecución;
- primitivas de proceso y memoria.

Pero reconocer hardware no equivale a declarar soberanía.

En maGNUx, el kernel es la gran base material, pero todavía necesita una capa que formule identidad y contrato.

```text
kernel
→ reconoce recursos
→ expone capacidades
→ todavía no declara por sí solo identidad maGNUx
```

---

### 4. Autoridad temprana

Aquí aparecen las hipótesis absorbidas:

| Hipótesis | Aporte | Límite |
|---|---|---|
| initramfs | Espacio viable hoy para ensayar autoridad temprana en Linux real. | Es volátil y transitorio por diseño tradicional. |
| seL4 | Microkernel formalmente verificado, fuerte en aislamiento y garantías. | No es la vía inmediata sobre Linux existente. |
| Hurd/GNU Mach | Modelo de servidores sobre microkernel, útil para pensar autoridad distribuida. | Madurez y adopción limitadas frente a Linux actual. |
| init_ID | Identidad inicial soberana antes del userspace pleno. | Requiere formalización técnica. |

La conclusión de maGNUx es pragmática:

```text
initramfs es el laboratorio viable actual.
seL4 y Hurd son hipótesis arquitectónicas.
init_ID es la pregunta de identidad temprana.
```

---

## Protosistema raíz

El antiguo “protosistema raíz” queda refundido aquí como el primer estado en el que el sistema puede empezar a decir algo sobre sí mismo.

No es todavía el sistema operativo completo.

Es una raíz mínima capaz de:

- montar lo imprescindible;
- leer política inicial;
- validar estado;
- reconocer hardware crítico;
- preparar comunicación temprana;
- iniciar identidad;
- decidir si continúa o se detiene.

```text
protosistema raíz
→ no es userspace normal
→ no es todavía ADMIN
→ es ROOT en formación
```

---

## initramfs como laboratorio viable

initramfs no es la meta final de maGNUx. Es la prótesis inicial que permite experimentar hoy.

Su valor es que aparece antes del sistema raíz ordinario y puede:

- ejecutar lógica temprana;
- inspeccionar `/proc`, `/sys`, `/dev`;
- montar raíz real;
- decidir continuidad;
- preparar entorno;
- fallar antes de entregar control;
- dejar rastros en `/run`;
- dialogar con `/boot/metal/` en la propuesta Zalty.

En maGNUx, initramfs se interpreta así:

```text
initramfs
→ laboratorio de soberanía temprana
→ espacio transitorio que ensaya permanencia conceptual
→ punto de prueba para xGNUpeD y HostID
```

---

## seL4 como hipótesis de garantía

seL4 aporta otra pregunta:

```text
¿qué ocurriría si la autoridad temprana se apoyara en un microkernel verificado?
```

Su valor conceptual para maGNUx está en:

- aislamiento fuerte;
- razonamiento formal;
- mínima base confiable;
- separación de servidores;
- autoridad explícita.

Pero la fase práctica de maGNUx no empieza sustituyendo Linux por seL4. Empieza usando Linux como laboratorio, sin perder de vista que seL4 representa una dirección de madurez posible.

---

## Hurd como hipótesis de servidores

Hurd/GNU Mach aporta una intuición distinta:

```text
el sistema puede organizar funciones como servidores comunicantes,
no como un bloque monolítico único.
```

Para maGNUx, Hurd es útil no tanto como destino inmediato, sino como recordatorio arquitectónico:

- la autoridad puede distribuirse;
- los servicios pueden tener identidad;
- el sistema puede componerse como conversación de servidores;
- la raíz no tiene por qué ser plana.

---

## init_ID como identidad inicial

init_ID resume la pregunta:

```text
¿qué identidad tiene el sistema en el instante previo a convertirse en sistema operativo visible?
```

No basta con PID 1.

PID 1 puede ser una pieza técnica. init_ID es una identidad de arranque:

- qué arranca;
- por qué arranca;
- qué contrato acepta;
- qué hardware reconoce;
- qué distribución interpreta;
- qué continuidad conserva;
- qué política permite seguir.

init_ID conecta directamente con xGNUpeD:

```text
init_ID
→ pregunta inicial

xGNUpeD
→ formulación de identidad temprana
```

---

## Del arranque heredado al arranque soberano

### Antes de systemd

- scripts;
- prioridades implícitas;
- convenciones dispersas;
- dependencias difíciles de auditar;
- arranque funcional, pero poco declarativo.

### Con systemd

- unidades;
- dependencias;
- cgroups;
- logs;
- sesión;
- estado;
- administración más coherente.

systemd fue un paso decisivo, pero sigue ordenando desde dentro de un host que ya se presupone válido.

### Con maGNUx

- identidad previa;
- contrato de arranque;
- autoridad temprana;
- separación ROOT/COMM/ADMIN;
- licencia Dernel;
- verificación Trilobytes;
- compatibilidad con Linux sin perder horizonte soberano.

---

## Secuencia maGNUx de arranque

```text
metal / firmware
  ↓
bootloader
  ↓
kernel Linux
  ↓
initramfs como laboratorio ROOT
  ↓
init_ID como pregunta de identidad inicial
  ↓
xGNUpeD como formulación de identidad
  ↓
Dernel como licencia operativa
  ↓
Trilobytes como coherencia de sesión
  ↓
ADMIN como operación cotidiana
```

---

## Permanencia del fundamento

La clave de maGNUx es que el fundamento inicial no desaparece.

En el arranque tradicional, muchas piezas tempranas parecen desvanecerse tras entregar control.

maGNUx propone otra lectura:

```text
lo temprano no debe desaparecer;
debe quedar representado como autoridad persistente.
```

Por eso `/run/maGNUx` en Zalty funciona como ensayo de raíz semiótica viva, y `/boot/metal/` como declaración persistente.

---

## Criterio de aceptación conceptual

El inicio estratificado queda correctamente formulado si permite responder:

1. qué autoridad existe antes del userspace;
2. qué papel cumple el bootloader;
3. qué reconoce el kernel;
4. qué puede ensayar initramfs;
5. qué aportan seL4 y Hurd como hipótesis;
6. qué pregunta formula init_ID;
7. cómo aparece xGNUpeD;
8. cómo se entrega continuidad a Dernel;
9. cómo se evita que ADMIN sustituya a ROOT;
10. cómo permanece vivo el fundamento inicial.

---

*← [Los tres estratos](03-estratos.md) | [Índice](../README.md) | Siguiente: [Bus de arranque →](05-bus-arranque.md)*
