# GCC ES Técnico MD

> [Documentación maGNUx](../README.md) · [Inicio del repositorio](../../README.md)

Documentación técnica en español sobre GCC, reorganizada como documentación canónica viva.

Esta estructura sustituye el modelo de entregas completas duplicadas por un modelo mantenible:

```text
docs/
    documentación canónica actual

entregas/
    histórico resumido de cada entrega

meta/
    changelog, manifiesto y protocolo editorial

nuevos/_pendientes/
    zona de entrada para ampliaciones futuras antes de consolidarlas
```

## Lectura principal

Empieza por el índice canónico:

- [Índice de unidades disponibles en español](docs/README.md)
- [Glosario técnico](docs/90-glosario-tecnico.md)
- [Manual oficial GCC 16.1.0 (inglés)](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/)

Las unidades 00–25 y el glosario están disponibles en esta rama. Las unidades 26–41 pendientes se distinguen en el índice y remiten al original en inglés, sin enlaces a archivos Markdown inexistentes.

## Documentos meta

- [Changelog consolidado](meta/changelog.md)
- [Manifiesto de continuidad](meta/manifiesto-continuidad.md)
- [Protocolo de incorporación documental](meta/protocolo-incorporacion.md)
- [Informe de optimización documental](meta/informe-optimizacion.md)

## Histórico de entregas

Las carpetas antiguas `gcc-es-tecnico-md-entrega-XX/` contenían copias completas o parciales de la documentación. En esta versión optimizada, cada entrega queda representada por un resumen histórico en:

- [Histórico de entregas](entregas/README.md)

## Ampliaciones futuras

Los nuevos `.md` deben entrar primero por la [zona de pendientes](nuevos/_pendientes/readme.md):

```text
nuevos/_pendientes/
```

Después se decide si son capítulos nuevos, ampliaciones de capítulos existentes, entradas de glosario o notas meta.

## Aplicación experimental

El [Laboratorio I — Gentoo](../laboratorios/gentoo/README.md) utiliza esta documentación para estudiar la cadena flag → cabeceras → fuente preprocesada → compilador → objeto. Los experimentos son originales y se mantienen fuera del manual.
