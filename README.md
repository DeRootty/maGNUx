# GCC 16.1.0 — material pendiente de traducción

Paquete de trabajo para maGNUx / Zalty, 28 de noviembre de 2026.

**383 fragmentos Texinfo en inglés**, numerados 0001–0383. 3.043.660 caracteres de fuente en total (sin cabeceras editoriales). Los fragmentos contienen como máximo 10.000 caracteres de fuente; su tamaño no representa un límite oficial de ChatGPT. Se añaden cuatro líneas de procedencia en cada archivo. No son manuales Texinfo autónomos ni deben compilarse individualmente.

## Cómo usarlo

1. Descargar el ZIP de esta rama de exportación y descomprimirlo.
2. Abrir la carpeta 01-pendientes/03-04/ y adjuntar a ChatGPT 0001-03-04-invoke.texi.
3. Pedir: «Traduce íntegramente el bloque adjunto de GCC 16.1.0 al español técnico y a Markdown, conserva código, opciones, referencias y avisos, intégralo en el manual de maGNUx en master sin duplicar contenido y registra el punto de continuación».
4. Tras comprobar la entrega, continuar por el siguiente número. Los inventarios TSV permiten llevar el control.
5. Los bloques pueden empezar o terminar dentro de una sección, lista, tabla o ejemplo. No completar por conjetura una frase o estructura abierta: consultar el fragmento vecino cuando sea necesario y conservar la continuidad al integrar. No traducir los identificadores de nodos, sintaxis Texinfo, flags ni código. Los comentarios técnicos y los bloques @ignore deben mantenerse diferenciados del texto visible. Una directiva @include señala un archivo incluido; los fragmentos de ese archivo aparecen inmediatamente después, por lo que no se debe duplicar su texto.

## Alcance

Se toma el índice del manual en master como referencia de lo publicado: capítulos 1–2, introducción al capítulo 3, 3.1, 3.2, 3.3 y 3.15. Su revisión humana y una auditoría de fidelidad todavía están pendientes; no se repiten en la cola.

- 0001–0170: capítulo 3, secciones 3.4–3.14 y 3.16–3.23, incluidas las fuentes referenciadas mediante @include.
- 0171–0342: capítulos 4–8, con las partes de md.texi aplicables al manual de usuario (se excluyen bloques condicionales INTERNALS; consultar inventario).
- 0343–0383: capítulos 9–18, Funding Free Software, GNU Project, GPL, GFDL, colaboradores, definición de índices y revisión de la introducción general del documento.

Los índices se generan a partir de las entradas Texinfo de toda la obra: no existe un texto fuente independiente con todas las entradas ya ordenadas. Su reconstrucción y cotejo final siguen pendientes. Se mantienen los condicionales y directivas originales; no se ha compilado ni cotejado la salida completa de texi2any. Este paquete no certifica que lo anteriormente traducido sea íntegro.

## Procedencia y licencia

Obra de origen: *Using the GNU Compiler Collection*, GCC 16.1.0. Richard M. Stallman and the GCC Developer Community. GNU Press / Free Software Foundation. Copyright © 1988–2026 Free Software Foundation, Inc. Cada fragmento identifica su archivo, SHA de blob original y líneas inclusivas de procedencia.

Fuente: https://github.com/gcc-mirror/gcc/tree/releases/gcc-16.1.0/gcc/doc

Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or any later version published by the Free Software Foundation; with the Invariant Sections being “Funding Free Software”, the Front-Cover Texts being (a) (see below), and with the Back-Cover Texts being (b) (see below). A copy of the license is included in the section entitled “GNU Free Documentation License”.

(a) A GNU Manual

(b) You have freedom to copy and modify this GNU Manual, like GNU software. Copies published by the Free Software Foundation raise funds for GNU development.

Los archivos originales íntegros de Funding Free Software, GNU Free Documentation License, GNU General Public License y la portada/avisos del manual están en 00-referencia. Se conservan en inglés; las traducciones de Funding y licencias serán exclusivamente informativas y adicionales, nunca sustitutivas. Esta distribución de fragmentos no es una edición terminada del manual. Las marcas de segmentación son de maGNUx. No se afirma una auditoría jurídica completa.

## Carpetas

- 00-referencia: fuentes originales de licencia, sección invariante y portada/macros, no la cola de traducción.
- 01-pendientes: bloques numerados por orden.
- 02-inventarios: registros TSV y rangos de md.texi.

Esta rama es una **exportación independiente**, no una rama de desarrollo. No fusionarla con master: su árbol contiene únicamente el paquete. Las traducciones se integran en master mediante entregas separadas.
