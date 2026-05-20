# 2. Estándares de lenguaje soportados por GCC

Para cada lenguaje compilado por GCC que tiene un estándar, GCC intenta seguir una o más versiones de ese estándar, posiblemente con excepciones y posiblemente con extensiones.

## 2.1 Lenguaje C

El estándar ANSI C original fue ratificado en 1989 y publicado en 1990. Posteriormente fue ratificado como estándar ISO, **ISO/IEC 9899:1990**. Esta versión se conoce habitualmente como **C89** o **C90**.

Para seleccionar este estándar en GCC pueden usarse opciones como:

```sh
-ansi
-std=c90
-std=iso9899:1990
```

Para obtener todos los diagnósticos requeridos por el estándar, conviene añadir:

```sh
-pedantic
```

o, si se desea que esos diagnósticos sean errores en lugar de advertencias:

```sh
-pedantic-errors
```

### C94/C95, C99, C11, C17 y C23

GCC documenta varias generaciones del lenguaje C:

| Estándar | Identificación | Selección típica en GCC |
| --- | --- | --- |
| C90 | ISO/IEC 9899:1990 | `-std=c90` |
| C94/C95 | enmienda AMD1 al estándar de 1990 | `-std=iso9899:199409` |
| C99 | ISO/IEC 9899:1999 | `-std=c99` |
| C11 | ISO/IEC 9899:2011 | `-std=c11` |
| C17 | ISO/IEC 9899:2018 / correcciones integradas | `-std=c17` |
| C23 | ISO/IEC 9899:2024 | `-std=c23` o `-std=iso9899:2024` |
| C2Y | versión posterior en desarrollo | `-std=c2y` |

C23 fue publicado como **ISO/IEC 9899:2024**. Durante su desarrollo, sus borradores fueron conocidos como **C2X**. En GCC, el soporte se activa con:

```sh
-std=c23
```

o:

```sh
-std=iso9899:2024
```

### Modos GNU extendidos

Por defecto, GCC proporciona algunas extensiones al lenguaje C que en raras ocasiones pueden entrar en conflicto con el estándar seleccionado.

Además de los modos estrictos, GCC permite seleccionar modos extendidos:

```sh
-std=gnu90
-std=gnu99
-std=gnu11
-std=gnu17
-std=gnu23
```

La diferencia conceptual es:

| Modo | Sentido técnico |
| --- | --- |
| `-std=c23` | C23 con intención de ajustarse al estándar ISO. |
| `-std=gnu23` | C23 más extensiones GNU. |
| `-pedantic` | Solicita diagnósticos donde el estándar lo requiere. |

Si no se proporciona ninguna opción de dialecto para C, el valor predeterminado indicado por el manual es:

```sh
-std=gnu23
```

## Implementaciones hosted y freestanding

El estándar ISO C distingue dos clases de implementación conforme:

| Clase | Descripción |
| --- | --- |
| **Hosted implementation** | Implementación alojada. Proporciona el estándar completo, incluyendo las bibliotecas requeridas. Es el caso normal de programas de usuario que se ejecutan sobre un sistema operativo. |
| **Freestanding implementation** | Implementación autónoma. Solo debe proporcionar un subconjunto de facilidades. Es importante para kernels, firmware, bootloaders y entornos sin sistema operativo completo. |

También distingue dos entornos de programa:

| Entorno | Descripción |
| --- | --- |
| **Hosted environment** | Entorno alojado. El programa arranca normalmente mediante `int main(void)` o `int main(int, char *[])` y dispone de las bibliotecas del entorno. |
| **Freestanding environment** | Entorno autónomo. El arranque y la terminación del programa quedan definidos por la implementación. Un kernel de sistema operativo es un ejemplo típico. |

Por defecto, GCC actúa como compilador para una implementación alojada y define:

```c
__STDC_HOSTED__ == 1
```

Para hacerlo actuar como compilador de un entorno freestanding se usa:

```sh
-ffreestanding
```

En ese caso, GCC define:

```c
__STDC_HOSTED__ == 0
```

Además, deja de asumir que los nombres de funciones de la biblioteca estándar tienen necesariamente la semántica definida por el estándar, salvo excepciones documentadas.

### Importancia para kernels y sistemas mínimos

Para construir un kernel, no basta con pasar `-ffreestanding`. Aun así pueden hacer falta arreglos propios para:

- enlazado;
- código de arranque;
- script de linker;
- objetos iniciales;
- ABI;
- memoria inicial;
- rutinas de soporte como `memcpy`, `memmove`, `memset` y `memcmp`.

El manual señala que muchas rutinas de soporte usadas por GCC están en `libgcc`, pero hay excepciones. GCC requiere que el entorno freestanding proporcione ciertas funciones como:

```c
memcpy
memmove
memset
memcmp
```

También señala que si se usa `__builtin_trap` y el destino no implementa el patrón de trampa, GCC puede emitir una llamada a:

```c
abort
```

## 2.2 Lenguaje C++

GCC soporta el estándar ISO C++ original de 1998 y revisiones posteriores como C++11, C++14, C++17 y, en gran medida, C++20 y C++23.

Ejemplos de selección de estándar:

```sh
g++ -std=c++17 archivo.cpp -o programa
g++ -std=c++20 archivo.cpp -o programa
g++ -std=c++23 archivo.cpp -o programa
```

De forma análoga a C, también existen modos GNU extendidos:

```sh
-std=gnu++17
-std=gnu++20
-std=gnu++23
```

Si no se proporciona ninguna opción de dialecto para C++, el valor predeterminado indicado por el manual es:

```sh
-std=gnu++20
```

Para obtener todos los diagnósticos requeridos por las versiones estándar, se recomienda añadir:

```sh
-pedantic
```

o:

```sh
-pedantic-errors
```

## 2.3 Objective-C y Objective-C++

GCC soporta Objective-C tradicional, también conocido como **Objective-C 1.0**, e incluye soporte para sintaxis de excepciones y sincronización. También soporta varias extensiones de Objective-C 2.0, como propiedades, enumeración rápida, atributos de método y palabras clave como `@optional` y `@required` en protocolos.

GCC usa por defecto la biblioteca de runtime GNU Objective-C, que forma parte de GCC y no es igual que la biblioteca de runtime Objective-C Apple/NeXT usada en sistemas Apple.

Para alternar entre estos modelos pueden usarse opciones como:

```sh
-fgnu-runtime
-fnext-runtime
```

La sintaxis de excepciones y sincronización de Objective-C incluye palabras clave como:

```objc
@try
@throw
@catch
@finally
@synchronized
```

Y se habilita con:

```sh
-fobjc-exceptions
```

## 2.4 COBOL

Desde GCC 15, GCC soporta el estándar ISO COBOL **ISO/IEC 1989:2023**. Incluye soporte de compatibilidad con otros compiladores COBOL mediante la opción:

```sh
-dialect
```

## 2.5 Go

Desde GCC 4.7.1, GCC soporta el estándar Go 1.

## 2.6 Lenguaje D

GCC soporta el lenguaje de programación D 2.0. El propio lenguaje D está definido por su implementación de referencia y su especificación.

## 2.7 Modula-2

GCC soporta Modula-2 y es compatible con dialectos PIM2, PIM3, PIM4 e ISO. También incluye bibliotecas ISO libres y bibliotecas compatibles con PIM y Logitech.

## 2.8 Referencias para otros lenguajes

Para Ada y Fortran, el manual remite a documentación específica de GNAT y GNU Fortran.

[Anterior](01-lenguajes-soportados.md) | [Índice](README.md) | [Siguiente](03-opciones-linea-ordenes-intro.md)
