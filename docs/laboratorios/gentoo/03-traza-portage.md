# G03 — De una USE flag a la orden de GCC

> [⬆ Laboratorio](README.md) · [🏠 Inicio](../../../README.md)

**Estado:** protocolo pendiente. No se presupone correspondencia USE ↔ CONFIG_*.

## Inspección inicial

Elegir un paquete y versión que declare una flag concreta en IUSE. Registrar perfil Gentoo, repositorio y commit de ebuild, eclasses heredadas, versión del paquete, GCC, CFLAGS, CPPFLAGS, LDFLAGS y dependencias. Buscar una flag que pueda alterar una cabecera generada o un argumento de compilación; si solo cambia dependencias, ese resultado también es válido.

En una VM o chroot desechable de Gentoo, usar dos configuraciones de Portage equivalentes salvo la flag del paquete. Primero simular la resolución:

~~~sh
# Sustituir categoría, paquete y versión por valores comprobados.
# No ejecutar una instalación hasta disponer de dos entornos de prueba.
USE="-flag" emerge -pv =categoria/paquete-version
USE="flag" emerge -pv =categoria/paquete-version
~~~

El valor solicitado mediante USE puede no ser el valor efectivo debido al perfil, máscaras o restricciones REQUIRED_USE. Revisar la simulación, y detenerse si las dos configuraciones no son realizables.

## Recorrido del ebuild

| Punto | Evidencia que se debe guardar |
|---|---|
| IUSE y dependencias | Declaración y ramas de dependencia |
| src_configure / eclass | `use_enable`, `use_with`, opciones Meson/CMake u otras |
| Configuración generada | config.h, registros configure, archivos de construcción |
| src_compile | Orden real del compilador, no solo CFLAGS declaradas |
| Unidad de traducción | Cabeceras, macros, fuente preprocesada |
| Objeto y enlace | Símbolos, ELF, bibliotecas y artefacto |

La forma de obtener órdenes verbosas depende del proyecto: por ejemplo Make V=1, Ninja -v o una base de datos de compilación cuando exista. No imponer una opción a un proyecto que no la interpreta. Los registros de construcción deben capturarse antes de que Portage limpie el directorio temporal y protegerse si contienen rutas o datos sensibles. Trabajar con dos directorios o máquinas aislados y paquetes fuente, no reutilizar artefactos binarios ni cambiar el sistema activo.

Reproducir la orden de una unidad con las rutas, macros, directorio de trabajo, archivos generados, arquitectura y opciones reales; usar una copia separada para introducir `-E -H`, `-dM` o volcados. Conservar también el resultado de la construcción normal, puesto que la instrumentación puede alterar el comportamiento.

Una dependencia nueva puede conducir a una API de kernel, pero la relación con Kconfig solo se registra después de verificar la interfaz, su implementación y el símbolo correspondiente. No se fuerza una modificación de kernel para hacer coincidir una USE flag.

Fuente: [Gentoo Development Guide — USE flags](https://devmanual.gentoo.org/general-concepts/use-flags/) y [ebuild](https://devmanual.gentoo.org/eclass-reference/ebuild/). [Formato de registro](04-registro-evidencia.md).
