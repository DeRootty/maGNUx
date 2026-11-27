# Uso de la GNU Compiler Collection - GCC 16.1.0

> [Portada GCC](../README.md) · [Documentación maGNUx](../../README.md) · [Inicio del repositorio](../../../README.md)
## Edición técnica en español - documentación canónica

Esta carpeta contiene la documentación canónica viva de traducción y estudio del manual **Using the GNU Compiler Collection, for gcc version 16.1.0**.

El índice histórico de la entrega 10 enumeraba 42 unidades numeradas, pero en master solo estaban presentes las unidades 00–20. La revisión de 27 de noviembre de 2026 reconstruye selectivamente 21–25 a partir de GCC 16.1.0 y un glosario de trabajo. Las unidades 26–41 siguen pendientes de recuperación o reconstrucción; no se presentan como disponibles. 

No es todavía una traducción completa del manual de 1237 páginas. Es una edición técnica por entregas, navegable y preparada para revisión comunitaria.

## Unidades disponibles en español

1. [Portada, atribución y nota de licencia](00-portada-y-licencia.md)
2. [Capítulo 1 - Lenguajes de programación soportados por GCC](01-lenguajes-soportados.md)
3. [Capítulo 2 - Estándares de lenguaje soportados por GCC](02-estandares-lenguaje.md)
4. [Capítulo 3 - Opciones de línea de órdenes de GCC: introducción](03-opciones-linea-ordenes-intro.md)
5. [Sección 3.1 - Resumen de opciones, primera parte](04-resumen-opciones-primera-parte.md)
6. [Guía práctica - Compilar C23 con GCC](05-guia-practica-c23-gcc.md)
7. [Sección 3.1 - Diagnósticos y advertencias](06-diagnosticos-y-advertencias.md)
8. [Sección 3.1 - Analizador estático de GCC](07-analizador-estatico.md)
9. [Sección 3.1 - Depuración y optimización](08-depuracion-y-optimizacion.md)
10. [Sección 3.1 - Instrumentación, cobertura y endurecimiento](09-instrumentacion-cobertura-endurecimiento.md)
11. [Sección 3.1 - Preprocesador y dependencias](10-preprocesador-y-dependencias.md)
12. [Sección 3.1 - Ensamblador y enlazador](11-ensamblador-y-enlazador.md)
13. [Sección 3.1 - Directorios, sysroot y búsqueda de recursos](12-directorios-sysroot-busqueda.md)
14. [Sección 3.1 - Convenciones de generación de código](13-convenciones-generacion-codigo.md)
15. [Sección 3.1 - Opciones de desarrollador y objetivos](14-desarrollador-y-objetivos.md)
16. [Sección 3.2 - Fases de compilación y sufijos de archivo](15-fases-y-sufijos.md)
17. [Sección 3.2 - Selección explícita de lenguaje con `-x`](16-seleccion-lenguaje-x.md)
18. [Sección 3.2 - Detener la cadena: `-c`, `-S`, `-E`](17-detener-cadena-c-s-e.md)
19. [Sección 3.2 - Salidas primarias, auxiliares y volcados](18-salidas-dumpbase-dumpdir.md)
20. [Sección 3.2 - Verbosidad, ayuda, wrappers y argumentos desde archivo](19-verbose-help-wrapper-atfile.md)
21. [Sección 3.3 - Compilar programas C++ con GCC y g++](20-compilar-cpp.md)
22. [Sección 3.4 - Dialecto C: `-ansi` y `-std=`](21-dialecto-c-ansi-std.md)
23. [Sección 3.4 - Estándares C y GNU: C90, C99, C11, C17, C23, GNU23](22-estandares-c-gnu.md)
24. [Sección 3.4 - Palabras clave, builtins y entorno hosted/freestanding](23-keywords-builtins-hosted-freestanding.md)
25. [Sección 3.4 - Inline, extensiones, dependencias estructuradas y compatibilidad](24-inline-extensiones-dependencias.md)
26. [Sección 3.4 - Signedness, arrays flexibles y orden escalar en estructuras](25-signedness-flex-arrays-sso.md)

## Recursos y navegación

- [Glosario técnico inglés/español](90-glosario-tecnico.md)
- [Histórico de entregas](../entregas/README.md)
- [Registro de cambios](../meta/changelog.md)
- [Manifiesto de continuidad](../meta/manifiesto-continuidad.md)
- [Laboratorio Gentoo](../../laboratorios/gentoo/README.md)

## Secciones pendientes de reconstrucción

Estas secciones todavía no tienen unidades Markdown disponibles en español. Para consultarlas mientras se reconstruyen, utiliza el original **en inglés** de GCC 16.1.0:

| Sección | Unidades pendientes | Fuente oficial |
|---|---|---|
| 3.5 — Dialecto C++ | 26–37 | [Leer original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/C_002b_002b-Dialect-Options.html) |
| 3.6 — Objective-C y Objective-C++ | 38–40 | [Leer original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Objective-C-and-Objective-C_002b_002b-Dialect-Options.html) |
| 3.7 — OpenMP y OpenACC | 41 | [Leer original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/OpenMP-and-OpenACC-Options.html) |
| 3.8 y siguientes | Por desarrollar | [Índice oficial del manual](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/) |

El inventario detallado se conserva en el [manifiesto de continuidad](../meta/manifiesto-continuidad.md). No se enlazan archivos aún inexistentes.

## Criterio de traducción

- Se traduce al español técnico de sistemas y programación.
- Se conservan literales, nombres de opciones, herramientas, arquitecturas, ABI, símbolos y fragmentos de código.
- Las opciones de GCC no se traducen. Se traduce su explicación y su papel dentro de la cadena de construcción.
- El glosario de trabajo se amplía con cada unidad disponible; la terminología de secciones pendientes se cotejará al reconstruirlas.

## Estado editorial

La documentación canónica contiene 00–25 y el glosario 90. Véase [manifiesto de continuidad](../meta/manifiesto-continuidad.md) para el inventario pendiente. Los [experimentos Gentoo](../../laboratorios/gentoo/README.md) constituyen material original separado, no capítulos del manual. No se ha generado PDF en esta revisión del repositorio.
