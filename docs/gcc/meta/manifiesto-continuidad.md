# Manifiesto de continuidad - entrega 10

## Objeto

Este manifiesto permite continuar la edición técnica en español del manual **Using the GNU Compiler Collection, for gcc version 16.1.0** sin perder el punto exacto de avance, el criterio terminológico ni la estructura de salida.

## Avance acumulado

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

## Punto exacto de continuación

La siguiente entrega debe continuar en:

```text
3.8 Options to Control Diagnostic Messages Formatting
```

El punto de entrada natural es `-fmessage-length=n`, seguido de opciones de formato de diagnósticos como `-fdiagnostics-plain-output`, `-fdiagnostics-show-location=`, `-fdiagnostics-color`, `GCC_COLORS`, caret diagnostics, URLs, paths, nesting, JSON/SARIF si aparecen en la sección, y controles relacionados.

## Prioridad recomendada para la entrega 11

1. Iniciar sección 3.8 sobre formato de mensajes de diagnóstico.
2. Explicar diferencia entre diagnóstico, advertencia, error, nota y localización fuente.
3. Cubrir line wrapping, color, salida plana, rutas de eventos y estabilidad para herramientas.
4. Mantener ZIP Markdown y PDF.
5. Actualizar glosario, changelog y manifiesto.

## Criterio editorial

- Mantener español técnico de sistemas y programación.
- No traducir opciones, nombres de macros, ABI, símbolos, literales, código ni comandos.
- Traducir la explicación semántica y contextual.
- Priorizar claridad para usuarios de Linux, GCC, C/C++, Objective-C, toolchains, paralelismo, offload y sistemas.
- Mantener navegación entre archivos Markdown.
- Generar siempre ZIP Markdown y PDF.
- Actualizar `CHANGELOG.md`, `MANIFIESTO_CONTINUIDAD.md` y glosario.

## Nota de honestidad

Esta entrega no reemplaza al manual oficial. Es una edición técnica derivada y parcial, orientada a divulgación y estudio. Debe revisarse comunitariamente antes de considerarse una traducción completa o definitiva.

[Anterior](changelog.md) | [Índice](../README.md)
