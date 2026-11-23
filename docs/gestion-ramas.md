# Auditoría y propósito de las ramas de maGNUx

> [🏠 Inicio](../README.md) · [📚 Documentación](README.md)

**Fecha de corte:** 23 de noviembre de 2026. **Alcance:** ramas observadas del repositorio DeRootty/maGNUx y su relación con la rama predeterminada master. No se han efectuado fusiones ni eliminaciones de ramas en esta auditoría.

## Tres ramas; tres funciones distintas

| Rama | Estado histórico comprobado | Uso aconsejado |
|---|---|---|
| **master** | Rama predeterminada, incorporó la refundición documental y actualizaciones posteriores del manifiesto, incluidos los volúmenes históricos y la dimensión de reciprocidad económica. | Línea principal de lectura, integración y desarrollo. |
| **docs/nav-final-candidate** | Antiguo trabajo de refundición; el PR [#47](https://github.com/DeRootty/maGNUx/pull/47) fue **fusionado en master el 26 de mayo de 2026**. Su punta ya es antecesora de master; no existen commits exclusivos pendientes de incorporar. | Conservación histórica o eventual eliminación por decisión del propietario. Una nueva fusión no aportaría cambios. |
| **archive/absorbed-docs-2026-05-26** | Rama divergente con un commit exclusivo respecto de master; su propio [README_ARCHIVE](https://github.com/DeRootty/maGNUx/blob/archive/absorbed-docs-2026-05-26/README_ARCHIVE.md) explica que se creó como paquete de seguridad de documentos antiguos antes de su retirada de la navegación candidata. | Archivo histórico, no sustituto de la rama principal. Mantener para recuperación selectiva. |

## Inspección de diferencias

Se revisó el historial Git mediante la comparación bidireccional con master, no sólo el nombre de las ramas.

### La rama de navegación ya está incorporada

- El PR [#47](https://github.com/DeRootty/maGNUx/pull/47) fue fusionado con éxito.
- En el corte inicial de la auditoría (punta de master **ec41af921f0b82384c5b46120620f8d07d7869d8**), su rama estaba **39 commits por detrás y 0 por delante**. Las incorporaciones posteriores a master incrementan esa distancia.
- Comparación: https://github.com/DeRootty/maGNUx/compare/master...docs/nav-final-candidate
- **Decisión:** no abrir una fusión redundante.

### La rama de archivo no debe fusionarse sin revisión selectiva

- Se identificó un **commit exclusivo de archivo**: https://github.com/DeRootty/maGNUx/commit/2c683c2343f974ce58174e852ca9000928cd6421
- En el corte inicial, esta rama estaba un commit por delante del ancestro común y master contenía **53 commits no presentes en el archivo**.
- Una comparación de su punta respecto de master revela numerosas eliminaciones de archivos que hoy son centrales: LICENSE, README, documentación de arquitectura, identidad, herramientas GCC, corpus CONFIG_* del kernel y prototipos de Zalty. Esto refleja la naturaleza parcial y histórica de la rama; **no debe usarse como una actualización integral**.
- La comparación inversa muestra que master también contiene cambios y eliminaciones posteriores de documentos antiguos. Recuperar alguno podría ser útil, pero sólo mediante inspección de contenido y con una ruta explícita de archivo, no mediante fusión masiva.
- Comparación: https://github.com/DeRootty/maGNUx/compare/master...archive/absorbed-docs-2026-05-26
- **Decisión:** preservar la rama como copia histórica y no fusionarla automáticamente. Si un documento único no ha sido absorbido, rescatarlo individualmente indicando su procedencia, propósito y compatibilidad.

## Política operativa recomendada

1. **master**: documentación principal y prototipos que hayan superado las comprobaciones correspondientes.
2. **ramas de trabajo**: crear para una revisión o cambio delimitado; incorporar mediante PR verificable.
3. **ramas de archivo**: conservar como instantáneas recuperables, nunca como origen automático de actualizaciones destructivas.
4. **no borrar ni forzar fusiones** sin comprobar el ancestro común, historial, diferencias, enlaces, licencias y dependencias.
5. **limpieza opcional**: la rama de navegación ya integrada podría eliminarse tras decidir si se desea conservar como marca histórica; no es necesario hacerlo para que master funcione.
6. **revisión de coherencia**: los documentos del manifiesto deben estar enlazados desde README principal y sus índices de sección; Zalty conserva la implementación experimental y no se confunde con una teoría validada.

Esta auditoría no altera el histórico de Git ni resuelve por sí sola posibles documentos de archivo todavía no absorbidos. Su función es evitar fusiones accidentales y facilitar la recuperación responsable del corpus.
