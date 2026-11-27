# 3.15. Transmisión de opciones al ensamblador

> [Índice del manual](README.md) · [Aula de integración](../README.md) · [Edición y licencia](00-edicion-y-licencia.md)

**Estado:** texto completo de la sección Assembler Options. Traducción no oficial asistida por IA, pendiente de revisión humana.  
**Original:** [gcc/doc/invoke.texi](https://github.com/gcc-mirror/gcc/blob/releases/gcc-16.1.0/gcc/doc/invoke.texi) · GCC 16.1.0 · blob `9207a021e64224b74d5019719c3d7e39a2663807`.  
Copyright © 1988–2026 Free Software Foundation, Inc. GFDL 1.3 o posterior; véase [avisos y licencia](00-edicion-y-licencia.md).

Puede transmitir opciones al ensamblador.

### -Wa,option

Transmite *option* como opción al ensamblador. Si *option* contiene comas, se divide en varias opciones en las comas.

### -Xassembler option / --for-assembler=option / --for-assembler option

Transmite *option* como opción al ensamblador. Puede utilizarla para suministrar opciones del ensamblador específicas del sistema que GCC no reconoce.

Si quiere transmitir una opción que acepta un argumento, debe utilizar `-Xassembler` dos veces, una para la opción y otra para el argumento.

---

[Índice del capítulo 3](README.md) · [Adaptación experimental](../integracion-gentoo.md)
