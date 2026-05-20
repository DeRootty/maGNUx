# Sección 3.1 - Instrumentación, cobertura y endurecimiento

GCC puede añadir código extra al programa para medir, comprobar o endurecer su ejecución. Esta familia de opciones es especialmente importante para pruebas, seguridad y análisis de comportamiento.

## Instrumentación

La instrumentación añade instrucciones adicionales al binario para observar o modificar su comportamiento durante la ejecución.

Ejemplos de familias de opciones:

```sh
-fprofile-arcs
-ftest-coverage
-fsanitize=...
-fstack-protector
-fstack-protector-strong
-fstack-clash-protection
-fcf-protection
```

## Cobertura de código

Para medir cobertura con herramientas como `gcov`:

```sh
gcc -fprofile-arcs -ftest-coverage main.c -o main
```

Después se ejecuta el programa:

```sh
./main
```

Y se analizan los resultados con:

```sh
gcov main.c
```

Esto permite saber qué líneas o ramas fueron ejecutadas durante las pruebas.

## Sanitizers

Los sanitizers detectan errores en tiempo de ejecución. Son herramientas fundamentales para pruebas.

### AddressSanitizer

```sh
-fsanitize=address
```

Detecta errores de memoria como:

- uso después de liberar;
- desbordamientos de heap;
- desbordamientos de stack;
- accesos fuera de límites.

Ejemplo:

```sh
gcc -g -O1 -fsanitize=address main.c -o main
```

### UndefinedBehaviorSanitizer

```sh
-fsanitize=undefined
```

Detecta ciertos casos de comportamiento indefinido durante la ejecución.

Ejemplo:

```sh
gcc -g -O1 -fsanitize=undefined main.c -o main
```

### ThreadSanitizer

```sh
-fsanitize=thread
```

Detecta carreras de datos en programas concurrentes.

### LeakSanitizer

```sh
-fsanitize=leak
```

Detecta fugas de memoria.

## Combinación de sanitizers

Algunos sanitizers pueden combinarse:

```sh
gcc -g -O1 -fsanitize=address,undefined main.c -o main
```

No todos son compatibles entre sí. Por ejemplo, ThreadSanitizer no suele combinarse con AddressSanitizer en la misma ejecución.

## Protección de pila

GCC puede añadir comprobaciones para detectar corrupción de pila:

```sh
-fstack-protector
-fstack-protector-strong
-fstack-protector-all
```

| Opción | Sentido |
| --- | --- |
| `-fstack-protector` | Protege funciones seleccionadas. |
| `-fstack-protector-strong` | Protege un conjunto más amplio, recomendado en muchas distribuciones. |
| `-fstack-protector-all` | Protege todas las funciones. |

Ejemplo:

```sh
gcc -O2 -fstack-protector-strong main.c -o main
```

## Stack clash protection

```sh
-fstack-clash-protection
```

Ayuda a evitar ciertos ataques o fallos donde la pila salta sobre páginas de guarda.

## Control-flow protection

En arquitecturas que lo soportan:

```sh
-fcf-protection
```

puede activar protección de flujo de control.

## Fortificación mediante cabeceras

Aunque no es únicamente una opción de GCC, muchas distribuciones usan:

```sh
-D_FORTIFY_SOURCE=2
```

o niveles superiores cuando están disponibles, normalmente junto con optimización:

```sh
gcc -O2 -D_FORTIFY_SOURCE=2 main.c -o main
```

Esto permite que cabeceras de la biblioteca C sustituyan ciertas llamadas por variantes comprobadas cuando el compilador puede conocer tamaños de objetos.

## Endurecimiento práctico

Una línea común para binarios de usuario puede incluir:

```sh
gcc -O2 -Wall -Wextra -fstack-protector-strong -D_FORTIFY_SOURCE=2 main.c -o main
```

Para pruebas intensivas:

```sh
gcc -g -O1 -fsanitize=address,undefined -fno-omit-frame-pointer main.c -o main
```

## Lectura técnica

Instrumentar no es optimizar. Instrumentar es añadir visibilidad o comprobaciones. En seguridad y fiabilidad, un binario instrumentado puede ser más lento, pero mucho más útil para encontrar fallos antes de producción.

[Anterior](08-depuracion-y-optimizacion.md) | [Índice](README.md) | [Siguiente](10-preprocesador-y-dependencias.md)
