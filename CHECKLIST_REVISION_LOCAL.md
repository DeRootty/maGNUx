# Checklist de revisión local

> [🏠 Inicio](README.md)

Usa esta lista antes de decidir si subir la maqueta a GitHub.

## Navegación

- [ ] El `README.md` raíz explica bien la separación maGNUx/Zalty.
- [ ] `docs/README.md` sirve como índice documental suficiente.
- [ ] Cada sección dentro de `docs/` tiene su propio `README.md`.
- [ ] Los documentos permiten subir, volver al índice y regresar al inicio.
- [ ] No hay enlaces rotos al navegar manualmente.

## Contenido

- [ ] La ruta corta de lectura se entiende sin contexto previo.
- [ ] La carpeta `legacy/` no oculta contenido importante.
- [ ] El prototipo initramfs queda claramente como experimental.
- [ ] Zalty no redefine maGNUx, solo lo implementa.

## Técnica

- [ ] Los scripts del prototipo tienen permiso ejecutable.
- [ ] No existen carpetas accidentales con llaves `{...}`.
- [ ] El prototipo puede revisarse sin mezclarlo con `docs/`.
