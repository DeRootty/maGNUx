# 3.2. Opciones que controlan el tipo de salida

> [Índice del manual](README.md) · [Aula de integración](../README.md) · [Edición y licencia](00-edicion-y-licencia.md)

**Estado:** parcial; traducido desde el comienzo de la sección Overall Options hasta el final de la entrada -o, antes de -dumpbase. Traducción no oficial asistida por IA, pendiente de revisión humana.  
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

---

**Punto exacto de continuación editorial:** la siguiente entrada es `-dumpbase dumpbase`. El resto de §3.2 no se ha traducido todavía. Consulte [Overall Options, original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Overall-Options.html) para el texto restante.

[Introducción del capítulo](03-introduccion.md) · [Índice](README.md) · [3.3](03-03-compilar-cpp.md)
