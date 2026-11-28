# Aula general — Compilación del kernel vanilla y arranque en bruto

> [⬆ Gentoo](../README.md) · [Laboratorios](../../README.md) · [Documentación](../../../README.md) · [🏠 Inicio](../../../../README.md)

**Estado:** itinerario propuesto; unidades prácticas en construcción.

Aprender a obtener, configurar y compilar Linux vanilla 6.18.65 LTS y preparar un USB arrancable a partir de los componentes generados, sin reutilizar como resultado una ISO de otra distribución. Se distingue kernel arrancable de sistema operativo completo: para obtener una sesión funcional se requieren componentes de espacio de usuario y un mecanismo de arranque apropiado.

| Unidad propuesta | Objeto |
|---|---|
| A01 | Preparar entorno, verificar origen e integridad de fuentes y toolchain. |
| A02 | Reconocer árbol de fuentes, configurar y compilar kernel y módulos. |
| A03 | Identificar artefactos y dependencias de arranque; initramfs mínimo si procede. |
| A04 | Diseñar imagen de disco y arranque UEFI/EFI stub o cargador según plataforma. |
| A05 | Probar imagen en VM, después en medio extraíble identificado y prescindible. |
| A06 | Diagnosticar arranque y registrar configuraciones, comandos, hashes y resultados. |

No se proporcionan aquí órdenes destructivas sobre discos. Antes de escribir un USB real se debe verificar el dispositivo, aislar el disco del sistema, preservar datos y confirmar la operación. La selección de la modalidad de arranque se hará según la plataforma de ensayo.

El [aula de integración GCC](../aula-gcc/README.md) explica la trazabilidad de compilación; el [laboratorio LFS](../../lfs/README.md) profundiza en la personalización del kernel. No se ha construido ni probado aún el USB en esta incorporación.
