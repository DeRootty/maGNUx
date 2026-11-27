# Protocolo de traducción y control de integridad

> [Aula de integración](README.md) · [Índice del manual](manual/README.md)

El objetivo es traducir la obra completa desde la edición exacta GCC 16.1.0. No se sustituirá la traducción por explicaciones abreviadas ni por una adaptación libre de las opciones. El manual anterior sigue accesible como material de estudio comentado, pero no constituye evidencia de traducción completa.

## Procedimiento

1. Recuperar la fuente Texinfo de la etiqueta `releases/gcc-16.1.0` y registrar ruta, SHA de blob, nodo, sección e intervalo de cobertura. Cotejar con el HTML oficial.
2. Traducir en orden la prosa y los títulos, conservar comandos, opciones, macros, ejemplos, referencias y condiciones. Los índices Texinfo deberán reconstruirse en el apéndice de índices; no fingir que ya se han traducido.
3. No corregir silenciosamente una afirmación del original: si se detecta un problema, anotarlo fuera del texto traducido.
4. Mantener el estado por sección: pendiente, parcial con punto de corte exacto, texto traducido completo pendiente de revisión, revisado.
5. Conservar licencias y secciones invariantes, incluir avisos de atribución y registrar revisión. La edición pública cerrada requiere comprobación del cumplimiento íntegro de GFDL.
6. Verificar enlaces relativos y rutas; no enlazar capítulos inexistentes.
7. Añadir la adaptación experimental únicamente en el plano del aula, con referencia a las secciones y resultados reproducibles.

## Inventario de procedencia inicial

| Archivo original | Identificador del blob | Cobertura |
|---|---|---|
| gcc/doc/frontends.texi | 97e49f4e1165185eda3260712dd5461d2ad07b52 | Capítulo 1 |
| gcc/doc/standards.texi | 2e345713c2c5157700b50198ab82b6a17b91f4b1 | Capítulo 2 |
| gcc/doc/invoke.texi | 9207a021e64224b74d5019719c3d7e39a2663807 | Introducción del capítulo 3; 3.1, 3.2, 3.3 y 3.15 |
| gcc/doc/gcc.texi | 495f09bc9d3ec73daec1ebd3f32a5412c5fde34a | Portada y aviso |
| gcc/doc/include/fdl.texi | af1a9c1d1965b115dbdf325cce17743eb094db74 | Fuente original íntegra |
| gcc/doc/include/funding.texi | d1583fabc0d8bec19f49bd13e78821cb0bc04527 | Fuente original íntegra |

Fuente: [etiqueta de GCC 16.1.0](https://github.com/gcc-mirror/gcc/blob/releases/gcc-16.1.0/gcc/doc/gcc.texi) y [manual oficial](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/).

## Terminología de trabajo

| Inglés | Español adoptado |
|---|---|
| front end | frontal |
| back end | backend |
| driver | controlador del compilador |
| compilation proper | compilación propiamente dicha |
| assembler / assembly | ensamblador / ensamblado |
| linker / linking | enlazador / enlace |
| translation unit | unidad de traducción |
| header | cabecera |
| hosted / freestanding | alojado / independiente |
| target | objetivo |
| dump | volcado |
| flag / option | indicador u opción, según contexto |

El [glosario anterior](../../../gcc/docs/90-glosario-tecnico.md) se conserva como apoyo; los términos deben cotejarse con el original y con el uso técnico.

## Próxima unidad pendiente

Las secciones 3.1 y 3.2 se han traducido en una segunda incorporación, incluida la entrada `@file` procedente de `libiberty/at-file.texi` (blob `080d1951d62df67643aaffa7a5acabf5d756864e`). La siguiente sección en orden es 3.4; quedan pendientes 3.4–3.14 y 3.16 en adelante, además de los capítulos 4–18 y anexos. El alcance es toda la obra, incluidos los lenguajes, objetivos de compilación, herramientas y apéndices que no sean relevantes para Gentoo. No se anuncia un porcentaje de cobertura basado en el número de archivos ni se da por terminada una sección por haberla resumido.

## Automatización por lotes

El [motor de traducción](../../../../tools/traduccion-gcc/README.md) utiliza el archivo HTML oficial generado de GCC 16.1.0 como representación desplegada de Texinfo. Mantiene separado el borrador automático de la edición editorial. La cobertura de segmentos no sustituye el cotejo de nodos, licencia y fidelidad técnica. La ejecución de pago es opt-in mediante secret y activación manual o variable de programación.
