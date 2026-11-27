# Laboratorio I — Gentoo: trazabilidad de compilación

> [⬆ Documentación](../../README.md) · [🏠 Inicio](../../../README.md)

**Estado:** metodología en construcción. Prioridad: comprender la relación entre flags, cabeceras, fuente compilable y comportamiento del compilador. No se deriva todavía una gramática semiótica ni una conclusión sobre Slackware o Arch. Ambos laboratorios quedan previstos, no desarrollados.

## Referencias de trabajo

- Kernel objetivo: Linux 6.18.65 LTS, vanilla y, cuando se disponga del árbol, gentoo-sources correspondiente; registrar el origen y los parches. El [catálogo previo](../../kernel/README.md) es 6.18.25 y no se debe confundir con el nuevo árbol.
- Manual de estudio: [GCC 16.1.0, edición técnica en español](../../gcc/README.md). La versión instalada en Gentoo se registrará con `gcc -v`; no se presupone que coincida con el manual.
- La primera prueba de concepto se realizó fuera de Gentoo, con GCC 14.2.0 (Debian). No se ha compilado Linux 6.18.65 en esta revisión.

## Ruta de aprendizaje

| Paso | Pregunta | Evidencia |
|---|---|---|
| 0 | ¿Qué versión y objetivo compilan? | `gcc -v`, `gcc -dumpmachine`, entorno y versiones de binutils |
| 1 | ¿Quién interpreta la flag? | ebuild/eclass, configure, Kconfig, Makefile, comando efectivo |
| 2 | ¿Qué macros y cabeceras se seleccionan? | `-E -dM`, `-H`, `-M` |
| 3 | ¿Cuál es la fuente que llega al frontal? | `.i` / `.ii`, marcadores de línea, hash |
| 4 | ¿Qué transforma el compilador? | GIMPLE, RTL, ensamblador y opciones efectivas |
| 5 | ¿Qué objeto sale? | ELF, símbolos, secciones, relocaciones y desensamblado |
| 6 | ¿Qué termina en el artefacto final? | lista y comando de enlace, símbolos y artefacto verificable |

No todas las flags atraviesan todos los pasos. Una USE flag puede cambiar únicamente dependencias o empaquetado. Una opción de optimización puede modificar también macros predefinidas. Una opción Kconfig puede omitir una unidad completa sin que exista un `.i` en la variante desactivada.

## Unidades experimentales

1. [G01 — Macro, cabecera y unidad de traducción](01-traza-gcc.md). Prueba pequeña reproducible sin privilegios.
2. [G02 — Del Kconfig a la unidad de compilación](02-traza-kbuild.md). Protocolo pendiente de ejecución sobre Linux 6.18.65.
3. [G03 — De USE a las órdenes reales de GCC](03-traza-portage.md). Protocolo pendiente de ejecución sobre Gentoo.
4. [Formato de registro de evidencia](04-registro-evidencia.md).

La regla es cambiar una sola decisión de entrada, registrar las modificaciones derivadas y comparar dos construcciones aisladas. Los casos con resultado idéntico o no atribuible son válidos. La compilación no es evidencia de una capacidad operativa hasta que se compruebe su incorporación y, cuando proceda, su funcionamiento.

## Referencias primarias

[GCC: opciones generales](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Overall-Options.html) · [Preprocesador](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Preprocessor-Options.html) · [Optimización](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Optimize-Options.html) · [Desarrolladores](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Developer-Options.html) · [Kconfig](https://docs.kernel.org/6.18/kbuild/kconfig-language.html) · [Kbuild](https://docs.kernel.org/6.18/kbuild/makefiles.html) · [Gentoo USE flags](https://devmanual.gentoo.org/general-concepts/use-flags/).
