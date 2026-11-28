# Manual GCC 16.1.0 en español

> [Aula de integración](../README.md) · [Laboratorio Gentoo](../../README.md) · [Inicio](../../../../../README.md)

**Proyecto de traducción completa** de *Using the GNU Compiler Collection*, a partir de las fuentes originales de la versión 16.1.0. La traducción directa está en curso y abarca toda la obra como objetivo, sin excluir capítulos por su relación con Gentoo. No es la obra terminada. La edición comentada anterior no se contabiliza como texto íntegramente traducido.

[Edición, atribución y licencia](00-edicion-y-licencia.md) · [Manual inglés](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/) · [Protocolo editorial](../protocolo.md)

## Traducción automática complementaria

[Motor de traducción y flujo de GitHub Actions](../../../../../tools/traduccion-gcc/README.md). El proceso genera un inventario y borradores separados cuando se ejecuta; no se contabilizan como texto revisado ni se sustituyen los capítulos de esta edición.

## Índice de capítulos (numeración del original)

| Capítulo | Estado de traducción directa |
|---|---|
| 1 — [Lenguajes de programación admitidos por GCC](01-lenguajes.md) | Texto completo del capítulo; revisión humana pendiente |
| 2 — [Estándares de lenguajes admitidos por GCC](02-estandares.md) | Texto completo del capítulo, 2.1–2.8; revisión humana pendiente |
| 3 — [Opciones de línea de órdenes de GCC](03-introduccion.md) | Introducción y algunas secciones; resto pendiente |
| 4 — Comportamiento de C definido por la implementación | Pendiente |
| 5 — Comportamiento de C++ definido por la implementación | Pendiente |
| 6 — Extensiones de la familia del lenguaje C | Pendiente |
| 7 — Funciones incorporadas de GCC | Pendiente |
| 8 — Extensiones del lenguaje C++ | Pendiente |
| 9 — Características de GNU Objective-C | Pendiente |
| 10 — Compatibilidad binaria | Pendiente |
| 11 — gcov: programa de cobertura de pruebas | Pendiente |
| 12 — gcov-tool: tratamiento de perfiles Gcda fuera de línea | Pendiente |
| 13 — gcov-dump: volcado de perfiles Gcda y Gcno fuera de línea | Pendiente |
| 14 — lto-dump: volcado de objetos LTO | Pendiente |
| 15 — Causas conocidas de problemas con GCC | Pendiente |
| 16 — Comunicación de errores | Pendiente |
| 17 — Cómo obtener ayuda con GCC | Pendiente |
| 18 — Contribuir al desarrollo de GCC | Pendiente |
| Funding Free Software | [Original inglés preservado](originales/Funding-Free-Software.md); traducción adicional pendiente |
| El proyecto GNU y GNU/Linux | Pendiente |
| Licencia Pública General de GNU | Pendiente de incorporar el original |
| Licencia de Documentación Libre de GNU | [Original íntegro en Texinfo](originales/fdl.texi); traducción informativa no publicada |
| Colaboradores de GCC | Pendiente |
| Apéndice A — Índices | Pendiente |

## Capítulo 3: opciones de GCC

| Sección | Disponibilidad |
|---|---|
| 3.1 — [Resumen de opciones](03-01-resumen-opciones.md) | Sección completa, incluidas todas las arquitecturas; revisión pendiente |
| 3.2 — [Control del tipo de salida](03-02-tipo-salida.md) | Texto completo de la sección, incluida la entrada @file; revisión pendiente |
| 3.3 — [Compilación de programas C++](03-03-compilar-cpp.md) | Texto completo de la sección; revisión pendiente |
| 3.4 — [Dialectos C](03-04-dialecto-c.md) | Parcial: bloque 0001, desde -ansi hasta -fno-builtin; revisión pendiente |
| 3.5 — Dialecto C++ | Pendiente |
| 3.6 — Dialectos Objective-C y Objective-C++ | Pendiente |
| 3.7 — OpenMP y OpenACC | Pendiente |
| 3.8 — Formato de diagnósticos | Pendiente |
| 3.9 — Solicitar o suprimir advertencias | Pendiente |
| 3.10 — Análisis estático | Pendiente |
| 3.11 — Depuración | Pendiente |
| 3.12 — Optimización | Pendiente |
| 3.13 — Instrumentación | Pendiente |
| 3.14 — Preprocesador | Pendiente de traducción directa |
| 3.15 — [Opciones para el ensamblador](03-15-ensamblador.md) | Texto completo de la sección; revisión pendiente |
| 3.16 — Enlace | Pendiente |
| 3.17 — Búsqueda de directorios | Pendiente |
| 3.18 — Convenciones de generación de código | Pendiente |
| 3.19 — Opciones para desarrolladores de GCC | Pendiente |
| 3.20 — Opciones específicas del objetivo | Pendiente |
| 3.21 — Variables de entorno | Pendiente |
| 3.22 — Cabeceras precompiladas | Pendiente |
| 3.23 — Módulos de C++ | Pendiente |

**Continuación de la cola Texinfo:** bloque `0002-03-04-invoke.texi`. Véase el [registro de entregas](registro-bloques.md).

Los títulos pendientes no enlazan a archivos ficticios. El [índice original completo](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/) conserva el acceso a las subdivisiones de cada capítulo. Los ejercicios y las referencias a Kbuild/Portage se encuentran en la [adaptación experimental](../integracion-gentoo.md).
