# maGNUx — Propuesta técnica introductoria

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

**Versión:** 0.2-draft  
**Estado:** Fase conceptual con prototipo initramfs en curso  
**Base práctica:** Linux kernel + initramfs + QEMU  
**Arquitectura inicial:** x86_64 CISC  
**Implementación de referencia:** Zalty  

---

## En pocas palabras

Esta propuesta técnica traduce el manifiesto maGNUx en una hipótesis evaluable.

La pregunta deja de ser solo filosófica:

```text
¿debería un sistema tener soberanía explícita?
```

Y pasa a ser técnica:

```text
¿qué piezas mínimas habría que construir
en initramfs
para demostrar identidad temprana,
validación de arranque
y licencia operativa inicial?
```

La respuesta v0.1 es:

```text
HostID / xGNUpeD
→ identidad temprana

boot-validator
→ validación de secuencia

early-comm / Kommu mínimo
→ comunicación temprana

Dernel policy
→ licencia operativa inicial
```

---

## Problema técnico

Linux puede arrancar correctamente sin declarar una identidad semántica propia antes del userspace ordinario.

Eso significa que muchas decisiones tempranas quedan repartidas entre:

- firmware;
- bootloader;
- kernel;
- parámetros de arranque;
- initramfs;
- scripts;
- udev;
- systemd u otro init;
- configuración de distribución;
- administración posterior.

El sistema funciona, pero no tiene un contrato temprano único que responda:

1. qué Host está arrancando;
2. qué política de arranque acepta;
3. qué secuencia se considera legítima;
4. qué procesos son críticos;
5. qué comunicación temprana queda registrada;
6. cuándo puede entregarse control a un entorno operativo.

---

## Hipótesis técnica

La hipótesis técnica de maGNUx es:

```text
initramfs puede actuar como laboratorio suficiente
para ensayar una raíz semiótica temprana
que declare identidad,
valide secuencia
y entregue licencia operativa inicial
antes de montar el sistema raíz ordinario.
```

Esto no convierte initramfs en la solución final. Lo convierte en el primer banco de pruebas.

---

## Arquitectura mínima v0.1

```text
firmware / bootloader
  ↓
kernel Linux
  ↓
initramfs
  ├── HostID / xGNUpeD
  │     └── declara identidad temprana
  ├── boot-validator
  │     └── valida secuencia y condiciones mínimas
  ├── early-comm
  │     └── registra eventos y estado temprano
  ├── Dernel policy
  │     └── concede o deniega continuidad operativa inicial
  ↓
pivot_root / switch_root
  ↓
ADMIN / sistema ordinario
```

---

## Componentes técnicos

| Componente | Capa | Función | Estado v0.1 |
|---|---|---|---|
| HostID / xGNUpeD | ROOT | Generar identidad temprana del Host. | Especificado y prototipable. |
| boot-validator | ROOT | Validar secuencia mínima de arranque. | Prototipable en C/shell. |
| early-comm | COMM | Registrar eventos y comunicar estado temprano. | Prototipable. |
| Dernel policy | ROOT/COMM | Autorizar continuidad y binarios críticos. | Prototipable como `policy.conf`. |
| Trilobytes | ADMIN/Guest | Verificar sesión orgánica. | Fuera de alcance v0.1. |
| `/boot/metal` | Persistencia | Declarar contratos y nodos semióticos. | Documental/prototipo Zalty. |
| `/run/maGNUx` | Runtime | Exponer estado vivo temprano. | Prototipable. |

---

## Qué debe demostrar el prototipo

El prototipo no tiene que demostrar todo maGNUx.

Debe demostrar tres cosas concretas:

### 1. Identidad temprana

Antes de montar `/`, el sistema debe generar o leer una identidad de Host:

```text
host_id
kernel_id
distro_id
boot_mode
policy_id
```

### 2. Validación de continuidad

Antes de entregar control, debe poder responder:

```text
¿la secuencia de arranque coincide con lo esperado?
¿faltan nodos esenciales?
¿la política permite continuar?
```

### 3. Comunicación temprana

Debe dejar rastros consultables de lo ocurrido:

```text
/run/maGNUx/events.log
/run/maGNUx/host-id
/run/maGNUx/boot-report.toml
```

---

## Qué queda fuera de v0.1

Queda fuera de alcance inicial:

- Trilobytes completo;
- login/logon integrados;
- KSIA Plasma;
- NPU;
- hardware específico;
- seL4 como base real;
- Hurd como arquitectura activa;
- reemplazo de systemd;
- motor criptográfico completo;
- modificación del kernel Linux.

Estos elementos permanecen como horizonte, no como requisito del primer prototipo.

---

## Separación por madurez

| Nivel | Contenido | Acción |
|---|---|---|
| Filosófico | Droide/dron, hormiguero, soberanía futura, IA sistémica. | Conservar como marco. |
| Arquitectónico | ROOT/COMM/ADMIN, xGNUpeD, Dernel, Trilobytes, maPOSIXd. | Especificar. |
| Técnico v0.1 | HostID, boot-validator, early-comm, policy.conf, QEMU. | Prototipar. |
| Técnico v0.2+ | `/boot/metal`, `/run/maGNUx`, contratos TOML, nodos semióticos. | Integrar en Zalty. |
| Futuro | seL4, hardware dedicado, NPU, KSIA Plasma. | Investigar. |

---

## Entregables actuales

| Documento | Función |
|---|---|
| [00 — Resumen ejecutivo](00-resumen-ejecutivo.md) | Define el alcance técnico evaluable. |
| [01 — Especificación xGNUpeD](01-xgnuped-spec.md) | Define identidad temprana y contrato HostID. |
| [02 — Especificación Dernel](02-dernel-spec.md) | Define licencia operativa inicial y política de autorización. |
| [Prototipo HostID v0.1](../../zalty/initramfs/prototipo-hostid-v0.1/README.md) | Ensayo técnico en initramfs/QEMU. |

---

## Criterios de aceptación de la propuesta técnica

La propuesta técnica v0.1 se considera útil si permite:

1. compilar o ejecutar un prototipo mínimo en initramfs;
2. generar una identidad de Host antes del userspace ordinario;
3. validar una secuencia mínima de arranque;
4. escribir un informe de estado en `/run/maGNUx`;
5. cargar una política inicial;
6. autorizar o denegar continuidad;
7. probar el flujo en QEMU;
8. explicar qué parte pertenece a ROOT, COMM o ADMIN;
9. no depender de systemd como fundamento semántico;
10. dejar claro qué queda fuera de alcance.

---

## Hoja de ruta inmediata

| Paso | Entregable | Estado |
|---|---|---|
| 1 | Resumen ejecutivo evaluable | En curso |
| 2 | Especificación técnica de xGNUpeD / HostID | En curso |
| 3 | Especificación del contrato Dernel | En curso |
| 4 | `host_identity.c` y `host_identity.h` | Prototipo en Zalty |
| 5 | `boot_validator.c` y `boot_validator.h` | Prototipo en Zalty |
| 6 | `early_comm.c` y `early_comm.h` | Prototipo en Zalty |
| 7 | `policy.conf` | Prototipo en Zalty |
| 8 | Test QEMU | Prototipo en Zalty |
| 9 | Reporte `/run/maGNUx` | Pendiente de maduración |
| 10 | Contratos `/boot/metal` | Pendiente de maduración |

---

*Documento base: [Manifiesto completo](../manifesto/01-manifiesto.md)*  
*Siguiente: [Especificación xGNUpeD →](01-xgnuped-spec.md)*
