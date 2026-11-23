# 05 — Bus de comunicación de arranque

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

---

## En pocas palabras

El **bus de comunicación de arranque** es la infraestructura conceptual que permite que el sistema no arranque como una suma muda de piezas, sino como una secuencia coordinada de identidad, estado, validación y continuidad.

No se trata de un bus físico en sentido estricto. Es una forma de nombrar la comunicación temprana necesaria entre:

- firmware;
- bootloader;
- kernel;
- initramfs;
- xGNUpeD;
- Dernel;
- política de arranque;
- declaración semiótica del sistema;
- estado runtime temprano.

---

## La exigencia

Todo lo anterior conduce a una exigencia: el sistema necesita un canal temprano capaz de articular, antes del userspace ordinario:

| Capacidad | Descripción |
|---|---|
| Identidad | El sistema sabe quién es desde el arranque. |
| Estado deseado | Declara cuál es la configuración legítima. |
| Validación | Verifica que lo que arranca coincide con lo declarado. |
| Secuenciación | Ordena el levantamiento de capas sin ambigüedad. |
| Permisos | Discrimina qué procesos acceden a qué recursos. |
| Reconciliación | Detecta divergencias de estado. |
| Persistencia inicial | El suelo de confianza no desaparece tras arrancar. |
| Comunicación | Transmite eventos tempranos de forma trazable. |

Sin ese bus, el arranque depende de piezas que comunican, pero no necesariamente bajo una semántica común.

---

## Kommu absorbido

El corpus anterior nombraba **Kommu** como sistema de comunicaciones tempranas.

Refundido aquí, Kommu representa la dimensión COMM del arranque:

```text
Kommu
→ comunicación temprana
→ coherencia entre capas
→ mediación antes del userspace pleno
```

Kommu no es simplemente red. Tampoco es únicamente IPC.

Kommu es la pregunta:

```text
¿cómo se comunican las capas del sistema
antes de que el sistema tenga una administración ordinaria?
```

---

## Identidad comunicativa absorbida

La identidad comunicativa, desarrollada en el bloque de identidad, aparece aquí como condición arquitectónica.

Un sistema que comunica sin identidad puede transmitir datos, pero no autoridad.

Por eso el bus de arranque debe transportar algo más que mensajes:

- quién emite;
- en qué fase emite;
- qué estado declara;
- qué recurso solicita;
- qué contrato invoca;
- qué respuesta recibe;
- qué queda registrado.

```text
mensaje temprano
+ identidad
+ fase
+ política
= comunicación arquitectónica
```

---

## El límite actual

Mientras ese bus no exista materialmente, el sistema seguirá dependiendo de soluciones software que, por elegantes que sean, arrastran el límite de:

> Querer gobernar desde dentro del mismo flujo que intentan someter a orden.

Esta es la razón por la que maGNUx no presenta el bus de arranque como algo ya implementado, sino como una exigencia arquitectónica.

---

## initramfs como parche legítimo

initramfs no es la culminación del proyecto ni la solución final. Pero representa, en las condiciones actuales del hardware, el único espacio real desde el cual imaginar una persistencia inicial del sistema que no dependa enteramente de la lógica tardía del espacio de usuario convencional.

En maGNUx, initramfs se entiende como:

- parche ontológico y técnico;
- prótesis transitoria;
- región inicial de Linux puro;
- soporte experimental para soberanía de arranque;
- primer lugar donde ensayar xGNUpeD y HostID;
- espacio desde el que construir `/run/maGNUx`.

---

## `/boot/metal/` y `/run/maGNUx/`

La línea Zalty introduce una distinción importante:

```text
/boot/metal
→ declara

/run/maGNUx
→ ensaya

/upLoad
→ integraría en una fase futura
```

### `/boot/metal/`

Funciona como raíz semiótica persistente:

- contratos;
- nodos;
- políticas;
- identidades;
- declaraciones de arranque;
- expectativas de hardware;
- criterios de continuidad.

No sustituye a `/boot/efi`. No sustituye a `/`.

Declara cómo debe interpretarse el arranque.

### `/run/maGNUx/`

Funciona como raíz semiótica viva transicional:

- estado runtime;
- enlaces a nodos técnicos;
- informes;
- coherencia entre `/dev` y nodos semióticos;
- trazas tempranas;
- resultado de validación.

No es una copia de `/`. Es una interpretación viva.

### `/upLoad/`

Queda reservado como hipótesis futura:

```text
/upLoad
→ raíz de nodos semióticos kernelizados
```

Durante la fase inicial, `/run/maGNUx` ensaya lo que `/upLoad` podría integrar si el modelo madura.

---

## Persistencia, estado vivo y canal transversal α

La llegada del modelo RGBA añade nuevos consumidores de identidad y contrato, pero **no transforma `/boot/metal/` en un bus de memoria compartida**.

Se distinguen tres funciones:

- **Persistencia material y contractual** (`/boot/metal/` como ruta visible tras su montaje): manifiestos, identidad, contratos y dependencias verificables de arranque; exigencia de autenticidad, integridad, protección frente a rollback y política de escritura.
- **Estado semiótico operativo** (`/run/maGNUx/` en la ruta Linux de Zalty): observaciones, validaciones, relaciones entre objetos y evidencias transitorias, sin sustituir la autoridad de la fuente persistente.
- **Comunicación de ejecución α–Linux**, si se adopta la ruta futura seL4: IPC, mensajes o memoria compartida expresamente diseñada, con aislamiento entre dominios y control de propiedad de buffers y dispositivos; una partición SSD/FAT no proporciona esas garantías por sí sola.

Los objetos emergentes del canal G y B deben identificar origen y dependencias materiales, para que Trilobytes pueda reconstruir el grafo `R → G → B` y revelar una sesión coherente. Sus eventos pueden utilizar nodos semióticos contratualmente habilitados. **Observar un evento no equivale a autorizar una acción**.

La capacidad de α para comunicar avisos mediante Trilobytes no debe corromper la entrada del usuario en TTY ni conceder privilegios por el texto recibido. Las inferencias son datos; las decisiones ejecutivas siguen sometidas a contratos y mecanismos efectivos.

La especificación [04 — Sesión RGBA](../propuesta-tecnica/04-sesion-rgba-spec.md) propone el flujo de estados sin establecer todavía el transporte concreto entre los futuros dominios.

---

## Nodos técnicos y nodos semióticos

Linux expone nodos técnicos:

```text
/dev/null
/dev/zero
/dev/random
/dev/console
/dev/kmsg
/sys
/proc
```

maGNUx/Zalty propone asociar esos nodos con nodos semióticos:

```text
/boot/metal/nodes/...
/run/maGNUx/dev/...
```

El objetivo no es duplicar Linux, sino interpretar lo que Linux levanta técnicamente.

Ejemplo conceptual:

```text
/dev/null
→ nodo técnico

/boot/metal/nodes/dev/essential.toml
→ declaración semiótica

/run/maGNUx/dev/null/report.toml
→ estado vivo interpretado
```

---

## Qué debería transportar el bus

Un bus de arranque maGNUx debería poder transportar:

| Tipo | Ejemplo |
|---|---|
| Identidad | host-id, distro-id, kernel-id. |
| Estado | hardware detectado, nodos disponibles, fase actual. |
| Política | contratos TOML, reglas de validación, modo de arranque. |
| Eventos | montaje, fallo, validación, denegación, degradación. |
| Permisos | qué puede continuar, qué queda bloqueado. |
| Trazas | informes en `/run/maGNUx`, logs tempranos. |
| Continuidad | paso hacia Dernel, Trilobytes y ADMIN. |

---

## Relación con hardware futuro

maGNUx reconoce un límite: ciertos cambios no madurarán por completo si el hardware no acompaña.

No basta con mejorar el software. Hay que orientar el hardware hacia la arquitectura que el software revela como necesaria.

La arquitectura x86_64 CISC aparece como punto de partida por:

- su peso histórico;
- su complejidad de arranque;
- su relevancia real en entornos de propósito general;
- su acumulación de compatibilidad;
- sus tensiones entre herencia, privilegio y secuencia de arranque.

No es necesariamente la meta. Es un laboratorio histórico y técnico.

---

## Cooperación futura entre CPU, firmware y aceleradores

En una madurez futura, la comunicación temprana podría involucrar:

```text
CPU
  └── firmware
        └── kernel
              └── bus temprano
                    ├── contratos
                    ├── mediciones
                    ├── políticas
                    └── aceleradores de decisión / NPU
```

La idea no es delegar soberanía a una IA o NPU, sino permitir que el sistema pueda asistir, validar y razonar sobre su estado temprano sin depender únicamente de userspace tardío.

---

## Criterio de aceptación conceptual

El bus de arranque queda correctamente formulado si permite responder:

1. qué fase del arranque emite un evento;
2. qué identidad emite;
3. qué política valida;
4. qué nodo técnico se interpreta;
5. qué nodo semiótico corresponde;
6. qué estado vivo queda en `/run/maGNUx`;
7. qué contrato declara `/boot/metal`;
8. qué continuidad se entrega a Dernel;
9. qué divergencias se bloquean o degradan;
10. qué parte podría madurar hacia hardware futuro.

---

*← [Inicio del sistema](04-inicio-sistema.md) | [Índice](../README.md) | Siguiente: [Capas POSIX →](06-capas-posix.md)*
