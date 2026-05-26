# 11 — Root y los dominios de autoridad

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> El manifiesto reinterpreta `root` no como una cuenta aislada, sino como una **formación estructural de varios dominios**.

---

## En pocas palabras

En maGNUx, `root` no es solo el superusuario. Es la convergencia de varios dominios de autoridad que, coordinados, permiten que el sistema exista, comunique, administre y opere.

La raíz no debe entenderse únicamente como:

```text
UID 0
```

sino como:

```text
autoridad material
+ autoridad comunicativa
+ autoridad operativa
+ autoridad administrativa
```

---

## La tesis de fondo

No basta con tener un privilegio abstracto. La autoridad plena exige concurrencia de ámbitos distintos.

Un sistema puede tener acceso a hardware, pero no a comunicación. Puede tener comunicación, pero no licencia operativa. Puede tener administración, pero no soberanía material.

Por eso maGNUx divide la raíz en dominios.

---

## Root como formación compuesta

La formulación central es:

```text
hroot + croot + droot = root
```

| Identidad | Dominio | Función |
|---|---|---|
| `hroot` | Hardware root | Autoridad sobre hardware físico, CPU, memoria, dispositivos y materialidad. |
| `croot` | Communication root | Autoridad sobre canales, buses, IPC, red, Kommu y comunicación sistémica. |
| `droot` | Dernel root | Autoridad sobre licencia operativa, Dernel run time y transición Host/Guest. |

Esta raíz compuesta no elimina el root Unix. Lo reinterpreta.

El root Unix queda como manifestación administrativa de una autoridad más profunda, no como explicación completa de la soberanía del sistema.

---

## Admin como operación compuesta

De forma paralela, la administración cotidiana también puede entenderse como composición:

```text
sadmin + uadmin + aadmin = admin
```

| Identidad | Dominio | Función |
|---|---|---|
| `sadmin` | System admin | Administración del sistema operativo, servicios y configuración. |
| `uadmin` | User admin | Administración de usuarios, sesiones, permisos y actividad orgánica. |
| `aadmin` | Application admin | Administración de aplicaciones, stores, paquetes, políticas de ejecución. |

Esta separación evita confundir:

```text
control estructural
```

con:

```text
operación administrativa cotidiana
```

---

## Los cuatro dominios conceptuales

### 1. Servicios primitivos

Acceso directo a recursos fundamentales del sistema:

- CPU;
- memoria base;
- interrupciones;
- almacenamiento de bajo nivel;
- dispositivos;
- firmware expuesto;
- capacidades iniciales del kernel.

Este dominio se relaciona con `hroot`.

### 2. Servicios de comunicación

Gobierno de los canales de conectividad:

- IPC;
- DBus;
- sockets;
- red local;
- INET;
- buses internos;
- Kommu;
- comunicación temprana entre capas.

Este dominio se relaciona con `croot`.

### 3. Servicios administrativos

Gestión del tráfico interno del sistema:

- prioridades;
- colas;
- políticas;
- servicios;
- sesiones;
- unidades;
- perfiles;
- límites;
- administración de usuarios y aplicaciones.

Este dominio se relaciona con `admin`, pero bajo autoridad de root.

### 4. Servicios de usuario

Ejecución subordinada de:

- tareas;
- aplicaciones;
- escritorios;
- sesiones;
- producción cotidiana;
- entornos gráficos;
- servicios delegados.

Este dominio pertenece al Guest operativo.

---

## La identidad de ROOT emerge de la concurrencia

```text
                    ROOT
                     │
     ┌───────────────┼───────────────────┐
     │               │                   │
     ▼               ▼                   ▼
   hroot           croot               droot
 hardware       comunicación          Dernel
     │               │                   │
     └───────────────┼───────────────────┘
                     │
                     ▼
              admin / guest / usuario
              subordinados a contrato
```

> La raíz efectiva del sistema solo emerge cuando estos dominios quedan articulados bajo una misma coherencia estructural.

---

## init_ID absorbido

El corpus anterior reservaba `initID.MD` para estudiar un inicio temprano con soberanía enraizada y multiplataforma.

Refundido aquí, `init_ID` representa la hipótesis de que el arranque necesita una identidad inicial antes de que el sistema se presente como userspace convencional.

```text
init_ID
→ identidad inicial de arranque
→ declaración temprana de autoridad
→ condición previa para xGNUpeD, Dernel y Trilobytes
```

No es solo un nombre de proceso. Es una pregunta:

```text
¿qué identidad tiene el sistema justo cuando empieza a levantarse?
```

Esta pregunta enlaza con:

- initramfs;
- PID 1;
- llamadas iniciales al kernel;
- delegación hacia Dernel;
- soberanía del arranque;
- compatibilidad multiplataforma.

---

## Contrato administrativo absorbido

El contrato administrativo define bajo qué condiciones la administración puede operar sin confundirse con la raíz material.

En maGNUx, administrar no significa poseer el sistema.

Administrar significa recibir capacidad bajo contrato.

```text
root
→ conserva autoridad estructural

admin
→ opera bajo delegación

guest
→ ejecuta actividad autorizada
```

El contrato administrativo debe declarar:

- qué puede modificar admin;
- qué no puede tocar admin;
- qué requiere escalada;
- qué debe pasar por Dernel;
- qué debe verificar Trilobytes;
- qué queda reservado a hroot, croot o droot;
- qué acciones deben registrarse.

---

## Relación con seguridad y escalada de privilegios

La escalada de privilegios se vuelve más peligrosa cuando `root` es una autoridad plana.

Si todo root es igual, comprometer un punto puede comprometer toda la estructura.

maGNUx propone una raíz compuesta:

```text
comprometer admin
≠ comprometer hroot
≠ comprometer croot
≠ comprometer droot
```

Esto no elimina la necesidad de seguridad clásica, pero ofrece un marco conceptual más fuerte para compartimentar autoridad.

---

## Relación con distribución y app stores

La administración de aplicaciones forma parte del dominio `aadmin`.

Esto importa porque las aplicaciones modernas no vienen solo de repositorios clásicos:

- paquetes de distribución;
- Flatpak;
- Snap;
- AppImage;
- stores;
- contenedores;
- repositorios externos;
- builds locales;
- entornos reproducibles.

El sistema debe poder distinguir:

```text
instalar
actualizar
ejecutar
conceder permisos
revocar permisos
asociar repositorios
conmutar políticas
```

Todo esto pertenece al plano admin, pero bajo contrato con root.

---

## Sin identidad de arranque, no hay soberanía

Una de las intuiciones más fértiles de maGNUx es que el sistema necesita una identidad estructural previa a su aparición como entorno operativo convencional.

Esta identidad no equivale al nombre de una distribución ni a un simple identificador administrativo. Debe ser una forma verificable de afirmar:

- qué sistema está arrancando;
- desde qué fundamento lo hace;
- cuál es su estado legítimo;
- qué continuidad mantiene respecto a instalación, actualizaciones e integridad material;
- qué dominios de autoridad están activos;
- qué parte puede pasar a operación delegada.

> El sistema no debería empezar a existir solo cuando ya ejecuta servicios visibles, sino desde el momento en que puede afirmar de forma verificable su condición, su raíz y su estado.

---

## Relación con los documentos anteriores de identidad

Este documento cierra la secuencia:

```text
xGNUpeD
→ declara identidad temprana

Trilobytes
→ verifica coherencia orgánica

Dernel
→ concede licencia operativa

Host / Guest
→ separa estructura y operación

Root / dominios
→ delimita autoridad y administración
```

---

## Criterio de aceptación conceptual

La teoría de root y dominios queda correctamente formulada si permite responder:

1. qué dominio gobierna el hardware;
2. qué dominio gobierna comunicación;
3. qué dominio gobierna licencia operativa;
4. qué dominio administra usuarios;
5. qué dominio administra aplicaciones;
6. qué dominio ejecuta actividad cotidiana;
7. qué identidad inicial declara el arranque;
8. qué contrato permite operar;
9. qué escalada debe impedirse;
10. qué autoridad nunca debe confundirse con uso.

---

*← [Host y Guest](10-host-guest.md) | [Índice](../README.md) | Siguiente: [Filosofía Unix y GNU →](../filosofia/12-filosofia-unix-gnu.md)*
