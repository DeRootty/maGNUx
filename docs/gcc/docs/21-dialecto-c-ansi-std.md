# 3.4 — Dialecto C: `-ansi` y `-std=`

Fuente primaria: [GCC 16.1.0, § 3.4 — Options Controlling C Dialect](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/C-Dialect-Options.html). Edición técnica selectiva en español, no traducción literal íntegra. Los ejemplos y ejercicios son aportaciones propias; no forman parte del manual original. [Atribución y licencia](00-portada-y-licencia.md).

## Lectura técnica de las opciones

En C, `-ansi` equivale a `-std=c90`. `-std=` selecciona el estándar o el dialecto GNU correspondiente; incluso un modo ISO admite extensiones que no lo contradigan. `-Wpedantic` toma el estándar elegido como referencia.

## Ejercicio original: una flag que modifica la aceptación del código

Guarda en `dialecto.c`:

~~~c
int f(void) {
    typeof(1) x = 4;
    return x;
}
~~~

~~~sh
gcc -std=gnu11 -fsyntax-only dialecto.c
gcc -std=c11 -pedantic-errors -fsyntax-only dialecto.c
~~~

El primero debería aceptar `typeof` como extensión; el segundo no debe interpretarlo como palabra clave GNU. Es una predicción para contrastar, no un registro de ejecución. No confundir rechazo sintáctico con ausencia de un archivo en la lista de compilación.

Repite con `__typeof__`, registra versión, salida de error y código de retorno. Después ensaya `-std=c23` si la versión instalada lo soporta: la aceptación de una palabra clave puede cambiar entre estándares.

**Interés para Gentoo:** antes de comparar código objeto debemos comprobar que ambos dialectos aceptan la unidad de traducción. No modificar el estándar exigido por un paquete o por Kbuild para forzar el resultado.

[Anterior](20-compilar-cpp.md) | [Índice](README.md) | [Siguiente](22-estandares-c-gnu.md)
