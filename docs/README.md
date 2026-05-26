# Documentación maGNUx

> [🏠 Inicio](../README.md)

Este índice concentra la lectura principal del proyecto. La documentación queda organizada como una sola ruta, con varios niveles de profundidad.

La documentación nueva funciona como columna vertebral. El corpus anterior se integra como desarrollo profundo dentro de cada bloque, evitando dos navegaciones paralelas.

## Lectura principal

| Orden | Plano | Entrada | Desarrollo profundo |
|---:|---|---|---|
| 1 | Propuesta técnica | [Resumen ejecutivo](propuesta-tecnica/00-resumen-ejecutivo.md) | [Manifiesto maGNUx histórico](maGNUx.md), [ZaltID como dernel](dernelZaltID.md) |
| 2 | Manifiesto | [Manifiesto](manifesto/01-manifiesto.md) | [Introducción](intro.md), [Ecosistema GNU](GNUpeD.md), [Soberanía sistémica](sysKing.md) |
| 3 | Manifiesto | [Hipótesis central](manifesto/02-hipotesis-central.md) | [Entidades sistematizadas](sysEntity.md), [Contrato OS](contractOS.md) |
| 4 | Arquitectura | [Estratos](arquitectura/03-estratos.md) | [Host](hostroot.md), [Guest](guestroot.md), [VMKZ](VMKZ.md), [VMDZ](VMDZ.md) |
| 5 | Arquitectura | [Inicio del sistema](arquitectura/04-inicio-sistema.md) | [Arranque temprano](initSoonrise.md), [Protosistema raíz](systemProt.md), [initramfs](initramfs.MD), [seL4](seL4.MD), [Hurd](Hurd.MD) |
| 6 | Arquitectura | [Bus de arranque](arquitectura/05-bus-arranque.md) | [Kommu](kommu.md), [Identidad comunicativa](kommuID.md) |
| 7 | Arquitectura | [Capas POSIX](arquitectura/06-capas-posix.md) | [Linux como kernel modelo](kernelLinux.md), [Carga del kernel](kernelLoad.md), [OpenRC](OpenRC.MD), [sysVinit](sysVinit.md), [runit](runit.md), [dinit](dinit.md), [systemd](SystemD.MD) |
| 8 | Identidad | [xGNUpeD](identidad/07-xgnuped.md) | [xGNUpeD histórico](xGNUpeD.md), [Identidad distributiva](distroID.md), [Identidad asociativa](relonIO.md), [Identidad conmutativa](disruPed.md) |
| 9 | Identidad | [Trilobytes](identidad/08-trilobytes.md) | [Trilobytes histórico](trilobytes.md), [Logon](logon.md), [Login](login.md) |
| 10 | Identidad | [Dernel](identidad/09-dernel.md) | [Dernel/ZaltID](dernelZaltID.md), [maGNUx](maGNUx.md) |
| 11 | Identidad | [Host y Guest](identidad/10-host-guest.md) | [Host root](hostroot.md), [Guest root](guestroot.md), [Bypass VMKZ a VMDZ](bypassKZDZ.md) |
| 12 | Identidad | [Root y dominios](identidad/11-root-dominios.md) | [init_ID](../initID.MD), [Contrato administrativo](contractAdmin.md) |
| 13 | Filosofía | [Unix y GNU](filosofia/12-filosofia-unix-gnu.md) | [Ecosistema GNU](GNUpeD.md), [C23](ISOC23.md) |
| 14 | Filosofía | [Hormiguero](filosofia/13-hormiguero.md) | [Entidades sistematizadas](sysEntity.md), [Colaboración](collab.md) |
| 15 | Filosofía | [Hardware](filosofia/14-hardware.md) | [Hardware presente/futuro](lookingfor.md), [ASM x86_64](intelASMx86_64.md), [Kernel config caps](kernelConfigCaps.md) |
| 16 | Filosofía | [Hoja de maduración](filosofia/15-hoja-maduracion.md) | [Arranque soberano](sovereignBoot.md), [Hacks al kernel](hacks.md), [Comunicación](hackToComm.md), [Almacenamiento](hackToStore.md), [Periféricos](hackToBridge.md), [RAM](hackToBus.md) |
| 17 | Implementación | [Zalty](../zalty/readme.md) | [Fases de Zalty](../zalty/fases/readme.md), [Initramfs](../zalty/initramfs/README.md) |

## Secciones principales

| Sección | Función |
|---|---|
| [Propuesta técnica](propuesta-tecnica/README.md) | Síntesis ejecutiva y primeras especificaciones. |
| [Manifiesto](manifesto/README.md) | Declaración de intención, soberanía e hipótesis central. |
| [Arquitectura](arquitectura/README.md) | Modelo de capas, arranque y compatibilidad. |
| [Identidad](identidad/README.md) | Autoridad, identidad y dominios orgánicos/técnicos. |
| [Filosofía](filosofia/README.md) | Marco cultural, hardware y maduración. |
| [Legacy / corpus integrado](legacy/README.md) | Mapa de documentos históricos integrados en la lectura principal. |

## Política de navegación

Consulta [NAVIGATION.md](NAVIGATION.md) para el patrón de enlaces internos.

## Criterio de esta refundición

```text
La ruta nueva ordena.
El corpus antiguo profundiza.
La navegación única evita duplicar puertas de entrada.
```