# maGNUx — Propuesta técnica introductoria

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

**Versión:** 0.1-draft  
**Estado:** Fase conceptual con primer prototipo en curso  
**Base:** Linux kernel + initramfs  
**Arquitectura objetivo:** x86_64 CISC  

---

## 1. El problema

Linux carece de una **teoría explícita de gobierno interno**. Ha crecido por capas: soluciones parciales, subsistemas, compatibilidades heredadas. El resultado es un sistema que funciona y escala, pero que no puede responder con claridad a:

- ¿Quién gobierna el sistema *antes* de que el espacio de usuario exista?
- ¿Cómo se legitima el arranque?
- ¿Dónde termina la autoridad estructural y dónde empieza la operación cotidiana?

`systemd` fue un avance real, pero sigue siendo una respuesta **dentro del host**: ordena servicios, no funda soberanía.

El problema se vuelve urgente cuando se plantea integrar **IA a bajo nivel** (sistémica, no por servicio). Una IA que hable directamente con el procesador en C necesita un sistema que sepa quién es, desde dónde arranca y qué le está permitido hacer — antes de que ningún servicio de usuario esté activo.

---

## 2. La propuesta

maGNUx propone una separación estructural entre **gobernar** y **operar** el sistema, materializada en tres estratos:

```
┌──────────────────────────────────┐
│  ADMIN  — operación cotidiana    │  userspace reconocible
├──────────────────────────────────┤
│  COMM   — mediación y coherencia │  IPC, DBus, Kommu services
├──────────────────────────────────┤
│  ROOT   — autoridad estructural  │  kernel + initramfs + identidad
└──────────────────────────────────┘
```

Cada estrato **permanece activo** durante el ciclo de vida del sistema. El suelo no desaparece una vez arrancado.

### Los componentes clave

| Componente | Qué hace | Equivalente actual |
|---|---|---|
| **xGNUpeD** | Finaliza la carga del kernel. Dota al sistema de identidad verificable antes del userspace. | Parte de lo que systemd debería *no* estar haciendo. |
| **Dernel** | Capa entre el kernel y el entorno operativo. Concede licencia operativa al guest sobre el host. | Abstracción ausente en Linux actual. |
| **Trilobytes** | Verifica coherencia entre identidad declarada, política y ejecución real. Se activa en el login. | Ausente. |
| **Kommu services** | IPC y DBus enmarcados en la filosofía COMM, con identidad de estrato. | Parte de systemd + dbus actuales. |

---

## 3. El primer prototipo: initramfs como laboratorio

El hardware actual no soporta soberanía de arranque nativa. Por ello, **initramfs es el laboratorio viable**: el único espacio donde hoy se puede experimentar con una persistencia inicial del sistema que no dependa del userspace convencional.

### Objetivo del prototipo

Demostrar que es posible:

1. **Establecer una identidad de Host** verificable en fase temprana (antes de montar `/`).
2. **Persistir esa identidad** durante todo el ciclo de vida del sistema (no desaparece tras el pivot_root).
3. **Discriminar procesos** en el arranque: ¿este proceso es una pieza crítica del host o un exploit?

### Alcance del prototipo v0.1

```
initramfs
  └── init (script bash → reescribir en C)
        ├── identity/
        │     └── host-id: genera y persiste la identidad del host
        ├── boot/
        │     └── boot-validator: valida la secuencia de arranque
        └── comm/
              └── early-comm: establece canal mínimo de comunicación temprana
```

**Fuera de alcance v0.1:** Trilobytes, KSIA Plasma, NPU, hardware específico.

---

## 4. Separación de partes: qué es postulado y qué es implementable ahora

### 🔵 Filosófico / postulado (base conceptual, no implementar aún)

- La metáfora del hormiguero y la teoría de juegos aplicada al código libre.
- La crítica ontológica a systemd como "línea recta".
- El concepto de Droide vs. Dron.
- La soberanía inteligente por host (requiere hardware futuro).
- KSIA Plasma (requiere maduración del kernel primero).
- Los dominios hroot/croot/droot (requieren Dernel funcional primero).

### 🟡 Arquitectónico / próxima especificación (documentar antes de codificar)

- Protocolo formal de las 4 propiedades de identidad de xGNUpeD.
- Definición del contrato entre Dernel run time y Dernel guest.
- Especificación del bus de comunicación de arranque.
- Las capas maPOSIXd00/01/02 como régimen de compatibilidad.

### 🟢 Implementable ahora en initramfs

- `host-id`: identificador del sistema generado en arranque temprano, persistido en memoria.
- `boot-validator`: verificación de que la secuencia de arranque es la esperada.
- `early-comm`: canal mínimo de comunicación entre etapas del arranque.
- Script `init` refactorizado con separación explícita de fases ROOT / COMM / ADMIN.

---

## 5. Hoja de ruta inmediata

| Paso | Entregable | Estado |
|---|---|---|
| 1 | Este documento | ✅ |
| 2 | Especificación técnica de xGNUpeD | 🔲 `propuesta-tecnica/01-xgnuped-spec.md` |
| 3 | Especificación del contrato Dernel | 🔲 `propuesta-tecnica/02-dernel-spec.md` |
| 4 | `host-id` en C (identidad temprana) | 🔲 `prototipo-initramfs/src/identity/` |
| 5 | `boot-validator` en bash/C | 🔲 `prototipo-initramfs/src/boot/` |
| 6 | `init` refactorizado por estratos | 🔲 `prototipo-initramfs/scripts/` |
| 7 | Test en QEMU | 🔲 `prototipo-initramfs/tests/` |

---

*Documento base: [Manifiesto completo](../manifesto/01-manifiesto.md)*  
*Siguiente: [Especificación xGNUpeD →](01-xgnuped-spec.md)*
