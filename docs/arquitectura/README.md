# Arquitectura

> [⬆ Subir a documentación](../README.md) · [🏠 Inicio](../../README.md)

Esta sección ordena los estratos del sistema, el inicio temprano, el bus de arranque y la relación con capas POSIX.

La arquitectura funciona como puente entre el manifiesto y la identidad operativa: toma la soberanía sistémica y la traduce en fases, capas y contratos.

## Documentos principales

| Orden | Documento | Archivo |
|---:|---|---|
| 1 | [03 — Los tres estratos: ROOT, COMM, ADMIN](03-estratos.md) | `03-estratos.md` |
| 2 | [04 — El inicio estratificado del sistema](04-inicio-sistema.md) | `04-inicio-sistema.md` |
| 3 | [05 — Bus de comunicación de arranque](05-bus-arranque.md) | `05-bus-arranque.md` |
| 4 | [06 — Capas de compatibilidad POSIX](06-capas-posix.md) | `06-capas-posix.md` |

## Corpus integrado

Estos documentos del corpus anterior quedan integrados aquí como desarrollo profundo:

| Tema | Documento |
|---|---|
| Arranque temprano | [initSoonrise.md](../initSoonrise.md) |
| Protosistema raíz | [systemProt.md](../systemProt.md) |
| Postulado initramfs | [initramfs.MD](../initramfs.MD) |
| Postulado seL4 | [seL4.MD](../seL4.MD) |
| Postulado Hurd | [Hurd.MD](../Hurd.MD) |
| Inicio nativo con init_ID | [initID.MD](../initID.MD) |
| Carga del kernel | [kernelLoad.md](../kernelLoad.md) |
| Linux como kernel modelo | [kernelLinux.md](../kernelLinux.md) |
| Levantamiento tradicional | [research00.md](../research00.md) |
| OpenRC | [OpenRC.MD](../OpenRC.MD) |
| sysVinit | [sysVinit.md](../sysVinit.md) |
| runit | [runit.md](../runit.md) |
| dinit | [dinit.md](../dinit.md) |
| systemd | [SystemD.MD](../SystemD.MD) |
| Hacks al kernel actual | [hacks.md](../hacks.md) |
| Comunicación | [hackToComm.md](../hackToComm.md) |
| Almacenamiento | [hackToStore.md](../hackToStore.md) |
| Periféricos | [hackToBridge.md](../hackToBridge.md) |
| RAM | [hackToBus.md](../hackToBus.md) |

## Lugar dentro del proyecto

```text
arquitectura
→ ordena capas y fases
→ conecta arranque temprano con sistema operativo
→ prepara el paso hacia identidad y Zalty
```

La implementación práctica debe referenciarse desde `zalty/`, no mezclarse aquí.