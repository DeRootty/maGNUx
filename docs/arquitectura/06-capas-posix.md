# 06 — Capas de compatibilidad POSIX

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> maGNUx propone un régimen de compatibilidad inspirado en POSIX, orientado a preservar la capacidad contributiva de la comunidad y a ordenar sus aportaciones dentro de estratos bien definidos.

---

## En pocas palabras

maGNUx no empieza sustituyendo Linux. Empieza reinterpretando Linux.

La compatibilidad POSIX no se entiende como límite final, sino como suelo de transición:

```text
usar Linux actual
sin quedar preso de su lectura tradicional del arranque,
la raíz,
el init,
y la administración.
```

Este documento absorbe la línea antigua sobre Linux como kernel modelo, carga del kernel, init tradicionales, systemd, OpenRC, sysVinit, runit, dinit y hacks al kernel actual.

---

## Por qué POSIX importa

POSIX importa porque ofrece una gramática común:

- procesos;
- archivos;
- permisos;
- señales;
- usuarios;
- grupos;
- descriptores;
- llamadas al sistema;
- herramientas de espacio de usuario;
- expectativas portables.

maGNUx no niega esa herencia. La usa como base para formular una pregunta superior:

```text
¿cómo puede existir una compatibilidad POSIX
sin que toda la soberanía del sistema quede reducida
a una lectura clásica de usuario, proceso y root?
```

---

## Linux como kernel modelo

Linux es el modelo práctico porque ya ofrece:

- kernel maduro;
- drivers;
- arquitecturas soportadas;
- initramfs;
- cgroups;
- namespaces;
- LSM;
- `/proc`;
- `/sys`;
- `/dev`;
- sistemas de ficheros;
- mecanismos de seguridad;
- comunidad enorme;
- compatibilidad real.

Pero maGNUx no toma Linux como dogma final. Lo toma como laboratorio:

```text
Linux
→ base técnica real
→ superficie para ensayar soberanía
→ compatibilidad que permite avanzar sin empezar desde cero
```

---

## Carga del kernel absorbida

La carga del kernel queda reinterpretada como paso entre materialidad y autoridad.

El kernel no solo se carga: expone una superficie sobre la cual el sistema puede construir identidad.

```text
bootloader
→ kernel
→ initramfs
→ xGNUpeD
→ Dernel
```

La carga del kernel aporta:

- memoria;
- scheduler;
- procesos;
- drivers;
- VFS;
- dispositivos;
- llamadas al sistema;
- namespaces;
- cgroups;
- seguridad base;
- comunicación con userland.

maGNUx añade una lectura:

```text
esas capacidades deben ser interpretadas
por una identidad de sistema,
no solo usadas por servicios tardíos.
```

---

## Las capas conceptuales maPOSIXd

```text
┌──────────────────────────────────────────────┐
│         maPOSIXd02                           │
│  Carga del núcleo operativo (ADMIN)          │
│  Entorno administrativo estándar             │
├──────────────────────────────────────────────┤
│         Dernel                               │
│  Capa de licencia operativa                  │
│  Software operativo acreditado para el host  │
├──────────────────────────────────────────────┤
│         maPOSIXd01                           │
│  Runtime de comunicación (COMM)              │
│  Mediación, IPC, DBus, Kommu, estado         │
├──────────────────────────────────────────────┤
│         maPOSIXd00                           │
│  Núcleo base en initramfs (ROOT)             │
│  Fundamento soberano del arranque            │
└──────────────────────────────────────────────┘
```

Estas capas no son una especificación cerrada. Son marcadores de transición.

---

## maPOSIXd00 — ROOT compatible

- Ubicación: initramfs.
- Función: establecer fundamento soberano del arranque.
- Absorbe: protosistema raíz, initramfs, init_ID, validación temprana.
- Equivalencia actual aproximada: etapa pre-init, detección de hardware, scripts tempranos, hooks dracut/initramfs.

maPOSIXd00 debe responder:

```text
¿puedo continuar hacia un sistema raíz ordinario?
```

---

## maPOSIXd01 — COMM compatible

- Ubicación: área de comunicación y runtime temprano.
- Función: mediar entre identidad, kernel y servicios.
- Absorbe: Kommu, DBus reinterpretado, IPC, comunicación temprana, reconciliación de estado.
- Equivalencia actual aproximada: parte de la orquestación que hoy puede aparecer distribuida entre systemd, dbus, udev, scripts, sockets y servicios.

maPOSIXd01 debe responder:

```text
¿cómo se comunican las capas bajo una política común?
```

---

## Dernel — licencia operativa

- Ubicación: entre COMM y ADMIN.
- Función: conceder licencia operativa sobre el Host al Guest.
- Absorbe: ZaltID, Dernel run time, Dernel guest, contrato operativo.
- Equivalencia actual: no tiene equivalente directo; algunas funciones aparecen repartidas entre init, políticas, sesiones, permisos y supervisores.

Dernel debe responder:

```text
¿qué puede operar sobre el Host y bajo qué contrato?
```

---

## maPOSIXd02 — ADMIN compatible

- Ubicación: entorno administrativo y userspace.
- Función: cargar el núcleo operativo del entorno reconocible.
- Absorbe: servicios, shell, administración, sesiones, aplicaciones, operación cotidiana.
- Equivalencia actual: lo que el usuario percibe como un Linux normal.

maPOSIXd02 debe responder:

```text
¿qué entorno operativo se entrega al usuario o administrador?
```

---

## Modelos init absorbidos

La documentación antigua comparaba modelos de levantamiento tradicional. En esta lectura quedan absorbidos como opciones operativas dentro de ADMIN, no como fundamento de soberanía.

| Modelo | Valor | Límite desde maGNUx |
|---|---|---|
| sysVinit | Sencillez histórica, runlevels, scripts claros. | Dependencias implícitas y baja expresividad semántica. |
| OpenRC | Modularidad, legibilidad, integración con Gentoo y filosofía Unix. | Sigue siendo gestor de servicios, no identidad temprana. |
| runit | Supervisión simple, rapidez, claridad. | No formula soberanía del arranque. |
| dinit | Supervisor moderno, dependencias claras, diseño contenido. | Se mantiene en plano operativo. |
| systemd | Gramática potente de servicios, cgroups, logs, dependencias y sesiones. | Puede mezclar demasiadas funciones como fundamento semántico. |

maGNUx no exige eliminar estos modelos. Los reubica:

```text
init / supervisor
→ pieza ADMIN o COMM
→ no fundamento completo de identidad
```

---

## systemd como antecedente incómodo

systemd demostró algo importante: el sistema necesitaba más coherencia que una colección de scripts.

Pero desde maGNUx, systemd se queda corto porque intenta ordenar desde dentro del flujo operativo.

```text
systemd
→ ordena servicios
→ coordina estado
→ gestiona sesiones
→ usa cgroups
→ proporciona logs
```

maGNUx pregunta antes:

```text
¿qué identidad y contrato hacen legítimo ese estado?
```

Por eso systemd no es enemigo. Es antecedente.

---

## Hacks al kernel absorbidos

La línea antigua de “hacks al kernel actual” queda reinterpretada como áreas de presión donde Linux puede necesitar adaptaciones o extensiones para madurar hacia maGNUx:

| Área | Pregunta maGNUx |
|---|---|
| Comunicación | ¿cómo hacer que IPC, DBus, sockets y buses transporten identidad y contrato? |
| Almacenamiento | ¿cómo distinguir datos, nodos técnicos y declaraciones semióticas persistentes? |
| Periféricos | ¿cómo validar dispositivos bajo identidad de Host? |
| RAM / bus | ¿cómo representar estado temprano y continuidad viva sin depender solo del userspace? |
| Kernel config caps | ¿qué capacidades deben activarse para permitir initramfs, seguridad, namespaces, cgroups, medición y trazabilidad? |

No son hacks arbitrarios. Son zonas donde la arquitectura actual revela tensión.

---

## Compatibilidad no significa subordinación

La compatibilidad POSIX permite que maGNUx no rompa con todo:

- conserva herramientas;
- conserva conocimiento comunitario;
- conserva userland;
- conserva scripts;
- conserva patrones de administración;
- conserva distribuciones;
- conserva software existente.

Pero compatibilidad no significa subordinación conceptual.

```text
POSIX permite operar.
maGNUx intenta declarar por qué esa operación es legítima.
```

---

## Áreas funcionales en maduración

| Área | Descripción |
|---|---|
| Identidad | Quién es el sistema, cómo se legitima, cómo persiste y cómo puede auditarse. |
| Gobierno | Qué instancia posee autoridad estructural sobre hardware, arranque y continuidad. |
| Comunicación | Relaciones entre procesos, servicios, buses, validaciones y permisos. |
| Operación | Entorno administrativo y de usuario. |
| Compatibilidad | Reutilización del legado Linux/POSIX sin renunciar a reorganización profunda. |

Estas áreas evolucionan así:

```text
Fundamento
→ Coordinación
→ Licencia
→ Operación
```

---

## Criterio de aceptación conceptual

Las capas POSIX quedan correctamente formuladas si permiten responder:

1. qué se conserva de POSIX;
2. qué aporta Linux como laboratorio;
3. qué pertenece a maPOSIXd00;
4. qué pertenece a maPOSIXd01;
5. qué papel cumple Dernel;
6. qué pertenece a maPOSIXd02;
7. qué lugar ocupan systemd, OpenRC, runit, dinit y sysVinit;
8. qué zonas de kernel requieren maduración;
9. cómo se evita romper compatibilidad;
10. cómo se evita quedar atrapado por la compatibilidad.

---

*← [Bus de arranque](05-bus-arranque.md) | [Índice](../README.md) | Siguiente: [xGNUpeD →](../identidad/07-xgnuped.md)*
