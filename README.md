# maGNUx

maGNUx es una arquitectura conceptual para el gobierno explícito del sistema operativo: identidad, autoridad, contrato, soberanía sistémica y arranque temprano.

Esta rama refunde la navegación nueva con el corpus documental anterior para dejar una sola lectura principal.

```text
maGNUx
→ manifiesto, arquitectura, identidad, filosofía y propuesta técnica

Zalty
→ distribución GNU/Linux experimental que ensaya maGNUx sobre Linux real
```

## Lectura única recomendada

La lectura principal del repositorio empieza aquí y continúa en `docs/`:

1. [Documentación maGNUx](docs/README.md)
2. [Resumen ejecutivo](docs/propuesta-tecnica/00-resumen-ejecutivo.md)
3. [Manifiesto](docs/manifesto/01-manifiesto.md)
4. [Estratos de arquitectura](docs/arquitectura/03-estratos.md)
5. [Inicio del sistema](docs/arquitectura/04-inicio-sistema.md)
6. [xGNUpeD](docs/identidad/07-xgnuped.md)
7. [Dernel](docs/identidad/09-dernel.md)
8. [Zalty](zalty/readme.md)
9. [Initramfs de Zalty](zalty/initramfs/README.md)
10. [Prototipo HostID v0.1](zalty/initramfs/prototipo-hostid-v0.1/README.md)

## Navegación por planos

| Plano | Entrada | Función |
|---|---|---|
| Propuesta técnica | [docs/propuesta-tecnica/](docs/propuesta-tecnica/README.md) | Síntesis ejecutiva y especificaciones iniciales. |
| Manifiesto | [docs/manifesto/](docs/manifesto/README.md) | Sentido del proyecto, soberanía y legitimidad. |
| Arquitectura | [docs/arquitectura/](docs/arquitectura/README.md) | Estratos, arranque, bus temprano y compatibilidad POSIX. |
| Identidad | [docs/identidad/](docs/identidad/README.md) | xGNUpeD, Trilobytes, Dernel, Host/Guest y dominios raíz. |
| Filosofía | [docs/filosofia/](docs/filosofia/README.md) | Unix/GNU, hormiguero, hardware y maduración. |
| Zalty | [zalty/](zalty/readme.md) | Implementación experimental GNU/Linux de maGNUx. |
| Initramfs | [zalty/initramfs/](zalty/initramfs/README.md) | Laboratorio de arranque temprano. |
| Corpus integrado | [docs/legacy/](docs/legacy/README.md) | Documentos históricos ya enlazados desde la navegación principal. |

## Regla de separación

```text
maGNUx declara.
Zalty ensaya.
docs/ explica el contrato.
zalty/ lo baja a máquina.
```

## Estado de esta rama

Esta rama es una candidata de refundición documental. No sustituye `master` hasta que sea revisada y aceptada.

El criterio de esta rama es:

```text
una sola lectura,
una sola navegación,
varios niveles de profundidad.
```

Los documentos nuevos actúan como columna vertebral. Los documentos antiguos quedan integrados como ampliaciones temáticas dentro de cada bloque.