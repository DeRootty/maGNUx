# 03 — Los tres estratos: ROOT, COMM, ADMIN

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> El principio rector de maGNUx es la **separación entre control y operación**.

---

## En pocas palabras

maGNUx organiza el sistema en tres estratos persistentes:

```text
ROOT
→ autoridad estructural, identidad temprana, base material

COMM
→ mediación, comunicación, coherencia y reconciliación

ADMIN
→ autoridad administrativa de Dernel; licencia y habilitación del Userland
```

La idea central no es añadir una capa decorativa sobre Linux. Es evitar que el sistema confunda:

```text
fundamento
```

con:

```text
operación
```

En maGNUx, el suelo no desaparece cuando se levanta la casa.

---

## Control y operación

### Control

Se entiende por **control** la capacidad de someter el hardware y los fundamentos del sistema a una autoridad estructural máxima.

Esta autoridad no debe confundirse simplemente con el privilegio tradicional de `root`, sino con una raíz más profunda: la instancia desde la que el sistema obtiene legitimidad, continuidad y capacidad de persistencia.

Control responde a la pregunta:

```text
¿qué sostiene el sistema y con qué legitimidad?
```

### Operación

Se entiende por **operación** la materialización útil del sistema para usuarios, servicios, procesos y administradores.

Es el plano donde aparecen:

- tareas cotidianas;
- entornos reconocibles;
- administración;
- sesiones;
- servicios;
- aplicaciones;
- interacción ordinaria.

Operación responde a la pregunta:

```text
¿qué puede hacerse con el sistema una vez constituido?
```

### Consecuencia

La arquitectura contemporánea suele mezclar ambos planos.

maGNUx propone separarlos con claridad para evitar que la operación cotidiana absorba o diluya la autoridad estructural del sistema.

---

## Diagrama general

```text
┌─────────────────────────────────────┐
│              ADMIN                  │
│  Dernel en el Adminland              │
│  licencia y habilitación Userland    │
├─────────────────────────────────────┤
│               COMM                  │
│  mediación y coherencia              │
│  IPC, DBus, Kommu, estado, política  │
├─────────────────────────────────────┤
│               ROOT                  │
│  autoridad estructural               │
│  kernel, initramfs, identidad        │
└─────────────────────────────────────┘
```

Entre COMM y ADMIN existe el umbral del **Adminland**, habilitado por xGNUpeD. Entre ADMIN y la actividad ordinaria existe el umbral del **Userland**, habilitado por Dernel. Ambos son dominios constitutivos, no soberanías adicionales; Trilobytes revela la sesión de manera transversal.

Estos estratos no deben leerse como etapas desechables. Cada uno permanece vivo durante el ciclo de vida del sistema.

---

## ROOT

ROOT no es solo el superusuario clásico ni una equivalencia simple con el kernel.

ROOT es la raíz estructural del sistema: la instancia que garantiza:

- continuidad;
- legitimidad inicial;
- base material;
- orientación del arranque;
- persistencia del fundamento;
- autoridad sobre hardware, comunicación y licencia operativa.

ROOT absorbe aquí los conceptos antiguos de:

- protosistema raíz;
- soberanía enraizada;
- init_ID;
- VMKZ;
- autoridad del Host;
- hroot, croot y droot.

ROOT es el estrato que permite decir:

```text
este sistema no solo funciona;
este sistema tiene fundamento.
```

---

## COMM

COMM no es solo red ni transporte entre procesos. Es el plano de mediación y coherencia.

En COMM, la comunicación deja de ser mero intercambio y pasa a convertirse en:

- coordinación;
- validación;
- reconciliación de estado;
- secuenciación;
- gobierno de permisos;
- comunicación temprana;
- trazabilidad.

COMM absorbe conceptos antiguos como:

- Kommu;
- identidad comunicativa;
- buses de arranque;
- DBus reinterpretado;
- IPC bajo contrato;
- comunicación entre Host y Guest;
- comunicación entre Dernel y Trilobytes.

xGNUpeD expresa COMM: levanta la distribución sobre los recursos del kernel, constituye objetos funcionales y habilita el Adminland en el que Dernel podrá operar. COMM es el estrato que permite decir:

```text
las partes del sistema no solo hablan;
hablan bajo una coherencia común.
```

---

## ADMIN

ADMIN es la máxima autoridad administrativa dentro del contrato de Dernel, no una autoridad sobre ROOT. Dernel opera en el Adminland habilitado por xGNUpeD y, mediante licencia operativa, habilita el Userland. El entorno de usuario resultante contiene el Linux reconocible:

- shells;
- servicios;
- herramientas;
- procesos de usuario;
- administración cotidiana;
- gestores de paquetes;
- tiendas de aplicaciones;
- escritorio;
- sesión;
- experiencia funcional.

ADMIN no equivale al usuario ordinario ni a sus procesos. Su ámbito administrativo hace posible un Userland útil y gobernable, sin confundirse con el fundamento que lo legitima.

La relación entre ADMIN y el Userland habilitado permite situar los conceptos antiguos de:

- operación delegada;
- Guest;
- VMDZ;
- sadmin, uadmin y aadmin;
- servicios de usuario;
- sesión orgánica;
- administración de aplicaciones.

ADMIN permite decir:

```text
el sistema puede usarse,
pero su uso no agota su soberanía.
```

---

## Dominios de autoridad

ROOT se expresa mediante dominios de autoridad que después se desarrollan en el bloque de identidad:

| Dominio | Relación | Función |
|---|---|---|
| Servicios primitivos | hroot | Hardware, CPU, memoria, dispositivos, materialidad. |
| Servicios de comunicación | croot | IPC, red, buses, Kommu, comunicación interna. |
| Servicios operativos | droot | Licencia Dernel, autorización y transición Host/Guest. |
| Servicios administrativos | admin | Gestión cotidiana bajo contrato. |
| Servicios de usuario | guest | Sesión, aplicaciones y actividad orgánica. |

La raíz efectiva del sistema emerge cuando estos dominios quedan articulados bajo una misma coherencia estructural.

---

## Secuencia de permanencia

maGNUx no concibe el arranque como una escalera que se tira después de subir.

```text
ROOT permanece
  COMM permanece → Adminland habilitado
    ADMIN permanece → Userland habilitado
      Trilobytes revela la sesión
```

El punto crucial es que ADMIN no reemplaza a COMM, y COMM no reemplaza a ROOT.

Cada estrato sostiene al siguiente sin transferirle necesariamente su propia autoridad. El usuario ordinario no es ADMIN; las sesiones excepcionales adquieren roles mediante autorización expresa.

---

## Qué sí es y qué no es maGNUx

### Sí es

- Una arquitectura conceptual para pensar el gobierno explícito del sistema.
- Una tentativa de dotar al arranque de identidad y soberanía.
- Una separación entre fundamento, mediación y operación.
- Una propuesta transicional apoyada en Linux.
- Una teoría del sistema orientada a trazabilidad, coherencia y legitimidad del estado.
- Una gramática para ordenar piezas existentes y otras aún por definir.

### No es

- Un reemplazo inmediato de Linux.
- Una implementación terminada.
- Un sistema operativo clásico ya cerrado.
- Una negación del valor de systemd, DBus, namespaces, cgroups o el userland contemporáneo.
- Una simple secuencia nueva de instrucciones de arranque.
- Una promesa de invulnerabilidad absoluta.

---

## La metáfora del edificio y la conexión transversal

Los tres estratos persistentes admiten una representación espacial:

| Planta | Ámbito | Figura de autoridad/operación |
|---|---|---|
| Alta | **Dernel** | **ADMIN** |
| Media | **xGNUpeD** | **COMM** |
| Baja | **Kernel** | **ROOT** |

**Trilobytes es la escalera de incendios**, una conexión transversal entre los tres ámbitos. No constituye otra planta ni altera la distinción entre control y operación.

La metáfora no sustituye el orden temporal del arranque ni implica que Trilobytes tenga acceso ilimitado a todas las plantas. La identidad se constituye tempranamente; la intermediación transversal es una **función posterior y condicionada**.

Para intermediar, Trilobytes necesita la luz verde de **ROOT, COMM y ADMIN**: tres delegaciones positivas e independientes. La identidad común de la arquitectura no implica autoridad común.

La descripción completa está en [Trilobytes](../identidad/08-trilobytes.md).

---

## Criterio de aceptación conceptual

La arquitectura de estratos queda correctamente formulada si permite responder:

1. qué pertenece al fundamento ROOT;
2. qué pertenece a la mediación COMM;
3. qué pertenece a la operación ADMIN;
4. qué permanece vivo tras el arranque;
5. qué no debe confundirse con root tradicional;
6. cómo se evita mezclar control y operación;
7. cómo se prepara la transición hacia identidad, Dernel y Zalty.

---

*← [Horizonte tecnológico y arquetipos](../manifesto/horizonte-arquetipado.md) | [Índice](../README.md) | Siguiente: [Inicio del sistema →](04-inicio-sistema.md)*
