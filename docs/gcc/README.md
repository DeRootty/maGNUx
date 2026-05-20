# GCC ES Técnico MD

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

- [Índice de documentación](docs/README.md)

## Documentos meta

- [Changelog consolidado](meta/changelog.md)
- [Manifiesto de continuidad](meta/manifiesto-continuidad.md)
- [Protocolo de incorporación documental](meta/protocolo-incorporacion.md)
- [Informe de optimización documental](meta/informe-optimizacion.md)

## Histórico de entregas

Las carpetas antiguas `gcc-es-tecnico-md-entrega-XX/` contenían copias completas o parciales de la documentación. En esta versión optimizada, cada entrega queda representada por un resumen histórico en:

- [Histórico de entregas](entregas/README.md)

## Ampliaciones futuras

Los nuevos `.md` deben entrar primero por:

```text
nuevos/_pendientes/
```

Después se decide si son capítulos nuevos, ampliaciones de capítulos existentes, entradas de glosario o notas meta.
