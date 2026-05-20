# Protocolo de incorporación documental

Este documento define cómo añadir nuevas ampliaciones sin volver al modelo de duplicación por entregas completas.

## Entrada inicial

Todo nuevo archivo Markdown debe colocarse primero en:

```text
nuevos/_pendientes/
```

## Clasificación

Cada archivo pendiente debe clasificarse como una de estas opciones:

```text
capítulo nuevo
ampliación de capítulo existente
corrección editorial
entrada de glosario
nota meta
material descartado o histórico
```

## Integración

- Si es capítulo nuevo, se mueve a `docs/` con numeración coherente.
- Si amplía un capítulo existente, se fusiona con el `.md` correspondiente.
- Si es glosario, se integra en `docs/90-glosario-tecnico.md`.
- Si es una nota editorial, se coloca en `meta/`.
- Si forma parte de una nueva entrega, se registra en `entregas/entrega-XX.md`.

## Navegación

Al consolidar contenido en `docs/`, se debe revisar:

```text
README.md principal
docs/README.md
navegación anterior / índice / siguiente
meta/changelog.md
entregas/entrega-XX.md
```

## Regla principal

No se debe crear una nueva carpeta que copie toda la documentación anterior. Las entregas futuras deben funcionar como registro histórico de cambios, no como duplicación completa del árbol.
