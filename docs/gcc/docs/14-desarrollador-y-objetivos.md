# 3.1 Resumen de opciones - desarrollador de GCC y objetivos

El final de la sección 3.1 abre dos bloques muy grandes: opciones internas o de desarrollador de GCC y opciones específicas por arquitectura u objetivo.

No todas estas opciones son para uso cotidiano. Muchas existen para depurar GCC, inspeccionar pasos internos, controlar pases de optimización o ajustar detalles de una arquitectura concreta.

## Opciones de desarrollador

Opciones representativas:

```sh
-dletters
-dumpmachine
-dumpversion
-dumpspecs
-save-temps
-save-temps=obj
-time
-fdump-tree-all
-fdump-rtl-all
-fopt-info
-fopt-info-vec
-fopt-info-optimized
-fopt-info-missed
```

### Lectura técnica

| Opción | Sentido práctico |
| --- | --- |
| `-dumpmachine` | Muestra la tripleta objetivo de GCC. |
| `-dumpversion` | Muestra la versión base. |
| `-dumpspecs` | Imprime las especificaciones internas usadas por el driver. |
| `-save-temps` | Conserva archivos intermedios: preprocesado, ensamblador, etc. |
| `-time` | Muestra tiempos de las fases ejecutadas. |
| `-fdump-tree-*` | Vuelca representaciones internas de árbol. |
| `-fdump-rtl-*` | Vuelca representaciones RTL. |
| `-fopt-info` | Informa sobre decisiones de optimización. |

## Inspeccionar la tripleta objetivo

```sh
gcc -dumpmachine
```

Ejemplo de salida:

```text
x86_64-pc-linux-gnu
```

Esto ayuda a saber para qué objetivo fue construido GCC.

## Ver versión

```sh
gcc -dumpversion
```

Para información más detallada suele usarse:

```sh
gcc --version
```

## Ver specs internas

```sh
gcc -dumpspecs
```

Las **specs** son reglas internas que el driver usa para decidir cómo invocar herramientas, qué opciones pasar y cómo construir comandos según el objetivo.

Modificar specs es una tarea avanzada.

## Conservar archivos temporales

```sh
gcc -save-temps main.c -o main
```

Puede conservar archivos como:

```text
main.i
main.s
main.o
```

Esto permite inspeccionar la salida del preprocesador y del compilador antes del ensamblado o enlazado.

Con:

```sh
gcc -save-temps=obj -c src/main.c -o build/main.o
```

los temporales se colocan junto a la salida objeto, según la política de GCC.

## Volcados internos

Opciones como:

```sh
-fdump-tree-all
-fdump-rtl-all
```

pueden generar muchos archivos. Se usan para estudiar GCC, depurar optimizaciones o entender cómo transforma el compilador un programa.

Ejemplo:

```sh
gcc -O2 -fdump-tree-optimized main.c -o main
```

Esto puede generar un archivo con representación interna tras optimizaciones de árbol.

## Información de optimización

Opciones representativas:

```sh
-fopt-info
-fopt-info-vec
-fopt-info-optimized
-fopt-info-missed
```

Ejemplo:

```sh
gcc -O2 -fopt-info-vec main.c -o main
```

Puede informar sobre vectorización realizada o no realizada, según el caso.

Para estudiar por qué un bucle no se vectorizó:

```sh
gcc -O3 -fopt-info-vec-missed main.c -o main
```

## Opciones específicas de objetivo

El resumen de GCC incluye familias enormes de opciones por arquitectura. Por ejemplo:

```text
AArch64
ARM
x86
RISC-V
PowerPC
MIPS
AVR
LoongArch
S/390
```

Cada objetivo tiene opciones propias para:

- conjunto de instrucciones;
- extensiones vectoriales;
- ABI;
- modelo de memoria;
- formato de llamada;
- uso de registros;
- generación de instrucciones específicas;
- compatibilidad con procesadores concretos.

## Ejemplos x86

Opciones habituales en x86/x86_64:

```sh
-march=native
-march=x86-64-v3
-mtune=generic
-msse2
-mavx2
-mavx512f
-mno-red-zone
```

| Opción | Sentido |
| --- | --- |
| `-march=` | Selecciona arquitectura/conjunto de instrucciones disponible. |
| `-mtune=` | Ajusta planificación para un procesador sin cambiar necesariamente ISA mínima. |
| `-mno-red-zone` | Desactiva red zone, importante para kernels x86_64. |

Ejemplo para usuario local:

```sh
gcc -O2 -march=native main.c -o main
```

Esto puede generar binarios no portables fuera de esa máquina.

Ejemplo para kernel x86_64:

```sh
gcc -ffreestanding -mno-red-zone -c kernel.c -o kernel.o
```

## Ejemplos RISC-V

Opciones típicas:

```sh
-march=rv64gc
-mabi=lp64d
-mcmodel=medany
```

Ejemplo:

```sh
riscv64-linux-gnu-gcc -march=rv64gc -mabi=lp64d main.c -o main
```

En RISC-V, `-march` y `-mabi` deben ser coherentes.

## Riesgo de portabilidad

Opciones como:

```sh
-march=native
-mavx512f
-mcpu=...
-mabi=...
```

pueden crear binarios que solo funcionen en ciertos procesadores o entornos.

En distribuciones, normalmente se evita compilar paquetes genéricos con opciones demasiado específicas.

## Perfil práctico

Inspeccionar entorno de GCC:

```sh
gcc -dumpmachine
gcc --version
```

Conservar fases intermedias:

```sh
gcc -save-temps main.c -o main
```

Consultar optimización:

```sh
gcc -O2 -fopt-info main.c -o main
```

Compilar para CPU local:

```sh
gcc -O2 -march=native main.c -o main
```

Compilar binario más portable:

```sh
gcc -O2 -mtune=generic main.c -o main
```

## Nota editorial

Las opciones de desarrollador y objetivo son terreno avanzado. En documentación para usuarios conviene distinguir entre:

```text
opciones de uso cotidiano
opciones de diagnóstico del compilador
opciones ABI
opciones de arquitectura
opciones peligrosas para portabilidad
```

[Anterior](13-convenciones-generacion-codigo.md) | [Índice](README.md) | [Siguiente](15-fases-y-sufijos.md)
