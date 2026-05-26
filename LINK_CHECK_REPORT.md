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

## Observación sobre duplicidades

No se han eliminado documentos antiguos. La refundición conserva el corpus histórico como desarrollo profundo enlazado desde los índices nuevos.

Duplicidades conceptuales detectadas, intencionadas por ahora:

| Concepto | Documento nuevo | Documento histórico |
|---|---|---|
| xGNUpeD | `docs/identidad/07-xgnuped.md` | `docs/xGNUpeD.md` |
| Dernel / ZaltID | `docs/identidad/09-dernel.md` | `docs/dernelZaltID.md`, `docs/maGNUx.md` |
| Trilobytes | `docs/identidad/08-trilobytes.md` | `docs/trilobytes.md` |
| Host / Guest | `docs/identidad/10-host-guest.md` | `docs/hostroot.md`, `docs/guestroot.md` |
| Unix/GNU | `docs/filosofia/12-filosofia-unix-gnu.md` | `docs/GNUpeD.md` |

Estas duplicidades no se consideran error en esta fase: la versión nueva actúa como lectura principal y la histórica como ampliación.

## Estado

La navegación principal queda corregida tras la revisión dirigida. Queda pendiente una validación automatizada completa de todos los enlaces Markdown si se desea convertir el borrador en PR listo para merge.