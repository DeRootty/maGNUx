# 3.2 Selección explícita de lenguaje con `-x`

GCC normalmente infiere el lenguaje de entrada por el sufijo del archivo, pero puede forzarse con la opción `-x`.

Formas equivalentes:

```sh
-x language
--language=language
--language language
```

La opción se aplica a los archivos siguientes hasta que aparezca otro `-x`.

## Uso básico

Forzar C sobre un archivo sin sufijo:

```sh
gcc -x c programa -std=c23 -c -o programa.o
```

Forzar ensamblador con preprocesador:

```sh
gcc -x assembler-with-cpp start.S -c -o start.o
```

Forzar C++:

```sh
gcc -x c++ archivo.txt -c -o archivo.o
```

## Cancelar selección explícita

Para volver al comportamiento basado en sufijos se usa:

```sh
-x none
```

Ejemplo:

```sh
gcc -x c fuente_sin_sufijo -x none util.c -c
```

Lectura:

```text
fuente_sin_sufijo → tratado como C
util.c            → tratado según su sufijo .c
```

## Lenguajes comunes aceptados

Ejemplos de lenguajes que pueden usarse con `-x`:

```text
c
c-header
cpp-output
c++
c++-header
c++-cpp-output
objective-c
objective-c-header
objective-c-cpp-output
objective-c++
assembler
assembler-with-cpp
```

El conjunto exacto puede depender de la configuración de GCC y de los front ends instalados.

## Casos de uso

### Archivos sin sufijo

Algunos sistemas generan archivos temporales sin extensión. `-x` evita que GCC no sepa cómo tratarlos.

```sh
gcc -x c /tmp/generated -c -o generated.o
```

### Ensamblador con macros C

Aunque `.S` suele activar preprocesador automáticamente, `-x assembler-with-cpp` permite hacerlo explícito:

```sh
gcc -x assembler-with-cpp bootcode -c -o bootcode.o
```

### Entrada estándar

Cuando se compila desde entrada estándar, no hay sufijo de archivo. Entonces `-x` es imprescindible.

```sh
echo 'int main(void){return 0;}' | gcc -x c - -o main
```

El guion `-` representa entrada estándar.

## Relación con `gcc` y `g++`

Aunque `-x c++` puede hacer que `gcc` compile código C++, para el enlazado de programas C++ suele preferirse `g++`, porque añade automáticamente bibliotecas y reglas de enlace C++.

Ejemplo que puede fallar al enlazar si hay uso de biblioteca estándar C++:

```sh
gcc -x c++ main.txt -o main
```

Preferible:

```sh
g++ -x c++ main.txt -o main
```

## Riesgos

Usar `-x` incorrectamente puede hacer que GCC interprete el archivo como un lenguaje equivocado.

Ejemplo:

```sh
gcc -x c++ archivo.c -c
```

Aunque el archivo se llame `.c`, será tratado como C++.

Eso puede cambiar reglas de tipos, nombres, enlazado, palabras clave y diagnóstico.

## Lectura técnica

`-x` separa la identidad del archivo de su nombre.

```text
sin -x
→ el sufijo orienta a GCC

con -x
→ la línea de órdenes manda sobre el sufijo
```

Esto es útil en sistemas de construcción avanzados, pero debe usarse con claridad para evitar confusiones.

[Anterior](15-fases-y-sufijos.md) | [Índice](README.md) | [Siguiente](17-detener-cadena-c-s-e.md)
