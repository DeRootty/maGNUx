# 3.1 Resumen de opciones - ensamblador y enlazador

GCC no es solo un compilador en sentido estrecho. Cuando se invoca como `gcc`, actúa como **driver** de una cadena: preprocesa, compila, ensambla y enlaza. Por eso la sección 3.1 incluye opciones para pasar argumentos al ensamblador y al enlazador.

## Pasar opciones al ensamblador

Opciones representativas:

```sh
-Wa,option
-Xassembler option
```

### Lectura técnica

| Opción | Sentido práctico |
| --- | --- |
| `-Wa,option` | Pasa `option` al ensamblador. Si hay varias opciones separadas por comas, se dividen y se pasan como argumentos separados. |
| `-Xassembler option` | Pasa exactamente una opción al ensamblador. Si la opción necesita argumento, puede requerir dos usos de `-Xassembler`. |

Ejemplo:

```sh
gcc -c archivo.c -Wa,--fatal-warnings -o archivo.o
```

Esto pide al ensamblador que trate advertencias como fatales, si el ensamblador soporta esa opción.

Con `-Xassembler`:

```sh
gcc -c archivo.c -Xassembler --fatal-warnings -o archivo.o
```

## Pasar opciones al enlazador

Opciones representativas:

```sh
-Wl,option
-Xlinker option
-u symbol
-z keyword
```

| Opción | Sentido práctico |
| --- | --- |
| `-Wl,option` | Pasa opciones al enlazador, separando por comas. |
| `-Xlinker option` | Pasa una opción al enlazador. |
| `-u symbol` | Fuerza que el símbolo se considere indefinido, provocando su búsqueda durante el enlace. |
| `-z keyword` | Pasa palabras clave específicas al enlazador, según soporte del sistema. |

Ejemplo:

```sh
gcc main.o util.o -Wl,-Map,programa.map -o programa
```

Esto pide al enlazador generar un mapa de enlace `programa.map`.

Otro ejemplo:

```sh
gcc main.o -Wl,--as-needed -lfoo -o programa
```

`--as-needed` es una opción del enlazador, no de GCC como compilador. GCC la transporta mediante `-Wl,`.

## Bibliotecas

Opciones representativas:

```sh
-lbiblioteca
-Ldirectorio
-nostdlib
-nodefaultlibs
-nostartfiles
-static
-shared
-pie
-no-pie
```

| Opción | Sentido práctico |
| --- | --- |
| `-lfoo` | Busca una biblioteca llamada `libfoo.so` o `libfoo.a`, según contexto. |
| `-Ldir` | Añade un directorio de búsqueda de bibliotecas. |
| `-nostdlib` | No usa archivos de arranque ni bibliotecas estándar. |
| `-nodefaultlibs` | No usa bibliotecas estándar por defecto, pero conserva archivos de arranque. |
| `-nostartfiles` | No usa archivos de arranque estándar, pero conserva bibliotecas estándar. |
| `-static` | Intenta enlazado estático. |
| `-shared` | Produce una biblioteca compartida. |
| `-pie` | Produce ejecutable independiente de posición, si el objetivo lo soporta. |
| `-no-pie` | Desactiva generación PIE. |

## Orden de bibliotecas

El orden importa en el enlazado.

Ejemplo:

```sh
gcc main.o -lfoo -o programa
```

no siempre equivale a:

```sh
gcc -lfoo main.o -o programa
```

En muchos enlazadores tradicionales, las bibliotecas se procesan de izquierda a derecha. Si `main.o` necesita símbolos de `libfoo`, `main.o` debe aparecer antes que `-lfoo`.

## Enlazado para sistemas mínimos

Para kernels, bootloaders o entornos freestanding, pueden usarse opciones como:

```sh
-nostdlib
-nodefaultlibs
-nostartfiles
-T script.ld
```

Ejemplo conceptual:

```sh
gcc -ffreestanding -nostdlib -T linker.ld boot.o kernel.o -o kernel.elf
```

Aquí GCC actúa como driver del enlazador, pero se evita el entorno estándar de usuario.

## Generar biblioteca compartida

```sh
gcc -fPIC -shared foo.c -o libfoo.so
```

| Opción | Sentido |
| --- | --- |
| `-fPIC` | Genera código independiente de posición adecuado para biblioteca compartida. |
| `-shared` | Pide al enlazador producir una biblioteca compartida. |

## Mapa de enlace

Un mapa de enlace puede ayudar a entender qué símbolos y secciones entran en el binario:

```sh
gcc main.o util.o -Wl,-Map,programa.map -o programa
```

Esto es especialmente útil en:

- sistemas embebidos;
- kernels;
- depuración de scripts de linker;
- análisis de tamaño;
- control de símbolos.

## Diferencia entre opciones de GCC y de linker

Una confusión frecuente es pensar que todas las opciones pertenecen a GCC. En realidad:

```text
gcc
→ driver

cc1 / cc1plus
→ compilador interno

as
→ ensamblador

ld
→ enlazador
```

`-Wl,` y `-Wa,` son mecanismos para pasar opciones a herramientas posteriores.

## Perfil práctico

Compilar y enlazar programa normal:

```sh
gcc -O2 main.c util.c -o programa
```

Generar objeto sin enlazar:

```sh
gcc -c main.c -o main.o
```

Enlazar con biblioteca:

```sh
gcc main.o -L/usr/local/lib -lfoo -o programa
```

Generar mapa de enlace:

```sh
gcc main.o util.o -Wl,-Map,programa.map -o programa
```

Compilar entorno freestanding:

```sh
gcc -ffreestanding -nostdlib -T linker.ld boot.o kernel.o -o kernel.elf
```

## Nota editorial

Las opciones del ensamblador y del enlazador dependen mucho del sistema objetivo. Por eso conviene distinguir claramente entre la interfaz común de GCC y las opciones específicas que GCC simplemente transmite a `as` o `ld`.

[Anterior](10-preprocesador-y-dependencias.md) | [Índice](README.md) | [Siguiente](12-directorios-sysroot-busqueda.md)
