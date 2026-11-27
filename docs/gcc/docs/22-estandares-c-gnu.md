# 3.4 — Estándares C y GNU

Fuente primaria: [GCC 16.1.0, § 3.4 — Options Controlling C Dialect](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/C-Dialect-Options.html). Edición técnica selectiva en español, no traducción literal íntegra. Los ejemplos y ejercicios son aportaciones propias; no forman parte del manual original. [Atribución y licencia](00-portada-y-licencia.md).

## Correspondencias

| ISO | Dialecto GNU |
|---|---|
| `c90` | `gnu90` / `gnu89` |
| `c99` | `gnu99` |
| `c11` | `gnu11` |
| `c17` / `c18` | `gnu17` / `gnu18` |
| `c23` | `gnu23` |
| `c2y` (experimental) | `gnu2y` (experimental) |

GCC 16.1 usa `gnu23` por defecto para C. No extrapolar ese valor a GCC anteriores.

## Ejercicio original: observar las macros del dialecto

~~~sh
for dialecto in c11 gnu11 c17 gnu17 c23 gnu23; do
    gcc -std="$dialecto" -E -dM -x c /dev/null > "$dialecto.macros" || break
done
diff -u c11.macros gnu11.macros
diff -u gnu11.macros gnu23.macros
~~~

Buscar `__STDC_VERSION__` y `__STRICT_ANSI__`. El valor de la primera no identifica por sí solo si se habilitan extensiones GNU; la segunda permite observar diferencias de modo en GCC. Si el compilador no admite un dialecto, registrar la limitación sin cambiar la herramienta durante el ensayo.

En un paquete real, las cabeceras pueden leer macros predefinidas y cambiar declaraciones visibles. Por tanto, observar la lista de macros y repetir con la cabecera real, no inferir el resultado solo desde el nombre de la opción.

[Anterior](21-dialecto-c-ansi-std.md) | [Índice](README.md) | [Siguiente](23-keywords-builtins-hosted-freestanding.md)
