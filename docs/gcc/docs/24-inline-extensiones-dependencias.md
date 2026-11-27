# 3.4 — Inline, extensiones y dependencias estructuradas

Fuente primaria: [GCC 16.1.0, § 3.4 — Options Controlling C Dialect](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/C-Dialect-Options.html). Edición técnica selectiva en español, no traducción literal íntegra. Los ejemplos y ejercicios son aportaciones propias; no forman parte del manual original. [Atribución y licencia](00-portada-y-licencia.md).

## Selección de opciones

| Opción | Función |
|---|---|
| `-fgnu89-inline` | Semántica GNU tradicional de inline en modos C99. |
| `-fno-gnu89-inline` | Semántica C99 de inline. |
| `-fms-extensions`, `-fplan9-extensions` | Admiten construcciones no estándar de sus respectivos entornos. |
| `-fdeps-file=`, `-fdeps-format=`, `-fdeps-target=` | Salida, formato y objetivo de información estructurada de dependencias. |

## Ejercicio original: no confundir semántica con optimización

~~~sh
gcc -std=gnu99 -dM -E -x c /dev/null | grep INLINE
gcc -std=gnu99 -fgnu89-inline -dM -E -x c /dev/null | grep INLINE
~~~

Las macros `__GNUC_GNU_INLINE__` y `__GNUC_STDC_INLINE__` permiten distinguir la semántica elegida. Para observar optimización, realizar un segundo ensayo manteniendo el dialecto y variando `-O0` frente a `-O2`. Una función declarada inline no obliga al compilador a insertar su cuerpo.

Las dependencias estructuradas no son equivalentes a una lista de cabeceras producida por `-M`. En el laboratorio inicial recogeremos ambas clases por separado, únicamente si el compilador y el sistema de construcción las emiten. Las extensiones de compatibilidad no se activarán para el kernel sin una razón documentada.

[Anterior](23-keywords-builtins-hosted-freestanding.md) | [Índice](README.md) | [Siguiente](25-signedness-flex-arrays-sso.md)
