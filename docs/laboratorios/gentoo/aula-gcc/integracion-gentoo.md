# Adaptación especial para propósito experimental en Gentoo

> [Aula de integración](README.md) · [Manual en español](manual/README.md) · [Laboratorio Gentoo](../README.md)

**Objeto de estudio:** Linux 6.18.65 LTS; primero vanilla, después gentoo-sources de la revisión correspondiente si está disponible.  
**Referencia documental:** GCC 16.1.0. **Herramienta experimental:** versión efectiva de GCC y binutils del entorno de ensayo.  
**Objetivo:** construir una traza verificable entre flags, cabeceras, fuente preprocesada apta para compilación y comportamiento del compilador, antes de extraer conclusiones sobre el manifiesto.

Esta guía es material experimental de maGNUx, no forma parte del manual de GCC.

## Ruta de estudio vinculada al manual

| Unidad del aula | Lectura del manual | Evidencia a producir |
|---|---|---|
| A01 — Componentes | [Capítulo 1](manual/01-lenguajes.md) | Distinguir driver, frontal, optimizador y backend. Registrar `gcc -v` y órdenes efectivas. |
| A02 — Dialecto y entorno | [Capítulo 2, `2.1](manual/02-estandares.md#21-lenguaje-c) | Comparar macros del dialecto real y el valor de `__STDC_HOSTED__§ en un programa de prueba. Examinar las opciones reales de Kbuild. |
| A03 — Fuente compilable | [`3.2 (inicio)](manual/03-02-tipo-salida.md) | Comparar `.i` y `.s§, objeto y orden de entrada/salida; distinguir sufijos y selección explícita de lenguaje. |
| A04 — Compilación de C++ | [`3.3](manual/03-03-compilar-cpp.md) | Diferenciar el driver `gcc` de `g++§. No trasladar flags C++ al kernel C por analogía. |
| A05 — Ensamblador | [§3.15](manual/03-15-ensamblador.md) | Identificar opciones transmitidas al ensamblador y contrastarlas con la orden real. |
| A06 — Cabeceras, macros, dependencias | `3.14: pendiente de traducción directa; [original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Preprocessor-Options.html) | `-H`, `-E -dM`, `-M`, fuente `.i§. |
| A07 — Compilador y optimización | `3.12, `3.19: pendientes; [original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Optimize-Options.html) | GIMPLE, RTL, optimización, ensamblador, símbolos. |
| A08 — Enlace y objeto final | §3.16: pendiente; [índice original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/) | Comando de enlace, secciones ELF, relocaciones y artefacto. |

## Ensayo A01–A03: observar una unidad antes de estudiar Kconfig

No modificar el sistema operativo ni instalar otro kernel. Reutilizar [G01](../01-traza-gcc.md), cuyos fuentes y script de captura ya están en el laboratorio.

```sh
# Desde docs/laboratorios/gentoo en un clon local:
gcc -v
gcc -dumpmachine
bash g01/trace.sh
```

La primera prueba de concepto previa se ejecutó en Debian, con GCC 14.2.0; esta publicación no constituye una repetición del ensayo en Gentoo. En Gentoo se anotarán versión de GCC, binutils, objetivo, orden efectiva y hashes de los artefactos.

Además, en un archivo temporal aislado, comparar una opción de dialecto y una de entorno:

```sh
work=$(mktemp -d)
printf 'int f(int x) { return x + 1; }\n' > "$work/demo.c"
gcc -std=gnu11 -E -dM "$work/demo.c" > "$work/hosted.macros"
gcc -std=gnu11 -ffreestanding -E -dM "$work/demo.c" > "$work/freestanding.macros"
diff -u "$work/hosted.macros" "$work/freestanding.macros"
```

Hipótesis: cambia `__STDC_HOSTED__`. La salida completa de macros puede contener otras diferencias. El ensayo no prueba por sí mismo el modo real de compilación de Linux; este debe obtenerse de Kbuild, no suponerse por analogía.

## Ensayo A04–A08: del símbolo a la orden de GCC

Seguir [G02 — Kconfig/Kbuild](../02-traza-kbuild.md) y [G03 — Portage](../03-traza-portage.md). Mantener dos directorios externos de construcción, la misma versión de fuentes y cadena de herramientas, y registrar cualquier cambio derivado de Kconfig. Utilizar las órdenes reales capturadas con `make V=1`; las cabeceras generadas y las rutas de inclusión son parte de la evidencia. No editar manualmente `include/generated/autoconf.h` ni simular una USE flag con una macro GCC sin comprobar el ebuild.

Para cada relación, conservar fuente, ruta, línea, macro u opción, orden real y resultado. Registrar si una opción provoca exclusión de una unidad, cambios en una cabecera, alteración de semántica u optimización sin cambio de fuente preprocesada, o ausencia de diferencias.

La evidencia se documenta según [registro de evidencia](../04-registro-evidencia.md). La prueba de una capacidad operativa requiere además comprobar su incorporación y funcionamiento; la presencia de un símbolo o una opción de configuración no basta.

## Estado

Los ejercicios complementarios son protocolos propuestos, no resultados ejecutados en esta revisión. La traducción no se utilizará como sustituto de la verificación de fuentes y binarios. No se ha compilado Linux 6.18.65 ni se modifica el manifiesto en esta entrega.
