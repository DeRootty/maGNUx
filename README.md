# maGNUx — propuesta de navegación final

maGNUx es una arquitectura conceptual para el gobierno explícito del sistema operativo: identidad, autoridad, contrato y arranque temprano.

Esta maqueta integra dos planos:

```text
maGNUx
→ manifiesto, arquitectura, identidad, filosofía y propuesta técnica

Zalty
→ distribución GNU/Linux experimental que ensaya maGNUx sobre Linux real
```

## Cómo evaluar esta maqueta

Abre este archivo en local y sigue la ruta recomendada. Todos los documentos principales tienen enlaces relativos para subir de nivel, volver al índice documental y regresar al inicio.

## Estructura propuesta

| Carpeta | Función |
|---|---|
| [`docs/`](docs/README.md) | Núcleo documental de maGNUx. |
| [`docs/propuesta-tecnica/`](docs/propuesta-tecnica/README.md) | Resumen ejecutivo y especificaciones iniciales. |
| [`docs/manifesto/`](docs/manifesto/README.md) | Manifiesto e hipótesis central. |
| [`docs/arquitectura/`](docs/arquitectura/README.md) | Estratos, inicio, bus de arranque y capas POSIX. |
| [`docs/identidad/`](docs/identidad/README.md) | xGNUpeD, Trilobytes, Dernel, Host/Guest y dominios raíz. |
| [`docs/filosofia/`](docs/filosofia/README.md) | Filosofía Unix/GNU, hormiguero, hardware y maduración. |
| [`zalty/`](zalty/readme.md) | Implementación GNU/Linux experimental. |
| [`zalty/initramfs/`](zalty/initramfs/README.md) | Laboratorio de initramfs y arranque temprano. |
| [`docs/legacy/`](docs/legacy/README.md) | Zona reservada para documentos antiguos o corpus extendido. |

## Ruta corta de lectura

1. [Resumen ejecutivo](docs/propuesta-tecnica/00-resumen-ejecutivo.md)
2. [Manifiesto](docs/manifesto/01-manifiesto.md)
3. [Estratos de arquitectura](docs/arquitectura/03-estratos.md)
4. [Inicio del sistema](docs/arquitectura/04-inicio-sistema.md)
5. [xGNUpeD](docs/identidad/07-xgnuped.md)
6. [Dernel](docs/identidad/09-dernel.md)
7. [Zalty](zalty/readme.md)
8. [Initramfs de Zalty](zalty/initramfs/README.md)
9. [Prototipo HostID v0.1](zalty/initramfs/prototipo-hostid-v0.1/README.md)

## Regla de separación

```text
maGNUx declara.
Zalty ensaya.
docs/ explica el contrato.
zalty/ lo baja a máquina.
```

## Estado de esta maqueta

Esta carpeta no pretende ser todavía el repositorio definitivo. Es una propuesta comprimida para revisar localmente la navegación Markdown final antes de decidir si se sube tal cual, si se retoca o si se integra por fases.
