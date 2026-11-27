# 3.4 — Palabras clave, builtins y entorno hosted/freestanding

Fuente primaria: [GCC 16.1.0, § 3.4 — Options Controlling C Dialect](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/C-Dialect-Options.html). Edición técnica selectiva en español, no traducción literal íntegra. Los ejemplos y ejercicios son aportaciones propias; no forman parte del manual original. [Atribución y licencia](00-portada-y-licencia.md).

## Lectura técnica

- `-fno-asm`: restringe palabras clave de extensión según el dialecto; las formas con doble guion bajo siguen disponibles.
- `-fno-builtin` y `-fno-builtin-funcion`: desactivan el reconocimiento implícito de funciones incorporadas, general o selectivamente.
- `-ffreestanding`: selecciona un entorno independiente e implica `-fno-builtin`.
- `-fhosted`: selecciona un entorno alojado e implica `-fbuiltin`.

## Ejercicio original: observar una llamada reconocible

~~~c
#include <string.h>
size_t longitud(void) {
    return strlen("magnux");
}
~~~

Guardar como `builtins.c`. Comparar:

~~~sh
gcc -std=gnu11 -O2 -S builtins.c -o hosted.s
gcc -std=gnu11 -O2 -fno-builtin-strlen -S builtins.c -o no-builtin.s
diff -u hosted.s no-builtin.s
~~~

La hipótesis es que el primer caso puede resolver la longitud constante y el segundo conservar una llamada. La decisión exacta depende de compilador, objetivo y opciones; comprobar símbolos y ensamblador, no asumir que toda llamada desaparece.

~~~sh
gcc -E -dM -x c /dev/null | grep __STDC_HOSTED__
gcc -ffreestanding -E -dM -x c /dev/null | grep __STDC_HOSTED__
~~~

Un kernel no es un programa alojado ordinario. La opción no crea por sí sola un kernel, ni impide toda generación de llamadas auxiliares. Las opciones de Kbuild son la evidencia que debe observarse.

[Anterior](22-estandares-c-gnu.md) | [Índice](README.md) | [Siguiente](24-inline-extensiones-dependencias.md)
