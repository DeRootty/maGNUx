> [⬆ Subir al índice principal](README.md) · [🏠 Inicio](README.md)

# Soberanía sistémica: arranque temprano, metal y nodos semióticos

Este documento desarrolla el punto **1. Soberanía sistémica** dentro de maGNUx.

La soberanía del sistema puede entenderse como el gobierno de un sistema ya constituido. La soberanía sistémica apunta antes: al criterio por el cual el hardware acepta convertirse en sistema.

La hipótesis central es:

```text
La soberanía sistémica comienza cuando el hardware,
ya despierto en su programación de metal,
necesita buscar fuera de sí una instrucción legítima
para continuar existiendo como sistema.
```

El punto crítico se sitúa en el momento en que el firmware UEFI busca qué hacer dentro del sistema de almacenamiento declarado como inicio en BIOS/firmware.

En ese instante, el hardware no está todavía gobernado por un sistema operativo. Pero tampoco es puro metal inerte. Ha despertado lo suficiente para buscar una ruta externa de continuidad.

---

## 1. Pregunta inicial

La pregunta central de la soberanía sistémica es:

```text
¿Quién tiene autoridad para decirle al hardware qué debe llegar a ser?
```

Antes del sistema operativo, existen varias capas de autoridad material:

```text
metal
firmware
UEFI/BIOS
configuración de placa
orden de arranque
dispositivo declarado como inicio
```

Pero cuando UEFI busca un ejecutable en almacenamiento, aparece una delegación:

```text
el hardware reconoce que su programación interna no basta
para convertirse en sistema operativo.
```

La máquina busca una instrucción exterior a su programación de metal.

Esa instrucción puede ser:

```text
BOOTX64.EFI
GRUB
systemd-boot
rEFInd
kernel EFI Stub
maGNUxBoot.efi
```

La cuestión soberana no es solo cuál de esos programas se ejecuta, sino bajo qué legitimidad se acepta como continuidad del hardware.

---

## 2. Programación de metal e instrucción externa

En maGNUx conviene distinguir:

| Plano | Significado |
|---|---|
| Programación de metal | Lo que la máquina sabe hacer por diseño físico, firmware y configuración de placa. |
| Instrucción externa | El programa localizado en almacenamiento que indica cómo continuar el arranque. |
| Contrato de arranque | Condiciones que convierten una instrucción posible en instrucción legítima. |
| Soberanía sistémica | Criterio que decide qué instrucción tiene autoridad para convertir hardware en sistema. |

El hardware no se convierte en sistema por existir.

```text
El hardware se convierte en sistema
cuando acepta una instrucción legítima
que le indica cómo continuar.
```

---

## 3. UEFI como búsqueda de continuidad

UEFI representa un momento de búsqueda.

La plataforma ya dispone de una base mínima:

```text
CPU inicial activa
memoria temprana disponible
firmware ejecutándose
dispositivo de arranque declarado
capacidad de leer una partición compatible
```

Pero todavía no existe sistema operativo.

En ese estado, UEFI pregunta materialmente:

```text
¿Dónde está la siguiente instrucción?
```

En un flujo tradicional, esa pregunta suele resolverse en la partición EFI:

```text
/boot/efi
→ puerta firmware
→ ejecutables EFI
→ entrada de arranque compatible
```

En maGNUx se propone añadir una segunda región con significado propio:

```text
/boot/metal
→ nodo semiótico soberano
→ declaración del metal
→ contrato de arranque
→ rutas compatibles y soberanas
```

---

## 4. De /boot/efi a /boot/metal

`/boot/efi` y `/boot/metal` no cumplen la misma función.

| Ruta | Naturaleza | Pregunta que responde |
|---|---|---|
| `/boot/efi` | Puerta firmware | ¿Qué ejecutable puede lanzar la placa? |
| `/boot/metal` | Nodo semiótico soberano | ¿Qué metal estoy arrancando y bajo qué contrato puede convertirse en sistema? |

`/boot/efi` es la puerta de entrada técnica reconocida por UEFI.

`/boot/metal` sería la declaración material y soberana del arranque.

En este planteamiento, `metal` no debe ser una carpeta ordinaria dentro de `/boot`, sino una partición independiente:

```text
partición FAT32 propia
UUID propio
montada en /boot/metal
contenido contractual diferenciado
```

---

## 5. Metal como partición independiente

Al definir `metal` como una partición distinta, maGNUx introduce una segmentación material del almacenamiento.

No se trata solo de ordenar ficheros.

Se trata de asociar:

```text
región física del dispositivo
→ UUID propio
→ punto de montaje
→ manifiestos
→ contratos
→ llaves
→ rutas de arranque
→ significado sistémico
```

La fórmula conceptual es:

```text
metal = partición física + UUID + contrato + significado
```

Por eso `/boot/metal` puede entenderse como el primer signo material de soberanía sistémica.

---

## 6. Nodo semiótico

Un nodo semiótico es un punto material del sistema que no solo existe, sino que significa algo dentro del contrato de arranque.

```text
nodo semiótico
→ punto material
→ estructura declarativa
→ significado operativo
→ posibilidad de interpretación
```

`/boot/metal` no almacena simplemente archivos.

Declara qué significa arrancar sobre ese hardware.

```text
partición física
→ nodo material

UUID
→ identidad técnica

manifiesto
→ identidad declarativa

contrato
→ legitimidad

llaves
→ autoridad verificable

agente IA
→ interpretación semántica
```

---

## 7. Compatibilidad con agentes IA externos

Los nodos semióticos son susceptibles de ser procesados por agentes IA externos.

Eso no significa que la IA gobierne el arranque.

Significa que el arranque puede ser leído semánticamente antes de ejecutarse.

Un agente IA externo podría interpretar:

```text
qué hardware se declara
qué UUID representa cada nodo
qué contrato de arranque se propone
qué rutas son compatibles
qué rutas son soberanas
qué llaves autorizan cada transición
qué recursos están presentes, dormidos, despiertos o vivos
qué incoherencias existen entre declaración y realidad
```

La distribución de roles sería:

| Elemento | Rol |
|---|---|
| IA externa | Interpreta, audita, explica o contrasta significado. |
| Contrato | Fija condiciones de legitimidad. |
| Firmas/llaves | Verifican autoridad. |
| GRUB/maGNUxBoot | Presenta o ejecuta rutas de arranque. |
| seL4/kernel | Toma el relevo técnico. |
| xGNUpeD | Abre identidad y administración soberana. |

La frase núcleo es:

```text
El arranque temprano compatible con IA no busca que la IA gobierne el arranque,
sino que el arranque pueda ser leído semánticamente antes de ejecutarse.
```

---

## 8. Estructura posible de /boot/metal

Una estructura inicial podría ser:

```text
/boot/metal/
├── metal.manifest
├── hardware.map
├── boot.contract
├── identities/
│   ├── host.id
│   ├── distro.id
│   └── recovery.id
├── keys/
│   ├── platform.pub
│   ├── distro.pub
│   └── sovereign.pub
├── entries/
│   ├── compatible-linux.entry
│   ├── sovereign-sel4.entry
│   └── recovery.entry
├── kernels/
│   ├── bzImage
│   └── seL4.elf
└── initramfs/
    └── magnux-initramfs.img
```

Cada archivo tiene función técnica y significado declarativo.

| Archivo | Función técnica | Significado semiótico |
|---|---|---|
| `metal.manifest` | Declara el nodo `metal`. | Este almacenamiento representa la declaración material del sistema. |
| `hardware.map` | Lista hardware esperado. | Este es el cuerpo que debe despertar. |
| `boot.contract` | Define condiciones de arranque. | Estas son las reglas para pasar de metal a sistema. |
| `host.id` | Identidad del host. | Esta máquina tiene una identidad soberana. |
| `compatible-linux.entry` | Entrada de arranque Linux. | Ruta de compatibilidad. |
| `sovereign-sel4.entry` | Entrada de arranque seL4. | Ruta soberana/verificable. |

---

## 9. Modo compatibilidad y modo soberano

El flujo tradicional queda así:

```text
UEFI
→ /boot/efi
→ GRUB
→ menú de inicio
→ Linux
→ /dev, /proc, /sys
→ PID 1
```

El flujo soberano propuesto introduce `/boot/metal`:

```text
UEFI
→ /boot/efi
→ GRUB mínimo o maGNUxBoot
→ /boot/metal
→ contrato
→ menú soberano
→ kernel/microkernel autorizado
→ xGNUpeD
→ administración legítima
```

En modo compatibilidad, el sistema puede seguir arrancando Linux de forma normal:

```text
modo compatibilidad
→ interfaces Linux tradicionales
→ /dev
→ /proc
→ /sys
→ init PID 1 tradicional
```

En modo soberano, la disponibilidad técnica del recurso no basta:

```text
modo soberano
→ cerraduras
→ llaves
→ identidad
→ contrato
→ apertura legítima
```

---

## 10. GRUB, seL4 y maGNUxBoot

GRUB sabe cargar.

seL4 sabe aislar y autorizar mediante una raíz mínima basada en capacidades.

maGNUx debe decidir dónde aparece la soberanía.

No conviene mezclar GRUB y seL4 como si fueran piezas equivalentes.

| Elemento | Rol natural |
|---|---|
| GRUB | Bootloader: carga kernels, muestra menú, lee configuración. |
| seL4 | Microkernel: aislamiento, capabilities, objetos protegidos. |
| maGNUxBoot | Hipótesis de cargador soberano que interpreta `/boot/metal`. |
| xGNUpeD | Gestor de identidad para apertura soberana. |

La vía progresiva sería:

```text
fase 1
→ GRUB sigue existiendo, pero lee /boot/metal y muestra un menú maGNUx

fase 2
→ maGNUxBoot.efi reemplaza a GRUB como cargador soberano mínimo

fase 3
→ seL4 se incorpora como raíz de autoridad para modo soberano
```

---

## 11. El menú como punto de decisión soberana

En el arranque tradicional, el menú de GRUB aparece antes de una raíz fuerte de soberanía.

En maGNUx, se propone que el menú no sea solo una lista de sistemas, sino una decisión sobre el significado del arranque:

```text
Arranque compatible Linux
Arranque soberano maGNUx
Arranque seL4 raíz verificable
Arranque de recuperación
```

Ese menú debería poder basarse en `/boot/metal`.

Así, la selección de una entrada no solo dice:

```text
carga este kernel
```

sino:

```text
ejecuta esta ruta de legitimidad
```

---

## 12. Definición de arranque temprano compatible con IA

Un arranque temprano compatible con agentes IA externos puede definirse así:

```text
Arranque temprano compatible con IA es aquel que,
antes de entregar el relevo definitivo al kernel,
dispone una región material declarativa donde hardware, rutas,
contratos, identidades y llaves quedan expresados de forma estructurada,
legible, verificable e interpretable.
```

Ese arranque no entrega autoridad a la IA.

Entrega inteligibilidad al proceso de arranque.

```text
IA
→ interpreta

contrato
→ legitima

llave
→ autoriza

kernel
→ administra

xGNUpeD
→ soberaniza
```

---

## 13. Relación con soberanía sistémica

La soberanía del sistema puede entenderse como control sobre un sistema ya constituido.

La soberanía sistémica apunta antes:

```text
al criterio por el cual el hardware acepta convertirse en sistema.
```

Por eso no es lo mismo:

```text
soberanía del sistema
→ gobierno de un sistema operativo ya levantado

soberanía sistémica
→ legitimidad del proceso que convierte metal en sistema
```

La soberanía sistémica se sitúa en el umbral:

```text
metal despierto
→ instrucción externa
→ contrato
→ ruta de arranque
→ kernel
→ sistema
```

---

## 14. Fórmula corta

```text
/boot/efi
→ puerta firmware

/boot/metal
→ nodo semiótico soberano

GRUB / maGNUxBoot
→ intérprete de rutas

agente IA externo
→ intérprete semántico

contrato
→ legitimidad

llaves
→ autoridad verificable

kernel / seL4
→ toma de relevo

xGNUpeD
→ apertura soberana
```

---

## 15. Tesis final

```text
El hardware no se convierte en sistema porque exista.
Se convierte en sistema cuando una instrucción legítima,
declarada en un nodo material interpretable,
le indica cómo continuar.
```

En maGNUx, `/boot/metal` representa ese nodo:

```text
una partición física,
con UUID propio,
montada como /boot/metal,
capaz de declarar el significado del arranque
antes de que el kernel convierta el metal en sistema.
```

---

> [⬆ Subir al índice principal](README.md) · [🏠 Inicio](README.md)
