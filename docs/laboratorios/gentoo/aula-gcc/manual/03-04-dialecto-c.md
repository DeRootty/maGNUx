# 3.4. Opciones que controlan el dialecto C

> [Índice del manual](README.md) · [Aula de integración](../README.md) · [Edición y licencia](00-edicion-y-licencia.md)

**Estado:** traducción parcial; bloque 0001 de 3, pendiente de revisión humana.  
**Original:** [gcc/doc/invoke.texi, líneas 2448–2727](https://github.com/gcc-mirror/gcc/blob/releases/gcc-16.1.0/gcc/doc/invoke.texi#L2448-L2727) · GCC 16.1.0 · blob `9207a021e64224b74d5019719c3d7e39a2663807`.  
Copyright © 1988–2026 Free Software Foundation, Inc. GFDL 1.3 o posterior; véase [avisos y licencia](00-edicion-y-licencia.md).

<!-- @node C Dialect Options
@cindex dialect options
@cindex language dialect options
@cindex options, dialect
-->

Las siguientes opciones controlan el dialecto de C (o de los lenguajes derivados de C, como C++, Objective-C y Objective-C++) que acepta el compilador:

<!-- @table @gcctabopt
@cindex ANSI support
@cindex ISO support
@opindex ansi
-->

### -ansi, --ansi

En modo C, equivale a `-std=c90`. En modo C++, equivale a `-std=c++98`.

<!-- @opindex std -->

### -std=

Determina el estándar del lenguaje. Véase [Estándares de lenguajes admitidos por GCC](02-estandares.md) para conocer los detalles de estas versiones del estándar. Actualmente, esta opción solo se admite al compilar C o C++.

El compilador puede aceptar varios estándares base, como `c90` o `c++98`, y dialectos GNU de esos estándares, como `gnu90` o `gnu++98`. Cuando se especifica un estándar base, el compilador acepta todos los programas que se ajustan a ese estándar, además de aquellos que utilizan extensiones GNU que no lo contradicen. Por ejemplo, `-std=c90` desactiva ciertas características de GCC que son incompatibles con ISO C90, como las palabras clave `asm` y `typeof`, pero no otras extensiones GNU que carecen de significado en ISO C90, como la omisión del término intermedio de una expresión `?:`. Por otra parte, cuando se especifica un dialecto GNU de un estándar, se habilitan todas las características admitidas por el compilador, incluso cuando dichas características cambian el significado del estándar base. Como resultado, algunos programas que se ajustan estrictamente al estándar pueden ser rechazados. El estándar concreto es utilizado por `-Wpedantic` para identificar qué características son extensiones GNU dada esa versión del estándar. Por ejemplo, `-std=gnu90 -Wpedantic` emite advertencias sobre los comentarios de estilo C++ `//`, mientras que `-std=gnu99 -Wpedantic` no lo hace.

Debe proporcionarse un valor para esta opción; los valores posibles son los siguientes.

<!-- @table @samp -->

#### c90, c89, iso9899:1990

Admite todos los programas ISO C90 (se desactivan ciertas extensiones GNU que entran en conflicto con ISO C90). Equivale a `-ansi` para código C.

#### iso9899:199409

ISO C90, modificado por la enmienda 1.

#### c99, c9x, iso9899:1999, iso9899:199x

ISO C99. Este estándar se admite de manera prácticamente completa, salvo errores y cuestiones de coma flotante (relacionadas principalmente, aunque no en su totalidad, con las características opcionales de C99 de los anexos F y G). Véase [el estado de C en GCC](https://gcc.gnu.org/projects/c-status.html) para más información. Los nombres `c9x` e `iso9899:199x` están obsoletos.

#### c11, c1x, iso9899:2011

ISO C11, la revisión de 2011 del estándar ISO C. Este estándar se admite de manera prácticamente completa, salvo errores, cuestiones de coma flotante (relacionadas principalmente, aunque no en su totalidad, con las características opcionales de C11 de los anexos F y G) y los anexos opcionales K (interfaces de comprobación de límites) y L (analizabilidad). El nombre `c1x` está obsoleto.

#### c17, c18, iso9899:2017, iso9899:2018

ISO C17, la revisión de 2017 del estándar ISO C (publicada en 2018). Este estándar es igual a C11 salvo por las correcciones de defectos (todas ellas se aplican también con `-std=c11`) y un nuevo valor de `__STDC_VERSION__`, por lo que se admite en la misma medida que C11.

#### c23, c2x, iso9899:2024

ISO C23, la revisión de 2023 del estándar ISO C (publicada en 2024). El nombre `c2x` está obsoleto.

#### c2y

La próxima versión del estándar ISO C, todavía en desarrollo. La compatibilidad con esta versión es experimental e incompleta.

#### gnu90, gnu89

Dialecto GNU de ISO C90 (incluidas algunas características de C99).

#### gnu99, gnu9x

Dialecto GNU de ISO C99. El nombre `gnu9x` está obsoleto.

#### gnu11, gnu1x

Dialecto GNU de ISO C11. El nombre `gnu1x` está obsoleto.

#### gnu17, gnu18

Dialecto GNU de ISO C17.

#### gnu23, gnu2x

Dialecto GNU de ISO C23. Es el predeterminado para código C. El nombre `gnu2x` está obsoleto.

#### gnu2y

La próxima versión del estándar ISO C, todavía en desarrollo, más las extensiones GNU. La compatibilidad con esta versión es experimental e incompleta. El nombre `gnu2x` está obsoleto.

#### c++98, c++03

El estándar ISO C++ de 1998 más la corrección técnica de 2003 y algunos informes de defectos adicionales. Equivale a `-ansi` para código C++.

#### gnu++98, gnu++03

Dialecto GNU de `-std=c++98`.

#### c++11, c++0x

El estándar ISO C++ de 2011 más las enmiendas. El nombre `c++0x` está obsoleto.

#### gnu++11, gnu++0x

Dialecto GNU de `-std=c++11`. El nombre `gnu++0x` está obsoleto.

#### c++14, c++1y

El estándar ISO C++ de 2014 más las enmiendas. El nombre `c++1y` está obsoleto.

#### gnu++14, gnu++1y

Dialecto GNU de `-std=c++14`. El nombre `gnu++1y` está obsoleto.

#### c++17, c++1z

El estándar ISO C++ de 2017 más las enmiendas. El nombre `c++1z` está obsoleto.

#### gnu++17, gnu++1z

Dialecto GNU de `-std=c++17`. El nombre `gnu++1z` está obsoleto.

#### c++20, c++2a

El estándar ISO C++ de 2020 más las enmiendas. La compatibilidad con los módulos de C++20 todavía es experimental y debe habilitarse con la opción `-fmodules`. El nombre `c++2a` está obsoleto.

#### gnu++20, gnu++2a

Dialecto GNU de `-std=c++20`. Es el predeterminado para código C++. La compatibilidad con los módulos de C++20 todavía es experimental y debe habilitarse con la opción `-fmodules`. El nombre `gnu++2a` está obsoleto.

#### c++23, c++2b

El estándar ISO C++ de 2023 más las enmiendas (publicado en 2024). La compatibilidad es experimental y podría cambiar de maneras incompatibles en futuras versiones. El nombre `c++2b` está obsoleto.

#### gnu++23, gnu++2b

Dialecto GNU de `-std=c++23`. La compatibilidad es experimental y podría cambiar de maneras incompatibles en futuras versiones. El nombre `gnu++2b` está obsoleto.

#### c++2c, c++26

La próxima revisión del estándar ISO C++, prevista para 2026. La compatibilidad es altamente experimental y casi con toda seguridad cambiará de maneras incompatibles en futuras versiones.

#### gnu++2c, gnu++26

Dialecto GNU de `-std=c++2c`. La compatibilidad es altamente experimental y casi con toda seguridad cambiará de maneras incompatibles en futuras versiones.

<!-- @end table (valores de -std=)
@opindex aux-info
-->

### -aux-info filename

Escribe en el archivo cuyo nombre se indica las declaraciones con prototipo de todas las funciones declaradas o definidas (o ambas cosas) en una unidad de traducción, incluidas las de los archivos de cabecera. Esta opción se ignora silenciosamente en cualquier lenguaje distinto de C.

Además de las declaraciones, el archivo indica, mediante comentarios, el origen de cada declaración (archivo fuente y línea), si la declaración era implícita, con prototipo o sin prototipo (`I`, `N` para nueva u `O` para antigua, respectivamente, en el primer carácter después del número de línea y los dos puntos), y si procedía de una declaración o de una definición (`C` o `F`, respectivamente, en el carácter siguiente). En el caso de las definiciones de funciones, también se proporciona una lista de argumentos al estilo K&R seguida de sus declaraciones, dentro de comentarios, después de la declaración.

<!-- @opindex fno-asm
@opindex fasm
-->

### -fno-asm

No reconoce `asm`, `inline` ni `typeof` como palabras clave, de modo que el código puede utilizar estas palabras como identificadores. En su lugar, puede utilizar las palabras clave `__asm__`, `__inline__` y `__typeof__`. En C, `-ansi` implica `-fno-asm`.

En C++, `inline` es una palabra clave estándar y no resulta afectada por esta opción. Quizá prefiera utilizar el indicador `-fno-gnu-keywords`, que desactiva `typeof`, pero no `asm` ni `inline`. En modo C99 (`-std=c99` o `-std=gnu99`), esta opción solo afecta a las palabras clave `asm` y `typeof`, puesto que `inline` es una palabra clave estándar de ISO C99. En modo C23 (`-std=c23` o `-std=gnu23`), esta opción solo afecta a la palabra clave `asm`, puesto que `typeof` es una palabra clave estándar de ISO C23.

<!-- @opindex fno-builtin
@opindex fbuiltin
@cindex built-in functions
-->

### -fno-builtin, -fno-builtin-function

No reconoce las funciones incorporadas que no comienzan con el prefijo `__builtin_`. Véase «Library Builtins» en el [manual original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Library-Builtins.html) para conocer los detalles de las funciones afectadas, incluidas aquellas que no son funciones incorporadas cuando se utilizan `-ansi` u opciones `-std` para ajustarse estrictamente a ISO C, porque carecen de significado en el estándar ISO.

GCC genera normalmente código especial para manejar determinadas funciones incorporadas de manera más eficiente; por ejemplo, las llamadas a `alloca` pueden convertirse en instrucciones individuales que ajustan directamente la pila, y las llamadas a `memcpy` pueden convertirse en bucles de copia en línea. El código resultante suele ser más pequeño y más rápido, pero, dado que las llamadas a funciones ya no aparecen como tales, no puede establecer un punto de interrupción en esas llamadas ni cambiar el comportamiento de las funciones enlazando con una biblioteca diferente. Además, cuando una función se reconoce como función incorporada, GCC puede utilizar información sobre dicha función para advertir de problemas con las llamadas a ella o para generar código más eficiente, incluso si el código resultante todavía contiene llamadas a esa función. Por ejemplo, se emiten advertencias con `-Wformat` por llamadas incorrectas a `printf` cuando `printf` es una función incorporada y se sabe que `strlen` no modifica la memoria global.

Con la opción `-fno-builtin-function` solo se desactiva la función incorporada *function*. *function* no debe comenzar por `__builtin_`. Si se indica el nombre de una función que no es incorporada en esta versión de GCC, se ignora esta opción. No existe una opción correspondiente `-fbuiltin-function`; si desea habilitar selectivamente funciones incorporadas al utilizar `-fno-builtin` o `-ffreestanding`, puede definir macros como las siguientes:

~~~c
#define abs(n)          __builtin_abs ((n))
#define strcpy(d, s)    __builtin_strcpy ((d), (s))
~~~

<!-- @opindex fcond-mismatch
@opindex fno-cond-mismatch
-->

---

**Nota editorial (fuera de la traducción):** en la entrada `gnu2y` se conserva la referencia a `gnu2x` del original, sin corregirla silenciosamente. Las marcas de índice originales se conservan como comentarios Markdown para la futura reconstrucción del apéndice. La tabla exterior de opciones continúa en el bloque 0002.

**Punto de continuación:** bloque `0002-03-04-invoke.texi`, líneas 2728–2945, comenzando por `@item -fcond-mismatch`. No se ha traducido todavía esa descripción.

[Anterior: 3.3](03-03-compilar-cpp.md) · [Índice](README.md) · 3.5 pendiente.
