# G01 — De una macro al objeto compilado

> [⬆ Laboratorio](README.md) · [🏠 Inicio](../../../README.md)

## Objeto

Aislar el efecto de `-DFEATURE=0` frente a `-DFEATURE=1`. No es una USE flag ni un símbolo Kconfig: es un control mínimo para aprender a observar el compilador antes de estudiar mecanismos de construcción complejos.

Se usan tres fuentes originales: [config.h](g01/config.h), [feature.h](g01/feature.h) y [demo.c](g01/demo.c). El programa exporta `run(unsigned)` y no necesita enlazarse a un ejecutable para estudiar el objeto.

## Ejecución

Desde esta carpeta de un clon local:

~~~sh
bash g01/trace.sh
# Opcional: GCC concreto, sin alterar el compilador del sistema:
CC=gcc bash g01/trace.sh
~~~

El script copia las fuentes a un directorio temporal nuevo, guarda comandos, versión, macros, inclusiones, dependencias, `.i`, volcados GIMPLE, ensamblador, objetos y desensamblado. No requiere root ni instala software. Requiere Bash, GCC, GNU binutils y utilidades básicas. La opción CC es el nombre o ruta de un ejecutable, no una cadena de opciones.

| Archivo | Qué observar |
|---|---|
| headers.txt | Árbol real de inclusiones |
| macros.txt | Definiciones al final del preprocesamiento |
| deps.mk | Cabeceras de las que depende el objeto |
| demo.i | Fuente preprocesada apta para compilar |
| *.gimple / *.optimized | Representaciones intermedias y transformaciones |
| demo.s | Ensamblador |
| demo.o / disassembly.txt | Objeto y código máquina desensamblado |
| commands.log | Órdenes reproducidas con sus argumentos |
| diff/*.diff | Diferencias textuales; no equivalencia semántica automática |

No usar `-dM` o `-dD` como sustituto del archivo `.i` ordinario. El flujo conserva ese archivo y lo entrega a GCC en una operación independiente, manteniendo el dialecto y la optimización. `-H` escribe la traza en stderr; `-M` emite dependencias y no el fuente preprocesado ordinario.

## Resultado de referencia observado

Prueba equivalente ejecutada el 27-11-2026 en entorno Debian, GCC 14.2.0-19, objetivo x86-64. No es un resultado de Gentoo ni GCC 16.1.

| Aspecto | FEATURE=0 | FEATURE=1 |
|---|---|---|
| Cabeceras del proyecto | config.h | config.h, feature.h |
| Dependencias | sin feature.h | con feature.h |
| Expresión efectiva (lectura del código) | n + 1 | n * 7 + 7 |
| Ensamblador observado | suma de 1 mediante LEA | secuencia ADD, LEA, SUB |
| Volcados generados | GIMPLE, optimized | GIMPLE, optimized |

La elección de instrucciones es un resultado local, no una garantía de GCC. Se observó la creación de los volcados, no se auditó aún cada pasada. Se espera reproducir el ensayo en Gentoo, registrar el resultado y añadir una comparación secundaria `-O0` / `-O2` con FEATURE fija. No confundir una diferencia de rutas o identificadores de etiquetas con un cambio semántico.

## Referencias

[Manual GCC § 3.2](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Overall-Options.html) · [§ 3.14](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Preprocessor-Options.html) · [§ 3.19](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Developer-Options.html) · [Lectura técnica en español: preprocesador](../../gcc/docs/10-preprocesador-y-dependencias.md) · [Fases](../../gcc/docs/17-detener-cadena-c-s-e.md).

[Siguiente: G02](02-traza-kbuild.md)
