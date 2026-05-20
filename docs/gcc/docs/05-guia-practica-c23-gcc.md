# Guía práctica - Compilar C23 con GCC

Esta guía resume cómo invocar GCC para compilar programas C23 y cómo diferenciar entre C23 estricto y GNU23.

## Compilar un programa C23 mínimo

Archivo `hola.c`:

```c
#include <stdio.h>

int main(void) {
    puts("Hola desde C23");
    return 0;
}
```

Compilación:

```sh
gcc -std=c23 hola.c -o hola
```

Ejecución:

```sh
./hola
```

## Activar advertencias razonables

Una invocación habitual para desarrollo es:

```sh
gcc -std=c23 -Wall -Wextra -Wpedantic hola.c -o hola
```

| Opción | Uso |
| --- | --- |
| `-std=c23` | Selecciona C23 ISO. |
| `-Wall` | Activa advertencias comunes. |
| `-Wextra` | Activa advertencias adicionales. |
| `-Wpedantic` | Advierte sobre usos no conformes al estándar seleccionado. |

## Tratar advertencias como errores

En proyectos que buscan disciplina estricta:

```sh
gcc -std=c23 -Wall -Wextra -Wpedantic -Werror hola.c -o hola
```

Esto puede ser útil en integración continua, aunque conviene tener cuidado cuando se compila con distintas versiones de GCC, porque nuevas advertencias pueden romper la compilación.

## C23 frente a GNU23

```sh
gcc -std=c23 archivo.c -o programa
```

selecciona el modo ISO C23.

```sh
gcc -std=gnu23 archivo.c -o programa
```

selecciona C23 más extensiones GNU.

| Modo | Cuándo usarlo |
| --- | --- |
| `c23` | Código que quiere ajustarse al estándar ISO. |
| `gnu23` | Código que acepta extensiones GNU, común en sistemas GNU/Linux. |

## Ver macros del compilador

Para inspeccionar macros predefinidas:

```sh
gcc -std=c23 -dM -E - < /dev/null
```

Esto imprime macros definidas por el compilador y el entorno.

Para buscar macros relacionadas con el estándar C:

```sh
gcc -std=c23 -dM -E - < /dev/null | grep STDC
```

## Compilar sin enlazar

Para producir un archivo objeto:

```sh
gcc -std=c23 -Wall -Wextra -c hola.c -o hola.o
```

Esto es útil en proyectos con varios archivos fuente.

## Ver las fases ejecutadas

```sh
gcc -std=c23 -v hola.c -o hola
```

Muestra información sobre rutas, configuración del compilador y programas internos usados.

Para ver las órdenes sin ejecutarlas:

```sh
gcc -std=c23 -### hola.c -o hola
```

## Código freestanding

Para código de kernel, firmware o entornos mínimos:

```sh
gcc -std=c23 -ffreestanding -fno-builtin -c kernel.c -o kernel.o
```

| Opción | Sentido |
| --- | --- |
| `-ffreestanding` | Indica entorno autónomo. |
| `-fno-builtin` | Evita asumir funciones estándar como builtins, salvo excepciones. |
| `-c` | Produce objeto sin enlazar. |

En código freestanding real también suelen intervenir:

- script de linker;
- ensamblador de arranque;
- ABI objetivo;
- flags específicas de arquitectura;
- implementación propia de rutinas de memoria;
- control estricto de bibliotecas enlazadas.

## Plantilla de comando razonable

Para un programa de usuario C23:

```sh
gcc -std=c23 -Wall -Wextra -Wpedantic -O2 main.c -o main
```

Para depuración:

```sh
gcc -std=c23 -Wall -Wextra -Wpedantic -g -O0 main.c -o main
```

Para código freestanding inicial:

```sh
gcc -std=c23 -ffreestanding -fno-builtin -Wall -Wextra -c kernel.c -o kernel.o
```

[Anterior](04-resumen-opciones-primera-parte.md) | [Índice](README.md) | [Siguiente](06-diagnosticos-y-advertencias.md)
