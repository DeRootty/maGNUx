# 1. Lenguajes de programación admitidos por GCC

> [Índice del manual](README.md) · [Aula de integración](../README.md) · [Edición y licencia](00-edicion-y-licencia.md)

**Estado:** texto completo del capítulo (prosa y referencias). Traducción no oficial asistida por IA, pendiente de revisión humana.  
**Original:** [gcc/doc/frontends.texi](https://github.com/gcc-mirror/gcc/blob/releases/gcc-16.1.0/gcc/doc/frontends.texi) · GCC 16.1.0 · blob `97e49f4e1165185eda3260712dd5461d2ad07b52`.  
Copyright © 1988–2026 Free Software Foundation, Inc. GFDL 1.3 o posterior; véase [avisos y licencia](00-edicion-y-licencia.md).

GCC son las siglas de «GNU Compiler Collection» (Colección de Compiladores GNU). GCC es una distribución integrada de compiladores para varios lenguajes de programación importantes. En la actualidad, estos lenguajes incluyen C, C++, Objective-C, Objective-C++, Fortran, Ada, D y Go.

La abreviatura GCC tiene varios significados de uso común. El significado oficial actual es «GNU Compiler Collection», que designa genéricamente el conjunto completo de herramientas. Históricamente, el nombre significaba «GNU C Compiler» (Compilador C de GNU), y este uso sigue siendo común cuando se pone el énfasis en compilar programas C. Por último, el nombre también se utiliza al hablar del componente de GCC independiente del lenguaje: el código compartido entre los compiladores de todos los lenguajes admitidos.

El componente de GCC independiente del lenguaje incluye la mayoría de los optimizadores, así como los «backends» que generan código máquina para distintos procesadores.

La parte de un compilador específica de un lenguaje determinado se denomina «frontal» (*front end*). Además de los frontales que son componentes integrados de GCC, hay otros varios que se mantienen por separado. Estos admiten lenguajes como Mercury. Para utilizarlos, deben construirse junto con GCC propiamente dicho.

La mayoría de los compiladores de lenguajes distintos de C tienen sus propios nombres. El compilador de C++ es G++, el de COBOL es gcobol, el de Ada es GNAT, y así sucesivamente. Cuando hablamos de compilar uno de esos lenguajes, podemos referirnos al compilador por su propio nombre o como GCC. Ambas formas son correctas.

Históricamente, los compiladores de muchos lenguajes, incluidos C++ y Fortran, se han implementado como «preprocesadores» que emiten otro lenguaje de alto nivel, como C. Ninguno de los compiladores incluidos en GCC está implementado de ese modo; todos generan código máquina directamente. Este tipo de preprocesador no debe confundirse con el preprocesador de C, que es una característica integral de los lenguajes C, C++, Objective-C y Objective-C++.

---

[Índice](README.md) · [Siguiente: capítulo 2](02-estandares.md)
