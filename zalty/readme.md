# Zalty

> [🏠 Inicio](../README.md) · [📚 Documentación maGNUx](../docs/README.md)

Zalty es la distribución GNU/Linux experimental que ensaya la arquitectura maGNUx sobre un sistema Linux real.

Zalty no sustituye el manifiesto maGNUx. Lo implementa, lo prueba y lo somete a fricción técnica.

## Índice

| Documento | Función |
|---|---|
| [Fases de implementación](fases/readme.md) | Hoja de ruta experimental. |
| [Initramfs](initramfs/README.md) | Laboratorio de arranque temprano. |
| [Identidades y nodos semióticos](identidades_zalty.md) | Relaciones entre ROOT, ADMIN y COMM y ficha conceptual de nodo. |

## Lectura didáctica: el campamento y el nodo

El sitio editorial utiliza un **campamento romano** para explicar Zalty: el fundamento material y su perímetro, la identidad que declara a qué conjunto pertenece, la administración que organiza la operación, la verificación de coherencia y la actividad de quienes lo habitan. Es una **metáfora pedagógica**, no una asignación literal de privilegios o procesos ni una ampliación ya implementada del prototipo.

El ejercicio útil que deriva de ella consiste en **declarar un nodo** antes de integrarlo: qué es, qué hace, con quién se relaciona, qué contrato reclama, cómo se verificaría su procedencia, qué traza deja y cuál es su estado. Después hay que comprobar si esa declaración concuerda con el comportamiento real.

La explicación conceptual y la ficha están desarrolladas en [Emergencia de identidades y nodos semióticos](identidades_zalty.md). La implementación sigue delimitada por las [fases de Zalty](fases/readme.md) y su [laboratorio initramfs](initramfs/README.md).

---

## Relación con maGNUx

```text
maGNUx
→ manifiesto, contrato y arquitectura

Zalty
→ distribución GNU/Linux experimental
```

## Principio operativo

Zalty debe demostrar primero lo posible sin modificar el kernel Linux: initramfs, `/boot/metal/`, `/run/maGNUx`, políticas de arranque y contratos declarativos.
