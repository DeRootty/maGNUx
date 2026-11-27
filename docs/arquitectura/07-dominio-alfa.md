# 07 — Dominio Alfa: arranque temprano y procesamiento heterogéneo

> [⬆ Arquitectura](README.md) · [📚 Documentación](../README.md) · [🏠 Inicio](../../README.md)

**Estado:** propuesta de arquitectura objetivo; pendiente de prueba en hardware concreto.  
**Continuidad:** [04 — Inicio estratificado](04-inicio-sistema.md) → [05 — Bus de arranque](05-bus-arranque.md) → este dominio especializado.  
**Identidad:** [Usuario Alfa](../identidad/12-usuario-alfa.md). **Verificación:** [Especificación de observabilidad](../propuesta-tecnica/04-alfa-observabilidad-spec.md).

## La cuestión que se abre después del protosistema raíz

El arranque actual de Zalty ensaya HostID, política y comunicación temprana sobre Linux/initramfs. La propuesta Alfa investiga una etapa futura: **instanciar antes del Linux ordinario un dominio de ejecución con memoria reservada**, para que Linux descubra después su interfaz como un recurso del sistema.

No es «instalar un segundo kernel dentro del archivo RAM» y esperar que Linux lo reconozca. RAM almacena código y estado, pero **el micronúcleo seL4 necesita instrucciones ejecutadas por un procesador compatible**. Una NPU especializada en operaciones tensoriales no ejecuta necesariamente un sistema operativo.

La hipótesis preferida separa:
- un **control de dominio basado en seL4**, sobre un núcleo general compatible o controlador adecuado;
- una **NPU** que sustenta principalmente la inferencia de Alfa;
- una **GPU dedicada** para cargas paralelas y transformaciones;
- una **APU** con CPU para Linux y gráficos integrados para presentar la sesión.

Este reparto es **lógico y experimental**, no un requisito universal demostrado de maGNUx.

## Secuencia objetivo de constitución

~~~text
Firmware / UEFI / gestor de arranque
  ├─ verifica política, estado y recursos disponibles
  ├─ reserva memoria y recursos de control del dominio Alfa
  ├─ inicia dominio seL4 sobre CPU/controlador compatible (si la plataforma lo permite)
  │    ├─ declara capacidades y versión de interfaz
  │    ├─ prepara acceso legítimo a NPU / GPU
  │    └─ expone descriptores de recursos y canal de comunicación
  └─ transfiere control al arranque de Linux
          ├─ memoria reservada excluida de gestión Linux
          ├─ descubre dispositivo lógico / canal del dominio Alfa
          ├─ valida protocolo, versión, permisos y estado
          ├─ integra la evidencia del dominio en ROOT/COMM/ADMIN
          └─ inicia antesala de sesión de usuarios normales
~~~

Que Linux pueda **descubrir** el dominio no significa que deba controlarlo directamente ni que el dominio adquiera las facultades de ROOT. La frontera de autoridad se define por contrato y debe aplicarse en mecanismos capaces de hacerla cumplir.

### Contrato de descubrimiento

Una interfaz provisional Alfa/Linux declararía, al menos:

| Campo | Propósito |
|---|---|
| `abi_version` | Compatibilidad y negociación de protocolo |
| `boot_id`, `host_id` | Vínculo entre arranque, equipo y dominio |
| `domain_state` | Ausente, preparado, activo, degradado o fallido |
| `features` | Inferencia, datos de sensores, perturbaciones controladas, diagnósticos |
| `npu_profile`, `gpu_profile` | Recursos realmente disponibles, no supuestos |
| `shared_memory_layout` | Rangos, tamaños, permisos y coherencia de cachés |
| `interrupt_or_signal` | Notificación y sincronización |
| `authority_contract` | Referencias autenticadas a facultades, no permisos autoafirmados |
| `health` | Latido, fallos y versión de firmware/modelos |
| `provenance` | Fuentes y grados de certeza de evidencias |

`/dev/magnux-alpha` podría ser un nombre de dispositivo lógico en Linux, solo si se desarrolla un controlador real. El nombre no constituye por sí mismo una API.

## Camino de implementación: posibilidades, no equivalencias automáticas

En sistemas con coprocesadores compatibles, Linux dispone de **remoteproc**, **rpmsg** y **virtio**; pueden servir como referencias para descubrimiento o comunicación con dominios remotos. No significa que funcionen automáticamente con cualquier NPU de PC ni que un seL4 arrancado antes de Linux sea reconocido por `remoteproc` sin un controlador o plataforma específicos.

La memoria reservada debe declararse mediante mecanismos del firmware y del sistema de arranque (p. ej., tablas UEFI/ACPI en PC o Device Tree en otras plataformas). El aislamiento requiere asimismo considerar IOMMU, DMA, IRQ, memoria compartida, actualizaciones y recuperación ante fallo. Reservar una página no asegura que un dispositivo no pueda acceder a ella.

Para intercambio entre GPU y presentación de la iGPU existen técnicas de compartición de búferes (p. ej., DRM PRIME / DMA-BUF), condicionadas por controladores, sincronización y hardware. La NPU puede requerir APIs distintas. Los copiados de datos y su coste deben medirse, no ignorarse.

## Modelo de estados

~~~text
AUSENTE_NPU
    └─ Alfa CAÍDO POR DEFECTO
       └─ ADMIN puede invocarlo excepcionalmente con recursos alternativos explícitos

NPU_PRESENTE
    └─ DOMINIO_PREPARADO
       ├─ contrato + recursos válidos → ALFA_ACTIVO
       ├─ fallos recuperables → ALFA_DEGRADADO
       └─ ausencia de garantías → ALFA_CAÍDO

ALFA_ACTIVO
    └─ puede adquirir rol ROOT / COMM / ADMIN
       solamente desde contextos humanos autorizados
~~~

La GPU dedicada y la APU con iGPU conforman **una configuración objetivo Alfa completa**, sin cambiar tácitamente la regla de activación por NPU. Si se decide hacer obligatoria la GPU para Alfa, habrá que publicar una revisión contractual de requisitos, capacidades y rutas degradadas.

## La secuencia de arranque no altera la soberanía

La precarga de seL4 tiene como objetivo dar soporte estable a Alfa, **no reemplazar el kernel Linux** ni someter ROOT a Dernel. La cadena de arranque debe conservar la distinción ROOT/kernel, COMM/xGNUpeD y ADMIN/Dernel. Trilobytes revela los estados constituidos y las decisiones auténticas de los mecanismos competentes.

El modo ROOT puro de mantenimiento debe seguir disponible como ruta excepcional prevista. Un fallo de seL4, NPU o GPU **no debe destruir por defecto el inicio básico de Linux**: se registra causa, se declara el estado Alfa caído y se respetan políticas de recuperación.

## Acceso semiótico del dominio Alfa

La constitución temprana de Alfa no implica acceso irrestricto al espacio de direcciones de Linux. Las referencias semióticas a recursos ROOT, COMM, Adminland y Userland deben exponerse mediante interfaces autorizadas y verificables que preserven la procedencia de datos, los límites del contrato y la revocación. Una referencia conceptual a un objeto no habilita leer su memoria material. La NPU o el dominio de control no adquieren permisos de DMA por la sola necesidad de inferencia.

La [hipótesis de homeostasis computacional](../manifesto/04-helice-alfa-continuidad.md) distingue entre diagnóstico y ejecución de respuestas. La eventual detección de amenazas o desequilibrios se somete a controles independientes de Alfa; su fallo o compromiso no debe desactivar las garantías esenciales de ROOT, COMM y ADMIN. El [contrato de observabilidad](../propuesta-tecnica/04-alfa-observabilidad-spec.md) detalla cómo ensayar la atribución semiótica antes de trasladarla al dominio especializado.

## Riesgos y límites de seguridad

- El soporte de seL4 y sus **garantías verificadas** dependen de arquitectura, plataforma, características y configuración concretas.
- Drivers, firmware NPU/GPU, aceleradores, DMA y memoria compartida quedan fuera de muchas garantías del núcleo salvo pruebas adicionales.
- Ejecutar Linux y seL4 en CPUs físicas o núcleos separados requiere gobierno efectivo de arranque, recursos e interrupciones; no basta con cargar dos imágenes.
- La concurrencia sobre un mismo dispositivo puede causar conflictos si no existe asignación y arbitraje real.
- Un dominio remoto con facultades elevadas debe contar con autorización verificable, límites, trazabilidad y revocación efectiva.

## Hoja de pruebas propuesta

| Fase | Experimento | Evidencia de éxito |
|---|---|---|
| A | Simular el protocolo Alfa/Linux como dos servicios separados bajo Linux/QEMU | Descubrimiento, negociación y estados reproducibles |
| B | Reservar memoria e intercambiar mensajes sin seL4 | Ausencia de solapamientos, comprobaciones de integridad y recuperación |
| C | Arrancar seL4 en plataforma compatible y controlar un servicio de prueba | Aislamiento y comunicación básica medidos |
| D | Incorporar NPU real cuando su interfaz y firmware lo permitan | Inferencia atribuida al dispositivo y coste CPU cuantificado |
| E | Añadir GPU paralela e iGPU de presentación | Rendimiento y coste de copias comparables |
| F | Fallos, revocación, ataque y apagado | Linux continúa; no hay escapes de capacidades; registros verificables |

Estas fases no son hitos cumplidos del repositorio. [Zalty](../../zalty/readme.md) conserva el alcance de su prototipo HostID.

## Referencias externas

- [seL4: plataformas soportadas](https://docs.sel4.systems/Hardware/) y [configuraciones verificadas](https://docs.sel4.systems/projects/sel4/verified-configurations.html).
- [Linux: Remote Processor Framework](https://docs.kernel.org/staging/remoteproc.html).
- [Linux: DMA-BUF](https://docs.kernel.org/driver-api/dma-buf.html).
- [Linux: DRM memory management / PRIME](https://docs.kernel.org/gpu/drm-mm.html).

**Siguiente lectura:** [04 — Observabilidad y evidencia Alfa](../propuesta-tecnica/04-alfa-observabilidad-spec.md).
