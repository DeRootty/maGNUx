# 3.2 Opciones que controlan el tipo de salida - fases y sufijos

La sección **3.2 Options Controlling the Kind of Output** explica cómo GCC decide qué fases ejecutar y qué clase de archivo producir.

La compilación puede implicar hasta cuatro fases, siempre en este orden:

1. **Preprocesamiento**: expansión de macros, resolución de `#include`, evaluación de directivas condicionales.
2. **Compilación propiamente dicha**: traducción del lenguaje fuente a ensamblador.
3. **Ensamblado**: traducción del ensamblador a código objeto.
4. **Enlazado**: combinación de objetos, bibliotecas y código de arranque para producir el resultado final.

## Sufijos de archivo

GCC usa el sufijo del archivo para decidir qué lenguaje o fase corresponde.

Ejemplos comunes:

| Sufijo | Interpretación habitual |
| --- | --- |
| `.c` | Fuente C que debe preprocesarse. |
| `.i` | C ya preprocesado. |
| `.cc`, `.cpp`, `.cxx`, `.C` | Fuente C++. |
| `.ii` | C++ ya preprocesado. |
| `.m` | Objective-C. |
| `.mi` | Objective-C ya preprocesado. |
| `.mm`, `.M` | Objective-C++. |
| `.s` | Ensamblador. |
| `.S` | Ensamblador que debe pasar por el preprocesador. |
| `.o` | Archivo objeto. |
| `.a` | Biblioteca estática. |
| `.so` | Biblioteca compartida en sistemas ELF. |

Ejemplo:

```sh
gcc main.c -o main
```

GCC reconoce `main.c` como C y ejecuta todas las fases necesarias hasta producir el ejecutable.

## Archivos ya preprocesados

Si el archivo termina en `.i`, GCC entiende que ya fue preprocesado:

```sh
gcc -c main.i -o main.o
```

Esto evita volver a expandir macros o resolver includes.

En C++:

```sh
g++ -c main.ii -o main.o
```

## Ensamblador preprocesado

Un archivo `.s` se trata como ensamblador puro:

```sh
gcc -c start.s -o start.o
```

Un archivo `.S` se preprocesa antes de ensamblarse:

```sh
gcc -c start.S -o start.o
```

Esto es muy común en kernels, bootloaders y código de bajo nivel, donde se usan macros o condicionales del preprocesador dentro de ensamblador.

Ejemplo conceptual:

```asm
#ifdef CONFIG_X86_64
    /* ensamblador para x86_64 */
#endif
```

## Archivos objeto y bibliotecas

Si GCC recibe un `.o`, normalmente lo pasa al enlazador:

```sh
gcc main.o util.o -o programa
```

Si recibe bibliotecas:

```sh
gcc main.o -Llib -lfoo -o programa
```

participan en la fase de enlace.

## El driver decide fases

Una misma invocación puede mezclar archivos de distinto tipo:

```sh
gcc main.c util.o start.S -o programa
```

Lectura:

```text
main.c  → preprocesar, compilar, ensamblar
util.o  → ya es objeto, pasar al enlazador
start.S → preprocesar, ensamblar
todo    → enlazar
```

## Relación con opciones -c, -S y -E

Aunque el sufijo indica qué hacer con cada entrada, las opciones generales pueden detener la cadena.

```sh
-E
```

solo preprocesa.

```sh
-S
```

produce ensamblador.

```sh
-c
```

produce objeto, sin enlazar.

Ejemplo:

```sh
gcc -S main.c -o main.s
```

produce ensamblador aunque normalmente `main.c` podría llegar hasta ejecutable.

## Sufijos desconocidos

Si GCC recibe un archivo con sufijo no reconocido, puede tratarlo como archivo para enlazar o ignorarlo según contexto. Para evitar ambigüedades se puede usar `-x`, que se explica en la siguiente unidad.

## Lectura técnica

La clave de esta sección es que GCC no necesita que el usuario diga siempre el lenguaje. Normalmente lo infiere por sufijo.

Pero esa inferencia debe entenderse como una convención del driver, no como una propiedad mágica del archivo.

```text
sufijo
→ lenguaje o fase esperada
→ fases ejecutadas por GCC
→ tipo de salida
```

En sistemas complejos, conocer esta lógica evita errores como:

- compilar ensamblador `.S` como si fuera `.s`;
- pasar C++ a `gcc` en lugar de `g++` durante enlace;
- enlazar accidentalmente cuando solo se quería objeto;
- no entender por qué un `.i` no procesa macros.

[Anterior](14-desarrollador-y-objetivos.md) | [Índice](README.md) | [Siguiente](16-seleccion-lenguaje-x.md)
