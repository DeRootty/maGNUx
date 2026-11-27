# G02 — Del símbolo Kconfig a Kbuild y GCC

> [⬆ Laboratorio](README.md) · [🏠 Inicio](../../../README.md)

**Estado:** protocolo no ejecutado. Objetivo de fuentes: Linux 6.18.65, no el catálogo 6.18.25.

## Elegir una unidad real

Primer candidato: `CONFIG_SECCOMP`. Confirmar en el árbol exacto su definición, dependencias y selección de objetos. No asumir que una referencia de Linux 6.12 sigue idéntica.

~~~sh
# Dentro del árbol de fuentes, solo lectura:
make -s kernelversion
git rev-parse HEAD  # si el árbol es un checkout Git
grep -nE '^[[:space:]]*(config|menuconfig) SECCOMP(_FILTER)?([[:space:]]|$)' arch/Kconfig
grep -n 'CONFIG_SECCOMP' kernel/Makefile
grep -n 'CONFIG_SECCOMP' kernel/seccomp.c
~~~

Si la ubicación cambió, localizar con `git grep` o `grep -R` sobre Kconfig y Makefiles. Registrar líneas y hash de cada fichero. `CONFIG_SECCOMP_FILTER` u otros símbolos derivados pueden cambiar al variar la decisión principal: no son variables independientes.

## Dos configuraciones aisladas

Usar un árbol de fuentes limpio, no el directorio de compilación de la máquina en uso. Crear dos directorios externos mediante `mktemp -d`; copiar en ambos la misma configuración base validada para amd64. Ejecutar `scripts/config --file "$A/.config" --disable SECCOMP` y `scripts/config --file "$B/.config" --enable SECCOMP`, después `make O="$A" ARCH=x86 olddefconfig` y la orden equivalente para B. Revisar los valores efectivos y `scripts/diffconfig "$A/.config" "$B/.config"`. Si Kconfig no permite la variante, detener el ensayo y explicar la dependencia, no forzar macros.

## Evidencia de construcción

Para cada variante, guardar salida de `make O="$A" ARCH=x86 V=1 -j2 vmlinux` (o B), código de retorno y logs; puede requerir bastante tiempo y almacenamiento. No instalar el kernel, no actualizar GRUB, no modificar el sistema activo. Se registrará compilador, enlazador, arquitectura, configuración y variables de construcción. El éxito de vmlinux por sí solo no prueba presencia de una capacidad: examinar lista de objetos, archivos `.cmd` y símbolos.

En una compilación correcta, comprobar si `kernel/seccomp.o` y `kernel/.seccomp.o.cmd` existen en el directorio externo. La ausencia solo es evidencia si la construcción llegó al punto pertinente con éxito y no había objetos residuales. Si Kbuild selecciona o descarta una unidad completa, la comparación de código preprocesado se aplica únicamente a las unidades comunes o a una inspección diagnóstica separada.

Para inspección de la fuente en el caso seleccionado, intentar `make O="$B" ARCH=x86 V=1 kernel/seccomp.i` después de preparar las fuentes y configuración; un objetivo explícito de archivo puede forzar su elaboración y **no** demuestra que el objeto participe en una compilación normal. Conservar su salida y orden efectiva. No utilizar `gcc -E kernel/seccomp.c` sin las opciones y cabeceras generadas de Kbuild.

Diferenciar:
- selección de unidades por Kbuild;
- macros de configuración generadas (por ejemplo `include/generated/autoconf.h` en el directorio de salida);
- inclusión condicional y ramas del código;
- optimización y selección de instrucciones;
- incorporación al artefacto final.

## Referencias

[Kconfig](https://docs.kernel.org/6.18/kbuild/kconfig-language.html) · [Kbuild Makefiles](https://docs.kernel.org/6.18/kbuild/makefiles.html) · [G01](01-traza-gcc.md).

[Siguiente: G03](03-traza-portage.md)
