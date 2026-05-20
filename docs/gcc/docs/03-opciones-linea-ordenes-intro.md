# 3. Opciones de línea de órdenes de GCC

Cuando se invoca GCC, normalmente realiza varias fases:

1. preprocesado;
2. compilación;
3. ensamblado;
4. enlazado.

Las opciones generales permiten detener este proceso en una etapa intermedia. Por ejemplo, la opción:

```sh
-c
```

indica que no debe ejecutarse el enlazador. En ese caso, la salida consiste en archivos objeto producidos por el ensamblador.

## Opciones transmitidas a distintas fases

Algunas opciones controlan el preprocesador, otras controlan el compilador propiamente dicho, otras el ensamblador y otras el enlazador. Muchas de las opciones del ensamblador y del enlazador no se documentan en detalle en esta parte, porque no siempre es necesario usarlas directamente desde GCC.

La mayoría de opciones de línea de órdenes útiles con GCC son aplicables a programas C. Si una opción solo tiene sentido con otro lenguaje, normalmente C++, el manual lo indica explícitamente.

## Cómo se invoca GCC

La forma habitual de ejecutar GCC es invocar el programa:

```sh
gcc
```

En compilación cruzada puede usarse una forma específica de máquina, por ejemplo:

```sh
x86_64-linux-gnu-gcc
aarch64-linux-gnu-gcc
riscv64-linux-gnu-gcc
```

También puede usarse una variante con versión concreta, dependiendo de cómo esté instalada en el sistema.

Para compilar programas C++, se debe invocar normalmente:

```sh
g++
```

La diferencia no es cosmética: `g++` aplica reglas y bibliotecas propias del entorno C++ durante compilación y enlazado.

## Opciones y operandos

El programa `gcc` acepta opciones y nombres de archivo como operandos. Muchas opciones tienen nombres de varias letras; por eso no deben agruparse opciones de una letra como si fueran opciones cortas tradicionales de otras herramientas.

Por ejemplo:

```sh
-dv
```

no es equivalente a:

```sh
-d -v
```

## Orden de las opciones

En muchos casos se pueden mezclar opciones y argumentos sin que el orden importe. Pero hay excepciones importantes:

- si se especifica `-L` varias veces, los directorios se buscan en el orden indicado;
- la posición de `-l` es significativa durante el enlazado;
- varias opciones del mismo tipo pueden anularse o acumularse según su semántica.

Ejemplo típico:

```sh
gcc main.o util.o -L/usr/local/lib -lfoo -o programa
```

## Opciones positivas y negativas

Muchas opciones largas empiezan por `-f` o `-W`, por ejemplo:

```sh
-fmove-loop-invariants
-Wformat
```

Muchas tienen forma positiva y negativa. Si la forma positiva es:

```sh
-ffoo
```

la forma negativa suele ser:

```sh
-fno-foo
```

El manual documenta normalmente solo una de las dos formas: la que no es el valor predeterminado.

## Argumentos de opciones

Algunas opciones aceptan argumentos, separados por espacio o por el signo `=`. Por ejemplo:

```sh
-o programa
-std=c23
-I include
-DNOMBRE=valor
```

Cuando una opción espera un tamaño, puede aceptar sufijos de tamaño como `kB`, `KiB`, `MB`, `MiB`, `GB` o `GiB`, según el contexto documentado.

## Lectura técnica

El capítulo 3 es el núcleo de uso diario del manual de GCC. Para un programador de sistemas, las preguntas esenciales son:

- ¿en qué fase quiero detener la compilación?;
- ¿qué estándar de lenguaje quiero seleccionar?;
- ¿qué advertencias quiero activar?;
- ¿quiero depuración, optimización o instrumentación?;
- ¿qué arquitectura objetivo y ABI estoy seleccionando?;
- ¿qué bibliotecas y rutas intervienen en el enlazado?

[Anterior](02-estandares-lenguaje.md) | [Índice](README.md) | [Siguiente](04-resumen-opciones-primera-parte.md)
