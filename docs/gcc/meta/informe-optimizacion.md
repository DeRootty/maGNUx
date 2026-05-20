# Informe de optimización documental

## Origen

Se partió de un árbol con entregas acumulativas de Markdown.

## Diagnóstico

El árbol original contenía muchas carpetas `gcc-es-tecnico-md-entrega-XX/` con copias completas o parciales del contenido anterior. Ese modelo es útil para entregar paquetes cerrados, pero poco mantenible como repositorio vivo.

## Resultado aplicado

Se creó una estructura canónica:

```text
gcc-es-tecnico-md/
├── README.md
├── docs/
├── entregas/
├── meta/
├── nuevos/_pendientes/
└── scripts/
```

## Métricas aproximadas

```text
Markdown original:     270 archivos
Markdown optimizado:   59 archivos
Palabras originales:   162783
Palabras optimizadas:  30879
```

La reducción se logra evitando que cada entrega vuelva a copiar todos los capítulos anteriores.

## Criterio aplicado

- La entrega 10 se toma como base canónica.
- Los capítulos activos se consolidan en `docs/`.
- `CHANGELOG.md` y `MANIFIESTO_CONTINUIDAD.md` pasan a `meta/`.
- Las entregas anteriores se sustituyen por resúmenes históricos en `entregas/`.
- Las ampliaciones futuras entran por `nuevos/_pendientes/`.

## Recomendación

A partir de ahora, una nueva entrega no debería copiar toda la documentación. Debe registrar qué cambia y actualizar la documentación canónica.
