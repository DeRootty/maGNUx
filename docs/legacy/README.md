# Corpus absorbido

> [⬆ Subir a documentación](../README.md) · [🏠 Inicio](../../README.md)

Esta carpeta no es una segunda navegación ni una zona de lectura alternativa.

En esta refundición, los documentos históricos se consideran **material absorbido** por la lectura principal. Pueden permanecer temporalmente en el repositorio durante la transición, pero la ruta recomendada debe ser siempre:

```text
docs/README.md
→ propuesta-tecnica/
→ manifesto/
→ arquitectura/
→ identidad/
→ filosofia/
→ zalty/
```

## Criterio

```text
La documentación nueva ordena.
La documentación antigua se absorbe.
La navegación única sustituye a los mapas paralelos.
```

## Mapa de absorción conceptual

| Conceptos antiguos | Documento nuevo que los absorbe |
|---|---|
| `maGNUx.md`, confianza cero, contrato operativo inicial | `docs/propuesta-tecnica/00-resumen-ejecutivo.md` y `docs/propuesta-tecnica/02-dernel-spec.md` |
| `xGNUpeD.md`, `distroID.md`, `relonIO.md`, `disruPed.md`, `kommuID.md` | `docs/identidad/07-xgnuped.md` |
| `trilobytes.md`, `logon.md`, `login.md` | `docs/identidad/08-trilobytes.md` |
| `dernelZaltID.md`, ZaltID, licencia operativa | `docs/identidad/09-dernel.md` |
| `hostroot.md`, `guestroot.md`, `VMKZ.md`, `VMDZ.md`, `bypassKZDZ.md` | `docs/identidad/10-host-guest.md` |
| `initID.MD`, `contractAdmin.md` | `docs/identidad/11-root-dominios.md` |
| `intro.md`, `GNUpeD.md`, `sysKing.md`, `sysEntity.md`, `contractOS.md` | `docs/manifesto/01-manifiesto.md` y `docs/manifesto/02-hipotesis-central.md` |
| `initSoonrise.md`, `systemProt.md`, `initramfs.MD`, `seL4.MD`, `Hurd.MD` | `docs/arquitectura/04-inicio-sistema.md` |
| `kernelLoad.md`, `kernelLinux.md`, `research00.md`, documentos init | `docs/arquitectura/06-capas-posix.md` |
| `hacks.md`, `hackToComm.md`, `hackToStore.md`, `hackToBridge.md`, `hackToBus.md` | `docs/filosofia/15-hoja-maduracion.md` y futuras especificaciones técnicas |
| `lookingfor.md`, `intelASMx86_64.md`, `kernelConfigCaps.md`, `ISOC23.md` | `docs/filosofia/14-hardware.md` y `docs/filosofia/12-filosofia-unix-gnu.md` |

## Regla de transición

Mientras el PR esté en borrador, los documentos históricos pueden seguir presentes para consulta y comparación.

Antes de marcar el PR como listo para merge, hay que decidir una de estas dos rutas:

1. mantenerlos como archivo histórico no enlazado desde la ruta principal;
2. moverlos a una carpeta de archivo explícita;
3. eliminarlos si su contenido ya ha quedado completamente absorbido.

La meta no es borrar memoria, sino evitar que el lector tenga que elegir entre dos mapas incompatibles.