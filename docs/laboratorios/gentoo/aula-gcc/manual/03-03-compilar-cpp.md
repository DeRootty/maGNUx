# 3.3. Compilación de programas C++

> [Índice del manual](README.md) · [Aula de integración](../README.md) · [Edición y licencia](00-edicion-y-licencia.md)

**Estado:** texto completo de la sección Invoking G++. Traducción no oficial asistida por IA, pendiente de revisión humana.  
**Original:** [gcc/doc/invoke.texi](https://github.com/gcc-mirror/gcc/blob/releases/gcc-16.1.0/gcc/doc/invoke.texi) · GCC 16.1.0 · blob `9207a021e64224b74d5019719c3d7e39a2663807`.  
Copyright © 1988–2026 Free Software Foundation, Inc. GFDL 1.3 o posterior; véase [avisos y licencia](00-edicion-y-licencia.md).

Los archivos fuente C++ utilizan convencionalmente uno de los sufijos `.C`, `.cc`, `.cpp`, `.CPP`, `.c++`, `.cp` o `.cxx`; los archivos de cabecera C++ utilizan a menudo `.hh`, `.hpp`, `.H` o (para código de plantillas compartido) `.tcc`; los archivos C++ preprocesados utilizan el sufijo `.ii`; y las unidades de interfaz de módulos C++20 utilizan a veces `.ixx`, `.cppm`, `.cxxm`, `.c++m` o `.ccm`.

GCC reconoce los archivos con estos nombres y los compila como programas C++ incluso si llama al compilador del mismo modo que al compilar programas C (normalmente con el nombre `gcc`).

Sin embargo, el uso de `gcc` no añade la biblioteca C++. `g++` es un programa que llama a GCC y especifica automáticamente el enlace con la biblioteca C++. Trata los archivos `.c`, `.h` y `.i` como archivos fuente C++ en lugar de C, a menos que se utilice `-x`. Este programa también es útil cuando se precompila un archivo de cabecera C con extensión `.h` para utilizarlo en compilaciones C++. En muchos sistemas, `g++` también se instala con el nombre `c++`.

Cuando compile programas C++, puede especificar muchas de las mismas opciones de línea de órdenes que utiliza para compilar programas en cualquier lenguaje; u opciones de línea de órdenes que tienen significado para C y lenguajes relacionados; u opciones que solo tienen significado para programas C++. Véase [opciones que controlan el dialecto C, original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/C-Dialect-Options.html) para las explicaciones de las opciones de lenguajes relacionados con C. Véase [opciones que controlan el dialecto C++, original](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/C_002b_002b-Dialect-Options.html) para las explicaciones de opciones que solo tienen significado para programas C++.

---

[3.2](03-02-tipo-salida.md) · [Índice](README.md) · [Siguiente: 3.4 (parcial)](03-04-dialecto-c.md)
