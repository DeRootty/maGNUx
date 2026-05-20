# Uso de la GNU Compiler Collection - GCC 16.1.0
## Edición técnica en español - documentación canónica

Esta carpeta contiene la documentación canónica viva de traducción y estudio del manual **Using the GNU Compiler Collection, for gcc version 16.1.0**.

La versión canónica actual conserva el contenido consolidado hasta la entrega 10, cierra **3.6 Options Controlling Objective-C and Objective-C++ Dialects** como lectura técnica inicial e inicia **3.7 Options Controlling OpenMP and OpenACC**. El objetivo de esta entrega es completar el bloque Objective-C/Objective-C++ y preparar la transición hacia el formato de diagnósticos de GCC.

No es todavía una traducción completa del manual de 1237 páginas. Es una edición técnica por entregas, navegable y preparada para revisión comunitaria.

## Navegación

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
27. [Sección 3.5 - Dialecto C++: introducción y ABI](26-cpp-dialecto-abi.md)
28. [Sección 3.5 - Compatibilidad ABI, acceso y memoria dinámica](27-cpp-compat-acceso-new-delete.md)
29. [Sección 3.5 - `char8_t`, conceptos y `constexpr`](28-cpp-char8-concepts-constexpr.md)
30. [Sección 3.5 - Contratos, corrutinas y volcados C++](29-cpp-contracts-coroutines-dumps.md)
31. [Sección 3.5 - Plantillas, módulos y diagnósticos C++ iniciales](30-cpp-templates-modules-diagnostics.md)
32. [Sección 3.5 - Temporales, RTTI y deallocation sized](31-cpp-temporales-rtti-deallocation.md)
33. [Sección 3.5 - Enumeraciones, orden de evaluación, plantillas y estáticos](32-cpp-enums-eval-templates-statics.md)
34. [Sección 3.5 - Visibilidad, DSO y compatibilidad Microsoft](33-cpp-visibilidad-dso-ms.md)
35. [Sección 3.5 - Advertencias específicas de C++](34-cpp-warnings-especificas.md)
36. [Sección 3.5 - Advertencias C++ sobre orden, movimiento y range-for](35-cpp-warnings-reorder-move-range.md)
37. [Sección 3.5 - Advertencias C++ sobre etiquetas, enlace y reglas de estilo](36-cpp-warnings-tags-linkage-effective.md)
38. [Sección 3.5 - Advertencias C++ sobre sobrecarga, memoria y jerarquías](37-cpp-warnings-overload-memory-hierarchy.md)
39. [Sección 3.6 - Objective-C y Objective-C++: introducción y runtime](38-objc-intro-runtime.md)
40. [Sección 3.6 - Objective-C y Objective-C++: despacho, excepciones, GC y `nil`](39-objc-dispatch-exceptions-gc.md)
41. [Sección 3.6 - Objective-C y Objective-C++: clases reemplazables, ivars y advertencias](40-objc-visibilidad-decls-warnings.md)
42. [Sección 3.7 - OpenMP, OpenACC y offload](41-openmp-openacc-offload.md)
43. [Glosario técnico inglés/español](90-glosario-tecnico.md)
44. [CHANGELOG](../meta/changelog.md)
45. [Manifiesto de continuidad](../meta/manifiesto-continuidad.md)

## Criterio de traducción

- Se traduce al español técnico de sistemas y programación.
- Se conservan literales, nombres de opciones, herramientas, arquitecturas, ABI, símbolos y fragmentos de código.
- Las opciones de GCC no se traducen. Se traduce su explicación y su papel dentro de la cadena de construcción.
- En esta entrega se fija vocabulario para *Objective-C runtime*, *message dispatch*, *nil receiver*, *garbage collection*, *instance variable*, *selector*, *protocol*, *OpenMP*, *OpenACC*, *offload target*, *target triplet*, *SIMD clone* y *host fallback*.

## Estado editorial

La documentación canónica procede de la entrega 10 y queda preparada para nuevas ampliaciones:

- ZIP con Markdown navegable.
- PDF estándar equivalente a esta entrega.
