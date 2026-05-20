# Sección 3.1 - Diagnósticos y advertencias

GCC dispone de un sistema amplio de diagnósticos. Un diagnóstico puede ser una advertencia, un error, una nota o un mensaje asociado a análisis más avanzado.

Las opciones relacionadas con advertencias suelen comenzar por:

```sh
-W
```

Las opciones que convierten advertencias en errores o controlan errores suelen incluir:

```sh
-Werror
-Wno-error
-pedantic-errors
```

## Advertencias básicas

Las opciones más habituales son:

```sh
-Wall
-Wextra
-Wpedantic
```

| Opción | Sentido |
| --- | --- |
| `-Wall` | Activa un conjunto amplio de advertencias recomendables. No significa literalmente "todas" las advertencias. |
| `-Wextra` | Activa advertencias adicionales no incluidas en `-Wall`. |
| `-Wpedantic` | Advierte por usos que no se ajustan al estándar ISO seleccionado. |

Ejemplo:

```sh
gcc -std=c23 -Wall -Wextra -Wpedantic main.c -o main
```

## Convertir advertencias en errores

```sh
-Werror
```

convierte todas las advertencias activas en errores.

Ejemplo:

```sh
gcc -Wall -Wextra -Werror main.c -o main
```

También puede aplicarse a una advertencia concreta:

```sh
-Werror=format
```

Y desactivarse para una advertencia concreta:

```sh
-Wno-error=format
```

Esto permite una política intermedia: tratar casi todo como error, pero permitir temporalmente ciertas advertencias.

## Advertencias de formato

GCC puede comprobar llamadas a funciones con formato tipo `printf`, `scanf` y similares.

```sh
-Wformat
-Wformat=2
-Wformat-security
```

| Opción | Sentido |
| --- | --- |
| `-Wformat` | Comprueba coherencia entre cadena de formato y argumentos. |
| `-Wformat=2` | Activa un nivel más estricto. |
| `-Wformat-security` | Advierte sobre usos peligrosos relacionados con seguridad. |

Ejemplo peligroso:

```c
printf(usuario);
```

Preferible:

```c
printf("%s", usuario);
```

Compilación recomendada para detectar estos casos:

```sh
gcc -Wall -Wextra -Wformat=2 -Wformat-security main.c -o main
```

## Advertencias sobre código no usado

```sh
-Wunused
-Wunused-variable
-Wunused-parameter
-Wunused-function
```

Estas advertencias ayudan a localizar código muerto, argumentos no usados o errores de mantenimiento.

Ejemplo:

```c
int f(int x) {
    return 42;
}
```

`x` puede provocar advertencia si está activada la advertencia correspondiente.

## Advertencias sobre conversiones

```sh
-Wconversion
-Wsign-conversion
```

Estas opciones advierten sobre conversiones implícitas que pueden perder información o cambiar signo.

Ejemplo típico:

```c
int x = -1;
unsigned y = x;
```

Esto puede compilar, pero puede no expresar la intención del programador.

## Advertencias sobre sombreado

```sh
-Wshadow
```

Advierte cuando una declaración local oculta otra declaración visible.

Ejemplo:

```c
int value;

void f(void) {
    int value = 3;
}
```

La variable local `value` sombrea la global.

## Advertencias sobre inicialización

```sh
-Wuninitialized
-Wmaybe-uninitialized
```

Estas advertencias dependen en parte del análisis que GCC puede hacer, y algunas funcionan mejor con optimización activada.

Ejemplo:

```sh
gcc -O2 -Wall -Wextra main.c -o main
```

## Advertencias de estilo y compatibilidad

Algunas advertencias ayudan a escribir código más portable o más claro:

```sh
-Wstrict-prototypes
-Wold-style-definition
-Wmissing-prototypes
-Wmissing-declarations
```

Son especialmente útiles en C, no necesariamente en C++.

## Pedantic

```sh
-pedantic
-pedantic-errors
```

`-pedantic` solicita diagnósticos requeridos por el estándar ISO seleccionado. No significa que GCC rechace todas sus extensiones. Algunas extensiones siguen disponibles, pero pueden producir diagnósticos si se usan en un modo ISO.

`-pedantic-errors` convierte esos diagnósticos en errores.

Ejemplo:

```sh
gcc -std=c23 -pedantic-errors main.c -o main
```

## Política práctica de advertencias

Una configuración razonable para muchos proyectos C puede ser:

```sh
gcc -std=c23 -Wall -Wextra -Wpedantic -Wformat=2 -Wshadow -Wconversion main.c -o main
```

Para CI o código crítico:

```sh
gcc -std=c23 -Wall -Wextra -Wpedantic -Wformat=2 -Werror main.c -o main
```

## Lectura técnica

Las advertencias no son decoración. Son parte de la política de calidad del código. En sistemas grandes, conviene tratarlas como una interfaz entre:

- intención del programador;
- supuestos del compilador;
- reglas del estándar;
- portabilidad;
- seguridad;
- mantenimiento.

[Anterior](05-guia-practica-c23-gcc.md) | [Índice](README.md) | [Siguiente](07-analizador-estatico.md)
