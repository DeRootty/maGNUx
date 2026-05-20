# Sección 3.1 - Analizador estático de GCC

GCC incluye un analizador estático invocable mediante opciones de compilación. Su propósito es detectar errores potenciales sin ejecutar el programa.

La opción central es:

```sh
-fanalyzer
```

## Qué hace el analizador

El analizador estático intenta razonar sobre posibles caminos de ejecución dentro del programa. Puede detectar problemas como:

- uso después de liberar memoria;
- doble liberación;
- fugas de memoria;
- uso de valores no inicializados;
- llamadas peligrosas;
- errores de manejo de recursos;
- posibles desreferencias nulas.

Ejemplo:

```sh
gcc -fanalyzer -Wall -Wextra main.c -o main
```

## Coste de compilación

El análisis estático puede ser bastante más caro que una compilación normal. No siempre conviene activarlo en cada compilación incremental rápida.

Puede ser más adecuado para:

- integración continua;
- revisiones periódicas;
- auditoría de código;
- ramas de calidad;
- análisis antes de publicar una versión.

## Diagnósticos del analizador

El analizador genera advertencias específicas. Algunas tienen nombres como:

```sh
-Wanalyzer-double-free
-Wanalyzer-use-after-free
-Wanalyzer-malloc-leak
-Wanalyzer-null-dereference
-Wanalyzer-use-of-uninitialized-value
```

El conjunto exacto depende de la versión de GCC.

## Ejemplo conceptual: doble liberación

```c
#include <stdlib.h>

void f(void) {
    int *p = malloc(sizeof *p);
    free(p);
    free(p);
}
```

Con `-fanalyzer`, GCC puede advertir que `p` se libera dos veces.

## Ejemplo conceptual: fuga de memoria

```c
#include <stdlib.h>

void f(void) {
    int *p = malloc(sizeof *p);
    *p = 42;
}
```

El puntero `p` se pierde sin llamar a `free`.

## Integración con advertencias

Puede combinarse con advertencias normales:

```sh
gcc -std=c23 -Wall -Wextra -Wpedantic -fanalyzer main.c -o main
```

En CI:

```sh
gcc -std=c23 -Wall -Wextra -fanalyzer -Werror main.c -o main
```

Conviene tener cuidado con `-Werror`, porque los analizadores pueden producir falsos positivos o diagnósticos dependientes de versión.

## Relación con sanitizers

El analizador estático no sustituye a los sanitizers.

| Técnica | Momento | Qué detecta |
| --- | --- | --- |
| `-fanalyzer` | Compilación | Posibles errores por análisis estático. |
| AddressSanitizer | Ejecución | Errores reales de memoria durante tests. |
| UndefinedBehaviorSanitizer | Ejecución | Comportamiento indefinido observado. |
| ThreadSanitizer | Ejecución | Carreras de datos. |

Son técnicas complementarias.

## Uso recomendado

Para desarrollo diario:

```sh
gcc -Wall -Wextra -c archivo.c
```

Para revisión profunda:

```sh
gcc -Wall -Wextra -fanalyzer -c archivo.c
```

Para CI:

```sh
gcc -Wall -Wextra -fanalyzer -Werror -c archivo.c
```

si el proyecto controla cuidadosamente los diagnósticos.

## Lectura técnica

`-fanalyzer` convierte GCC en algo más que un traductor de código: lo usa como herramienta de inspección semántica. Para código de sistemas, esto es especialmente valioso porque muchos errores no aparecen como fallos de sintaxis, sino como estados peligrosos posibles.

[Anterior](06-diagnosticos-y-advertencias.md) | [Índice](README.md) | [Siguiente](08-depuracion-y-optimizacion.md)
