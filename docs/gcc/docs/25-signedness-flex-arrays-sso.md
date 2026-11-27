# 3.4 — Signedness, arrays flexibles y orden escalar

Fuente primaria: [GCC 16.1.0, § 3.4 — Options Controlling C Dialect](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/C-Dialect-Options.html). Edición técnica selectiva en español, no traducción literal íntegra. Los ejemplos y ejercicios son aportaciones propias; no forman parte del manual original. [Atribución y licencia](00-portada-y-licencia.md).

## Selección de opciones

- `-fsigned-char` / `-funsigned-char`: signo del tipo `char`.
- `-fsigned-bitfields` / `-funsigned-bitfields`: signo de campos de bits sin indicación explícita.
- `-fstrict-flex-arrays=0..3`: reglas para reconocer arrays finales como flexibles; 3 exige la declaración flexible estándar.
- `-fsso-struct=big-endian|little-endian|native`: orden escalar de estructuras y uniones C; puede romper compatibilidad binaria.

## Ejercicio original: una flag puede cambiar el significado sin cambiar las cabeceras

~~~c
int negativo(char c) {
    return c < 0;
}
~~~

~~~sh
gcc -O2 -fsigned-char -S signo.c -o signed.s
gcc -O2 -funsigned-char -S signo.c -o unsigned.s
diff -u signed.s unsigned.s
~~~

Guardar el fragmento como `signo.c`. Predicción: en el segundo caso la comparación no puede resultar verdadera; en el primero depende del argumento. Evitar convertir la predicción en prueba hasta observar el ensamblador y, si procede, ejecutar un programa de prueba.

Este caso contrasta con una flag `-D`: incluso cuando la unidad preprocesada coincide, el compilador puede interpretarla de forma distinta. El experimento no pretende modificar el ABI del sistema; cualquier cambio de ABI se estudia solo en artefactos aislados.

**Estado de la sección:** cobertura selectiva de § 3.4, no inventario exhaustivo de opciones. Quedan por cotejar, entre otras, `-aux-info`, `-fcond-mismatch`, `-fgimple`, `-fgnu-tm`, `-flax-vector-conversions` y `-fpermitted-flt-eval-methods`.

[Anterior](24-inline-extensiones-dependencias.md) | [Índice](README.md) | Sección 3.5 pendiente de reconstrucción
