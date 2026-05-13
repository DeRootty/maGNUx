# Sistemas Operativos GPL con soberanía enraizada

> **GPL Operating Systems with Rooted Sovereignty**  
> Nombre internacional del proyecto, útil para lectura técnica y documentación bilingüe.

> **Nota de lectura:** el contenido principal, por razones de desarrollo documental, se encuentra en el punto **4.1. ZaltID como dernel modelo de maGNUx**.  
> También puede consultarse: [Notas sobre el autor](notasAut.md).

Por temas de licencias, la arquitectura demostrada en este desarrollo de soberanía sistémica se plantea sobre **RISC-V** como base abierta de referencia.

Como apoyo comparativo, aquí se puede consultar el documento de [instrucciones ASM de la arquitectura x86_64 publicadas por Intel](intelASMx86_64.md).

---

## Cómo leer este repositorio

Este repositorio no debe leerse como una simple colección de notas, sino como una **ruta conceptual de construcción de sistema**. La documentación está organizada en capas:

1. **Fundamento filosófico y jurídico-técnico**: soberanía, GNU, GPL, C23 y arquitectura abierta.
2. **Arranque temprano**: protosistema raíz, initramfs, Hurd, seL4 e init_ID.
3. **Carga del kernel**: Linux como modelo práctico, inits tradicionales, systemd y transición hacia xGNUpeD.
4. **Operativa bajo confianza cero**: manifiesto maGNUx, Tinetsys, Guest, VMDZ, TPM y paso de VMKZ a VMDZ.
5. **Dernel / ZaltID**: núcleo conceptual de maGNUx como propuesta de soberanía comunicativa.

> **Lectura recomendada:** si es la primera vez que llegas al proyecto, empieza por la sección **[Mapa conceptual rápido](#mapa-conceptual-rápido)** y después salta a **[4.1. ZaltID como dernel modelo de maGNUx](maGNUx.md)**.

> El criterio de navegación jerárquica está definido en [**Navegación del repositorio**](NAVIGATION.md).

---

## Tabla de contenidos

### A. Marco introductorio

| Código | Documento | Función |
|---|---|---|
| A | [Introducción](intro.md) | Entrada general al proyecto y motivación inicial. |
| A.a | [Ecosistema GNU](GNUpeD.md) | Contextualiza el papel de GNU, GPL y cultura de software libre. |

### 1. Soberanía sistémica

| Código | Documento | Función |
|---|---|---|
| 1 | [Soberanía sistémica](sysKing.md) | Define la idea de soberanía aplicada al sistema operativo. |
| 1.1 | [Entidades sistematizadas](sysEntity.md) | Ordena las entidades que intervienen en la arquitectura. |
| 1.2 | [Hardware presente vs Hardware futuro](lookingfor.md) | Contrasta lo disponible hoy con el hardware necesario para madurar la propuesta. |
| 1.3 | [Estándar C23: ISO/IEC 9899:2024](ISOC23.md) | Sitúa C como lenguaje de medio nivel para articular código sistémico. |
| 1.4 | [Cómo condicionar las capacidades del Kernel](kernelConfigCaps.md) | Explica cómo los `CONFIG_*` condicionan la compilación del kernel y qué capacidades quedan expuestas en runtime. |
| 1.5 | [Arranque soberano: del hardware vivo a la utilidad sistémica](sovereignBoot.md) | Justifica el arranque soberano, las cerraduras, xGNUpeD, nodos, mallas y dernelización como base para futuras capacidades configurables del kernel. |

### 2. Arranque temprano

| Código | Documento | Función |
|---|---|---|
| 2 | [Arranque temprano](initSoonrise.md) | Introduce el dominio previo al sistema operativo plenamente levantado. |
| 2.1 | [Protosistema raíz](systemProt.md) | Define la primera base de autoridad sistémica. |
| 2.1.1 | [Postulado de Hurd](Hurd.MD) | Explora Hurd/GNU Mach como hipótesis de microkernel y servidores. |
| 2.1.2 | [Postulado de initramfs](initramfs.MD) | Estudia initramfs como autoridad temprana viable en Linux actual. |
| 2.1.3 | [Postulado de seL4](seL4.MD) | Considera seL4 como microkernel formalmente verificado. |
| 2.1.4 | [Postulado de inicio nativo con init_ID](initID.MD) | Propone una identidad inicial nativa para el arranque. |
| 2.2 | [Host: Soberanía enraizada](hostroot.md) | Sitúa la identidad de la máquina como host soberano. |
| 2.3 | [Kommu: Sistema de comunicaciones tempranas](kommu.md) | Define la comunicación inicial entre capas sistémicas. |
| 2.4 | [Levantamiento del VMKZ](VMKZ.md) | Describe el levantamiento del plano raíz/host. |
| 2.4.1 | [Declaración de un contrato de sistema operativo](contractOS.md) | Formaliza condiciones de validez para el sistema operativo. |

### 3. Carga del kernel

| Código | Documento | Función |
|---|---|---|
| 3 | [Carga del kernel: La expresión soberana de la raíz](kernelLoad.md) | Explica el paso desde arranque temprano hacia kernel operativo. |
| 3.1 | [Linux como kernel modelo: Arranque en modo compatibilidad](kernelLinux.md) | Usa Linux como base práctica para modelar compatibilidad y transición. |

#### 3.1.1. Levantamiento de sistema tradicional

| Código | Documento | Función |
|---|---|---|
| 3.1.1 | [Levantamiento de sistema tradicional](research00.md) | Sitúa los modelos clásicos de init y gestión de servicios. |
| 3.1.1.1 | [Postulado de OpenRC](OpenRC.MD) | Analiza OpenRC como init modular y dependencial. |
| 3.1.1.2 | [Postulado de sysVinit](sysVinit.md) | Analiza el init clásico basado en runlevels. |
| 3.1.1.3 | [Postulado de runit](runit.md) | Analiza runit como init/supervisor mínimo. |
| 3.1.1.4 | [Postulado de dinit](dinit.md) | Analiza dinit como supervisor moderno y ligero. |
| 3.1.1.5 | [Postulado de SystemD](SystemD.MD) | Analiza systemd como gestor integral de sistema y servicios. |

#### 3.1.2. Hacks al kernel actual

| Código | Documento | Función |
|---|---|---|
| 3.1.2 | [Hacks al actual kernel](hacks.md) | Agrupa adaptaciones necesarias sobre el Linux actual. |
| 3.1.2.1 | [Comunicación](hackToComm.md) | Explora hacks o extensiones orientadas a comunicación. |
| 3.1.2.2 | [Almacenamiento](hackToStore.md) | Explora hacks o extensiones orientadas a almacenamiento. |
| 3.1.2.3 | [Periféricos](hackToBridge.md) | Explora hacks o extensiones orientadas a periféricos. |
| 3.1.2.4 | [RAM](hackToBus.md) | Explora hacks o extensiones orientadas a memoria y bus. |

#### 3.1.3. Arranque soberano e identidad

| Código | Documento | Función |
|---|---|---|
| 3.1.3 | [Arranque en modo soberano: xGNUpeD como gestor de identidades para el levantamiento soberano raíz](xGNUpeD.md) | Presenta xGNUpeD como capa de identidad sistémica temprana. |
| 3.1.3.1 | [Identidad distributiva](distroID.md) | Relación entre sistema, distribución y comunidad. |
| 3.1.3.2 | [Identidad asociativa](relonIO.md) | Capacidad de asociación entre componentes y contribuciones. |
| 3.1.3.3 | [Identidad conmutativa](disruPed.md) | Capacidad de filtrar o distinguir estados compatibles/no compatibles. |
| 3.1.3.4 | [Identidad comunicativa](kommuID.md) | Trazabilidad, comunicación y coherencia del sistema. |
| 3.1.4 | [Levantamiento de la identidad distributiva](distro.md) | Desarrollo operativo de la identidad ligada a distribución. |

### 3.2. Guest y plano operativo

| Código | Documento | Función |
|---|---|---|
| 3.2 | [La filosofía desde la que emerge el sistema en su operativa: Manifiesto maGNUx](maGNUx.md) | Cómo redactar un contrato de sistema basado en la confianza cero. |
| 3.2.1 | [Tinetsys: Sistema de comunicaciones avanzado](tinetsys.md) | Propone comunicación avanzada más allá del arranque temprano, a puerta cerrada. |
| 3.2.2 | [Guest: Soberanía delegada](guestroot.md) | Propone una capa administrativa como plano delegado de operación a puerta cerrada. |
| 3.3 | [El principio de simetría: Motor VMDZ](VMDZ.md) | Describe el giro del plano delegado/guest o puesta en marcha del motor a puerta cerrada. |
| 3.3.1 | [Principio de compatibilidad: hardware de cifrado](contractAdmin.md) | Describe el papel del TPM. |
| 3.3.2 | [Bypass VMKZ a VMDZ](bypassKZDZ.md) | Administración del TPM o hardware de cifrado: desde su estado temprano a su estado avanzado. |

### 4. Dernel, ZaltID y maGNUx

| Código | Documento | Función |
|---|---|---|
| 4 | [El dernel: la expresión soberana de la identidad comunicativa](dernelZaltID.md) | Presenta el dernel como capa comunicativa y soberana. |
| 4.1 | [ZaltID como dernel modelo de maGNUx](maGNUx.md) | Documento central del proyecto y punto recomendado de lectura. |
| 4.1.1 | [Trilobytes: El delimitador administrativo que da coherencia a la identidad distributiva](trilobytes.md) | Delimita administración, identidad y coherencia distributiva. |
| 4.1.2 | [Logon: El servicio que legitima la actividad orgánica](logon.md) | Define legitimación de la actividad orgánica previa al uso. |
| 4.1.3 | [Login: La declaración explícita de la dinámica orgánica](login.md) | Define el inicio explícito de sesión y operación del usuario. |

### 5. Colaboración y soberanías futuras

| Código | Documento | Función |
|---|---|---|
| 5 | [Otras soberanías por agregar](collab.md) | Espacio de colaboración para ampliar el marco conceptual. |

---

## Mapa conceptual rápido

| Nodo | Pregunta que responde | Documentos principales |
|---|---|---|
| **Soberanía** | ¿Quién gobierna el sistema y desde qué legitimidad? | [Soberanía sistémica](sysKing.md), [Entidades sistematizadas](sysEntity.md) |
| **Hardware** | ¿Qué hardware existe hoy y qué hardware haría falta? | [Hardware presente vs Hardware futuro](lookingfor.md), [ASM x86_64](intelASMx86_64.md) |
| **Lenguaje** | ¿Con qué lenguaje se articula el plano medio entre teoría y máquina? | [C23](ISOC23.md) |
| **Arranque temprano** | ¿Qué existe antes del sistema operativo plenamente operativo? | [Arranque temprano](initSoonrise.md), [Protosistema raíz](systemProt.md) |
| **Microkernel / initramfs / seL4** | ¿Qué bases pueden ejercer autoridad temprana? | [Hurd](Hurd.MD), [initramfs](initramfs.MD), [seL4](seL4.MD), [init_ID](initID.MD) |
| **Host** | ¿Cómo se identifica la máquina como entidad soberana? | [Host](hostroot.md), [VMKZ](VMKZ.md), [Contrato OS](contractOS.md) |
| **Kernel** | ¿Cómo se expresa la raíz al cargar Linux? | [Carga del kernel](kernelLoad.md), [Linux como kernel modelo](kernelLinux.md) |
| **Inits tradicionales** | ¿Qué modelos actuales existen para levantar el sistema? | [OpenRC](OpenRC.MD), [sysVinit](sysVinit.md), [runit](runit.md), [dinit](dinit.md), [SystemD](SystemD.MD) |
| **xGNUpeD** | ¿Cómo se propone gestionar identidad soberana en el levantamiento raíz? | [xGNUpeD](xGNUpeD.md), [Identidad distributiva](distroID.md), [Identidad comunicativa](kommuID.md) |
| **Operativa cerrada / confianza cero** | ¿Cómo emerge la operativa del sistema bajo contrato, cierre y delegación controlada? | [Manifiesto maGNUx](maGNUx.md), [Tinetsys](tinetsys.md), [Guest](guestroot.md), [VMDZ](VMDZ.md), [Hardware de cifrado](contractAdmin.md), [Bypass VMKZ a VMDZ](bypassKZDZ.md) |
| **Dernel / ZaltID** | ¿Cuál es el núcleo conceptual de maGNUx? | [Dernel](dernelZaltID.md), [ZaltID / maGNUx](maGNUx.md) |
| **Login orgánico** | ¿Cómo se legitima la actividad humana u orgánica? | [Trilobytes](trilobytes.md), [Logon](logon.md), [Login](login.md) |

---

## Ruta de lectura recomendada

### Ruta corta

Para entender el proyecto sin leer todo el repositorio:

1. [Introducción](intro.md)
2. [Soberanía sistémica](sysKing.md)
3. [Arranque temprano](initSoonrise.md)
4. [Linux como kernel modelo](kernelLinux.md)
5. [xGNUpeD](xGNUpeD.md)
6. [ZaltID como dernel modelo de maGNUx](maGNUx.md)

### Ruta técnica

Para estudiar la arquitectura desde el arranque:

1. [Protosistema raíz](systemProt.md)
2. [Postulado de initramfs](initramfs.MD)
3. [Postulado de seL4](seL4.MD)
4. [Postulado de Hurd](Hurd.MD)
5. [Carga del kernel](kernelLoad.md)
6. [Levantamiento de sistema tradicional](research00.md)
7. [Postulado de SystemD](SystemD.MD)
8. [Arranque soberano con xGNUpeD](xGNUpeD.md)
9. [Manifiesto maGNUx: operativa bajo confianza cero](maGNUx.md)
10. [Tinetsys](tinetsys.md)
11. [Guest: Soberanía delegada](guestroot.md)
12. [Motor VMDZ](VMDZ.md)
13. [Hardware de cifrado / TPM](contractAdmin.md)
14. [Bypass VMKZ a VMDZ](bypassKZDZ.md)

### Ruta filosófica

Para leer maGNUx como manifiesto conceptual:

1. [Ecosistema GNU](GNUpeD.md)
2. [Soberanía sistémica](sysKing.md)
3. [Entidades sistematizadas](sysEntity.md)
4. [Host: Soberanía enraizada](hostroot.md)
5. [Manifiesto maGNUx: confianza cero y contrato de sistema](maGNUx.md)
6. [Guest: Soberanía delegada](guestroot.md)
7. [El principio de simetría: Motor VMDZ](VMDZ.md)
8. [El dernel](dernelZaltID.md)
9. [ZaltID como dernel modelo de maGNUx](maGNUx.md)

---

## Glosario mínimo de navegación

| Término | Lectura sugerida |
|---|---|
| **Host** | Identidad de la máquina como entidad material y soberana. |
| **Guest** | Plano administrativo delegado que opera a puerta cerrada bajo condiciones de contrato. |
| **Kommu** | Comunicación temprana y coherencia inicial del sistema. |
| **Tinetsys** | Comunicación avanzada en el plano operativo cerrado/delegado. |
| **VMKZ** | Levantamiento del plano raíz/host. |
| **VMDZ** | Motor del plano delegado/guest: giro operativo desde la simetría y la administración cerrada. |
| **TPM / hardware de cifrado** | Base material de compatibilidad criptográfica para sostener confianza cero y administración delegada. |
| **Bypass VMKZ a VMDZ** | Paso administrativo del hardware de cifrado desde estado temprano a estado avanzado. |
| **xGNUpeD** | Capa propuesta para identidad sistémica en el levantamiento raíz. |
| **Dernel** | Capa conceptual que hereda parte del papel coordinador del init, pero bajo una teoría de identidad comunicativa. |
| **ZaltID** | Modelo central del dernel dentro de maGNUx. |
| **Trilobytes** | Delimitador administrativo que aporta coherencia a la identidad distributiva. |

---

## Nota sobre GitHub Markdown

GitHub no permite insertar automáticamente el contenido de otros archivos Markdown dentro de este documento. Por eso este índice funciona mediante:

- enlaces relativos a cada archivo;
- tablas de referencia;
- rutas de lectura;
- glosario de orientación;
- y descripciones breves de cada documento.

Si en el futuro se quiere mostrar contenido real de cada archivo dentro del README, será necesario generar este documento automáticamente mediante un script o una acción de GitHub.
