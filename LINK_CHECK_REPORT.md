# Informe de enlaces Markdown

> [🏠 Inicio](README.md)

## Revisión PR #47

Se revisó el PR de refundición documental `docs/nav-final-candidate` contra `master`.

## Incidencias encontradas y corregidas

| Incidencia | Estado |
|---|---|
| `docs/README.md` enlazaba `init_ID` como si estuviera dentro de `docs/`; el archivo real está en la raíz como `initID.MD`. | Corregido a `../initID.MD`. |
| `docs/arquitectura/README.md` enlazaba `initID.MD` con ruta incorrecta. | Corregido a `../../initID.MD`. |
| `docs/manifesto/README.md` enlazaba `notasAut.md`, archivo no presente en la rama. | Retirado de la navegación. |
| `docs/legacy/README.md` mencionaba `notasAut.md`, archivo no presente en la rama. | Retirado del mapa. |
| `docs/README.md` enlazaba `tinetsys.md`, archivo no presente en la rama. | Retirado de la navegación principal. |

## Cambio de criterio posterior

Tras la revisión inicial, se cambió el criterio de integración:

```text
antes: documentos nuevos + corpus antiguo como desarrollo profundo enlazado
ahora: documentos nuevos como lectura única + corpus antiguo absorbido conceptualmente
```

Por tanto, los índices principales ya no deben empujar al lector hacia documentos duplicados como ruta alternativa. Los documentos históricos pueden permanecer durante la transición, pero la lectura recomendada debe pasar por los documentos nuevos.

## Duplicidades conceptuales absorbidas

| Concepto | Documento nuevo que absorbe | Documento histórico absorbido |
|---|---|---|
| xGNUpeD e identidades | `docs/identidad/07-xgnuped.md` | `docs/xGNUpeD.md`, `docs/distroID.md`, `docs/relonIO.md`, `docs/disruPed.md`, `docs/kommuID.md` |
| Dernel / ZaltID | `docs/identidad/09-dernel.md` | `docs/dernelZaltID.md`, `docs/maGNUx.md` |
| Trilobytes / Logon / Login | `docs/identidad/08-trilobytes.md` | `docs/trilobytes.md`, `docs/logon.md`, `docs/login.md` |
| Host / Guest / VMKZ / VMDZ | `docs/identidad/10-host-guest.md` | `docs/hostroot.md`, `docs/guestroot.md`, `docs/VMKZ.md`, `docs/VMDZ.md`, `docs/bypassKZDZ.md` |
| Unix / GNU / C | `docs/filosofia/12-filosofia-unix-gnu.md` | `docs/GNUpeD.md`, `docs/ISOC23.md` |
| Hardware y capacidades | `docs/filosofia/14-hardware.md` | `docs/lookingfor.md`, `docs/intelASMx86_64.md`, `docs/kernelConfigCaps.md` |
| Arranque temprano | `docs/arquitectura/04-inicio-sistema.md` | `docs/initSoonrise.md`, `docs/systemProt.md`, `docs/initramfs.MD`, `docs/seL4.MD`, `docs/Hurd.MD`, `initID.MD` |
| Linux, init y compatibilidad | `docs/arquitectura/06-capas-posix.md` | `docs/kernelLoad.md`, `docs/kernelLinux.md`, `docs/research00.md`, documentos init tradicionales |

## Estado

La navegación principal queda corregida y orientada a lectura única.

Pendiente antes de marcar el PR como listo para merge:

1. decidir si los documentos históricos absorbidos se conservan sin enlazar, se mueven a archivo o se eliminan;
2. validar automáticamente todos los enlaces Markdown;
3. revisar que cada documento nuevo contiene ya suficiente contenido absorbido y no solo una referencia conceptual.