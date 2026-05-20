# 1. Lenguajes de programación soportados por GCC

GCC significa **GNU Compiler Collection**. GCC es una distribución integrada de compiladores para varios lenguajes de programación importantes. Actualmente incluye lenguajes como C, C++, Objective-C, Objective-C++, Fortran, Ada, D y Go.

La abreviatura **GCC** ha tenido varios significados en el uso común. El significado oficial actual es **GNU Compiler Collection**, que se refiere de manera genérica al conjunto completo de herramientas. Históricamente, el nombre significaba **GNU C Compiler**, y ese uso sigue siendo habitual cuando el énfasis está en compilar programas escritos en C. Finalmente, el nombre también se usa para hablar del componente independiente del lenguaje dentro de GCC: el código compartido entre los compiladores de todos los lenguajes soportados.

## Componente independiente del lenguaje

El componente independiente del lenguaje incluye la mayor parte de los optimizadores y también los **back ends**, encargados de generar código máquina para distintos procesadores.

En una lectura de sistemas, esto significa que GCC separa varios planos:

- el lenguaje fuente, tratado por un **front end**;
- las optimizaciones y representaciones internas comunes;
- la generación de código para una arquitectura objetivo, realizada por un **back end**;
- la coordinación global de fases: preprocesado, compilación, ensamblado y enlazado.

## Front ends

La parte de un compilador específica de un lenguaje concreto se denomina **front end**. Además de los front ends integrados en GCC, existen otros mantenidos por separado. Para usarlos, normalmente deben construirse junto con GCC propiamente dicho.

La mayoría de los compiladores para lenguajes distintos de C tienen sus propios nombres. Por ejemplo:

| Lenguaje | Herramienta habitual |
| --- | --- |
| C | `gcc` |
| C++ | `g++` |
| COBOL | `gcobol` |
| Ada | `GNAT` |
| Fortran | `gfortran` |

Cuando se habla de compilar uno de esos lenguajes, puede hacerse referencia al compilador por su propio nombre o al conjunto como GCC. Ambas formas pueden ser correctas según el contexto.

## Nota histórica: compiladores frente a preprocesadores

Históricamente, algunos compiladores de lenguajes como C++ o Fortran se implementaron como "preprocesadores" que emitían otro lenguaje de alto nivel, por ejemplo C. Los compiladores incluidos en GCC no se implementan de ese modo: generan código máquina directamente.

Ese tipo de preprocesador histórico no debe confundirse con el **preprocesador de C**, que sí es una característica integral de los lenguajes C, C++, Objective-C y Objective-C++.

## Lectura práctica

Una orden como:

```sh
gcc programa.c -o programa
```

no debe leerse como una simple conversión textual de C a binario. En condiciones normales, `gcc` actúa como **driver de compilación** y coordina varias fases:

1. preprocesado del archivo fuente;
2. compilación a ensamblador o representación intermedia;
3. ensamblado a archivo objeto;
4. enlazado con bibliotecas y objetos de arranque;
5. producción del ejecutable final.

[Anterior](00-portada-y-licencia.md) | [Índice](README.md) | [Siguiente](02-estandares-lenguaje.md)
