# Sección 3.1 - Resumen de opciones, primera parte

La sección **Option Summary** del manual de GCC enumera grupos de opciones por categorías. Esta parte del manual es extensa porque GCC no es solo un compilador de C: actúa como un *driver* capaz de coordinar compilación, ensamblado, enlazado, diagnóstico, optimización, análisis estático, instrumentación, generación de código y selección de objetivo.

Este capítulo resume las primeras familias de opciones desde una perspectiva práctica.

## Opciones globales

Las opciones globales afectan al comportamiento general de GCC, sin estar necesariamente asociadas a una única fase. Algunas de las más visibles son:

```sh
-c
-S
-E
-o archivo
-v
-###
--help
--target-help
--version
```

| Opción | Sentido |
| --- | --- |
| `-c` | Compila y ensambla, pero no enlaza. Produce archivo objeto. |
| `-S` | Compila hasta ensamblador. Produce archivo `.s`. |
| `-E` | Solo ejecuta el preprocesador. |
| `-o archivo` | Indica el nombre de salida. |
| `-v` | Muestra información detallada de las fases ejecutadas. |
| `-###` | Muestra las órdenes que se ejecutarían, sin ejecutarlas realmente. |
| `--help` | Muestra ayuda de opciones. |
| `--target-help` | Muestra ayuda específica del objetivo. |
| `--version` | Muestra la versión. |

Ejemplo:

```sh
gcc -c main.c -o main.o
```

Lectura: compila `main.c` hasta objeto, sin crear ejecutable final.

## Opciones de lenguaje

Las opciones de lenguaje controlan el dialecto o estándar usado para interpretar el código fuente.

Ejemplos:

```sh
-std=c23
-std=gnu23
-std=c++20
-std=gnu++20
-ansi
-funsigned-char
-fsigned-char
-ffreestanding
-fhosted
```

| Opción | Sentido |
| --- | --- |
| `-std=c23` | Usa el estándar ISO C23. |
| `-std=gnu23` | Usa C23 más extensiones GNU. |
| `-ansi` | En C equivale a un modo ISO tradicional, desactivando ciertas extensiones GNU incompatibles. |
| `-ffreestanding` | Compila para entorno autónomo, como kernel o firmware. |
| `-fhosted` | Compila para entorno alojado, típico de programas de usuario. |
| `-funsigned-char` | Hace que `char` sea no signado por defecto. |
| `-fsigned-char` | Hace que `char` sea signado por defecto. |

Ejemplo para C23:

```sh
gcc -std=c23 -Wall -Wextra main.c -o main
```

Ejemplo para código de sistema freestanding:

```sh
gcc -std=c23 -ffreestanding -c kernel.c -o kernel.o
```

## Advertencias

Las opciones de advertencia empiezan habitualmente por `-W`.

Ejemplos comunes:

```sh
-Wall
-Wextra
-Wpedantic
-Werror
-Wformat
-Wshadow
-Wconversion
-Wunused
```

| Opción | Sentido |
| --- | --- |
| `-Wall` | Activa un conjunto amplio de advertencias comunes. |
| `-Wextra` | Activa advertencias adicionales. |
| `-Wpedantic` | Advierte por usos no admitidos por el estándar seleccionado. |
| `-Werror` | Convierte advertencias en errores. |
| `-Wformat` | Comprueba formatos tipo `printf`/`scanf`. |
| `-Wunused` | Advierte por entidades no usadas. |

Ejemplo:

```sh
gcc -std=c23 -Wall -Wextra -Wpedantic main.c -o main
```

Para tratar advertencias como errores:

```sh
gcc -std=c23 -Wall -Wextra -Werror main.c -o main
```

## Opciones de depuración

Las opciones de depuración generan información adicional para depuradores como GDB.

```sh
-g
-ggdb
-g3
-g0
```

| Opción | Sentido |
| --- | --- |
| `-g` | Genera información de depuración. |
| `-ggdb` | Genera información especialmente útil para GDB. |
| `-g3` | Incluye información adicional, como macros. |
| `-g0` | No genera información de depuración. |

Ejemplo:

```sh
gcc -g -O0 main.c -o main
```

La combinación `-g -O0` es típica durante depuración inicial porque evita muchas transformaciones que dificultan seguir el código.

## Opciones de optimización

Las opciones de optimización modifican cómo GCC transforma el programa para mejorar rendimiento, tamaño o características concretas.

```sh
-O0
-O1
-O2
-O3
-Os
-Og
-Ofast
```

| Opción | Sentido |
| --- | --- |
| `-O0` | Sin optimización. Valor típico para depurar. |
| `-O1` | Optimización básica. |
| `-O2` | Optimización fuerte, generalmente segura para producción. |
| `-O3` | Optimización más agresiva. |
| `-Os` | Optimiza tamaño. |
| `-Og` | Optimiza manteniendo buena experiencia de depuración. |
| `-Ofast` | Activa optimizaciones agresivas que pueden relajar cumplimiento estricto de estándares. |

Ejemplo:

```sh
gcc -O2 main.c -o main
```

## Opciones de preprocesador

El preprocesador gestiona macros, inclusión de cabeceras y condicionales de compilación.

```sh
-DNOMBRE
-DNOMBRE=valor
-UNOMBRE
-I directorio
-include archivo
-M
-MM
-MD
-MMD
```

| Opción | Sentido |
| --- | --- |
| `-D` | Define una macro. |
| `-U` | Elimina una definición de macro. |
| `-I` | Añade un directorio de búsqueda de cabeceras. |
| `-include` | Incluye un archivo antes del fuente principal. |
| `-M`, `-MM` | Generan dependencias para `make`. |
| `-MD`, `-MMD` | Generan dependencias como efecto lateral de la compilación. |

Ejemplo:

```sh
gcc -DDEBUG=1 -Iinclude -c main.c -o main.o
```

## Opciones de enlazado

Aunque GCC no es directamente el enlazador, puede invocarlo y pasarle opciones.

```sh
-lbiblioteca
-Ldirectorio
-static
-shared
-pthread
-Wl,opcion
```

| Opción | Sentido |
| --- | --- |
| `-lfoo` | Enlaza con `libfoo`. |
| `-Ldir` | Añade un directorio de búsqueda de bibliotecas. |
| `-static` | Intenta enlazado estático. |
| `-shared` | Produce biblioteca compartida. |
| `-pthread` | Configura compilación y enlazado para POSIX threads. |
| `-Wl,` | Pasa opciones directamente al enlazador. |

Ejemplo:

```sh
gcc main.o -L/usr/local/lib -lfoo -o programa
```

## Lectura sistémica

La clave de esta sección es entender que GCC no debe verse como un único paso. Sus opciones seleccionan rutas dentro de una cadena de construcción.

```text
fuente → preprocesador → compilador → ensamblador → enlazador → ejecutable
```

Cada grupo de opciones actúa sobre una o varias fases.

[Anterior](03-opciones-linea-ordenes-intro.md) | [Índice](README.md) | [Siguiente](05-guia-practica-c23-gcc.md)
