# maGNUx

maGNUx es una arquitectura conceptual para el gobierno explícito del sistema operativo: identidad, autoridad, contrato, soberanía sistémica y arranque temprano.

Esta rama refunde la navegación nueva con el corpus documental anterior para dejar una sola lectura principal.

```text
maGNUx
→ manifiesto, arquitectura, identidad, filosofía y propuesta técnica

Zalty
→ distribución GNU/Linux experimental que ensaya maGNUx sobre Linux real

GCC ES Técnico
→ documentación técnica en español sobre GCC, compilación y cadena de herramientas
```

## Lectura única recomendada

La lectura principal del repositorio empieza aquí y continúa en `docs/`:

1. [Documentación maGNUx](docs/README.md)
2. [Resumen ejecutivo](docs/propuesta-tecnica/00-resumen-ejecutivo.md)
3. [Manifiesto](docs/manifesto/01-manifiesto.md)
4. [Horizonte tecnológico — Arquetipar sistemas operativos](docs/manifesto/horizonte-arquetipado.md)
4 bis. [Hélice, Alfa y evidencia del sistema vivo](docs/manifesto/04-helice-alfa-continuidad.md)
5. [Estratos de arquitectura](docs/arquitectura/03-estratos.md)
6. [Inicio del sistema](docs/arquitectura/04-inicio-sistema.md)
7. [xGNUpeD](docs/identidad/07-xgnuped.md)
8. [Dernel](docs/identidad/09-dernel.md)
9. [Trilobytes: coherencia y representación](docs/identidad/08-trilobytes.md)
10. [Especificación de mediación Trilobytes](docs/propuesta-tecnica/03-trilobytes-mediacion-spec.md)
10 bis. [Alfa: identidad, propietario y contextos terminales](docs/identidad/12-usuario-alfa.md)
10 ter. [Dominio Alfa: seL4, NPU, GPU y arranque](docs/arquitectura/07-dominio-alfa.md)
10 quater. [Alfa: observabilidad y evidencia DevOps](docs/propuesta-tecnica/04-alfa-observabilidad-spec.md)
11. [Zalty](zalty/readme.md)
12. [Initramfs de Zalty](zalty/initramfs/README.md)
13. [Prototipo HostID v0.1](zalty/initramfs/prototipo-hostid-v0.1/README.md)
14. [GCC ES Técnico](docs/gcc/README.md)
15. [Epílogo y notas](docs/manifesto/EPILOGO.md) — evolución orgánica, autoría y cuestiones abiertas.

## Nueva base constitutiva: Commonwealth del silicio

- [Volumen I — Roma, Britania y Commonwealth](docs/manifesto/volumen-i-britania-roma-commonwealth.md): historia de los dominios imperiales y su evolución.
- [Volumen II — Commonwealth del silicio](docs/manifesto/volumen-ii-commonwealth-del-silicio.md): continuidad histórica aplicada a maGNUx; ROOT/kernel, COMM/xGNUpeD, ADMIN/Dernel, modos de mantenimiento y Trilobytes en el arranque ordinario.

- [Artículo académico — Reciprocidad económica y soberanía contributiva](docs/manifesto/03-reciprocidad-economica-computacional.md): registro verificable, evaluación asistida por IA y financiación del mantenimiento del software libre.

La [continuidad helicoidal](docs/manifesto/horizonte-arquetipado.md) conduce ahora al [artículo sobre Alfa y el vórtice emergente](docs/manifesto/04-helice-alfa-continuidad.md), vinculado a una [propuesta comprobable para DevOps](docs/propuesta-tecnica/04-alfa-observabilidad-spec.md).

## Navegación por planos

| Plano | Entrada | Función |
|---|---|---|
| Propuesta técnica | [docs/propuesta-tecnica/](docs/propuesta-tecnica/README.md) | Síntesis ejecutiva y especificaciones iniciales. |
| Manifiesto | [docs/manifesto/](docs/manifesto/README.md) | Sentido del proyecto, soberanía y legitimidad. |
| Epílogo y notas | [Epílogo y notas](docs/manifesto/EPILOGO.md) | Genealogía del manifiesto y registro abierto de su evolución. |
| Arquitectura | [docs/arquitectura/](docs/arquitectura/README.md) | Estratos, arranque, bus temprano y compatibilidad POSIX. |
| Identidad | [docs/identidad/](docs/identidad/README.md) | xGNUpeD, Trilobytes, Dernel, Host/Guest y dominios raíz. |
| Filosofía | [docs/filosofia/](docs/filosofia/README.md) | Unix/GNU, hormiguero, hardware y maduración. |
| Zalty | [zalty/](zalty/readme.md) | Implementación experimental GNU/Linux de maGNUx. |
| Initramfs | [zalty/initramfs/](zalty/initramfs/README.md) | Laboratorio de arranque temprano. |
| GCC ES Técnico | [docs/gcc/](docs/gcc/README.md) | Traducción y documentación técnica en español sobre GCC. |
| Corpus integrado | [docs/legacy/](docs/legacy/README.md) | Documentos históricos ya enlazados desde la navegación principal. |

## Regla de separación

```text
maGNUx declara.
Zalty ensaya.
docs/ explica el contrato.
zalty/ lo baja a máquina.
```

## Estado de master y las ramas históricas

Esta es la rama principal `master`. La antigua rama de refundición documental ya se integró mediante el [PR #47](https://github.com/DeRootty/maGNUx/pull/47). Para la historia y el propósito de las tres ramas, consulta la [auditoría de ramas](docs/gestion-ramas.md).

El criterio de esta rama es:

```text
una sola lectura,
una sola navegación,
varios niveles de profundidad.
```

Los documentos nuevos actúan como columna vertebral. Los documentos antiguos quedan integrados como ampliaciones temáticas dentro de cada bloque.