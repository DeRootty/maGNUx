# 3.2. Opciones que controlan el tipo de salida

> [Índice del manual](README.md) · [Aula de integración](../README.md) · [Edición y licencia](00-edicion-y-licencia.md)

**Estado:** sección 3.2 completa en traducción inicial; revisión humana pendiente. Incluye la entrada @file de libiberty/at-file.texi (blob `080d1951d62df67643aaffa7a5acabf5d756864e`).
**Original:** [gcc/doc/invoke.texi](https://github.com/gcc-mirror/gcc/blob/releases/gcc-16.1.0/gcc/doc/invoke.texi) · GCC 16.1.0 · blob `9207a021e64224b74d5019719c3d7e39a2663807`.  
Copyright © 1988–2026 Free Software Foundation, Inc. GFDL 1.3 o posterior; véase [avisos y licencia](00-edicion-y-licencia.md).

La compilación puede comprender hasta cuatro etapas: preprocesamiento, compilación propiamente dicha, ensamblado y enlace, siempre en ese orden. GCC es capaz de preprocesar y compilar varios archivos, bien en varios archivos de entrada del ensamblador, bien en un único archivo de entrada del ensamblador; después, cada archivo de entrada del ensamblador produce un archivo objeto, y el enlace combina todos los archivos objeto (los recién compilados y los especificados como entrada) en un archivo ejecutable.

Para cualquier archivo de entrada dado, el sufijo del nombre del archivo determina qué clase de compilación se realiza:

| Sufijo | Tratamiento |
|---|---|
| `file.c` | Código fuente C que debe preprocesarse. |
| `file.i` | Código fuente C que no debe preprocesarse. |
| `file.ii` | Código fuente C++ que no debe preprocesarse. |
| `file.m` | Código fuente Objective-C. Tenga en cuenta que debe enlazar con la biblioteca `libobjc` para que funcione un programa Objective-C. |
| `file.mi` | Código fuente Objective-C que no debe preprocesarse. |
| `file.mm`, `file.M` | Código fuente Objective-C++. Tenga en cuenta que debe enlazar con la biblioteca `libobjc` para que funcione un programa Objective-C++. `.M` se refiere literalmente a la M mayúscula. |
| `file.mii` | Código fuente Objective-C++ que no debe preprocesarse. |
| `file.h` | Cabecera C, C++, Objective-C u Objective-C++ que se convertirá en una cabecera precompilada (predeterminado), o cabecera C o C++ que se convertirá en una especificación Ada (mediante `-fdump-ada-spec`). |
| `file.cc`, `file.cp`, `file.cxx`, `file.cpp`, `file.CPP`, `file.c++`, `file.C` | Código fuente C++ que debe preprocesarse. En `.cxx` las dos últimas letras deben ser literalmente x; de igual modo, `.C` se refiere a una C mayúscula literal. |
| `file.mm`, `file.M` | Código fuente Objective-C++ que debe preprocesarse. |
| `file.mii` | Código fuente Objective-C++ que no debe preprocesarse. |
| `file.hh`, `file.H`, `file.hp`, `file.hxx`, `file.hpp`, `file.HPP`, `file.h++`, `file.tcc` | Cabecera C++ que se convertirá en una cabecera precompilada o una especificación Ada. |
| `file.f`, `file.for`, `file.ftn`, `file.fi` | Código fuente Fortran de formato fijo que no debe preprocesarse. |
| `file.F`, `file.FOR`, `file.fpp`, `file.FPP`, `file.FTN` | Código fuente Fortran de formato fijo que debe preprocesarse (con el preprocesador tradicional). |
| `file.f90`, `file.f95`, `file.f03`, `file.f08`, `file.fii` | Código fuente Fortran de formato libre que no debe preprocesarse. |
| `file.F90`, `file.F95`, `file.F03`, `file.F08` | Código fuente Fortran de formato libre que debe preprocesarse (con el preprocesador tradicional). |
| `file.cob`, `file.COB`, `file.cbl`, `file.CBL` | Código fuente COBOL. |
| `file.go` | Código fuente Go. |
| `file.d` | Código fuente D. |
| `file.di` | Archivo de interfaz D. |
| `file.dd` | Código de documentación D (Ddoc). |
| `file.ads` | Archivo fuente Ada que contiene una declaración de unidad de biblioteca (declaración de paquete, subprograma o genérico, o instanciación de un genérico), o una declaración de renombrado de una unidad de biblioteca (renombrado de paquete, genérico o subprograma). Estos archivos también se denominan *specs*. |
| `file.adb` | Archivo fuente Ada que contiene el cuerpo de una unidad de biblioteca (cuerpo de subprograma o paquete). También se denominan *bodies*. |
| `file.s` | Código ensamblador. |
| `file.S`, `file.sx` | Código ensamblador que debe preprocesarse. |
| `other` | Archivo objeto que pasa directamente al enlace. Cualquier nombre de archivo sin un sufijo reconocido se trata de esta manera. |

Puede especificar explícitamente el lenguaje de entrada mediante la opción `-x`:

### -x language / --language=language / --language language

Especifica explícitamente el lenguaje *language* de los archivos de entrada siguientes (en lugar de dejar que el compilador elija uno predeterminado a partir del sufijo del nombre de archivo). Esta opción se aplica a todos los archivos de entrada siguientes hasta la próxima opción `-x`. Los valores posibles de *language* son:

```text
c  c-header  cpp-output
c++  c++-header  c++-system-header c++-user-header c++-cpp-output
c++-system-module
objective-c  objective-c-header  objective-c-cpp-output  objc-cpp-output
objective-c++  objective-c++-header  objective-c++-cpp-output
objc++-cpp-output
assembler  assembler-with-cpp
ada  adascil  adawhy
cobol
d
f77  f77-cpp-input  f95  f95-cpp-input
go
modula-2  modula-2-cpp-output
rust
algol68
lto
```

Tenga en cuenta que `-x` no implica un estándar del lenguaje en particular. Por ejemplo, `-x f77` puede requerir también `-std=legacy` para algunos códigos fuente antiguos.

### -x none

Desactiva cualquier especificación del lenguaje, de modo que los archivos siguientes se tratan según los sufijos de sus nombres (como si `-x` no se hubiera utilizado).

Si solo desea algunas de las etapas de compilación, puede utilizar `-x` (o los sufijos de nombres de archivo) para indicar a `gcc` dónde comenzar, y una de las opciones `-c`, `-S` o `-E` para indicar dónde detenerse. Tenga en cuenta que algunas combinaciones (por ejemplo, `-x cpp-output -E`) indican a `gcc` que no haga absolutamente nada.

### -c / --compile

Compila o ensambla los archivos fuente, pero no enlaza. La etapa de enlace simplemente no se realiza. El resultado final tiene la forma de un archivo objeto para cada archivo fuente.

De forma predeterminada, el nombre del archivo objeto de un archivo fuente se obtiene sustituyendo el sufijo `.c`, `.i`, `.s`, etc., por `.o`.

Los archivos de entrada no reconocidos, que no requieren compilación ni ensamblado, se ignoran.

### -S / --assemble

Se detiene después de la etapa de compilación propiamente dicha; no ensambla. El resultado tiene la forma de un archivo de código ensamblador por cada archivo de entrada que no sea ensamblador.

De forma predeterminada, el nombre del archivo ensamblador de un archivo fuente se obtiene sustituyendo el sufijo `.c`, `.i`, etc., por `.s`.

Se ignoran los archivos de entrada que no requieren compilación.

### -E / --preprocess

Se detiene después de la etapa de preprocesamiento; no ejecuta el compilador propiamente dicho. El resultado tiene la forma de código fuente preprocesado, que se envía a la salida estándar.

Se ignoran los archivos de entrada que no requieren preprocesamiento.

### -o file / --output=file / --output file

Coloca la salida primaria en el archivo *file*. Esto se aplica a cualquier clase de salida que se esté produciendo, tanto si es un archivo ejecutable, un archivo objeto, un archivo ensamblador o código C preprocesado.

Si no se especifica `-o`, de forma predeterminada se coloca un archivo ejecutable en `a.out`, el archivo objeto de `source.suffix` en `source.o`, su archivo ensamblador en `source.s`, una cabecera precompilada en `source.suffix.gch` y todo el código fuente C preprocesado en la salida estándar.

Aunque `-o` solo da nombre a la salida primaria, también afecta a la denominación de las salidas auxiliares y de los volcados. Véanse los ejemplos que siguen. A menos que se indique lo contrario, ambas salidas se colocan en el mismo directorio que la salida primaria. En las salidas auxiliares, el sufijo del archivo de entrada se sustituye por el del tipo de archivo de salida auxiliar; en los volcados, el sufijo del archivo de volcado se añade al sufijo del archivo de entrada. En las órdenes de compilación, el nombre base de ambas salidas es el de la salida primaria; en las órdenes de compilación y enlace, el nombre de la salida primaria, sin el sufijo de ejecutable, se combina con el nombre del archivo de entrada. Si ambos comparten el mismo nombre base, sin tener en cuenta el sufijo, el resultado de la combinación es ese nombre base; de lo contrario, se concatenan, separados por un guion.

```sh
gcc -c foo.c ...
```

utilizará `foo.o` como salida primaria y situará junto a él las salidas auxiliares y los volcados; por ejemplo, el archivo auxiliar `foo.dwo` para `-gsplit-dwarf` y el volcado `foo.c.???r.final` para `-fdump-rtl-final`.

Si se especifica explícitamente un archivo de salida que no sea del enlazador, los archivos auxiliares y de volcado toman de forma predeterminada el mismo nombre base:

```sh
gcc -c foo.c -o dir/foobar.o ...
```

denominará las salidas auxiliares `dir/foobar.*` y los volcados `dir/foobar.c.*`.

Una salida del enlazador, en cambio, antepondrá un prefijo a las salidas auxiliares y de volcado:

```sh
gcc foo.c bar.c -o dir/foobar ...
```

generalmente denominará las salidas auxiliares `dir/foobar-foo.*` y `dir/foobar-bar.*`, y los volcados `dir/foobar-foo.c.*` y `dir/foobar-bar.c.*`.

La única excepción a lo anterior se produce cuando el ejecutable comparte el nombre base con la única entrada:

```sh
gcc foo.c -o dir/foo ...
```

en cuyo caso las salidas auxiliares se denominan `dir/foo.*` y los volcados `dir/foo.c.*`.

La ubicación y los nombres de las salidas auxiliares y de volcado pueden ajustarse mediante las opciones `-dumpbase`, `-dumpbase-ext`, `-dumpdir`, `-save-temps=cwd` y `-save-temps=obj`.


### -dumpbase dumpbase / --dumpbase dumpbase

Esta opción establece el nombre base de los archivos de salida auxiliares y de volcado. No afecta al nombre del archivo de salida primario. Las salidas intermedias, cuando se conservan, no se consideran salidas primarias, sino auxiliares:

~~~sh
gcc -save-temps -S foo.c
~~~

guarda el archivo preprocesado (ya no temporal) en `foo.i` y después compila a la salida (implícita) `foo.s`, mientras que:

~~~sh
gcc -save-temps -dumpbase save-foo -c foo.c
~~~

preprocesa a `save-foo.i`, compila a `save-foo.s` (ahora una salida intermedia y, por tanto, auxiliar) y después ensambla al archivo de salida (implícito) `foo.o`.

En ausencia de esta opción, los archivos de volcado y auxiliares toman sus nombres del archivo de entrada, o del archivo de salida que no sea del enlazador si se especifica explícitamente: los archivos de volcado (por ejemplo, los solicitados por las opciones `-fdump-*`) con el sufijo del nombre de entrada, y los archivos auxiliares (los solicitados por otras opciones que no sean de volcado, por ejemplo, `-save-temps`, `-gsplit-dwarf` y `-fcallgraph-info`) sin él.

Puede obtenerse una distinción similar entre los sufijos de las salidas de volcado y auxiliares para un `-dumpbase basename.suf` indicado explícitamente especificando también `-dumpbase-ext .suf`.

Si se especifica explícitamente *dumpbase* con algún componente de directorio, se ignora cualquier especificación de *dumppfx* (por ejemplo, `-dumpdir` o `-save-temps=*`) y, en vez de añadirse a ella, *dumpbase* la sustituye por completo:

~~~sh
gcc foo.c -c -o dir/foo.o -dumpbase alt/foo \
  -dumpdir pfx- -save-temps=cwd ...
~~~

crea salidas auxiliares y de volcado denominadas `alt/foo.*`, sin tener en cuenta `dir/` en `-o`, el prefijo `./` implícito en `-save-temps=cwd` ni `pfx-` en `-dumpdir`.

Cuando se especifica `-dumpbase` en una orden que compila varias entradas, o que compila y después enlaza, puede combinarse con *dumppfx*, tal como se especifica en `-dumpdir`. Entonces cada archivo de entrada se compila utilizando el *dumppfx* combinado, y se calculan para cada archivo de entrada los valores predeterminados de *dumpbase* y *auxdropsuf*:

~~~sh
gcc foo.c bar.c -c -dumpbase main ...
~~~

crea `foo.o` y `bar.o` como salidas primarias, y evita sobrescribir las salidas auxiliares y de volcado usando *dumpbase* como prefijo, creando salidas denominadas `main-foo.*` y `main-bar.*`.

Una cadena vacía especificada como *dumpbase* evita que el nombre base de salida influya en la denominación de las salidas auxiliares y de volcado durante la compilación, calculando valores predeterminados:

~~~sh
gcc -c foo.c -o dir/foobar.o -dumpbase '' ...
~~~

denominará las salidas auxiliares `dir/foo.*` y las de volcado `dir/foo.c.*`. Observe que sus nombres base se toman del nombre de entrada, pero el directorio sigue siendo, de forma predeterminada, el de salida.

El *dumpbase* de cadena vacía no impide usar el nombre base de salida para las salidas durante el enlace:

~~~sh
gcc foo.c bar.c -o dir/foobar -dumpbase '' -flto ...
~~~

La compilación de los archivos fuente denominará las salidas auxiliares `dir/foo.*` y `dir/bar.*`, y las de volcado `dir/foo.c.*` y `dir/bar.c.*`. La recompilación LTO durante el enlace utilizará `dir/foobar.` como prefijo de los archivos de volcado y auxiliares.

### -dumpbase-ext auxdropsuf / --dumpbase-ext auxdropsuf

Al formar el nombre de un archivo de salida auxiliar (pero no de volcado), elimina el *auxdropsuf* final de *dumpbase* antes de añadir cualquier sufijo. Si no se especifica, esta opción toma por defecto el sufijo de un *dumpbase* predeterminado, es decir, el sufijo del archivo de entrada cuando `-dumpbase` no está presente en la línea de órdenes, o *dumpbase* se combina con *dumppfx*.

~~~sh
gcc foo.c -c -o dir/foo.o -dumpbase x-foo.c -dumpbase-ext .c ...
~~~

crea `dir/foo.o` como salida principal y genera salidas auxiliares `dir/x-foo.*`, tomando la ubicación de la salida primaria y eliminando el sufijo `.c` de *dumpbase*. Las salidas de volcado conservan el sufijo: `dir/x-foo.c.*`.

Esta opción se ignora si no coincide con el sufijo del *dumpbase* especificado, excepto como alternativa al sufijo del ejecutable cuando se añade a *dumppfx* el nombre base de salida del enlazador, tal como se indica más adelante:

~~~sh
gcc foo.c bar.c -o main.out -dumpbase-ext .out ...
~~~

crea `main.out` como salida primaria y evita sobrescribir las salidas auxiliares y de volcado utilizando el nombre del ejecutable menos *auxdropsuf* como prefijo, creando salidas auxiliares denominadas `main-foo.*` y `main-bar.*` y de volcado denominadas `main-foo.c.*` y `main-bar.c.*`.

### -dumpdir dumppfx / --dumpdir dumppfx

Al formar el nombre de un archivo de salida auxiliar o de volcado, utiliza *dumppfx* como prefijo:

~~~sh
gcc -dumpdir pfx- -c foo.c ...
~~~

crea `foo.o` como salida primaria y salidas auxiliares denominadas `pfx-foo.*`, combinando el *dumppfx* indicado con el *dumpbase* predeterminado, derivado de la salida primaria predeterminada, que a su vez deriva del nombre de entrada. Las salidas de volcado también toman el sufijo del nombre de entrada: `pfx-foo.c.*`.

Si *dumppfx* se va a utilizar como nombre de directorio, debe terminar con un separador de directorio:

~~~sh
gcc -dumpdir dir/ -c foo.c -o obj/bar.o ...
~~~

crea `obj/bar.o` como salida primaria y salidas auxiliares denominadas `dir/bar.*`, combinando el *dumppfx* indicado con el *dumpbase* predeterminado derivado del nombre de la salida primaria. Las salidas de volcado también toman el sufijo del nombre de entrada: `dir/bar.c.*`.

Toma por defecto la ubicación del archivo de salida, salvo que este sea un archivo especial como `/dev/null`. Las opciones `-save-temps=cwd` y `-save-temps=obj` sustituyen este valor predeterminado, igual que una opción explícita `-dumpdir`. Si se indican varias de estas opciones, prevalece la última:

~~~sh
gcc -dumpdir pfx- -c foo.c -save-temps=obj ...
~~~

genera `foo.o`, con salidas auxiliares denominadas `foo.*` porque `-save-temps=*` sustituye el *dumppfx* indicado por la opción `-dumpdir` anterior. No importa que `=obj` sea el valor predeterminado de `-save-temps` ni que el directorio de salida sea implícitamente el directorio actual. Las salidas de volcado se denominan `foo.c.*`.

Al compilar a partir de varios archivos de entrada, si se especifica `-dumpbase`, se añaden *dumpbase* menos el sufijo *auxdropsuf* y un guion a un *dumppfx* explícito o predeterminado (o lo sustituyen si contienen algún componente de directorio), de modo que cada una de las compilaciones obtiene salidas auxiliares y de volcado con nombres distintos.

~~~sh
gcc foo.c bar.c -c -dumpdir dir/pfx- -dumpbase main ...
~~~

genera salidas auxiliares de volcado en `dir/pfx-main-foo.*` y `dir/pfx-main-bar.*`, añadiendo *dumpbase* seguido de un guion a *dumppfx*. Las salidas de volcado conservan el sufijo del archivo de entrada: `dir/pfx-main-foo.c.*` y `dir/pfx-main-bar.c.*`, respectivamente. Contrástese con la compilación de una sola entrada:

~~~sh
gcc foo.c -c -dumpdir dir/pfx- -dumpbase main ...
~~~

que, al aplicar `-dumpbase` a una sola fuente, no calcula ni añade un *dumpbase* separado por archivo de entrada. Sus salidas auxiliares y de volcado se sitúan en `dir/pfx-main.*`.

Al compilar y después enlazar a partir de varios archivos de entrada, un *dumppfx* predeterminado o especificado explícitamente también experimenta la transformación con *dumpbase* seguido de un guion antes descrita (por ejemplo, la compilación de `foo.c` y `bar.c` anterior, pero sin `-c`). Si no se indica ni `-dumpdir` ni `-dumpbase`, se añade en su lugar al *dumppfx* predeterminado el nombre base de salida del enlazador, menos *auxdropsuf* si se especificó o, en caso contrario, el sufijo del ejecutable, seguido de un guion. Sin embargo, observe que, a diferencia de casos anteriores de enlace:

~~~sh
gcc foo.c bar.c -dumpdir dir/pfx- -o main ...
~~~

no añade el nombre de salida `main` a *dumppfx*, porque se especifica explícitamente `-dumpdir`. El objetivo es que el *dumppfx* especificado explícitamente pueda contener, si se desea, el nombre de salida especificado como parte del prefijo; solo se combinaría con él un *dumpbase* especificado explícitamente, para evitar descartar sin más una opción significativa.

Al compilar y después enlazar a partir de un solo archivo de entrada, el nombre base de salida del enlazador solo se añadirá al *dumppfx* predeterminado de la forma anterior si no comparte el nombre base con el único nombre de archivo de entrada. Esto se ha tratado en los casos de enlace con una sola entrada anteriores, pero no con un `-dumpdir` explícito que impida la combinación, aunque lo sustituya `-save-temps=*`:

~~~sh
gcc foo.c -dumpdir alt/pfx- -o dir/main.exe -save-temps=cwd ...
~~~

Las salidas auxiliares se denominan `foo.*` y las salidas de volcado `foo.c.*`, en el directorio de trabajo actual, tal como finalmente solicita `-save-temps=cwd`.

En resumen, para obtener un flujo de datos intuitivo aunque ligeramente impreciso: el nombre de salida primario se divide en una parte de directorio y una parte de nombre base; *dumppfx* se establece en la primera, salvo que lo sustituya `-dumpdir` o `-save-temps=*`, y *dumpbase* se establece en la segunda, salvo que lo sustituya `-dumpbase`. Si hay varias entradas o enlace, este *dumpbase* puede combinarse con *dumppfx* y tomarse de cada archivo de entrada. Los nombres de salida auxiliares de cada entrada se forman combinando *dumppfx*, *dumpbase* menos el sufijo, y el sufijo de salida auxiliar; los nombres de salida de volcado solo difieren en que se conserva el sufijo de *dumpbase*.

En cuanto a las salidas auxiliares y de volcado creadas durante la recompilación LTO, una combinación de *dumppfx* y *dumpbase*, según se hayan indicado o se deriven del nombre de salida del enlazador, pero no de las entradas, incluso en los casos en que de otro modo no se utilizaría esa combinación como tal, se transmite con un punto final en lugar del guion añadido por el compilador, si lo hay, como opción `-dumpdir` a `lto-wrapper`. Al intervenir en el enlace, este programa no recibe normalmente ninguna opción `-dumpbase` ni `-dumpbase-ext`, y las ignora.

Al ejecutar subcompiladores, `lto-wrapper` añade los nombres de las etapas LTO al *dumppfx* recibido, se asegura de que contiene un componente de directorio para que sustituya cualquier opción `-dumpdir` y lo transmite como `-dumpbase` a los subcompiladores.

### -v / --verbose

Imprime (en la salida de error estándar) las órdenes ejecutadas para realizar las etapas de compilación. También imprime el número de versión del programa controlador del compilador, del preprocesador y del compilador propiamente dicho.

### -###

Como `-v`, excepto que las órdenes no se ejecutan y los argumentos se entrecomillan salvo que solo contengan caracteres alfanuméricos o `./-_`. Esto resulta útil para que los scripts de shell capturen las líneas de órdenes generadas por el controlador.

### --help

Imprime (en la salida estándar) una descripción de las opciones de línea de órdenes que entiende `gcc`. Si se especifica también `-v`, se transmite `--help` a los distintos procesos invocados por `gcc`, para que puedan mostrar las opciones de línea de órdenes que aceptan. Si también se ha especificado `-Wextra` (antes de `--help`), se muestran asimismo las opciones de línea de órdenes que no tienen documentación asociada.

### --target-help

Imprime (en la salida estándar) una descripción de las opciones de línea de órdenes específicas del objetivo para cada herramienta. Para algunos objetivos puede imprimirse también información adicional específica del objetivo.

### --help={class|[^]qualifier}[,...]

Imprime (en la salida estándar) una descripción de las opciones de línea de órdenes que entiende el compilador y que se ajustan a todas las clases y calificadores especificados. Estas son las clases admitidas:

- `optimizers`: muestra todas las opciones de optimización admitidas por el compilador.
- `warnings`: muestra todas las opciones que controlan los mensajes de advertencia producidos por el compilador.
- `target`: muestra las opciones específicas del objetivo. Sin embargo, a diferencia de `--target-help`, no se muestran las opciones específicas del objetivo del enlazador ni del ensamblador. Esto se debe a que esas herramientas actualmente no admiten la sintaxis ampliada `--help=`.
- `params`: muestra los valores reconocidos por la opción `--param`.
- *language*: muestra las opciones admitidas para *language*, donde *language* es el nombre de uno de los lenguajes admitidos en esta versión de GCC. Si una opción está admitida por todos los lenguajes, debe seleccionarse la clase `common`.
- `common`: muestra las opciones comunes a todos los lenguajes.

Estos son los calificadores admitidos:

- `undocumented`: muestra únicamente las opciones que no están documentadas.
- `joined`: muestra las opciones que toman un argumento que aparece después de un signo igual en el mismo fragmento continuo de texto, como `--help=target`.
- `separate`: muestra las opciones que toman un argumento que aparece como una palabra separada después de la opción original, como `-o output-file`.

Así, por ejemplo, para mostrar todos los indicadores específicos del objetivo no documentados que admite el compilador, utilice:

~~~sh
--help=target,undocumented
~~~

El sentido de un calificador puede invertirse anteponiendo el carácter `^`; así, por ejemplo, para mostrar todas las opciones de advertencia binarias (es decir, las que están activadas o desactivadas y no toman argumento) que tienen descripción, utilice:

~~~sh
--help=warnings,^joined,^undocumented
~~~

El argumento de `--help=` no debe consistir únicamente en calificadores invertidos.

Es posible combinar varias clases, aunque normalmente esto restringe tanto la salida que no hay nada que mostrar. Un caso en que sí funciona, sin embargo, es cuando una de las clases es *target*. Por ejemplo, para mostrar todas las opciones de optimización específicas del objetivo, utilice:

~~~sh
--help=target,optimizers
~~~

La opción `--help=` puede repetirse en la línea de órdenes. Cada uso sucesivo muestra la clase de opciones solicitada, omitiendo las que ya se han mostrado. Si también se especifica `--help` en cualquier lugar de la línea de órdenes, esta prevalece sobre cualquier opción `--help=`.

Si la opción `-Q` aparece en la línea de órdenes antes de `--help=`, cambia el texto descriptivo que muestra `--help=`. En lugar de describir las opciones mostradas, se indica si la opción está habilitada, deshabilitada o establecida en un valor específico (suponiendo que el compilador lo sepa en el punto en que se utiliza `--help=`).

He aquí un ejemplo abreviado de la adaptación de `gcc` a ARM:

~~~text
  % gcc -Q -mabi=2 --help=target -c
  The following options are target specific:
  -mabi=                                2
  -mabort-on-noreturn                   [disabled]
  -mapcs                                [disabled]
~~~

La salida es sensible a los efectos de las opciones anteriores de la línea de órdenes; así, por ejemplo, es posible averiguar qué optimizaciones están habilitadas en `-O2` utilizando:

~~~sh
-Q -O2 --help=optimizers
~~~

Como alternativa, puede descubrir qué optimizaciones binarias habilita `-O3` utilizando:

~~~sh
gcc -c -Q -O3 --help=optimizers > /tmp/O3-opts
gcc -c -Q -O2 --help=optimizers > /tmp/O2-opts
diff /tmp/O2-opts /tmp/O3-opts | grep enabled
~~~

### --version

Muestra el número de versión y los avisos de copyright del GCC invocado.

### -pass-exit-codes / --pass-exit-codes

Normalmente el programa `gcc` termina con código 1 si alguna fase del compilador devuelve un código de retorno que indica que no se ha completado con éxito. Si especifica `-pass-exit-codes`, el programa `gcc` devuelve en su lugar el error numéricamente más alto producido por cualquiera de las fases que devuelva una indicación de error. Los frontales C, C++ y Fortran devuelven 4 si encuentran un error interno del compilador.

### -pipe / --pipe

Utiliza tuberías en lugar de archivos temporales para la comunicación entre las distintas etapas de compilación. Esto no funciona en algunos sistemas donde el ensamblador no puede leer de una tubería; sin embargo, el ensamblador GNU no tiene dificultades.

### -wrapper

Invoca todas las subórdenes bajo un programa envoltorio. El nombre del programa envoltorio y sus parámetros se transmiten como una lista separada por comas.

~~~sh
gcc -c t.c -wrapper gdb,--args
~~~

Esto invoca todos los subprogramas de `gcc` bajo `gdb --args`, de modo que la invocación de `cc1` es `gdb --args cc1 ...`.

### -ffile-prefix-map=old=new

Al compilar archivos que residen en el directorio *old*, registra cualquier referencia a ellos en el resultado de la compilación como si los archivos residieran en el directorio *new*. Especificar esta opción equivale a especificar todas las opciones individuales `-f*-prefix-map`. Puede utilizarse para realizar construcciones reproducibles independientes de su ubicación. Los directorios referenciados por directivas no se ven afectados por estas opciones. Véanse también `-fmacro-prefix-map`, `-fdebug-prefix-map`, `-fprofile-prefix-map` y `-fcanon-prefix-map`.

### -fcanon-prefix-map

Para las opciones `-f*-prefix-map`, normalmente la comparación del prefijo *old* con el nombre de archivo al que normalmente se haría referencia en el resultado de la compilación se realiza mediante comparación textual de los prefijos, o ignorando las mayúsculas y minúsculas en sistemas de archivos que no las distinguen y considerando iguales las barras y las barras inversas en los sistemas de archivos basados en DOS. `-fcanon-prefix-map` hace que tales comparaciones se realicen sobre las rutas canonizadas de *old* y del nombre de archivo referenciado.

### -fplugin=name.so

Carga el código del complemento contenido en el archivo *name.so*, que se supone que es un objeto compartido que el compilador cargará mediante `dlopen`. El nombre base del archivo de objeto compartido se utiliza para identificar el complemento a efectos del análisis de argumentos (véase `-fplugin-arg-name-key=value` más adelante). Cada complemento debe definir las funciones de devolución de llamada especificadas en la API de complementos.

### -fplugin-arg-name-key=value

Define un argumento llamado *key* con valor *value* para el complemento llamado *name*.

### -fdump-ada-spec[-slim]

Para archivos fuente y de inclusión C y C++, genera las especificaciones Ada correspondientes. Véase «Generating Ada Bindings for C and C++ headers» en la [Guía del usuario de GNAT](https://gcc.gnu.org/onlinedocs/gnat_ugn/), que proporciona documentación detallada sobre esta característica.

### -fada-spec-parent=unit

Junto con la opción `-fdump-ada-spec[-slim]` anterior, genera especificaciones Ada como unidades hijas de la unidad padre *unit*.

### -fdump-go-spec=file

Para archivos de entrada en cualquier lenguaje, genera las declaraciones Go correspondientes en *file*. Esto genera declaraciones Go `const`, `type`, `var` y `func`, que pueden ser una manera útil de empezar a escribir una interfaz Go para código escrito en otro lenguaje.

### @file

Lee las opciones de línea de órdenes de *file*. Las opciones leídas se insertan en lugar de la opción original `@file`. Si *file* no existe o no puede leerse, la opción se tratará literalmente y no se eliminará.

Las opciones de *file* se separan por espacios en blanco. Puede incluirse un carácter de espacio en blanco en una opción rodeando toda la opción con comillas simples o dobles. Puede incluirse cualquier carácter (incluida una barra inversa) anteponiéndole una barra inversa. El propio *file* puede contener opciones `@file` adicionales; estas se procesarán de forma recursiva.

---

[Anterior: 3.1](03-01-resumen-opciones.md) · [Introducción del capítulo](03-introduccion.md) · [Índice](README.md) · [Siguiente: 3.3](03-03-compilar-cpp.md)
