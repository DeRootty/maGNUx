# 3.1 Resumen de opciones - preprocesador y dependencias

Esta unidad continúa la sección **3.1 Option Summary** del manual de GCC. En esta parte aparecen las opciones que controlan el **preprocesador de C/C++** y la generación de archivos de dependencias.

El preprocesador es la fase que transforma directivas como `#include`, `#define`, `#ifdef`, `#if` y macros antes de que el compilador analice el lenguaje C o C++ propiamente dicho.

## Opciones principales del preprocesador

Opciones representativas del resumen:

```sh
-Dname
-Dname=definition
-Uname
-include file
-imacros file
-idirafter dir
-imultilib dir
-iprefix file
-iquote dir
-isystem dir
-isysroot dir
-iwithprefix dir
-iwithprefixbefore dir
-nostdinc
-nostdinc++
-undef
-pthread
```

### Lectura técnica

| Opción | Sentido práctico |
| --- | --- |
| `-Dname` | Define una macro con valor implícito `1`. |
| `-Dname=definition` | Define una macro con el valor indicado. |
| `-Uname` | Elimina una macro predefinida o definida previamente. |
| `-include file` | Fuerza la inclusión de un archivo antes del código fuente. |
| `-imacros file` | Procesa macros desde un archivo, pero descarta su salida textual. |
| `-iquote dir` | Añade un directorio para búsquedas de `#include "archivo.h"`. |
| `-isystem dir` | Añade un directorio de cabeceras de sistema. Sus diagnósticos pueden tratarse de forma especial. |
| `-nostdinc` | No busca cabeceras en los directorios estándar. |
| `-undef` | No predefine macros específicas del sistema ni de GCC, salvo las estándar obligatorias. |

## Definir macros desde línea de órdenes

Ejemplo:

```sh
gcc -std=c23 -DDEBUG -DVERSION=3 main.c -o main
```

Equivale conceptualmente a que el código viera:

```c
#define DEBUG 1
#define VERSION 3
```

Esto permite compilar el mismo código con configuraciones distintas sin editar los fuentes.

```c
#ifdef DEBUG
    fprintf(stderr, "modo depuración activado\n");
#endif
```

## Desdefinir macros

```sh
gcc -std=c23 -UDEBUG main.c -o main
```

`-U` es útil cuando una macro viene definida por el entorno de compilación, por un fichero de configuración o por una opción anterior.

## Inclusión forzada

```sh
gcc -std=c23 -include config.h main.c -o main
```

Esto hace que `config.h` se procese antes que `main.c`. Es habitual en sistemas de construcción donde se genera un archivo de configuración común.

## Rutas de inclusión

Aunque esta familia se completa en la unidad de directorios, el preprocesador usa rutas para encontrar cabeceras:

```sh
gcc -std=c23 -Iinclude main.c -o main
```

Con:

```c
#include "mi_api.h"
```

GCC buscará en `include/` además de las rutas habituales.

## Dependencias para Make

Opciones representativas:

```sh
-M
-MM
-MD
-MMD
-MF file
-MG
-MP
-MQ target
-MT target
```

Estas opciones hacen que GCC genere reglas de dependencia, normalmente para `make`.

### Lectura técnica

| Opción | Sentido práctico |
| --- | --- |
| `-M` | Genera dependencias incluyendo cabeceras de sistema. |
| `-MM` | Genera dependencias excluyendo cabeceras de sistema. |
| `-MD` | Compila y además genera archivo de dependencias. |
| `-MMD` | Como `-MD`, pero omite cabeceras de sistema. |
| `-MF file` | Especifica el archivo de salida de dependencias. |
| `-MT target` | Cambia el objetivo usado en la regla generada. |
| `-MQ target` | Como `-MT`, pero escapando caracteres especiales para Make. |
| `-MP` | Añade reglas ficticias para evitar errores si se elimina una cabecera. |

Ejemplo habitual:

```sh
gcc -std=c23 -Wall -Wextra -MMD -MP -c src/main.c -o build/main.o
```

Generará algo como:

```text
build/main.o: src/main.c include/config.h include/api.h
```

Esto permite que `make` sepa cuándo debe recompilar un objeto porque cambió una cabecera.

## Salida del preprocesador

La opción general `-E` detiene la cadena después del preprocesado:

```sh
gcc -std=c23 -E main.c -o main.i
```

Esto produce un archivo `main.i` con macros expandidas e inclusiones resueltas. Es muy útil para depurar problemas de macros, `#include` o configuración.

## Advertencias relacionadas con preprocesador

Opciones útiles:

```sh
-Wundef
-Wendif-labels
-Wexpansion-to-defined
-Wbuiltin-macro-redefined
```

`-Wundef` avisa cuando una macro no definida se usa en una expresión `#if`:

```c
#if FEATURE_X
/* ... */
#endif
```

Si `FEATURE_X` no está definida, C la trata como `0`, pero esto puede ocultar errores de configuración.

## Perfil recomendado

Para un proyecto C con dependencias automáticas:

```sh
gcc -std=c23 -Wall -Wextra -Wpedantic -MMD -MP -Iinclude -c src/main.c -o build/main.o
```

Para inspeccionar qué ve realmente el compilador:

```sh
gcc -std=c23 -DDEBUG -Iinclude -E src/main.c -o build/main.i
```

## Nota editorial

En esta entrega se mantiene la opción `-D`, `-U`, `-I`, `-M`, `-MM`, `-MD`, etc. como vocabulario técnico literal. No deben traducirse como "definir", "desdefinir" o "incluir" dentro del comando, porque son parte de la interfaz estable de GCC.

[Anterior](09-instrumentacion-cobertura-endurecimiento.md) | [Índice](README.md) | [Siguiente](11-ensamblador-y-enlazador.md)
