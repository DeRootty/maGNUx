# 3.2 Detener la cadena: `-c`, `-S`, `-E`

Las opciones `-c`, `-S` y `-E` son esenciales porque indican hasta dónde debe llegar GCC.

## `-c` / `--compile`

```sh
gcc -c main.c -o main.o
```

`-c` compila o ensambla, pero **no enlaza**. El resultado final es un archivo objeto.

Cadena típica:

```text
main.c -> preprocesador -> compilador -> ensamblador -> main.o
```

No se produce ejecutable. Por eso este comando no genera `main`, sino `main.o`.

### Uso típico

```sh
gcc -std=c23 -Wall -Wextra -O2 -c src/main.c -o build/main.o
gcc -std=c23 -Wall -Wextra -O2 -c src/util.c -o build/util.o
gcc build/main.o build/util.o -o programa
```

Este patrón separa compilación y enlace, que es lo habitual en proyectos con `make`, `ninja`, `meson`, `cmake` o sistemas propios.

## `-S` / `--assemble`

```sh
gcc -S main.c -o main.s
```

`-S` detiene GCC después de la compilación propiamente dicha, antes del ensamblador.

Cadena típica:

```text
main.c -> preprocesador -> compilador -> main.s
```

El resultado es ensamblador.

Esto permite inspeccionar el código generado por el compilador antes de que el ensamblador lo traduzca a objeto.

Ejemplo:

```sh
gcc -std=c23 -O2 -S main.c -o main.s
```

## `-E` / `--preprocess`

```sh
gcc -E main.c -o main.i
```

`-E` detiene GCC después del preprocesador.

Cadena típica:

```text
main.c -> preprocesador -> main.i
```

El resultado contiene:

- macros expandidas;
- inclusiones resueltas;
- directivas procesadas;
- líneas de control para depuración y diagnóstico.

Ejemplo:

```sh
gcc -std=c23 -DDEBUG -Iinclude -E src/main.c -o build/main.i
```

Esto es muy útil para depurar problemas de macros, cabeceras o compilación condicional.

## Relación entre las tres opciones

| Opción | Se detiene después de | Salida típica |
| --- | --- | --- |
| `-E` | Preprocesador | `.i`, `.ii`, salida textual |
| `-S` | Compilador | `.s` |
| `-c` | Ensamblador | `.o` |
| Sin estas opciones | Enlazador | ejecutable o biblioteca |

## Ejemplo completo por fases

```sh
gcc -E main.c -o main.i
gcc -S main.i -o main.s
gcc -c main.s -o main.o
gcc main.o -o main
```

En la práctica, normalmente no se ejecuta así manualmente, pero muestra las fases.

## Varios archivos con `-c`

```sh
gcc -c main.c util.c
```

produce normalmente:

```text
main.o
util.o
```

Si se especifica `-o` con varios archivos de entrada y `-c`, puede no ser válido o tener restricciones según el caso, porque no puede haber una única salida objeto para varias unidades independientes salvo que se use otra técnica.

## `-o` y tipo de salida

La opción `-o` nombra la salida de la fase final ejecutada.

Ejemplos:

```sh
gcc -E main.c -o main.i
gcc -S main.c -o main.s
gcc -c main.c -o main.o
gcc main.c -o main
```

En cada caso, `-o` no significa lo mismo semánticamente: nombra la salida correspondiente al punto donde se detuvo la cadena.

## Uso en sistemas reales

### Generar dependencias y objeto

```sh
gcc -MMD -MP -c src/main.c -o build/main.o
```

### Inspeccionar preprocesado

```sh
gcc -E src/main.c | less
```

### Inspeccionar ensamblador optimizado

```sh
gcc -O2 -S src/main.c -o build/main.s
```

### Compilar sin enlazar en un kernel

```sh
gcc -ffreestanding -c kernel.c -o kernel.o
```

## Lectura técnica

Estas tres opciones permiten convertir GCC en una herramienta de inspección por etapas.

```text
-E → qué ve el compilador después del preprocesador
-S → qué ensamblador genera el compilador
-c → qué objeto se entrega al enlazador
```

Comprenderlas permite depurar toolchains, construir sistemas reproducibles y separar responsabilidades dentro de un sistema de construcción.

[Anterior](16-seleccion-lenguaje-x.md) | [Índice](README.md) | [Siguiente](18-salidas-dumpbase-dumpdir.md)
