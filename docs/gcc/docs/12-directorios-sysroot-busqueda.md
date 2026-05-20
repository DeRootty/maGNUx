# 3.1 Resumen de opciones - directorios, sysroot y búsqueda de recursos

La sección 3.1 también agrupa opciones para controlar dónde busca GCC cabeceras, bibliotecas, herramientas auxiliares y recursos internos.

Estas opciones son críticas para:

- compilación cruzada;
- SDKs;
- toolchains aisladas;
- construcción de sistemas completos;
- entornos chroot;
- sysroots;
- kernels y sistemas freestanding;
- distribuciones GNU/Linux.

## Directorios de cabeceras

Opciones representativas:

```sh
-I dir
-iquote dir
-isystem dir
-idirafter dir
-nostdinc
-nostdinc++
```

| Opción | Sentido práctico |
| --- | --- |
| `-I dir` | Añade un directorio de búsqueda de cabeceras. |
| `-iquote dir` | Añade directorio para inclusiones con comillas. |
| `-isystem dir` | Añade directorio tratado como cabeceras de sistema. |
| `-idirafter dir` | Añade directorio buscado después de los directorios estándar. |
| `-nostdinc` | No busca cabeceras en los directorios estándar. |
| `-nostdinc++` | No busca cabeceras estándar de C++. |

Ejemplo:

```sh
gcc -Iinclude -c src/main.c -o build/main.o
```

## Orden de búsqueda de cabeceras

Una inclusión como:

```c
#include "config.h"
```

no se resuelve igual que:

```c
#include <stdio.h>
```

La primera forma suele buscar primero en el entorno del archivo fuente y rutas de comillas. La segunda busca en rutas de sistema y rutas indicadas según la política de GCC.

`-iquote` permite controlar específicamente rutas para `#include "..."`.

## Cabeceras de sistema

Con:

```sh
-isystem /ruta/include
```

GCC trata esa ruta como cabecera de sistema. Esto puede afectar a diagnósticos: advertencias dentro de cabeceras de sistema pueden ser suprimidas o tratadas de forma distinta.

Esto es útil cuando se compila contra bibliotecas externas que no se desea auditar con el mismo nivel de advertencias que el código propio.

## Sysroot

Opciones representativas:

```sh
--sysroot=dir
-isysroot dir
```

Un **sysroot** es un directorio que actúa como raíz alternativa para buscar cabeceras y bibliotecas del sistema objetivo.

Ejemplo:

```sh
aarch64-linux-gnu-gcc --sysroot=/opt/sysroots/aarch64 main.c -o main
```

Lectura:

```text
compilador en el host
→ genera código para aarch64
→ busca cabeceras y bibliotecas dentro del sysroot objetivo
```

## Compilación cruzada

En compilación cruzada es habitual que el compilador tenga un prefijo:

```sh
aarch64-linux-gnu-gcc
riscv64-linux-gnu-gcc
x86_64-w64-mingw32-gcc
```

El prefijo suele codificar una tupla de destino:

```text
arquitectura-vendor-sistema-abi
```

o variantes prácticas similares.

El sysroot complementa al compilador cruzado proporcionando el entorno de cabeceras y bibliotecas del destino.

## Directorios de bibliotecas

Durante el enlazado, GCC puede recibir rutas de bibliotecas:

```sh
-L dir
-l foo
```

Ejemplo:

```sh
gcc main.o -L/opt/milib/lib -lfoo -o programa
```

Esto añade `/opt/milib/lib` a la búsqueda y enlaza con `libfoo`.

## Buscar herramientas auxiliares

GCC usa programas auxiliares como:

```text
cc1
cc1plus
as
ld
collect2
```

En entornos especiales puede ser necesario controlar rutas internas mediante opciones de GCC, variables de entorno o configuración de la toolchain.

Opciones relacionadas pueden incluir:

```sh
-B prefix
```

`-B` permite indicar prefijos para buscar ejecutables, bibliotecas y archivos especiales relacionados con la toolchain.

## `-B` y toolchains alternativas

Ejemplo conceptual:

```sh
gcc -B/opt/toolchain/bin/ main.c -o main
```

Esto puede hacer que GCC busque ciertas herramientas auxiliares en `/opt/toolchain/bin/`.

Es una opción poderosa, pero debe usarse con cuidado, porque puede cambiar componentes críticos de la cadena de construcción.

## Entornos sin cabeceras estándar

Para un kernel o runtime mínimo:

```sh
gcc -ffreestanding -nostdinc -Iinclude -c kernel.c -o kernel.o
```

`-nostdinc` evita que el compilador use las cabeceras estándar del sistema host.

Esto es importante cuando el objetivo no es un programa de usuario normal sino un entorno autónomo.

## Riesgo técnico

Las rutas de búsqueda son una fuente común de errores sutiles:

- se incluye una cabecera del host en lugar de la del destino;
- se enlaza contra una biblioteca equivocada;
- se mezcla una libc incompatible;
- se usa un ensamblador o enlazador distinto del esperado;
- el orden de `-I` o `-L` cambia el resultado.

Por eso, en builds reproducibles conviene registrar explícitamente:

```text
compilador usado
sysroot
rutas -I
rutas -L
prefijos -B
variables de entorno relevantes
```

## Perfil práctico

Programa normal con cabeceras locales:

```sh
gcc -Iinclude src/main.c -o programa
```

Compilación cruzada con sysroot:

```sh
aarch64-linux-gnu-gcc --sysroot=/opt/sysroots/aarch64 src/main.c -o main
```

Kernel o runtime mínimo:

```sh
gcc -ffreestanding -nostdinc -Iinclude -c kernel.c -o kernel.o
```

[Anterior](11-ensamblador-y-enlazador.md) | [Índice](README.md) | [Siguiente](13-convenciones-generacion-codigo.md)
