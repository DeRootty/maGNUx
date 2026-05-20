# 3.2 Opciones que controlan el tipo de salida - fases y sufijos

La sección **3.2 Options Controlling the Kind of Output** explica cómo GCC decide qué fases ejecutar y qué clase de archivo producir.

La compilación puede implicar hasta cuatro fases, siempre en este orden:

1. **Preprocesamiento**: expansión de macros, resolución de `#include`, evaluación de directivas condicionales.
2. **Compilación propiamente dicha**: traducción del lenguaje fuente a ensamblador.
3. **Ensamblado**: traducción de ensamblador a objeto.
4. **Enlazado**: combinación de objetos y bibliotecas para formar un ejecutable o biblioteca.

GCC puede detenerse en distintas fases según las opciones usadas.

## Sufijos de archivo

GCC decide qué hacer con cada archivo de entrada según su sufijo, salvo que se fuerce el lenguaje con `-x`.

Ejemplos habituales:

| Sufijo | Interpretación típica |
| --- | --- |
| `.c` | Código C que debe preprocesarse. |
| `.i` | Código C ya preprocesado. |
| `.cc`, `.cpp`, `.cxx`, `.C` | Código C++. |
| `.ii` | Código C++ ya preprocesado. |
| `.m` | Objective-C. |
| `.mi` | Objective-C ya preprocesado. |
| `.mm`, `.M` | Objective-C++. |
| `.s` | Ensamblador. |
| `.S` | Ensamblador que debe pasar por el preprocesador. |
| `.o` | Archivo objeto. |
| `.a` | Biblioteca estática. |
| `.so` | Biblioteca compartida, en sistemas ELF. |

## Archivos C

```sh
gcc -c main.c -o main.o
```

`main.c` se trata como C. Si no se detiene antes, GCC puede preprocesar, compilar y ensamblar.

Para ver el preprocesado:

```sh
gcc -E main.c -o main.i
```

Para compilar un archivo ya preprocesado:

```sh
gcc -c main.i -o main.o
```

## Archivos C++

```sh
g++ -c main.cpp -o main.o
```

`main.cpp` se trata como C++.

También puede usarse `gcc`, pero para enlazar programas C++ completos normalmente debe usarse `g++`, porque añade automáticamente las bibliotecas C++ necesarias.

## Ensamblador `.s` y `.S`

```sh
gcc -c archivo.s -o archivo.o
```

Un archivo `.s` se pasa al ensamblador directamente.

```sh
gcc -c archivo.S -o archivo.o
```

Un archivo `.S` pasa primero por el preprocesador. Esto permite usar macros C, `#include`, `#ifdef`, etc. dentro de ensamblador.

Ejemplo:

```asm
#ifdef CONFIG_X86_64
    /* código específico */
#endif
```

## Archivos objeto

Si se pasan archivos `.o`, GCC puede usarlos durante el enlazado:

```sh
gcc main.o util.o -o programa
```

En ese caso no se compilan de nuevo; se entregan al enlazador.

## Bibliotecas

```sh
gcc main.o libfoo.a -o programa
```

O usando `-l`:

```sh
gcc main.o -L. -lfoo -o programa
```

## Forzar el lenguaje

Aunque los sufijos son importantes, se puede forzar el lenguaje con `-x`.

Ejemplo:

```sh
gcc -x c archivo.sin_extension -c -o archivo.o
```

Esto se estudia con más detalle en la siguiente unidad.

## Detener la cadena

Opciones principales:

```sh
-E
-S
-c
```

| Opción | Fase final |
| --- | --- |
| `-E` | Detiene tras preprocesamiento. |
| `-S` | Detiene tras compilación a ensamblador. |
| `-c` | Detiene tras ensamblado a objeto. |
| sin estas opciones | Intenta enlazar. |

Ejemplo:

```sh
gcc -E main.c -o main.i
gcc -S main.c -o main.s
gcc -c main.c -o main.o
gcc main.c -o main
```

## Entradas múltiples

GCC puede recibir varios archivos:

```sh
gcc main.c util.c -o programa
```

Esto compila cada fuente y luego enlaza.

También puede mezclar objetos y fuentes:

```sh
gcc main.c util.o -o programa
```

## Salidas por defecto

Si no se especifica `-o`, GCC usa nombres por defecto:

- salida ejecutable: normalmente `a.out`;
- salida objeto con `-c`: mismo nombre base con `.o`;
- salida ensamblador con `-S`: mismo nombre base con `.s`;
- salida preprocesada con `-E`: normalmente va a salida estándar si no se indica `-o`.

## Lectura técnica

La clave de esta sección es que GCC no "compila archivos" de una única forma. Clasifica entradas, decide fases, genera salidas intermedias o finales y puede recibir elementos ya procesados.

```text
.c  → preprocesar → compilar → ensamblar → enlazar
.i  → compilar → ensamblar → enlazar
.s  → ensamblar → enlazar
.o  → enlazar
```

Esta clasificación es esencial para entender builds grandes, Makefiles, toolchains cruzadas y sistemas freestanding.

[Anterior](14-desarrollador-y-objetivos.md) | [Índice](README.md) | [Siguiente](16-seleccion-lenguaje-x.md)
