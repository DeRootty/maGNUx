# Manifiesto de continuidad — revisión de reconstrucción (27-11-2026)

## Objeto

Este manifiesto permite continuar la edición técnica en español del manual **Using the GNU Compiler Collection, for gcc version 16.1.0** sin perder el punto exacto de avance, el criterio terminológico ni la estructura de salida.

## Avance declarado por la entrega 10 (histórico, no inventario actual)

Se ha cubierto, en forma de edición técnica navegable:

1. Portada, atribución y nota de licencia.
2. Capítulo 1: lenguajes soportados por GCC.
3. Capítulo 2: estándares de lenguaje soportados por GCC.
4. Introducción al capítulo 3.
5. Sección 3.1: resumen de opciones, en lectura técnica inicial.
6. Guía práctica para compilar C23 con GCC.
7. Diagnósticos, advertencias y analizador estático.
8. Depuración, optimización, LTO, instrumentación, cobertura y endurecimiento.
9. Preprocesador, dependencias, ensamblador, enlazador, rutas y generación de código.
10. Opciones de desarrollador y opciones específicas de objetivo.
11. Sección 3.2: control del tipo de salida.
12. Sección 3.3: compilar programas C++ con GCC y g++.
13. Sección 3.4: opciones que controlan el dialecto C.
14. Sección 3.5: opciones que controlan el dialecto C++.
15. Sección 3.6: opciones que controlan Objective-C y Objective-C++.
16. Inicio de sección 3.7: opciones que controlan OpenMP y OpenACC.

## Punto real de continuación

La rama master solo contenía 00–20 antes de la revisión. Se reconstruyeron 21–25 (sección 3.4, cobertura selectiva) y el glosario 90. No se recuperó el texto histórico de las unidades 21–41. Quedan pendientes 26–37 (C++), 38–40 (Objective-C), 41 (OpenMP/OpenACC), los aspectos de § 3.4 no cubiertos y posteriormente § 3.8 (formato de diagnósticos) y el resto del manual. El índice distingue capítulos presentes de pendientes.

Para Gentoo se crea una ruta experimental independiente que enlaza las secciones oficiales 3.2, 3.4, 3.12, 3.14 y 3.19, sin anticipar conclusiones sobre el manifiesto. La página de § 3.8 no pudo recuperarse durante la revisión; no se inventa una traducción.

## Criterio editorial

- Mantener español técnico de sistemas y programación.
- No traducir opciones, nombres de macros, ABI, símbolos, literales, código ni comandos.
- Traducir la explicación semántica y contextual.
- Priorizar claridad para usuarios de Linux, GCC, C/C++, Objective-C, toolchains, paralelismo, offload y sistemas.
- Mantener navegación entre archivos Markdown.
- Para entregas de distribución cerradas, generar ZIP Markdown y PDF cuando se complete y valide el bloque. Esta revisión es una incorporación directa al repositorio, no una entrega PDF completa.
- Actualizar `CHANGELOG.md`, `MANIFIESTO_CONTINUIDAD.md` y glosario.

## Nota de honestidad

Esta entrega no reemplaza al manual oficial. Es una edición técnica derivada y parcial, orientada a divulgación y estudio. Debe revisarse comunitariamente antes de considerarse una traducción completa o definitiva.

[Anterior](changelog.md) | [Índice](../README.md)
