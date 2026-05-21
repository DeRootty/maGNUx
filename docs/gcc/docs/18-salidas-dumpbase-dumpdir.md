# 3.2 Salidas primarias, auxiliares y volcados

La opción `-o` controla la salida principal, pero GCC también puede producir archivos auxiliares y archivos de volcado. Esta parte de la sección 3.2 explica cómo se nombran.

## `-o file` / `--output=file`

Formas equivalentes:

```sh
-o file
--output=file
--output file
```

Indica dónde colocar la salida primaria.

Ejemplos:

```sh
gcc main.c -o main
gcc -c main.c -o main.o
gcc -S main.c -o main.s
gcc -E main.c -o main.i
```

La misma opción sirve para distintos tipos de salida. Su significado concreto depende de dónde se detenga la cadena.

## Salida por defecto

Si no se usa `-o`, GCC elige nombres por defecto.

Ejemplos:

```sh
gcc -c main.c
```

produce normalmente:

```text
main.o
```

```sh
gcc -S main.c
```

produce:

```text
main.s
```

```sh
gcc main.c
```

produce normalmente:

```text
a.out
```

salvo que el sistema o configuración use otro valor.

## Archivos auxiliares

Además de la salida principal, GCC puede generar archivos auxiliares:

- dependencias `.d`;
- volcados de optimización;
- dumps de árboles internos;
- dumps RTL;
- información de análisis;
- archivos temporales conservados con `-save-temps`.

Ejemplo:

```sh
gcc -MMD -MP -c main.c -o build/main.o
```

puede producir:

```text
build/main.o
build/main.d
```

## `-dumpbase`

La opción:

```sh
-dumpbase dumpbase
```

controla la base usada para nombrar archivos de volcado y auxiliares.

Es útil cuando se generan múltiples archivos y se desea controlar su nombre base.

Ejemplo conceptual:

```sh
gcc -c main.c -fdump-tree-optimized -dumpbase unidad -o main.o
```

puede producir volcados con nombres derivados de `unidad`.

## `-dumpdir`

La opción:

```sh
-dumpdir dumpdir
```

controla el directorio donde se colocan ciertos archivos de volcado.

Ejemplo conceptual:

```sh
gcc -O2 -fdump-tree-optimized -dumpdir dumps/ -c main.c -o main.o
```

Esto permite separar archivos de diagnóstico de los objetos de compilación.

## `-dumpbase-ext`

La opción:

```sh
-dumpbase-ext auxdropsuf
```

controla la extensión que se elimina de la base al generar nombres auxiliares, en los casos documentados por GCC.

Es una opción avanzada y normalmente solo interesa a sistemas de construcción complejos o a quien estudia la generación de dumps.

## `-save-temps`

```sh
-save-temps
-save-temps=cwd
-save-temps=obj
```

Conserva archivos temporales intermedios.

Ejemplo:

```sh
gcc -save-temps main.c -o main
```

puede dejar archivos como:

```text
main.i
main.s
main.o
main
```

Con:

```sh
-save-temps=obj
```

los temporales se colocan de forma más coherente con la ubicación del objeto.

## Relación con sistemas de construcción

En un sistema con directorios separados:

```text
src/
build/
dumps/
```

puede ser importante controlar:

```text
salida principal
archivos de dependencias
volcados de optimización
temporales
```

Ejemplo:

```sh
gcc -O2 -MMD -MP -fdump-tree-optimized -dumpdir dumps/ -c src/main.c -o build/main.o
```

La salida principal es:

```text
build/main.o
```

pero pueden aparecer también:

```text
build/main.d
dumps/...
```

## Riesgos

Si no se controla bien el nombrado de salidas auxiliares, pueden aparecer problemas como:

- archivos de volcado mezclados con objetos;
- dependencias generadas en rutas no esperadas;
- colisiones de nombres entre fuentes con el mismo basename;
- builds no reproducibles por rutas absolutas;
- dificultad para limpiar artefactos.

## Lectura técnica

La salida de GCC no es solo el binario final. En una construcción moderna, los artefactos intermedios son parte del proceso.

```text
fuente
→ salida principal
→ dependencias
→ temporales
→ volcados
→ informes de optimización
```

Controlar estos nombres es importante para sistemas reproducibles, análisis de compilación y limpieza de builds.

[Anterior](17-detener-cadena-c-s-e.md) | [Índice](README.md) | [Siguiente](19-verbose-help-wrapper-atfile.md)
