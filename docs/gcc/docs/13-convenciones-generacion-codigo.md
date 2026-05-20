# 3.1 Resumen de opciones - convenciones de generación de código

La sección 3.1 incluye una familia llamada **Options for Code Generation Conventions**. Estas opciones no solo afectan al rendimiento, sino a cómo se materializa el binario: ABI, símbolos, tablas, posición en memoria, excepciones, visibilidad, alineación y compatibilidad con enlazadores/cargadores.

## Posición independiente y bibliotecas compartidas

Opciones representativas:

```sh
-fpic
-fPIC
-fpie
-fPIE
-fno-pic
-fno-pie
```

| Opción | Sentido práctico |
| --- | --- |
| `-fpic` | Genera código independiente de posición para bibliotecas compartidas, con posibles límites específicos de arquitectura. |
| `-fPIC` | Variante más amplia de PIC. |
| `-fpie` | Genera código adecuado para ejecutables PIE. |
| `-fPIE` | Variante más amplia de PIE. |
| `-fno-pic` | Desactiva generación PIC. |
| `-fno-pie` | Desactiva generación PIE. |

Ejemplo de biblioteca compartida:

```sh
gcc -fPIC -shared lib.c -o libmilib.so
```

Ejemplo de ejecutable PIE:

```sh
gcc -fPIE -pie main.c -o main
```

## Visibilidad de símbolos

Opciones representativas:

```sh
-fvisibility=default
-fvisibility=hidden
-fvisibility=internal
-fvisibility=protected
```

La visibilidad controla qué símbolos quedan exportados desde un objeto compartido.

| Valor | Sentido |
| --- | --- |
| `default` | Visibilidad normal/exportable. |
| `hidden` | El símbolo no se exporta para resolución externa normal. |
| `internal` | Más restrictivo, dependiente de plataforma. |
| `protected` | Exportado pero con reglas especiales de resolución. |

Ejemplo:

```sh
gcc -fPIC -fvisibility=hidden -shared lib.c -o libmilib.so
```

Esto puede reducir la superficie ABI expuesta por una biblioteca compartida.

## Excepciones y tablas asociadas

Opciones representativas:

```sh
-fexceptions
-fnon-call-exceptions
-funwind-tables
-fasynchronous-unwind-tables
```

| Opción | Sentido |
| --- | --- |
| `-fexceptions` | Habilita soporte de excepciones cuando el lenguaje o plataforma lo requiere. |
| `-fnon-call-exceptions` | Permite que ciertas instrucciones que no son llamadas puedan lanzar excepciones. |
| `-funwind-tables` | Genera tablas de desenrollado de pila. |
| `-fasynchronous-unwind-tables` | Genera tablas adecuadas para desenrollado asíncrono, útil para depuración/profiling. |

Estas opciones pueden afectar al tamaño del binario y a la capacidad de depuración, excepciones y trazado de pila.

## Identificación del compilador

Opción representativa:

```sh
-fident
-fno-ident
```

`-fident` permite emitir identificadores del compilador en el objeto, según soporte del formato de salida.

`-fno-ident` evita emitirlos.

## Common symbols

Opciones representativas:

```sh
-fcommon
-fno-common
```

Estas opciones afectan a cómo se emiten definiciones tentativas en C.

Ejemplo:

```c
int global;
```

En código antiguo, múltiples definiciones tentativas podían terminar como símbolos comunes. Con `-fno-common`, múltiples definiciones de este tipo en distintas unidades pueden producir errores de enlace.

Esto ayuda a detectar errores de diseño en variables globales.

## Alineación

Opciones representativas:

```sh
-falign-functions
-falign-labels
-falign-loops
-falign-jumps
```

Estas opciones controlan alineación de funciones, etiquetas, bucles y saltos. Pueden mejorar rendimiento en algunas arquitecturas, pero aumentar tamaño.

Ejemplo:

```sh
gcc -O2 -falign-functions=32 main.c -o main
```

## Short enums, short wchar y ABI

Opciones representativas:

```sh
-fshort-enums
-fshort-wchar
```

Estas opciones alteran tamaños o representación de tipos. Pueden romper compatibilidad ABI si se mezclan objetos compilados con configuraciones distintas.

```sh
-fshort-enums
```

hace que los `enum` usen el tipo entero más pequeño suficiente.

```sh
-fshort-wchar
```

cambia el tamaño de `wchar_t` en plataformas donde sea aplicable.

Estas opciones deben tratarse como decisiones ABI, no como simples optimizaciones.

## Registro global y llamadas

Opciones representativas pueden incluir controles sobre registros, llamadas, retorno o convenciones específicas de arquitectura. Muchas dependen del objetivo.

Ejemplos de familias:

```sh
-ffixed-reg
-fcall-used-reg
-fcall-saved-reg
```

Estas opciones son de bajo nivel y pueden invalidar supuestos del ABI si se usan sin control.

## TLS y almacenamiento local de hilo

Opciones relacionadas con modelos TLS pueden influir en cómo se accede a variables `thread_local` o `__thread`.

Ejemplo conceptual:

```c
__thread int contador;
```

El modelo de acceso puede depender de si el binario es compartido, PIE, estático o de la plataforma objetivo.

## Lectura sistémica

Las opciones de generación de código forman una frontera entre:

```text
lenguaje fuente
→ ABI
→ formato objeto
→ enlazador
→ cargador dinámico
→ sistema operativo
```

No deben tratarse como simples "flags de rendimiento".

Algunas cambian el contrato binario del programa.

## Perfil práctico

Biblioteca compartida con símbolos ocultos por defecto:

```sh
gcc -O2 -fPIC -fvisibility=hidden -shared lib.c -o libmilib.so
```

Ejecutable PIE:

```sh
gcc -O2 -fPIE -pie main.c -o main
```

Depuración/profiling con buen desenrollado:

```sh
gcc -O2 -g -fasynchronous-unwind-tables main.c -o main
```

Detección de definiciones globales problemáticas:

```sh
gcc -fno-common main.c util.c -o programa
```

## Nota editorial

Cuando una opción altera ABI, visibilidad o layout binario, debe documentarse como decisión de sistema. Mezclar objetos compilados con convenciones distintas puede producir fallos difíciles de diagnosticar.

[Anterior](12-directorios-sysroot-busqueda.md) | [Índice](README.md) | [Siguiente](14-desarrollador-y-objetivos.md)
