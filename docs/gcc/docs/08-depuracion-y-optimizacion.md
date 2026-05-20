# Sección 3.1 - Depuración y optimización

GCC permite controlar tanto la información de depuración como el nivel de optimización. Estas dos dimensiones están relacionadas, pero no son lo mismo.

## Información de depuración

Las opciones principales son:

```sh
-g
-ggdb
-g0
-g1
-g2
-g3
```

| Opción | Sentido |
| --- | --- |
| `-g` | Genera información de depuración en el formato nativo del sistema. |
| `-ggdb` | Genera información especialmente adecuada para GDB. |
| `-g0` | No genera información de depuración. |
| `-g1` | Información mínima. |
| `-g2` | Nivel normal. |
| `-g3` | Información extra, incluyendo macros. |

Ejemplo:

```sh
gcc -g main.c -o main
```

## Depurar sin optimización

Para depuración inicial suele usarse:

```sh
gcc -g -O0 main.c -o main
```

`-O0` evita muchas transformaciones que harían más difícil seguir el flujo original del programa.

## Depurar con optimización razonable

GCC ofrece:

```sh
-Og
```

que intenta proporcionar una experiencia de depuración razonable sin desactivar todas las optimizaciones.

Ejemplo:

```sh
gcc -g -Og main.c -o main
```

## Niveles de optimización

```sh
-O0
-O1
-O2
-O3
-Os
-Oz
-Og
-Ofast
```

| Opción | Sentido |
| --- | --- |
| `-O0` | Sin optimización. |
| `-O1` | Optimización básica. |
| `-O2` | Optimización fuerte general, habitual para producción. |
| `-O3` | Optimización más agresiva, puede aumentar tamaño. |
| `-Os` | Optimiza tamaño. |
| `-Oz` | Optimiza tamaño de forma más agresiva cuando está disponible. |
| `-Og` | Optimización pensada para depuración. |
| `-Ofast` | Optimización agresiva que puede relajar reglas estrictas. |

## `-Ofast`

`-Ofast` no equivale simplemente a `-O3`. Activa optimizaciones que pueden romper expectativas estrictas del estándar, especialmente en matemáticas de coma flotante.

Úsese solo cuando el proyecto acepta esas condiciones.

## Optimización y comportamiento indefinido

El compilador puede asumir que el programa no ejecuta comportamiento indefinido. A niveles altos de optimización, esto puede producir resultados sorprendentes si el programa tiene errores.

Ejemplo conceptual:

```c
int f(int x) {
    return x + 1 > x;
}
```

Si el desbordamiento de `int` con signo es comportamiento indefinido, el compilador puede razonar de formas no obvias para el programador.

## Información de depuración con optimización

Es posible compilar con:

```sh
gcc -g -O2 main.c -o main
```

Esto produce un binario optimizado con información de depuración. Sin embargo, al depurar puede ocurrir que:

- variables parezcan optimizadas fuera;
- el orden de instrucciones no coincida con el código fuente;
- funciones estén inlineadas;
- saltos parezcan no lineales.

## LTO

La optimización en tiempo de enlace se activa con:

```sh
-flto
```

Permite optimizar considerando varias unidades de traducción durante el enlazado.

Ejemplo:

```sh
gcc -O2 -flto main.c util.c -o programa
```

LTO puede mejorar rendimiento, pero también hace más compleja la depuración y puede requerir que todas las piezas del toolchain sean compatibles.

## Perfilado y optimización guiada por perfil

GCC puede usar información de ejecución para optimizar. El flujo general es:

1. compilar con instrumentación de perfil;
2. ejecutar cargas representativas;
3. recompilar usando los datos obtenidos.

Opciones típicas:

```sh
-fprofile-generate
-fprofile-use
```

Ejemplo:

```sh
gcc -O2 -fprofile-generate main.c -o main
./main
gcc -O2 -fprofile-use main.c -o main
```

## Combinaciones prácticas

Depuración inicial:

```sh
gcc -g -O0 -Wall -Wextra main.c -o main
```

Depuración con algo de optimización:

```sh
gcc -g -Og -Wall -Wextra main.c -o main
```

Producción general:

```sh
gcc -O2 -Wall -Wextra main.c -o main
```

Producción con LTO:

```sh
gcc -O2 -flto main.c util.c -o programa
```

## Lectura técnica

La optimización no es simplemente "hacerlo más rápido". Es permitir que el compilador transforme el programa bajo ciertas reglas. Cuanto más se optimiza, más importante es que el código no dependa de comportamiento indefinido, conversiones accidentales o supuestos no garantizados.

[Anterior](07-analizador-estatico.md) | [Índice](README.md) | [Siguiente](09-instrumentacion-cobertura-endurecimiento.md)
