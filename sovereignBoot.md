> [⬆ Subir al índice principal](README.md) · [🏠 Inicio](README.md)

# Del hardware vivo a la utilidad sistémica

> Kernelización, cerraduras, xGNUpeD y dernelización en el modo soberano de maGNUx.

Este documento define una pieza conceptual central dentro de maGNUx: la relación entre arranque temprano, kernel, cerraduras, xGNUpeD, identidades soberanas y dernelización del software.

La idea principal es que el sistema no debe entenderse únicamente como una secuencia técnica de arranque, sino como una cadena de legitimidad. Cada capa recibe una herencia, la transforma y la entrega a la siguiente.

En maGNUx, el arranque no consiste solo en encender una máquina. Consiste en justificar quién gobierna, qué recursos existen, qué identidad puede abrirlos y qué utilidad sistémica se deriva de esa apertura.

---

## 1. El arranque temprano declara hardware vivo

El arranque temprano no entrega todavía un sistema operativo plenamente administrable.

Su función principal es declarar una base material viva: CPU, memoria, buses, consola, firmware, almacenamiento localizable, dispositivos iniciales y puntos mínimos de comunicación.

En esta etapa, el sistema todavía no opera sobre recursos plenamente gobernables. Opera sobre condiciones materiales de existencia.

```text
arranque temprano
→ declara hardware vivo
→ prepara puntos de anclaje
→ planta una semilla de identidad por cada elemento declarado
→ deja una traza inicial basada en nodos semióticos
→ permite que el kernel tome el relevo formando una malla operativa
```

En este contexto, una **semilla** no es todavía un recurso administrable, sino una marca inicial de existencia. Un **nodo semiótico** es el signo mínimo que permite reconocer, trazar y heredar esa existencia en capas posteriores. La **malla operativa** aparece cuando esos signos iniciales pueden relacionarse entre sí y sostener el relevo del kernel.

Los puntos **2.2**, **2.3**, **2.4** y **2.4.1** del proyecto maGNUx describen esta base previa al kernel:

```text
2.2 Host: Soberanía enraizada
2.3 Kommu: Sistema de comunicaciones tempranas
2.4 Levantamiento del VMKZ
2.4.1 Declaración de un contrato de sistema operativo
```

Estas secciones explican el fundamento sobre el que el kernel podrá tomar el relevo.

El arranque temprano no gobierna todavía la operativa completa del sistema. Declara una base viva y deja una herencia.

---

## 2. El kernel toma el relevo

A partir del punto **3**, y especialmente en **3.1**, el kernel toma el relevo sobre los puntos vivos declarados por el arranque temprano.

Linux se usa como kernel modelo porque permite estudiar cómo un kernel real carga controladores, enumera dispositivos, inicializa subsistemas y transforma una base material inicial en recursos operables.

```text
hardware vivo
→ kernel
→ drivers
→ subsistemas
→ recursos kernelizados
```

En Linux tradicional, el resultado habitual de esa carga son interfaces expuestas:

```text
/dev
/proc
/sys
/run
syscalls
drivers
mounts
sockets
TTY
cgroups si están disponibles
namespaces si están disponibles
```

Estas interfaces permiten que un init PID 1 tradicional levante el sistema.

Pero maGNUx propone una lectura más estricta.

El kernel no debería limitarse a dejar interfaces disponibles. En modo soberano, el kernel debe transformar el hardware vivo en cerraduras.

En Linux actual, estas cerraduras no existen todavía como categoría soberana formal. maGNUx las propone como reinterpretación y posible extensión del resultado de la kernelización: allí donde Linux expone interfaces y mecanismos de control, maGNUx propone cerraduras sujetas a identidad, contrato y legitimidad.

---

## 3. Interfaces compatibles y cerraduras soberanas

El punto **3.1** funciona como una bifurcación conceptual.

Desde el relevo del kernel pueden aparecer dos modos de salida:

```text
modo compatibilidad
→ interfaces expuestas

modo soberano
→ cerraduras expuestas por defecto
```

La diferencia es esencial:

```text
Interfaz  = acceso disponible.
Cerradura = acceso disponible, pero condicionado por contrato.
```

En modo compatibilidad, el kernel deja recursos accesibles según el modelo Linux tradicional. El sistema se levanta usando interfaces existentes.

En modo soberano, todo recurso queda cerrado por defecto. El kernel no entrega una superficie de interfaces abiertas, sino una superficie de cerraduras securizadas.

```text
hardware vivo
→ kernel
→ driver/subsistema
→ cerradura
→ llave
→ apertura legítima
```

En modo soberano no se decide caso por caso qué queda como interfaz y qué queda como cerradura. La premisa es más fuerte:

```text
todo queda cerrado por defecto
```

El acceso solo se concede cuando una identidad demuestra legitimidad suficiente para abrir una cerradura concreta.

---

## 4. 3.1.1 como arranque en modo compatibilidad

El punto **3.1.1 — Levantamiento de sistema tradicional** debe entenderse como el estudio del arranque en modo compatibilidad.

En este modo, el kernel Linux deja disponibles interfaces tradicionales y los distintos sistemas de init PID 1 las consumen para levantar el sistema.

```text
interfaces compatibles
→ init tradicional
→ servicios
→ sistema operativo levantado
```

Los modelos estudiados en esta sección son:

```text
sysVinit
runit
OpenRC
dinit
systemd
```

Cada uno abre las interfaces del kernel de forma diferente:

```text
sysVinit → inittab, runlevels y scripts
runit    → supervisión permanente simple
OpenRC   → dependencias y scripts coordinados
dinit    → supervisión y dependencias explícitas
systemd  → unidades, cgroups, namespaces, sockets, udev y políticas integradas
```

La pregunta principal en modo compatibilidad es:

```text
¿Qué interfaces del kernel necesita abrir este init para levantar el sistema?
```

Aquí los recursos se administran según el modelo Linux existente: permisos sobre archivos, nodos de dispositivo, procesos, usuarios, grupos, capabilities, ACLs, namespaces, cgroups, LSM y otros mecanismos de control, aislamiento o política.

---

## 5. 3.1.3 como arranque en modo soberano

El punto **3.1.3 — Arranque en modo soberano: xGNUpeD como gestor de identidades para el levantamiento soberano raíz** introduce una segunda vía.

En modo soberano, xGNUpeD no se limita a consumir interfaces heredadas del kernel Linux.

Su función es encajar las llaves que permiten abrir cerraduras.

```text
cerradura → recurso vivo protegido
llave     → identidad operativa autorizada
apertura  → activación legítima del recurso
```

La función de xGNUpeD es convertir la disponibilidad técnica del recurso en capacidad legítima de administración.

El sistema no se considera plenamente operativo solo porque el kernel haya expuesto un recurso. Se considera operativo cuando ese recurso puede ser abierto mediante una llave compatible con el contrato de sistema y con la distribución operativa definida.

```text
modo compatibilidad:
interfaz disponible → init tradicional → uso del recurso

modo soberano:
cerradura cerrada → identidad legitimada → llave válida → apertura soberana
```

---

## 6. Soberanía y permisos tradicionales

En Linux tradicional, el acceso se administra principalmente mediante permisos y políticas sobre objetos ya representados dentro del sistema:

```text
archivos
directorios
nodos de dispositivo
particiones
procesos
propietarios
grupos
ACLs
capabilities
namespaces
cgroups
políticas LSM
```

En maGNUx, esos mecanismos no desaparecen, pero no agotan la autoridad.

El acceso soberano gobierna algo más profundo: el hardware vivo que existe detrás de esas representaciones.

```text
Linux tradicional:
¿tiene este proceso permisos o política suficiente sobre este objeto?

maGNUx:
¿tiene esta identidad soberanía legítima para abrir esta cerradura
que conduce a hardware vivo?
```

Ambos planos confluyen en el modo soberano:

```text
soberanía sobre hardware vivo
+
permisos, políticas y controles tradicionales sobre objetos del sistema
=
operativa soberana
```

Por eso, en maGNUx, no es equivalente una identidad `root`, una identidad `admin`, una identidad `comm` o una identidad `user`.

---

## 7. Identidades soberanas

En maGNUx, las identidades no representan únicamente niveles de permisos al estilo Unix/Linux. Representan posiciones distintas dentro de la cadena de soberanía del sistema.

La soberanía no nace en PID 1. PID 1 recibe una herencia.

Esa herencia procede de las capas anteriores del arranque:

```text
arranque temprano
→ hardware vivo
→ host
→ comunicación temprana
→ VMKZ
→ contrato inicial
→ kernel
→ cerraduras
→ xGNUpeD
→ distribución operativa
```

Las identidades deben separarse en dos planos.

Por un lado están las **identidades sistémicas**, que dan soberanía al nodo:

```text
root  → soberanía material temprana
admin → soberanía administrativa por llave
comm  → soberanía comunicativa relacional
```

Por otro lado está la identidad de **usuario operativo**, gestionable desde PID 1:

```text
user → soberanía de uso legitimado
```

`user` no está al mismo nivel sistémico que `root`, `admin` y `comm`. El usuario opera dentro de la soberanía del nodo; no constituye por sí mismo la identidad sistémica de la máquina.

O en forma más directa:

```text
root funda.
admin abre.
comm singulariza.
user disfruta.
```

---

## 8. Soberanía de nodos y mallas

maGNUx trabaja con soberanía de nodos y mallas.

Un nodo no debe entenderse únicamente como una máquina, un proceso, un usuario o un recurso aislado. Un nodo es una entidad reconocible dentro de una malla de relaciones. Puede representar una máquina, una identidad sistémica, un recurso vivo, una cerradura, una comunicación singularizada o una posición operativa dentro del sistema.

Una malla no es simplemente una red técnica. Es un tejido de relaciones, accesos, legitimidades, trazas y comunicaciones que permite saber quién actúa, desde dónde actúa, bajo qué autoridad y con qué finalidad sistémica.

```text
nodo
→ entidad reconocible

malla
→ relación trazable entre nodos

soberanía
→ legitimidad para actuar dentro de la malla
```

En este sentido, maGNUx no se limita a administrar usuarios o permisos. Administra la legitimidad de los nodos dentro de una malla soberana.

Bajo el dominio de maGNUx pueden existir usuarios ordinarios gestionados desde PID 1, sea cual sea el init empleado:

```text
systemd
OpenRC
sysVinit
runit
dinit
init propio
```

Estos usuarios pertenecen al plano operativo del sistema. Pueden abrir sesiones, solicitar ejecución, consumir recursos, lanzar procesos y disfrutar capacidades legitimadas.

Sin embargo, los usuarios ordinarios no deben confundirse con las identidades sistémicas.

En maGNUx, las identidades sistémicas son:

```text
root
admin
comm
```

`root`, `admin` y `comm` no son simples cuentas de usuario. Son identidades estructurales mediante las cuales la máquina adquiere posición, autoridad y presencia dentro de las carreteras de la información.

La identidad sistémica permite que la máquina no sea solo un equipo encendido, sino un nodo reconocible dentro de una malla informacional.

```text
root  → funda la relación con el hardware vivo
admin → administra cerraduras mediante llaves legítimas
comm  → singulariza comunicaciones dentro de la malla
```

El usuario ordinario, en cambio, no constituye por sí mismo la identidad sistémica de la máquina. El usuario disfruta recursos porque su uso ha sido legitimado dentro del contrato operativo, pero no define la soberanía basal del nodo.

Por tanto:

```text
root, admin y comm identifican sistémicamente la máquina.
user opera dentro de esa identidad.
```

O, dicho de forma más directa:

```text
Las identidades sistémicas dan soberanía al nodo.
Los usuarios disfrutan recursos bajo esa soberanía.
```

---

## 9. Root: soberanía material temprana

`root` administra el hardware vivo antes de las cerraduras.

No debe entenderse únicamente como UID 0 de Unix/Linux. En maGNUx, `root` representa la autoridad asociada al plano material temprano: el momento en que el hardware todavía está siendo declarado, inicializado y preparado para que el kernel tome el relevo.

```text
root administra el hardware vivo antes de las cerraduras.
```

Su dominio pertenece al plano donde el sistema aún no opera principalmente sobre cerraduras administrativas, sino sobre condiciones materiales de existencia:

```text
CPU inicializable
memoria disponible
buses reconocibles
firmware interpretado
consola temprana
almacenamiento localizable
puntos vivos de arranque
```

`root` funda la relación entre sistema y materia.

---

## 10. Admin: soberanía administrativa por llave

`admin` administra demostrando que tiene las llaves.

A diferencia de `root`, `admin` no opera sobre el hardware vivo antes de su kernelización. Opera sobre cerraduras ya constituidas por el kernel.

```text
admin administra demostrando que tiene las llaves.
```

La autoridad de `admin` no procede de que todo esté abierto, sino de que puede demostrar que posee llaves legítimas para abrir, cerrar, delegar o restringir recursos.

En modo compatibilidad, un administrador puede parecerse mucho al `root` tradicional de Linux, porque dispone de capacidad amplia de operación.

Pero en modo soberano la causa de esa amplitud es distinta:

```text
compatibilidad:
el administrador usa interfaces disponibles

soberanía:
el administrador abre cerraduras porque su identidad está legitimada
```

En el modo administrativo, el administrador puede disponer de una soberanía plana o casi total sobre el sistema. Desde la experiencia operativa, esto puede parecer casi indistinguible del modo compatibilidad tradicional.

Sin embargo, la diferencia conceptual sigue siendo radical.

En modo compatibilidad, el administrador opera sobre interfaces heredadas del kernel Linux tradicional. En modo soberano administrativo, el administrador no opera porque las interfaces estén abiertas, sino porque su identidad ha sido legitimada como autoridad suficiente para abrir cerraduras.

---

## 11. Comm: soberanía comunicativa relacional

`comm` se encarga de singularizar las comunicaciones.

Su función no es dominar el hardware vivo ni administrar todas las cerraduras del sistema. Su función es garantizar que las relaciones entre procesos, servicios, usuarios y planos operativos sean distinguibles, trazables y coherentes.

```text
comm se encarga de singularizar las comunicaciones.
```

Una comunicación soberana no es simplemente un canal abierto. Es una relación reconocible entre entidades legitimadas.

`comm` debe permitir responder preguntas como:

```text
quién comunica
con quién comunica
desde qué identidad
bajo qué contrato
con qué trazabilidad
con qué legitimidad
```

`comm` introduce una soberanía relacional.

Su papel es evitar que el sistema sea una masa indistinguible de procesos hablando entre sí. Cada comunicación debe poder ser singularizada, atribuida y comprendida dentro del contrato operativo.

---

## 12. User: soberanía de uso legitimado

`user` disfruta de los recursos porque su disfrute está legitimado.

No gobierna el hardware vivo. No administra las cerraduras. No singulariza por sí mismo todo el plano comunicativo. Su posición es otra: solicitar, ejecutar y disfrutar recursos cuya apertura ha sido legitimada.

```text
user disfruta de los recursos porque su disfrute está legitimado.
```

Esto significa que el usuario no accede a un recurso simplemente porque exista una interfaz disponible. Accede porque el sistema reconoce que su identidad, su contexto y su solicitud son compatibles con el contrato operativo.

La soberanía del usuario no es soberanía de gobierno, sino soberanía de uso:

```text
puede ejecutar lo autorizado
puede acceder a lo legitimado
puede disfrutar recursos concedidos
puede operar dentro de su contrato
```

El usuario no abre el sistema por sí mismo. Disfruta aquello que el sistema le permite abrir mediante una legitimidad reconocida.

---

## 13. Kernelización del hardware

La kernelización del hardware es el proceso por el cual el kernel toma el hardware vivo declarado por el arranque temprano y lo convierte en recursos kernelizados.

En modo soberano, este proceso no termina simplemente en interfaces disponibles, sino en cerraduras.

```text
hardware vivo
→ kernel
→ driver
→ subsistema
→ cerradura
```

La kernelización dota al hardware de forma operativa. Lo hace visible, direccionable, clasificable y gobernable desde el sistema.

Pero una cerradura solo regula acceso.

No define todavía su utilidad.

Una cerradura permite decir:

```text
este recurso puede abrirse o permanecer cerrado
```

Pero todavía no responde por completo a:

```text
para qué se abre
quién lo necesita
qué evento lo justifica
qué relación sistémica activa
qué utilidad produce
```

Ahí aparece la dernelización.

---

## 14. Dernelización del software

La dernelización es dotar de utilidad a las cerraduras.

Si la kernelización convierte hardware vivo en cerraduras, la dernelización convierte esas cerraduras en utilidad sistémica.

```text
kernelización = hardware vivo convertido en cerradura
dernelización = cerradura convertida en utilidad sistémica
```

La dernelización no consiste simplemente en ejecutar software sobre un sistema ya levantado. Consiste en interpretar las cerraduras dentro de una finalidad operativa.

El sistema no pregunta solo si una cerradura puede abrirse. Pregunta también:

```text
para qué debe abrirse
qué identidad la solicita
qué evento lo justifica
qué comunicación activa
qué utilidad produce
qué relación tiene con el contrato operativo
```

Ejemplo de almacenamiento:

```text
NVMe vivo
→ kernel lo convierte en recurso de bloque
→ queda como cerradura de almacenamiento
→ dernelización decide su utilidad:
   raíz del sistema
   almacén de usuario
   respaldo
   caché
   log
   zona cifrada
```

Ejemplo de red:

```text
tarjeta de red viva
→ kernel carga driver
→ queda como cerradura de comunicación
→ dernelización decide su utilidad:
   canal administrativo
   canal de usuario
   canal comm
   canal de actualización
   canal aislado
```

El dernel no sustituye al kernel. Opera sobre el resultado soberano del kernel.

Allí donde el kernel protege el acceso al recurso, el dernel interpreta su utilidad dentro de la vida operativa del sistema.

---

## 15. Relación entre kernel, xGNUpeD y dernel

La secuencia conceptual queda así:

```text
Arranque temprano
→ declara hardware vivo

Kernel
→ kerneliza hardware vivo
→ produce cerraduras

xGNUpeD
→ legitima llaves

Dernel
→ dota de utilidad a las cerraduras
→ convierte apertura legítima en operación sistémica
```

En forma sintética:

```text
El kernel cierra.
xGNUpeD legitima.
El dernel da utilidad.
```

La función de cada capa es distinta:

| Capa | Función |
|---|---|
| Arranque temprano | Declara hardware vivo. |
| Kernel | Convierte hardware vivo en cerraduras. |
| xGNUpeD | Valida llaves e identidades soberanas. |
| Dernel | Dota de utilidad sistémica a las cerraduras. |
| Usuario | Disfruta recursos legitimados. |

---

## 16. Modo compatibilidad frente a modo soberano

La distinción completa queda así:

```text
Modo compatibilidad:
hardware vivo
→ kernel
→ interfaces
→ init tradicional
→ servicios
→ permisos tradicionales

Modo soberano:
hardware vivo
→ kernel
→ cerraduras
→ xGNUpeD
→ llaves
→ dernel
→ utilidad sistémica
→ disfrute legitimado
```

En modo compatibilidad, el sistema se levanta porque las interfaces están disponibles y un init tradicional sabe consumirlas.

En modo soberano, el sistema se levanta porque las cerraduras pueden abrirse legítimamente y porque esa apertura produce utilidad sistémica dentro de un contrato.

---

## 17. Consecuencia para maGNUx

La consecuencia principal es que maGNUx no debe limitarse a estudiar qué capacidades expone el kernel.

También debe estudiar:

```text
qué hardware vivo fue declarado
qué cerraduras produjo el kernel
qué identidades pueden abrirlas
qué llaves existen
qué comunicaciones se singularizan
qué usuarios disfrutan recursos
qué utilidad sistémica se produce
```

Por eso la arquitectura no puede reducirse a PID 1.

PID 1 no crea la soberanía desde cero. PID 1 recibe una traza.

La soberanía procede del legado que cada capa del arranque deja a la siguiente.

```text
arranque temprano
→ traza material

kernel
→ traza de cerraduras

xGNUpeD
→ traza de legitimidad

dernel
→ traza de utilidad

usuario
→ traza de disfrute autorizado
```

---

## 18. Fórmula final

La síntesis conceptual puede expresarse así:

```text
El arranque temprano declara hardware vivo.
El kernel convierte hardware vivo en cerraduras.
xGNUpeD valida las llaves que pueden abrirlas.
El dernel dota de utilidad a las cerraduras abiertas.
El usuario disfruta recursos porque su disfrute está legitimado.
```

Y en relación con las identidades:

```text
root administra el hardware vivo antes de las cerraduras.
admin administra demostrando que tiene las llaves.
comm singulariza las comunicaciones.
user disfruta los recursos porque su disfrute está legitimado.
```

maGNUx no propone únicamente otro modo de arrancar Linux.

Propone una lectura soberana del sistema: desde la materia viva hasta la utilidad operativa, pasando por cerraduras, llaves, identidades, comunicaciones y disfrute legitimado.

---

> [⬆ Subir al índice principal](README.md) · [🏠 Inicio](README.md)
