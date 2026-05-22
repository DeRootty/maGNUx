# 3.3 Compilar programas C++

La sección **3.3 Compiling C++ Programs** explica una diferencia muy importante: puedes invocar GCC como `gcc` sobre archivos C++, pero para programas C++ normalmente debes usar `g++`.

## Sufijos habituales de C++

GCC reconoce como C++ sufijos como:

```text
.C
.cc
.cpp
.CPP
.c++
.cp
.cxx
```

Cabeceras habituales:

```text
.hh
.hpp
.H
.tcc
```

Archivos C++ ya preprocesados:

```text
.ii
```

Y unidades de interfaz de módulos C++20 pueden usar sufijos como:

```text
.ccm
.cppm
.cxxm
.c++m
```

según soporte y configuración.

## `gcc` frente a `g++`

Puedes compilar C++ con:

```sh
gcc -x c++ main.cpp -c -o main.o
```

Pero para enlazar programas C++ lo normal es:

```sh
g++ main.cpp -o main
```

`g++` enlaza automáticamente con las bibliotecas estándar de C++ necesarias y aplica convenciones adecuadas para programas C++.

## Problema típico con `gcc`

Este comando puede compilar, pero fallar al enlazar:

```sh
gcc main.cpp -o main
```

porque `gcc` puede no añadir automáticamente la biblioteca estándar C++.

La forma correcta suele ser:

```sh
g++ main.cpp -o main
```

O, si se usa `gcc`, añadir explícitamente la biblioteca correspondiente:

```sh
gcc main.cpp -lstdc++ -o main
```

Pero en uso normal, `g++` es la herramienta adecuada.

## Compilar sin enlazar

Para producir un objeto C++:

```sh
g++ -std=c++20 -Wall -Wextra -c main.cpp -o main.o
```

Luego se enlaza:

```sh
g++ main.o -o main
```

## Mezclar C y C++

Supongamos:

```text
main.cpp
util.c
```

Compilación separada:

```sh
g++ -std=c++20 -c main.cpp -o main.o
gcc -std=c23 -c util.c -o util.o
g++ main.o util.o -o programa
```

El enlace final se hace con `g++` si el programa final usa C++.

## `extern "C"`

Cuando C++ llama a funciones C, puede hacer falta declarar enlace C:

```cpp
extern "C" {
    int funcion_c(int);
}
```

Esto evita el *name mangling* de C++ para esos símbolos.

## Bibliotecas C++

Para crear una biblioteca compartida C++:

```sh
g++ -fPIC -shared lib.cpp -o libmilib.so
```

Para enlazar contra ella:

```sh
g++ main.cpp -L. -lmilib -o main
```

## Estándar C++

Seleccionar estándar:

```sh
g++ -std=c++20 main.cpp -o main
g++ -std=c++23 main.cpp -o main
```

Modo GNU extendido:

```sh
g++ -std=gnu++20 main.cpp -o main
```

## Advertencias recomendadas

```sh
g++ -std=c++20 -Wall -Wextra -Wpedantic main.cpp -o main
```

Para tratar advertencias como errores:

```sh
g++ -std=c++20 -Wall -Wextra -Wpedantic -Werror main.cpp -o main
```

## Lectura técnica

La diferencia entre `gcc` y `g++` no es que uno “compile C” y el otro “compile C++” de forma absoluta. La diferencia importante está en el papel del **driver**, especialmente durante el enlazado.

```text
gcc
→ driver general
→ no asume necesariamente programa C++ completo

g++
→ driver C++
→ aplica convenciones de compilación/enlace para C++
```

Para programas C++, usa `g++` salvo que tengas una razón técnica precisa para controlar manualmente el enlace.

[Anterior](19-verbose-help-wrapper-atfile.md) | [Índice](README.md) | [Siguiente](21-dialecto-c-ansi-std.md)
