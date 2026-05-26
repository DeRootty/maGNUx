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

## Absorción profunda ya realizada

### Bloque manifiesto

| Documento nuevo | Conceptos absorbidos |
|---|---|
| `docs/manifesto/01-manifiesto.md` | GNU/GPL, Linux como giro tangencial a Unix, control/operación, identidad estructural, droide/dron, IA sistémica y KSIA Plasma como horizonte subordinado. |
| `docs/manifesto/02-hipotesis-central.md` | Soberanía sistémica, entidades sistematizadas, contrato OS, metadistribución de paso, continuidad Unix y legitimidad del arranque. |

### Bloque identidad

| Documento nuevo | Conceptos absorbidos |
|---|---|
| `docs/identidad/07-xgnuped.md` | xGNUpeD, identidad distributiva, asociativa, conmutativa y comunicativa. |
| `docs/identidad/08-trilobytes.md` | Trilobytes, Logon, Login, legitimación orgánica y coherencia de sesión. |
| `docs/identidad/09-dernel.md` | Dernel, ZaltID, licencia operativa, contrato operativo y relación con systemd. |
| `docs/identidad/10-host-guest.md` | Host, Guest, VMKZ, VMDZ, bypass y plano delegado. |
| `docs/identidad/11-root-dominios.md` | hroot, croot, droot, admin, init_ID, contrato administrativo y dominios de autoridad. |

### Bloque arquitectura

| Documento nuevo | Conceptos absorbidos |
|---|---|
| `docs/arquitectura/03-estratos.md` | ROOT, COMM, ADMIN, control/operación y dominios estructurales. |
| `docs/arquitectura/04-inicio-sistema.md` | Arranque temprano, protosistema raíz, initramfs, seL4, Hurd e init_ID. |
| `docs/arquitectura/05-bus-arranque.md` | Kommu, identidad comunicativa, `/boot/metal`, `/run/maGNUx`, nodos técnicos/semióticos y hardware futuro. |
| `docs/arquitectura/06-capas-posix.md` | Linux como kernel modelo, carga del kernel, POSIX, init tradicionales, systemd, OpenRC, runit, dinit, sysVinit y hacks al kernel. |

## Pendiente antes de marcar el PR como listo para merge

1. absorber en profundidad los bloques `propuesta-tecnica/` y `filosofia/`;
2. decidir si los documentos históricos absorbidos se conservan sin enlazar, se mueven a archivo o se eliminan;
3. validar automáticamente todos los enlaces Markdown;
4. revisar que la descripción del PR refleje el nuevo criterio de absorción, no solo integración.