# 3. Opciones de línea de órdenes de GCC

> [Índice del manual](README.md) · [Aula de integración](../README.md) · [Edición y licencia](00-edicion-y-licencia.md)

**Estado:** introducción del capítulo traducida; las secciones se contabilizan individualmente. Traducción no oficial asistida por IA, pendiente de revisión humana.  
**Original:** [gcc/doc/invoke.texi](https://github.com/gcc-mirror/gcc/blob/releases/gcc-16.1.0/gcc/doc/invoke.texi) · GCC 16.1.0 · blob `9207a021e64224b74d5019719c3d7e39a2663807`.  
Copyright © 1988–2026 Free Software Foundation, Inc. GFDL 1.3 o posterior; véase [avisos y licencia](00-edicion-y-licencia.md).

Cuando invoca GCC, normalmente realiza el preprocesamiento, la compilación, el ensamblado y el enlace. Las «opciones generales» permiten detener este proceso en una etapa intermedia. Por ejemplo, la opción `-c` indica que no se ejecute el enlazador. En ese caso, el resultado consiste en archivos objeto producidos por el ensamblador. Véase [opciones que controlan el tipo de salida](03-02-tipo-salida.md).

Otras opciones se transmiten a una o más etapas del procesamiento. Algunas controlan el preprocesador y otras el propio compilador. Otras controlan el ensamblador y el enlazador; la mayoría de estas no se documenta aquí, puesto que raramente es necesario utilizarlas.

La mayoría de las opciones de línea de órdenes que puede utilizar con GCC son útiles para programas C; cuando una opción solo es útil con otro lenguaje (normalmente C++), la explicación lo indica explícitamente. Si la descripción de una opción concreta no menciona un lenguaje fuente, puede utilizar esa opción con todos los lenguajes admitidos.

La manera habitual de ejecutar GCC consiste en ejecutar el programa llamado `gcc`, o `machine-gcc` al realizar compilación cruzada, o `machine-gcc-version` para ejecutar una versión específica de GCC. Cuando compile programas C++, debería invocar GCC como `g++`. Véase [compilación de programas C++](03-03-compilar-cpp.md), para información sobre las diferencias de comportamiento entre `gcc` y `g++` al compilar programas C++.

El programa `gcc` acepta opciones y nombres de archivo como operandos. Muchas opciones tienen nombres de varias letras; por tanto, no pueden agruparse varias opciones de una sola letra: `-dv` es muy distinto de `-d -v`.

Puede mezclar opciones y otros argumentos. Por lo general, no importa el orden que utilice. El orden sí importa cuando utiliza varias opciones de la misma clase; por ejemplo, si especifica `-L` más de una vez, los directorios se buscan en el orden especificado. También es significativa la posición de la opción `-l`.

Muchas opciones tienen nombres largos que comienzan por `-f` o `-W`; por ejemplo, `-fmove-loop-invariants`, `-Wformat`, etc. La mayoría de ellas tiene una forma positiva y otra negativa; la forma negativa de `-ffoo` es `-fno-foo`. Este manual solo documenta una de estas dos formas, la que no sea la predeterminada.

Algunas opciones admiten uno o más argumentos, normalmente separados del nombre de la opción por un espacio o por el signo igual (`=`). A menos que se documente lo contrario, un argumento puede ser numérico o una cadena. Normalmente, los argumentos numéricos deben ser enteros decimales o hexadecimales pequeños y sin signo. Los argumentos hexadecimales deben comenzar por el prefijo `0x`. Los argumentos de opciones que especifican algún tipo de umbral de tamaño pueden ser enteros decimales o hexadecimales arbitrariamente grandes, seguidos de un sufijo de tamaño en bytes que designe un múltiplo de bytes, como `kB` y `KiB` para kilobyte y kibibyte, respectivamente, `MB` y `MiB` para megabyte y mebibyte, `GB` y `GiB` para gigabyte y gibibyte, y así sucesivamente. Estos argumentos se designan mediante `byte-size` en el texto siguiente.

Consulte al NIST, la IEC y otros estándares nacionales e internacionales pertinentes para obtener la lista completa y la explicación de los prefijos binarios y decimales de tamaños en bytes.

Véase «Option Index» en el [manual original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/) para el índice de opciones de GCC.

---

[Anterior: capítulo 2](02-estandares.md) · [Índice de secciones del capítulo 3](README.md) · [Siguiente: 3.1 — Resumen de opciones](03-01-resumen-opciones.md)
