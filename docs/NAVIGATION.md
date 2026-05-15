# Política de navegación Markdown de maGNUx

Este documento fija el patrón mínimo para que los archivos `.md` del repositorio sean navegables.

## Regla general

Cada documento debe permitir:

1. volver al documento padre;
2. volver al índice principal;
3. evitar enlaces huérfanos.

## Barra recomendada

Para archivos en la raíz del repositorio:

```md
> [⬆ Subir un nivel](PADRE.md) · [🏠 Inicio](README.md)
```

Para archivos dentro de subcarpetas:

```md
> [⬆ Subir un nivel](../PADRE.md) · [🏠 Inicio](../README.md)
```

## Archivos de primer nivel

Si el archivo depende directamente del índice principal, basta con:

```md
> [🏠 Inicio](README.md)
```

## Archivos dependientes de una sección

Ejemplos recomendados:

| Documento | Padre |
|---|---|
| `systemProt.md` | `initSoonrise.md` |
| `Hurd.MD` | `systemProt.md` |
| `initramfs.MD` | `systemProt.md` |
| `seL4.MD` | `systemProt.md` |
| `initID.MD` | `systemProt.md` |
| `research00.md` | `kernelLinux.md` |
| `OpenRC.MD` | `research00.md` |
| `sysVinit.md` | `research00.md` |
| `runit.md` | `research00.md` |
| `dinit.md` | `research00.md` |
| `SystemD.MD` | `research00.md` |

## Archivos dentro de `kernel/`

Para los bloques `CONFIG_*`:

```md
> [⬆ Subir a CONFIG Linux 6.18.25](../research00.md) · [🏠 Inicio](../README.md)
```

## Criterio de aceptación

Un documento se considera navegable si:

- sus enlaces relativos apuntan a archivos existentes;
- permite volver al `README.md`;
- si está en una rama conceptual, permite subir al documento padre;
- si está en una subcarpeta, usa correctamente `../`;
- no depende solo del botón atrás del navegador.
