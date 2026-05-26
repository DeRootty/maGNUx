# Política de navegación Markdown de maGNUx

> [🏠 Inicio](../README.md)

Este documento fija el patrón mínimo para que los archivos `.md` sean navegables en GitHub, en un editor local o en cualquier visor Markdown.

## Regla general

Cada documento debe permitir:

1. volver al documento padre;
2. volver al índice principal;
3. evitar enlaces huérfanos;
4. conservar rutas relativas simples;
5. distinguir documentación conceptual de implementación experimental.

## Barras recomendadas

### Documentos en raíz

```md
> [🏠 Inicio](README.md)
```

### Documentos dentro de `docs/`

```md
> [🏠 Inicio](../README.md)
```

### Índices de sección dentro de `docs/<seccion>/`

```md
> [⬆ Subir a documentación](../README.md) · [🏠 Inicio](../../README.md)
```

### Documentos dentro de `docs/<seccion>/`

```md
> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)
```

### Documentos dentro de `zalty/`

```md
> [🏠 Inicio](../README.md) · [📚 Documentación maGNUx](../docs/README.md)
```

### Prototipos dentro de `zalty/initramfs/<prototipo>/`

```md
> [⬆ Subir a initramfs](../README.md) · [🏠 Inicio](../../../README.md)
```

## Criterio de aceptación

Un documento se considera navegable si:

- sus enlaces relativos apuntan a archivos existentes;
- permite volver a `README.md`;
- si pertenece a una sección, permite volver a su `README.md` de sección;
- si pertenece a Zalty, no redefine el manifiesto, solo lo implementa o ensaya;
- si pertenece a `docs/`, no contiene scripts ni artefactos de build;
- si pertenece a `zalty/`, puede contener prototipos, scripts, ejemplos y pruebas.

## Regla conceptual

```text
maGNUx declara.
Zalty ensaya.
docs/ explica.
zalty/ ejecuta.
```
