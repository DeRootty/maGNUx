# Manifiesto de continuidad — revisión de reconstrucción (27-11-2026)

> [Portada GCC](../README.md) · [Índice de unidades](../docs/README.md) · [Inicio del repositorio](../../../README.md)

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

## Nueva ruta de traducción directa

La traducción íntegra solicitada pasa al [Aula de integración de Gentoo](../../laboratorios/gentoo/aula-gcc/README.md). El [índice de la traducción directa](../../laboratorios/gentoo/aula-gcc/manual/README.md) declara su cobertura real. Las unidades comentadas históricas se conservan; no se confunden con capítulos completos del original.

## Punto real de continuación (edición técnica comentada)

La rama master solo contenía 00–20 antes de la revisión. Se reconstruyeron 21–25 (sección 3.4, cobertura selectiva) y el glosario 90. No se recuperó el texto histórico de las unidades 21–41. Quedan pendientes 26–37 (C++), 38–40 (Objective-C), 41 (OpenMP/OpenACC), los aspectos de § 3.4 no cubiertos y posteriormente § 3.8 (formato de diagnósticos) y el resto del manual. El índice distingue capítulos presentes de pendientes.

Para Gentoo se crea una ruta experimental independiente que enlaza las secciones oficiales 3.2, 3.4, 3.12, 3.14 y 3.19, sin anticipar conclusiones sobre el manifiesto. La página de § 3.8 no pudo recuperarse durante la revisión; no se inventa una traducción.

### Inventario histórico de unidades aún pendientes

- Sección 3.5 - Dialecto C++: introducción y ABI — pendiente de reconstrucción (`26-cpp-dialecto-abi.md`)
- Sección 3.5 - Compatibilidad ABI, acceso y memoria dinámica — pendiente de reconstrucción (`27-cpp-compat-acceso-new-delete.md`)
- Sección 3.5 - `char8_t`, conceptos y `constexpr` — pendiente de reconstrucción (`28-cpp-char8-concepts-constexpr.md`)
- Sección 3.5 - Contratos, corrutinas y volcados C++ — pendiente de reconstrucción (`29-cpp-contracts-coroutines-dumps.md`)
- Sección 3.5 - Plantillas, módulos y diagnósticos C++ iniciales — pendiente de reconstrucción (`30-cpp-templates-modules-diagnostics.md`)
- Sección 3.5 - Temporales, RTTI y deallocation sized — pendiente de reconstrucción (`31-cpp-temporales-rtti-deallocation.md`)
- Sección 3.5 - Enumeraciones, orden de evaluación, plantillas y estáticos — pendiente de reconstrucción (`32-cpp-enums-eval-templates-statics.md`)
- Sección 3.5 - Visibilidad, DSO y compatibilidad Microsoft — pendiente de reconstrucción (`33-cpp-visibilidad-dso-ms.md`)
- Sección 3.5 - Advertencias específicas de C++ — pendiente de reconstrucción (`34-cpp-warnings-especificas.md`)
- Sección 3.5 - Advertencias C++ sobre orden, movimiento y range-for — pendiente de reconstrucción (`35-cpp-warnings-reorder-move-range.md`)
- Sección 3.5 - Advertencias C++ sobre etiquetas, enlace y reglas de estilo — pendiente de reconstrucción (`36-cpp-warnings-tags-linkage-effective.md`)
- Sección 3.5 - Advertencias C++ sobre sobrecarga, memoria y jerarquías — pendiente de reconstrucción (`37-cpp-warnings-overload-memory-hierarchy.md`)
- Sección 3.6 - Objective-C y Objective-C++: introducción y runtime — pendiente de reconstrucción (`38-objc-intro-runtime.md`)
- Sección 3.6 - Objective-C y Objective-C++: despacho, excepciones, GC y `nil` — pendiente de reconstrucción (`39-objc-dispatch-exceptions-gc.md`)
- Sección 3.6 - Objective-C y Objective-C++: clases reemplazables, ivars y advertencias — pendiente de reconstrucción (`40-objc-visibilidad-decls-warnings.md`)
- Sección 3.7 - OpenMP, OpenACC y offload — pendiente de reconstrucción (`41-openmp-openacc-offload.md`)

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

[Registro de cambios](changelog.md) | [Índice de unidades](../docs/README.md) | [Portada GCC](../README.md)
