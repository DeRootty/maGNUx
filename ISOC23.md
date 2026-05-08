>[Inicio](README.md)

# Referencia estructurada de ANSI C / ISO C actual — ISO/IEC 9899:2024 (C23)

> Documento de trabajo en formato Markdown.
>
> Propósito: ofrecer un equivalente conceptual a un listado de mnemónicos ISA, pero aplicado al lenguaje C.
> En C no existen “mnemónicos” como en ensamblador; lo equivalente son sus **palabras clave**, **operadores**, **directivas de preprocesador**, **cabeceras estándar**, **tipos**, **macros** y **funciones de biblioteca estándar**.

* Fuente: [ANSI C / ISO C](https://www.iso.org/es/contents/data/standard/08/20/82075.html?utm_source=chatgpt.com)

---

## 1. Norma de referencia

| Elemento | Valor |
|---|---|
| Norma oficial actual | ISO/IEC 9899:2024 |
| Nombre común | C23 |
| Organismo | ISO/IEC JTC 1/SC 22/WG14 |
| Edición | 5 |
| Publicación | 2024-10 |
| Sustituye a | ISO/IEC 9899:2018, C17/C18 |
| Campo | Lenguaje de programación C |

La norma define la forma e interpretación de los programas escritos en C: sintaxis, restricciones, reglas semánticas, representación de entrada/salida y límites/restricciones de una implementación conforme.

---

## 2. Equivalencia conceptual con ASM / ISA

| En una ISA como x86-64 o RISC-V | En ISO C |
|---|---|
| ISA | Estándar del lenguaje C |
| Mnemónico de instrucción | Palabra clave, operador o función estándar |
| Manual de instrucciones | ISO/IEC 9899:2024 |
| Extensiones ISA | Extensiones del compilador, fuera del estándar |
| Registros CPU | Objetos, tipos, almacenamiento y modelo abstracto de máquina |
| Instrucciones privilegiadas | No aplica directamente; C no define kernel ni CPU |
| ABI / Calling convention | Fuera de ISO C; depende de plataforma y compilador |

---

## 3. Palabras clave del lenguaje C

### 3.1 Palabras clave clásicas heredadas de C90/C99/C11/C17

| Palabra clave | Categoría | Uso resumido |
|---|---|---|
| `auto` | especificador de almacenamiento | duración automática; históricamente implícito en variables locales |
| `break` | sentencia de control | sale de `switch`, `for`, `while` o `do while` |
| `case` | etiqueta | rama dentro de `switch` |
| `char` | tipo básico | carácter / entero pequeño |
| `const` | cualificador de tipo | objeto no modificable mediante ese lvalue |
| `continue` | sentencia de control | salta a la siguiente iteración de un bucle |
| `default` | etiqueta | rama por defecto de `switch` |
| `do` | sentencia de iteración | bucle `do ... while` |
| `double` | tipo real | coma flotante de doble precisión |
| `else` | sentencia de selección | rama alternativa de `if` |
| `enum` | declaración de tipo | tipo enumerado |
| `extern` | especificador de almacenamiento | enlace externo / declaración de objeto o función externa |
| `float` | tipo real | coma flotante de precisión simple |
| `for` | sentencia de iteración | bucle con inicialización, condición e iteración |
| `goto` | sentencia de salto | salto a etiqueta |
| `if` | sentencia de selección | bifurcación condicional |
| `inline` | especificador de función | sugiere/define semántica de función inline |
| `int` | tipo básico | entero con tamaño natural de implementación |
| `long` | modificador de tipo | entero o flotante extendido según combinación |
| `register` | especificador de almacenamiento | sugerencia histórica de almacenamiento en registro |
| `restrict` | cualificador de puntero | promesa de no aliasing para optimización |
| `return` | sentencia de salto | devuelve control y opcionalmente valor |
| `short` | modificador de tipo | entero corto |
| `signed` | modificador de tipo | entero con signo |
| `sizeof` | operador | tamaño en bytes de tipo u objeto |
| `static` | especificador de almacenamiento | duración estática o enlace interno según contexto |
| `struct` | declaración de tipo | agregado con miembros nombrados |
| `switch` | sentencia de selección | selección por valor entero |
| `typedef` | declaración | crea alias de tipo |
| `union` | declaración de tipo | agregado con almacenamiento compartido |
| `unsigned` | modificador de tipo | entero sin signo |
| `void` | tipo especial | ausencia de valor / puntero genérico `void *` |
| `volatile` | cualificador de tipo | acceso observable; evita ciertas optimizaciones |
| `while` | sentencia de iteración | bucle condicional |

### 3.2 Palabras clave introducidas o normalizadas en revisiones modernas

| Palabra clave | Desde | Uso resumido |
|---|---:|---|
| `_Alignas` | C11 | especificador de alineación |
| `_Alignof` | C11 | consulta de alineación |
| `_Atomic` | C11 | tipo/operaciones atómicas |
| `_Bool` | C99 | tipo booleano básico |
| `_Complex` | C99 | tipo complejo |
| `_Generic` | C11 | selección genérica en tiempo de compilación |
| `_Imaginary` | C99 | tipo imaginario, reservado/obsolescente en la práctica |
| `_Noreturn` | C11 | función que no retorna |
| `_Static_assert` | C11 | aserción en tiempo de traducción |
| `_Thread_local` | C11 | almacenamiento local por hilo |
| `alignas` | C23 | forma sin guion bajo para alineación |
| `alignof` | C23 | forma sin guion bajo para consulta de alineación |
| `bool` | C23 | nombre estándar del tipo booleano |
| `constexpr` | C23 | especificador para objetos constantes evaluables en traducción |
| `false` | C23 | constante booleana falsa |
| `nullptr` | C23 | constante de puntero nulo |
| `static_assert` | C23 | forma sin guion bajo de aserción estática |
| `thread_local` | C23 | forma sin guion bajo para almacenamiento local por hilo |
| `true` | C23 | constante booleana verdadera |
| `typeof` | C23 | deducción del tipo de una expresión |
| `typeof_unqual` | C23 | deducción del tipo sin cualificadores |

> Nota: algunos nombres existían antes como macros en cabeceras estándar o como extensiones de compilador; C23 los normaliza dentro del lenguaje.

---

## 4. Operadores de C

### 4.1 Operadores aritméticos

| Operador | Nombre | Uso |
|---|---|---|
| `+` | suma / signo positivo | suma aritmética o promoción unaria |
| `-` | resta / negación | resta aritmética o negación unaria |
| `*` | multiplicación / indirección | multiplicación o acceso mediante puntero |
| `/` | división | división entera o real |
| `%` | módulo | resto de división entera |
| `++` | incremento | preincremento o postincremento |
| `--` | decremento | predecremento o postdecremento |

### 4.2 Operadores relacionales y de igualdad

| Operador | Nombre |
|---|---|
| `==` | igual a |
| `!=` | distinto de |
| `<` | menor que |
| `>` | mayor que |
| `<=` | menor o igual |
| `>=` | mayor o igual |

### 4.3 Operadores lógicos

| Operador | Nombre |
|---|---|
| `!` | negación lógica |
| `&&` | AND lógico con cortocircuito |
| `||` | OR lógico con cortocircuito |

### 4.4 Operadores bit a bit

| Operador | Nombre |
|---|---|
| `~` | NOT bit a bit |
| `&` | AND bit a bit / dirección de objeto |
| `|` | OR bit a bit |
| `^` | XOR bit a bit |
| `<<` | desplazamiento a la izquierda |
| `>>` | desplazamiento a la derecha |

### 4.5 Operadores de asignación

| Operador | Nombre |
|---|---|
| `=` | asignación simple |
| `+=` | suma y asigna |
| `-=` | resta y asigna |
| `*=` | multiplica y asigna |
| `/=` | divide y asigna |
| `%=` | módulo y asigna |
| `&=` | AND bit a bit y asigna |
| `|=` | OR bit a bit y asigna |
| `^=` | XOR bit a bit y asigna |
| `<<=` | desplaza izquierda y asigna |
| `>>=` | desplaza derecha y asigna |

### 4.6 Operadores de punteros, miembros y objetos

| Operador | Nombre | Uso |
|---|---|---|
| `&` | dirección de | obtiene puntero a un objeto o función |
| `*` | indirección | accede al objeto apuntado |
| `.` | miembro directo | accede a miembro de `struct` o `union` |
| `->` | miembro por puntero | accede a miembro desde puntero |
| `[]` | subíndice | acceso a elemento de array |
| `()` | llamada / agrupación | llamada a función o agrupación de expresiones |

### 4.7 Otros operadores

| Operador | Nombre | Uso |
|---|---|---|
| `sizeof` | tamaño | tamaño en bytes |
| `alignof` / `_Alignof` | alineación | alineación requerida |
| `(tipo)` | conversión explícita | cast |
| `?:` | condicional | selección ternaria |
| `,` | coma | evalúa expresiones de izquierda a derecha |
| `_Generic` | selección genérica | selección por tipo en tiempo de traducción |

---

## 5. Directivas de preprocesador

| Directiva | Uso |
|---|---|
| `#include` | inserta cabeceras o archivos |
| `#define` | define macros |
| `#undef` | elimina definición de macro |
| `#if` | compilación condicional |
| `#ifdef` | condicional si macro definida |
| `#ifndef` | condicional si macro no definida |
| `#elif` | rama alternativa condicional |
| `#elifdef` | C23: rama si macro definida |
| `#elifndef` | C23: rama si macro no definida |
| `#else` | rama alternativa final |
| `#endif` | fin de bloque condicional |
| `#error` | emite error de traducción |
| `#warning` | C23: emite advertencia de traducción |
| `#pragma` | directiva específica de implementación |
| `#line` | ajusta número de línea/nombre de archivo |
| `#embed` | C23: inclusión de recurso binario en traducción |

---

## 6. Tipos fundamentales

| Familia | Tipos / formas |
|---|---|
| Booleano | `bool`, `_Bool` |
| Caracteres | `char`, `signed char`, `unsigned char`, `char8_t`, `char16_t`, `char32_t`, `wchar_t` |
| Enteros con signo | `signed char`, `short`, `int`, `long`, `long long` |
| Enteros sin signo | `unsigned char`, `unsigned short`, `unsigned int`, `unsigned long`, `unsigned long long` |
| Coma flotante real | `float`, `double`, `long double` |
| Coma flotante decimal | `_Decimal32`, `_Decimal64`, `_Decimal128` si la implementación lo soporta |
| Complejos | `float _Complex`, `double _Complex`, `long double _Complex` |
| Vacío | `void` |
| Punteros | `T *`, `void *`, punteros a función |
| Agregados | `struct`, `union`, arrays |
| Enumerados | `enum` |
| Atómicos | `_Atomic(T)` |

---

## 7. Especificadores y cualificadores de tipo

| Elemento | Categoría | Uso |
|---|---|---|
| `const` | cualificador | acceso no modificable |
| `volatile` | cualificador | acceso observable |
| `restrict` | cualificador | no aliasing mediante ese puntero |
| `_Atomic` | cualificador/especificador | objeto atómico |
| `signed` | especificador | entero con signo |
| `unsigned` | especificador | entero sin signo |
| `short` | especificador | entero corto |
| `long` | especificador | entero largo o `long double` |
| `typeof` | especificador | toma tipo de expresión |
| `typeof_unqual` | especificador | toma tipo sin cualificadores |
| `constexpr` | especificador | constante evaluable en traducción |

---

## 8. Especificadores de almacenamiento

| Especificador | Uso |
|---|---|
| `auto` | almacenamiento automático |
| `register` | sugerencia histórica; restricciones sobre dirección |
| `static` | duración estática / enlace interno |
| `extern` | enlace externo / declaración |
| `thread_local` / `_Thread_local` | duración por hilo |
| `typedef` | alias de tipo |

---

## 9. Cabeceras estándar de C

### 9.1 Cabeceras clásicas

| Cabecera | Área |
|---|---|
| `<assert.h>` | aserciones |
| `<ctype.h>` | clasificación y conversión de caracteres |
| `<errno.h>` | códigos de error |
| `<float.h>` | límites de coma flotante |
| `<limits.h>` | límites de enteros |
| `<locale.h>` | localización |
| `<math.h>` | matemáticas |
| `<setjmp.h>` | saltos no locales |
| `<signal.h>` | señales |
| `<stdarg.h>` | argumentos variables |
| `<stddef.h>` | definiciones comunes: `size_t`, `ptrdiff_t`, `NULL` |
| `<stdio.h>` | entrada/salida |
| `<stdlib.h>` | utilidades generales, memoria, conversión |
| `<string.h>` | cadenas y memoria |
| `<time.h>` | tiempo y fechas |

### 9.2 Cabeceras añadidas en C95/C99/C11/C23 o revisiones posteriores

| Cabecera | Área |
|---|---|
| `<complex.h>` | números complejos |
| `<fenv.h>` | entorno de coma flotante |
| `<inttypes.h>` | formatos y utilidades para enteros de anchura fija |
| `<iso646.h>` | grafías alternativas de operadores |
| `<stdbool.h>` | booleanos; en C23 algunos nombres pasan al lenguaje |
| `<stdint.h>` | enteros de anchura fija |
| `<tgmath.h>` | matemáticas genéricas por tipo |
| `<uchar.h>` | caracteres Unicode de tamaño fijo |
| `<wchar.h>` | caracteres anchos |
| `<wctype.h>` | clasificación de caracteres anchos |
| `<stdalign.h>` | alineación; afectada por C23 |
| `<stdatomic.h>` | operaciones atómicas |
| `<stdnoreturn.h>` | `_Noreturn`; afectada por C23 |
| `<threads.h>` | hilos estándar C |
| `<stdbit.h>` | C23: utilidades de bits |
| `<stdckdint.h>` | C23: aritmética entera comprobada |

---

## 10. Funciones representativas de la biblioteca estándar

### 10.1 Entrada/salida — `<stdio.h>`

| Función / macro | Uso |
|---|---|
| `printf`, `fprintf`, `sprintf`, `snprintf` | salida formateada |
| `scanf`, `fscanf`, `sscanf` | entrada formateada |
| `putchar`, `puts`, `fputs`, `fputc` | salida de caracteres/cadenas |
| `getchar`, `gets_s`*, `fgets`, `fgetc` | entrada de caracteres/cadenas |
| `fopen`, `freopen`, `fclose` | gestión de archivos |
| `fread`, `fwrite` | E/S binaria |
| `fseek`, `ftell`, `rewind` | posición de archivo |
| `fflush` | vaciado de buffer |
| `perror` | mensaje asociado a `errno` |
| `EOF`, `FILE` | macro/tipo estándar |

\* `gets` fue retirada; `gets_s` pertenece a interfaces de comprobación de límites cuando están disponibles.

### 10.2 Memoria y utilidades — `<stdlib.h>`

| Función / macro | Uso |
|---|---|
| `malloc`, `calloc`, `realloc`, `free` | memoria dinámica |
| `aligned_alloc` | memoria con alineación específica |
| `exit`, `abort`, `atexit`, `quick_exit` | terminación de programa |
| `getenv`, `system` | entorno y comandos del sistema |
| `atoi`, `atol`, `atoll` | conversión simple de cadenas |
| `strtol`, `strtoul`, `strtoll`, `strtoull` | conversión robusta de enteros |
| `strtof`, `strtod`, `strtold` | conversión de coma flotante |
| `qsort`, `bsearch` | ordenación y búsqueda |
| `rand`, `srand` | pseudoaleatoriedad clásica |
| `EXIT_SUCCESS`, `EXIT_FAILURE` | códigos portables de salida |

### 10.3 Cadenas y memoria — `<string.h>`

| Función | Uso |
|---|---|
| `memcpy` | copia memoria sin solapamiento |
| `memmove` | copia memoria con posible solapamiento |
| `memset` | rellena memoria |
| `memcmp` | compara bloques de memoria |
| `memchr` | busca byte en memoria |
| `strcpy`, `strncpy` | copia cadenas |
| `strcat`, `strncat` | concatena cadenas |
| `strcmp`, `strncmp` | compara cadenas |
| `strlen` | longitud de cadena |
| `strchr`, `strrchr` | busca carácter |
| `strstr` | busca subcadena |
| `strtok` | tokenización |
| `strerror` | descripción de error |

### 10.4 Matemáticas — `<math.h>`

| Familia | Ejemplos |
|---|---|
| trigonometría | `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `atan2` |
| hiperbólicas | `sinh`, `cosh`, `tanh` |
| exponenciales/logaritmos | `exp`, `exp2`, `log`, `log10`, `log2` |
| potencias/raíces | `pow`, `sqrt`, `cbrt`, `hypot` |
| redondeo | `ceil`, `floor`, `trunc`, `round`, `nearbyint`, `rint` |
| clasificación | `isfinite`, `isinf`, `isnan`, `isnormal` |
| comparación FP | `isgreater`, `isless`, `isunordered` |
| resto | `fmod`, `remainder`, `remquo` |
| manipulación FP | `frexp`, `ldexp`, `modf`, `scalbn`, `copysign` |

### 10.5 Enteros de anchura fija — `<stdint.h>`

| Tipo / macro | Uso |
|---|---|
| `int8_t`, `int16_t`, `int32_t`, `int64_t` | enteros con signo de anchura exacta |
| `uint8_t`, `uint16_t`, `uint32_t`, `uint64_t` | enteros sin signo de anchura exacta |
| `intptr_t`, `uintptr_t` | enteros capaces de contener punteros |
| `intmax_t`, `uintmax_t` | enteros máximos disponibles |
| `INT8_MAX`, `UINT64_MAX`, etc. | límites |
| `INT32_C`, `UINT64_C` | constantes con tipo adecuado |

### 10.6 Tipos y macros comunes — `<stddef.h>`

| Elemento | Uso |
|---|---|
| `size_t` | tamaño de objetos |
| `ptrdiff_t` | diferencia entre punteros |
| `nullptr_t` | C23: tipo de `nullptr` |
| `NULL` | constante de puntero nulo |
| `offsetof` | desplazamiento de miembro en estructura |
| `max_align_t` | tipo con máxima alineación fundamental |

### 10.7 Booleanos — `<stdbool.h>`

| Elemento | Uso |
|---|---|
| `bool` | tipo booleano, integrado en C23 |
| `true` | valor verdadero |
| `false` | valor falso |
| `__bool_true_false_are_defined` | macro histórica |

### 10.8 Atómicos — `<stdatomic.h>`

| Elemento | Uso |
|---|---|
| `atomic_bool`, `atomic_int`, etc. | tipos atómicos convenientes |
| `atomic_load`, `atomic_store` | carga/almacenamiento atómico |
| `atomic_exchange` | intercambio atómico |
| `atomic_compare_exchange_*` | compare-and-swap |
| `atomic_fetch_add`, `atomic_fetch_sub` | operaciones read-modify-write |
| `memory_order_relaxed` | orden relajado |
| `memory_order_acquire` | adquisición |
| `memory_order_release` | liberación |
| `memory_order_acq_rel` | adquisición/liberación |
| `memory_order_seq_cst` | consistencia secuencial |

### 10.9 Hilos — `<threads.h>`

| Elemento | Uso |
|---|---|
| `thrd_t` | identificador de hilo |
| `thrd_create`, `thrd_join`, `thrd_detach` | ciclo de vida de hilos |
| `mtx_t` | mutex |
| `mtx_init`, `mtx_lock`, `mtx_unlock`, `mtx_destroy` | gestión de mutex |
| `cnd_t` | variable de condición |
| `cnd_wait`, `cnd_signal`, `cnd_broadcast` | sincronización por condición |
| `tss_t` | almacenamiento específico de hilo |
| `call_once` | inicialización única |

### 10.10 Bits — `<stdbit.h>` C23

| Familia | Uso |
|---|---|
| conteo de unos | contar bits activos |
| ceros iniciales/finales | análisis de representación binaria |
| potencia de dos | comprobar o calcular propiedades relacionadas |
| rotaciones | rotación de bits cuando esté definida por la cabecera |
| ancho de bit | cálculo del ancho necesario para representar valores |

### 10.11 Aritmética comprobada — `<stdckdint.h>` C23

| Macro | Uso |
|---|---|
| `ckd_add` | suma comprobada contra overflow |
| `ckd_sub` | resta comprobada contra overflow |
| `ckd_mul` | multiplicación comprobada contra overflow |

---

## 11. Macros predefinidas relevantes

| Macro | Significado |
|---|---|
| `__STDC__` | implementación conforme a C |
| `__STDC_VERSION__` | versión del estándar C soportada |
| `__STDC_HOSTED__` | indica entorno hosted o freestanding |
| `__FILE__` | archivo actual |
| `__LINE__` | línea actual |
| `__DATE__` | fecha de traducción |
| `__TIME__` | hora de traducción |
| `__func__` | nombre de función actual |
| `__STDC_NO_ATOMICS__` | ausencia de atómicos C11 |
| `__STDC_NO_THREADS__` | ausencia de hilos C11 |
| `__STDC_NO_VLA__` | ausencia o limitación de arrays de longitud variable |
| `__STDC_IEC_559__` | soporte IEC 60559/IEEE 754, según implementación |
| `__STDC_IEC_559_COMPLEX__` | soporte complejo IEC 60559, según implementación |

---

## 12. Traducción, ejecución y modelo abstracto

| Concepto | Resumen |
|---|---|
| Unidad de traducción | fuente tras inclusión y preprocesado |
| Objeto | región de almacenamiento que puede representar valores |
| Lvalue | expresión que designa un objeto |
| Valor | contenido interpretable según tipo |
| Duración de almacenamiento | automática, estática, asignada o por hilo |
| Enlace | externo, interno o ninguno |
| Secuencia / evaluación | reglas de orden y efectos secundarios |
| Comportamiento definido | comportamiento especificado por la norma |
| Comportamiento definido por implementación | la implementación debe documentarlo |
| Comportamiento no especificado | varias posibilidades válidas sin obligación de elegir una fija |
| Comportamiento indefinido | la norma no impone requisitos |

---

## 13. Comportamientos críticos para programación de bajo nivel

| Tema | Riesgo |
|---|---|
| Overflow de entero con signo | comportamiento indefinido |
| Overflow de entero sin signo | aritmética módulo 2ⁿ |
| Acceso fuera de límites de array | comportamiento indefinido |
| Desreferenciar puntero nulo | comportamiento indefinido |
| Usar objeto tras `free` | comportamiento indefinido |
| Leer variable automática no inicializada | indeterminado; puede ser indefinido |
| Violación de aliasing efectivo | comportamiento indefinido |
| Conversión puntero-entero | definida por implementación salvo casos garantizados |
| Desplazamientos bit a bit inválidos | comportamiento indefinido |
| División entera por cero | comportamiento indefinido |
| Modificar string literal | comportamiento indefinido |
| Dependencia de padding/alineación | frecuentemente definida por implementación |

---

## 14. Elementos especialmente relevantes de C23

| Elemento | Tipo | Resumen |
|---|---|---|
| `bool`, `true`, `false` | lenguaje | booleanos como palabras del lenguaje |
| `nullptr`, `nullptr_t` | lenguaje/tipo | constante de puntero nulo y su tipo |
| `typeof`, `typeof_unqual` | lenguaje | deducción de tipos |
| `constexpr` | lenguaje | constantes evaluables en traducción |
| `alignas`, `alignof` | lenguaje | nombres modernos sin guion bajo |
| `static_assert` | lenguaje | aserción estática sin guion bajo |
| `thread_local` | lenguaje | almacenamiento local por hilo |
| `#elifdef`, `#elifndef` | preprocesador | ramas condicionales simplificadas |
| `#warning` | preprocesador | advertencia controlada |
| `#embed` | preprocesador | inclusión de datos binarios |
| `<stdbit.h>` | cabecera | utilidades de manipulación de bits |
| `<stdckdint.h>` | cabecera | aritmética entera comprobada |

---

## 15. Referencias oficiales y útiles

| Recurso | Uso |
|---|---|
| ISO/IEC 9899:2024 | Norma oficial vigente del lenguaje C |
| ISO/IEC JTC1/SC22/WG14 | Grupo de trabajo responsable de C |
| Borradores WG14 | Referencia pública cercana al texto normativo, útil cuando no se dispone del PDF ISO |
| Manual del compilador | Necesario para extensiones GNU C, Clang, MSVC, atributos, pragmas y ABI |
| ABI de plataforma | Necesario para llamadas, layout binario, registros, enlazado y convención de llamada |
| POSIX | Complementa C en sistemas Unix/Linux, pero no forma parte de ISO C |

---

## 16. Nota final

Este documento no sustituye a ISO/IEC 9899:2024. Sirve como índice técnico de orientación, equivalente a un listado de mnemónicos en ASM, pero adaptado al lenguaje C moderno.

Para trabajo de kernel, firmware, runtime, libc o arranque temprano, conviene distinguir siempre entre:

1. **ISO C**: lenguaje portable.
2. **Extensiones del compilador**: GNU C, Clang, MSVC, atributos, builtins, inline asm.
3. **ABI de arquitectura**: x86-64 SysV ABI, AArch64 ABI, RISC-V psABI, etc.
4. **Entorno freestanding**: subconjunto de C disponible sin sistema operativo completo.
5. **POSIX/Linux**: llamadas de sistema, libc, hilos, ficheros, procesos y señales.
