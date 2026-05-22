# 3.2 Verbosidad, ayuda, wrappers y argumentos desde archivo

La parte final de esta unidad de la sección 3.2 reúne opciones que no cambian directamente el lenguaje, sino la forma de invocar, inspeccionar o transportar la cadena de herramientas.

## `-v` / `--verbose`

```sh
gcc -v main.c -o main
```

Imprime en la salida de error estándar los comandos que GCC ejecuta internamente para las distintas fases. También muestra información de versión del driver, del preprocesador y del compilador propiamente dicho.

Uso típico:

```sh
gcc -v -std=c23 main.c -o main
```

Sirve para ver:

- rutas de búsqueda;
- programas invocados;
- opciones implícitas;
- configuración de la toolchain;
- objetivo de compilación.

## `-###`

```sh
gcc -### main.c -o main
```

Es parecido a `-v`, pero no ejecuta realmente los comandos. Los muestra con el quoting apropiado para que puedan ser inspeccionados o capturados por scripts.

Es útil cuando quieres saber qué haría GCC sin producir archivos.

## `--help`, `--target-help` y clases de ayuda

Opciones habituales:

```sh
--help
--target-help
--help=class
--help=warnings
--help=optimizers
--help=params
--help=target
```

| Opción | Sentido |
| --- | --- |
| `--help` | Muestra ayuda general. |
| `--target-help` | Muestra opciones específicas del objetivo. |
| `--help=warnings` | Lista opciones de advertencia. |
| `--help=optimizers` | Lista opciones de optimización. |
| `--help=target` | Lista opciones específicas de destino. |

Ejemplo:

```sh
gcc --help=warnings
```

Puede usarse para descubrir opciones activables con `-W`.

## `-wrapper`

La opción:

```sh
-wrapper program
```

permite ejecutar subprogramas internos de GCC mediante un wrapper. Es una opción avanzada.

Ejemplo conceptual:

```sh
gcc -wrapper strace,-f main.c -o main
```

La intención es envolver invocaciones internas para observar o modificar su ejecución.

Esto puede ser útil para depuración de toolchains, pero no es de uso cotidiano.

## Argumentos desde archivo: `@file`

GCC permite leer argumentos desde un archivo:

```sh
gcc @args.txt
```

El archivo `args.txt` puede contener opciones y nombres de archivo.

Ejemplo:

```text
-std=c23
-Wall
-Wextra
-Iinclude
-c
src/main.c
-o
build/main.o
```

Entonces:

```sh
gcc @args.txt
```

actúa como si esos argumentos estuvieran escritos en la línea de órdenes.

## Ventajas de `@file`

Los archivos de argumentos son útiles cuando:

- la línea de órdenes sería muy larga;
- un sistema de construcción genera opciones automáticamente;
- se quiere inspeccionar exactamente qué argumentos se pasaron;
- hay límites del sistema operativo para longitud de comandos;
- se desea separar configuración de invocación.

## Quoting y expansión

El procesamiento exacto de comillas, espacios y escapes en `@file` sigue reglas documentadas por GCC. Conviene no asumir que es idéntico a un shell.

Ejemplo seguro:

```text
-Iinclude
-DDEBUG=1
src/main.c
-o
build/main.o
```

Si hay rutas con espacios, hay que usar quoting adecuado.

## Ejemplo de build reproducible

Un sistema de construcción puede generar:

```text
build/main.args
```

con:

```text
-std=c23
-Wall
-Wextra
-Wpedantic
-MMD
-MP
-Iinclude
-c
src/main.c
-o
build/main.o
```

Y ejecutar:

```sh
gcc @build/main.args
```

Esto deja una traza clara de la invocación.

## Relación con diagnóstico de toolchain

Combinaciones útiles:

```sh
gcc -v @build/main.args
gcc -### @build/main.args
gcc --help=target
```

`-v` muestra lo que se ejecuta.  
`-###` muestra lo que se ejecutaría.  
`--help=target` muestra opciones específicas del destino.

## Lectura técnica

Estas opciones ayudan a inspeccionar la caja negra del driver GCC.

```text
-v      → observar ejecución real
-###    → observar ejecución planeada
--help  → descubrir interfaz disponible
@file   → transportar argumentos complejos
-wrapper → instrumentar subprogramas internos
```

Son especialmente útiles en entornos donde importa la trazabilidad de compilación.

[Anterior](18-salidas-dumpbase-dumpdir.md) | [Índice](README.md) | [Siguiente](20-compilar-cpp.md)
