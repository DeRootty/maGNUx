# 2. Estándares de lenguajes admitidos por GCC

> [Índice del manual](README.md) · [Aula de integración](../README.md) · [Edición y licencia](00-edicion-y-licencia.md)

**Estado:** texto completo del capítulo, secciones 2.1–2.8 (prosa y referencias). Traducción no oficial asistida por IA, pendiente de revisión humana.  
**Original:** [gcc/doc/standards.texi](https://github.com/gcc-mirror/gcc/blob/releases/gcc-16.1.0/gcc/doc/standards.texi) · GCC 16.1.0 · blob `2e345713c2c5157700b50198ab82b6a17b91f4b1`.  
Copyright © 1988–2026 Free Software Foundation, Inc. GFDL 1.3 o posterior; véase [avisos y licencia](00-edicion-y-licencia.md).

Para cada lenguaje compilado por GCC para el que existe un estándar, GCC intenta seguir una o más versiones de ese estándar, posiblemente con algunas excepciones y algunas extensiones.

## 2.1. Lenguaje C

El estándar ANSI C original (X3.159-1989) fue ratificado en 1989 y publicado en 1990. Este estándar fue ratificado como estándar ISO (ISO/IEC 9899:1990) más tarde, en 1990. No había diferencias técnicas entre estas publicaciones, aunque las secciones del estándar ANSI se renumeraron y pasaron a ser cláusulas del estándar ISO. El estándar ANSI, pero no el ISO, iba acompañado también de un documento de justificación (*Rationale*).

Este estándar, en ambas formas, se conoce comúnmente como C89, u ocasionalmente como C90, por las fechas de ratificación. Para seleccionar este estándar en GCC, utilice una de las opciones `-ansi`, `-std=c90` o `-std=iso9899:1990`; para obtener todos los diagnósticos exigidos por el estándar, también debería especificar `-pedantic` (o `-pedantic-errors` si quiere que sean errores en lugar de advertencias). Véase [opciones que controlan el dialecto C, original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/C-Dialect-Options.html).

Los errores del estándar ISO C de 1990 se corrigieron mediante dos corrigendos técnicos publicados en 1994 y 1996. GCC no admite la versión sin corregir.

En 1995 se publicó una enmienda al estándar de 1990. Esta enmienda añadió los dígrafos y `__STDC_VERSION__` al lenguaje, pero por lo demás se ocupó de la biblioteca. Esta enmienda se conoce comúnmente como AMD1; el estándar enmendado a veces se conoce como C94 o C95. Para seleccionarlo en GCC, utilice `-std=iso9899:199409` (junto con `-pedantic`, como en otras versiones del estándar, para recibir todos los diagnósticos exigidos).

En 1999 se publicó una nueva edición del estándar ISO C como ISO/IEC 9899:1999, conocida comúnmente como C99. (Durante su desarrollo, los borradores de esta versión se denominaban C9X). GCC ofrece un soporte sustancialmente completo de esta versión del estándar; para más detalles, véase [el estado de C en GCC](https://gcc.gnu.org/projects/c-status.html). Para seleccionar este estándar, utilice `-std=c99` o `-std=iso9899:1999`.

Los errores del estándar ISO C de 1999 se corrigieron mediante tres corrigendos técnicos publicados en 2001, 2004 y 2007. GCC no admite la versión sin corregir.

En 2011 se publicó una cuarta versión del estándar C, conocida como C11, como ISO/IEC 9899:2011. (Durante su desarrollo, los borradores de esta versión se denominaban C1X). GCC ofrece un soporte sustancialmente completo de este estándar, habilitado con `-std=c11` o `-std=iso9899:2011`. En 2017 se preparó una versión con las correcciones integradas, publicada en 2018 como ISO/IEC 9899:2018; se conoce como C17 y se admite mediante `-std=c17` o `-std=iso9899:2017`; las correcciones también se aplican con `-std=c11`, y la única diferencia entre las opciones es el valor de `__STDC_VERSION__`.

En 2024 se publicó una quinta versión del estándar C, conocida como C23, como ISO/IEC 9899:2024. (Durante su desarrollo, los borradores se denominaban C2X). El soporte se habilita mediante `-std=c23` o `-std=iso9899:2024`.

Se encuentra en desarrollo otra versión del estándar C, conocida como C2Y; su soporte experimental e incompleto se habilita con `-std=c2y`.

De forma predeterminada, GCC ofrece algunas extensiones al lenguaje C que, en ocasiones poco frecuentes, entran en conflicto con el estándar C. Véase [extensiones de la familia del lenguaje C, original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/C-Extensions.html). Algunas características que forman parte de C99 se aceptan como extensiones en el modo C90, y algunas que forman parte de C11 se aceptan como extensiones en los modos C90 y C99. El uso de las opciones `-std` antes enumeradas desactiva estas extensiones cuando entran en conflicto con la versión del estándar C seleccionada. También puede seleccionar explícitamente una versión ampliada del lenguaje C con `-std=gnu90` (C90 con extensiones GNU), `-std=gnu99` (C99 con extensiones GNU), `-std=gnu11` (C11 con extensiones GNU), `-std=gnu17` (C17 con extensiones GNU) o `-std=gnu23` (C23 con extensiones GNU).

El valor predeterminado, si no se indican opciones de dialecto C, es `-std=gnu23`.

El estándar ISO C define (en la cláusula 4) dos clases de implementación conforme. Una implementación alojada conforme (*conforming hosted implementation*) admite todo el estándar, incluidas todas las prestaciones de biblioteca; una implementación independiente conforme (*conforming freestanding implementation*) solo está obligada a proporcionar ciertas prestaciones de biblioteca: las de `<float.h>`, `<limits.h>`, `<stdarg.h>` y `<stddef.h>`; desde AMD1, también las de `<iso646.h>`; desde C99, también las de `<stdbool.h>` y `<stdint.h>`; y desde C11, también las de `<stdalign.h>` y `<stdnoreturn.h>`. Además, los tipos complejos, añadidos en C99, no son obligatorios en las implementaciones independientes. Desde C23, las implementaciones independientes deben admitir un conjunto más amplio de prestaciones de biblioteca, incluidas algunas funciones de otras cabeceras.

El estándar también define dos entornos para los programas: un entorno independiente (*freestanding environment*), exigido a todas las implementaciones, que puede carecer de prestaciones de biblioteca más allá de las exigidas a las implementaciones independientes y en el que el tratamiento del inicio y la terminación de los programas viene definido por la implementación; y un entorno alojado (*hosted environment*), que no es obligatorio, en el que se proporcionan todas las prestaciones de biblioteca y el inicio se realiza a través de una función `int main (void)` o `int main (int, char *[])`. Un kernel de sistema operativo es un ejemplo de programa que se ejecuta en un entorno independiente; un programa que utiliza las prestaciones de un sistema operativo es un ejemplo de programa que se ejecuta en un entorno alojado.

GCC aspira a ser utilizable como compilador para una implementación conforme independiente o alojada. De forma predeterminada, actúa como compilador de una implementación alojada, define `__STDC_HOSTED__` como `1` y supone que, cuando se utilizan los nombres de las funciones de ISO C, estas tienen la semántica definida en el estándar. Para que actúe como compilador de un entorno independiente, utilice `-ffreestanding`; entonces define `__STDC_HOSTED__` como `0` y no hace suposiciones sobre el significado de los nombres de funciones de la biblioteca estándar, con las excepciones que se indican más adelante. Para construir un kernel de sistema operativo, es posible que aún tenga que disponer sus propios mecanismos de enlace y arranque. Véase [opciones que controlan el dialecto C, original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/C-Dialect-Options.html).

En general, GCC proporciona las prestaciones de biblioteca de las cabeceras que no declaran funciones con enlace externo (lo que incluye las cabeceras que C11 y los estándares anteriores exigen a las implementaciones independientes), pero no las incluidas en otras cabeceras. Además, GCC proporciona `<stdatomic.h>`, aunque declara algunas funciones con enlace externo (que se proporcionan en `libatomic`). En unas pocas plataformas, algunas de las cabeceras que no declaran funciones con enlace externo se obtienen, en cambio, de la biblioteca C del sistema operativo, lo que puede significar que carezcan de soporte para características de versiones más recientes del estándar C admitidas por las versiones propias de GCC de esas cabeceras. En algunas plataformas, GCC proporciona `<tgmath.h>` (pero esta implementación no admite las interfaces añadidas en C23).

Para utilizar las prestaciones de un entorno alojado, y algunas de las exigidas a un entorno independiente por C23, debe encontrarlas en otro lugar (por ejemplo, en la biblioteca C de GNU). Véase «Standard Libraries» en el [manual original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/).

La mayoría de las rutinas de soporte del compilador que utiliza GCC están presentes en `libgcc`, pero hay algunas excepciones. GCC exige que el entorno independiente proporcione `memcpy`, `memmove`, `memset` y `memcmp`. Contrariamente a los estándares que regulan `memcpy`, GCC espera que el caso de solapamiento exacto del origen y el destino funcione y no invoque comportamiento indefinido. Por último, si se utiliza `__builtin_trap` y el objetivo no implementa el patrón `trap`, GCC emite una llamada a `abort`.

Para referencias a corrigendos técnicos, documentos de justificación e información en línea sobre la historia de C, véase [lecturas de GCC](https://gcc.gnu.org/readings.html).

## 2.2. Lenguaje C++

GCC admite el estándar ISO C++ original publicado en 1998, las revisiones de 2011, 2014 y 2017 y la mayor parte de las de 2020 y 2024.

El estándar ISO C++ original se publicó como estándar ISO (ISO/IEC 14882:1998) y fue enmendado mediante un corrigendo técnico publicado en 2003 (ISO/IEC 14882:2003). Estos estándares se denominan C++98 y C++03, respectivamente. GCC implementa la mayor parte de C++98 (`export` es una excepción notable) y la mayoría de los cambios de C++03. Para seleccionar este estándar en GCC, utilice `-ansi`, `-std=c++98` o `-std=c++03`; para obtener todos los diagnósticos exigidos por el estándar, debería especificar también `-pedantic` (o `-pedantic-errors` si quiere que sean errores en lugar de advertencias).

En 2011 se publicó un estándar ISO C++ revisado como ISO/IEC 14882:2011, denominado C++11; antes de su publicación se denominaba comúnmente C++0x. C++11 contiene varios cambios en el lenguaje C++, todos los cuales han sido implementados en GCC. Para más detalles, véase [estado de C++11](https://gcc.gnu.org/projects/cxx-status.html#cxx11). Para seleccionar este estándar en GCC, utilice `-std=c++11`.

En 2014 se publicó otro estándar ISO C++ revisado como ISO/IEC 14882:2014, denominado C++14; antes de su publicación se denominaba a veces C++1y. C++14 contiene varios cambios adicionales en el lenguaje C++, todos los cuales han sido implementados en GCC. Para más detalles, véase [estado de C++14](https://gcc.gnu.org/projects/cxx-status.html#cxx14). Para seleccionar este estándar en GCC, utilice `-std=c++14`.

El lenguaje C++ se revisó de nuevo en 2017 y se publicó ISO/IEC 14882:2017. Se denomina C++17 y, antes de su publicación, se denominaba con frecuencia C++1z. GCC admite todos los cambios de esa especificación. Para más detalles, véase [estado de C++17](https://gcc.gnu.org/projects/cxx-status.html#cxx17). Utilice `-std=c++17` para seleccionar esta variante de C++.

En 2020 se publicó otro estándar ISO C++ revisado como ISO/IEC 14882:2020, denominado C++20; antes de su publicación se denominaba a veces C++2a. GCC admite la mayoría de los cambios de la nueva especificación. Para más detalles, véase [estado de C++20](https://gcc.gnu.org/projects/cxx-status.html#cxx20). Para seleccionar este estándar en GCC, utilice `-std=c++20`.

En 2024 se publicó otro estándar ISO C++ revisado como ISO/IEC 14882:2024, denominado C++23; antes de su publicación se denominaba a veces C++2b. GCC admite la mayoría de los cambios de la nueva especificación. Para más detalles, véase [estado de C++23](https://gcc.gnu.org/projects/cxx-status.html#cxx23). Para seleccionar este estándar en GCC, utilice `-std=c++23`.

Encontrará más información sobre los estándares C++ en el [sitio web del comité ISO C++](https://www.open-std.org/jtc1/sc22/wg21/).

Para obtener todos los diagnósticos exigidos por cualquiera de las versiones del estándar antes descritas, debería especificar `-pedantic` o `-pedantic-errors`; de lo contrario, GCC permitirá como extensiones algunas características de C++ que no pertenecen a ISO. Véase [opciones de advertencia, original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Warning-Options.html).

De forma predeterminada, GCC también proporciona algunas extensiones adicionales al lenguaje C++ que, en ocasiones poco frecuentes, entran en conflicto con el estándar C++. Véase [opciones que controlan el dialecto C++, original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/C_002b_002b-Dialect-Options.html). El uso de las opciones `-std` antes enumeradas desactiva estas extensiones cuando entran en conflicto con la versión del estándar C++ seleccionada. También puede seleccionar explícitamente una versión ampliada del lenguaje C++ con `-std=gnu++98` (C++98 con extensiones GNU), `-std=gnu++11` (C++11 con extensiones GNU), `-std=gnu++14` (C++14 con extensiones GNU), `-std=gnu++17` (C++17 con extensiones GNU), `-std=gnu++20` (C++20 con extensiones GNU) o `-std=gnu++23` (C++23 con extensiones GNU).

El valor predeterminado, si no se indican opciones de dialecto C++, es `-std=gnu++20`.

## 2.3. Lenguajes Objective-C y Objective-C++

GCC admite Objective-C «tradicional» (también conocido como «Objective-C 1.0») y contiene soporte para la sintaxis de excepciones y sincronización de Objective-C. También admite varias extensiones del lenguaje «Objective-C 2.0», incluidas las propiedades, la enumeración rápida (solo para Objective-C), los atributos de método y las palabras clave `@optional` y `@required` en los protocolos. GCC admite Objective-C++, y las características disponibles en Objective-C también están disponibles en Objective-C++.

GCC utiliza de forma predeterminada la biblioteca de tiempo de ejecución de GNU Objective-C, que forma parte de GCC y no es la misma que la biblioteca de tiempo de ejecución Apple/NeXT Objective-C utilizada en los sistemas de Apple. Este manual documenta diversas diferencias. Las opciones `-fgnu-runtime` y `-fnext-runtime` permiten alternar entre producir resultados que funcionen con la biblioteca de tiempo de ejecución de GNU Objective-C y resultados que funcionen con la biblioteca Apple/NeXT Objective-C.

No existe un estándar formal escrito para Objective-C ni Objective-C++. El manual de referencia de Objective-C tradicional (1.0) es *Object-Oriented Programming and the Objective-C Language* ([PDF](https://www.gnustep.org/resources/documentation/ObjectivCBook.pdf)).

La sintaxis de excepciones y sincronización de Objective-C (es decir, las palabras clave `@try`, `@throw`, `@catch`, `@finally` y `@synchronized`) es admitida por GCC y se habilita con `-fobjc-exceptions`. La sintaxis se documenta brevemente en este manual y en los manuales de Objective-C 2.0 de Apple.

Las extensiones y características del lenguaje Objective-C 2.0 se habilitan automáticamente; incluyen propiedades (mediante las palabras clave `@property`, `@synthesize` y `@dynamic`), enumeración rápida (no disponible en Objective-C++), atributos para métodos (como `deprecated`, `noreturn`, `sentinel`, `format`), el atributo `unused` para los argumentos de método, la palabra clave `@package` para las variables de instancia y las palabras clave `@optional` y `@required` en los protocolos. Puede desactivar todas estas extensiones del lenguaje Objective-C 2.0 con `-fobjc-std=objc1`, que hace que el compilador reconozca la misma sintaxis del lenguaje Objective-C que reconocía GCC 4.0 y produzca un error si se utiliza alguna de las nuevas características.

Actualmente, GCC no admite variables de instancia no frágiles (*non-fragile instance variables*).

El manual de referencia de Objective-C 2.0 está disponible en [Apple](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html).

Para más información en línea sobre la historia de Objective-C, véase [lecturas de GCC](https://gcc.gnu.org/readings.html).

## 2.4. Lenguaje COBOL

A partir de la publicación de GCC 15, GCC admite el estándar ISO del lenguaje COBOL (ISO/IEC 1989:2023). Incluye cierto soporte de compatibilidad con otros compiladores COBOL mediante `-dialect`.

## 2.5. Lenguaje Go

A partir de la publicación de GCC 4.7.1, GCC admite el estándar del lenguaje Go 1, descrito en [Go 1](https://go.dev/doc/go1).

## 2.6. Lenguaje D

GCC admite el lenguaje de programación D 2.0. El propio lenguaje D viene definido actualmente por su implementación de referencia y la especificación del lenguaje que la acompaña, descrita en la [especificación de D](https://dlang.org/spec/spec.html).

## 2.7. Lenguaje Modula-2

GCC admite el lenguaje Modula-2 y es conforme con los dialectos PIM2, PIM3, PIM4 e ISO. También se implementa un conjunto completo de bibliotecas ISO libres. Contiene asimismo una colección de bibliotecas PIM y algunas bibliotecas compatibles con Logitech.

Para más información sobre Modula-2, véase [lecturas de GCC](https://gcc.gnu.org/readings.html). El manual en línea está disponible en [GNU Modula-2](https://gcc.gnu.org/onlinedocs/gm2/index.html).

## 2.8. Referencias para otros lenguajes

Véase «About This Guide», en el [GNAT Reference Manual](https://gcc.gnu.org/onlinedocs/gnat_rm/), para información sobre la conformidad con los estándares y la compatibilidad del compilador Ada.

Véase «Standards», en el [manual de GNU Fortran](https://gcc.gnu.org/onlinedocs/gfortran/), para detalles de los estándares admitidos por GNU Fortran.

---

[Anterior: capítulo 1](01-lenguajes.md) · [Índice](README.md) · [Siguiente: capítulo 3](03-introduccion.md)
