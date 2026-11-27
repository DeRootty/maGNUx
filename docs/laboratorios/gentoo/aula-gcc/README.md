# Aula de integración: GCC en español

> [⬆ Laboratorio I — Gentoo](../README.md) · [Documentación maGNUx](../../../README.md) · [🏠 Inicio](../../../../README.md)

## Adaptación especial para propósito experimental en Gentoo

**Objeto de estudio:** kernel Linux **6.18.65 LTS**, árbol original (vanilla) y árbol Gentoo correspondiente, una vez obtenidos y verificados los fuentes y parches.  
**Manual de referencia:** *Using the GNU Compiler Collection*, GCC **16.1.0**, de Richard M. Stallman y la comunidad de desarrolladores de GCC.  
**Entorno objetivo:** Gentoo GNU/Linux, amd64/x86-64. La versión de GCC realmente utilizada se registrará en cada experimento; no tiene por qué coincidir con la versión del manual.  
**Estado editorial:** traducción íntegra del manual como objetivo; primera incorporación parcial del texto original, no edición terminada.

El aula tiene una doble finalidad: estudiar en español el manual de GCC en su orden original y utilizar ese conocimiento para reproducir la trayectoria de una flag desde la decisión de entrada hasta los fuentes, cabeceras, macros, unidad de traducción, representación intermedia, objeto y enlace final del kernel.

No se pretende inferir todavía una arquitectura semiótica ni una gramática para otras distribuciones. Primero se debe aprender y verificar el funcionamiento de los mecanismos reales.

## Dos planos de lectura

| Plano | Contenido |
|---|---|
| [Manual GCC en español](manual/README.md) | Traducción directa del original inglés, capítulo por capítulo; conservar opciones, código, términos y referencias. |
| [Adaptación experimental para Gentoo](integracion-gentoo.md) | Aplicación del conocimiento a flags, cabeceras y compilador; ejercicios y evidencias separados de la traducción. |
| [Edición técnica anterior](../../../gcc/README.md) | Material comentado e histórico de consulta, no se computa como traducción íntegra del manual. |
| [Protocolo de traducción y control](protocolo.md) | Inventario, procedencia, terminología, revisión y criterio de completitud. |

## Resultado que perseguimos

```text
Flag de entrada
  → intérprete real (Portage, Kconfig, Kbuild, GCC u otro)
  → selección de archivos y opciones efectivas
  → macros y cabeceras
  → fuente preprocesada compilable
  → compilación y representaciones intermedias
  → ensamblador y objeto
  → enlace, artefacto y evidencia
```

No todas las decisiones atraviesan todas las etapas. No se presupone que una USE flag se traduzca directamente a CONFIG_* ni que toda flag modifique una cabecera.

La metodología experimental parte de [G01](../01-traza-gcc.md), continúa con [G02](../02-traza-kbuild.md) y [G03](../03-traza-portage.md). El [catálogo CONFIG_* anterior](../../../kernel/README.md) permanece identificado como Linux 6.18.25; no se ha regenerado para 6.18.65.

**Límite de esta publicación:** primera entrega de la traducción directa; no se ha ejecutado una compilación del kernel 6.18.65 ni se certifica que los capítulos aún pendientes estén traducidos.
