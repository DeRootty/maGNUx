# 07 — xGNUpeD: la capa de identidad

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> Si no existieran las comunidades Linux, esto no sería necesario.

---

## En pocas palabras

**xGNUpeD** es la capa que permite que un sistema GNU/Linux deje de arrancar como una suma anónima de kernel, drivers, servicios y distribución, y empiece a reconocerse como una entidad con identidad técnica.

Asocia:

- la máquina física o virtual;
- el kernel cargado;
- la distribución instalada;
- la política de arranque;
- la comunidad o linaje del sistema;
- y el lenguaje base con el que el Dernel podrá comunicarse con el kernel.

No es un nuevo `init`. Tampoco es un reemplazo completo de systemd. Es la **finalización semiótica de la carga del kernel**: el punto en el que el sistema ya no solo tiene un kernel vivo, sino una identidad mínima desde la que puede empezar a gobernarse.

---

## Qué problema resuelve

Linux puede arrancar, montar raíz, cargar drivers y levantar servicios sin declarar de forma explícita:

```text
quién soy,
de dónde vengo,
qué distribución me interpreta,
qué política me legitima,
y qué continuidad mantengo respecto a mi instalación.
```

El resultado es poderoso, pero difuso. La identidad del sistema queda repartida entre:

- el bootloader;
- el kernel;
- `initramfs`;
- `/etc/os-release`;
- systemd u otro init;
- el gestor de paquetes;
- la configuración de la distribución;
- y la administración humana.

xGNUpeD propone reunir esa información temprana en una **identidad estructural reconocible**, anterior al despliegue ordinario del userspace.

---

## Qué es xGNUpeD

xGNUpeD puede entenderse como el **driver del sistema**.

Si el kernel tuviera una longitud conceptual, xGNUpeD aparecería al final de esa longitud:

```text
firmware
  → bootloader
    → kernel
      → initramfs
        → xGNUpeD
          → Dernel
            → Trilobytes
              → entorno operativo
```

No sustituye al kernel. No sustituye al init. No sustituye a la distribución.

Su papel es fijar una identidad inicial suficiente para que las capas posteriores no operen sobre una máquina muda, sino sobre un sistema que puede afirmar:

```text
soy este host,
con este kernel,
bajo esta distribución,
con esta política,
en este estado de arranque.
```

---

## Identidad distributiva

La **identidad distributiva** expresa la relación del sistema con la distribución que lo interpreta.

No todos los GNU/Linux son equivalentes en su modo de administrar:

- instalación de aplicaciones;
- resolución de dependencias;
- actualización del sistema;
- estructura de repositorios;
- ciclo de vida de paquetes;
- políticas de seguridad;
- servicios iniciales;
- integración con escritorio o servidor.

La identidad distributiva permite declarar:

```text
este sistema pertenece a este linaje,
usa esta filosofía de distribución,
y debe ser gobernado de acuerdo con ella.
```

Ejemplos conceptuales:

| Distribución | Identidad distributiva probable |
|---|---|
| Gentoo | Construcción explícita, USE flags, control fino, compilación local. |
| openSUSE | Integración administrativa, YaST, Btrfs/Snapper, coherencia empresarial/comunitaria. |
| NixOS | Declaratividad fuerte, reproducibilidad, estado expresado como configuración. |
| Debian | Estabilidad, universalidad, contrato social, gestión clásica de paquetes. |

xGNUpeD no impone una distribución. La reconoce.

---

## Identidad asociativa

La **identidad asociativa** permite crear relaciones semejantes con otras distribuciones, comunidades, repositorios o tiendas de aplicaciones, sin perder la identidad propia.

Un sistema puede necesitar dialogar con:

- repositorios externos;
- formatos de paquete ajenos;
- contenedores;
- capas Flatpak, Snap, AppImage o similares;
- tiendas de aplicaciones;
- herramientas de construcción cruzada;
- entornos de compatibilidad.

La identidad asociativa no dice “todo vale”. Dice:

```text
puedo asociarme con otros ecosistemas,
pero la asociación debe respetar mi identidad estructural.
```

Así, la compatibilidad no destruye soberanía. La amplía bajo contrato.

---

## Identidad conmutativa

La **identidad conmutativa** permite reconocer, filtrar o conmutar propiedades de otros sistemas sin confundirlas con la identidad base.

Por ejemplo, una distribución puede querer adoptar:

- una forma de instalar aplicaciones de otra distribución;
- una política de actualización distinta;
- un modelo de aislamiento;
- un runtime alternativo;
- un sistema de perfiles;
- una capa declarativa;
- o una estrategia de repositorios.

La identidad conmutativa permite distinguir:

```text
esto es propio,
esto es compatible,
esto es prestado,
esto es ajeno,
esto rompe el contrato.
```

Conmutar no significa perder identidad. Significa poder intercambiar propiedades bajo una regla explícita.

---

## Identidad comunicativa

La **identidad comunicativa** dota al sistema de una forma coherente de registrar, auditar y transmitir su estado.

En el corpus anterior se vinculaba esta propiedad con un posible **motor de criptografía soberano**. Refundido dentro de maGNUx, esto significa:

```text
la comunicación del sistema debe poder ser trazable,
autenticable,
y coherente con la identidad declarada.
```

La identidad comunicativa conecta con:

- logs tempranos;
- medición de arranque;
- huellas de estado;
- comunicación entre capas;
- IPC;
- DBus;
- Kommu;
- cifrado;
- políticas de confianza cero.

Sin identidad comunicativa, el sistema puede ejecutar. Pero no puede explicar de forma fiable qué ejecutó, desde dónde y bajo qué legitimidad.

---

## Las cuatro propiedades como matriz

| Propiedad | Pregunta que responde | Riesgo si falta |
|---|---|---|
| Distributiva | ¿A qué linaje pertenece este sistema? | Linux genérico sin autoridad contextual. |
| Asociativa | ¿Con quién puede relacionarse sin perder coherencia? | Compatibilidad caótica. |
| Conmutativa | ¿Qué puede adoptar, filtrar o rechazar? | Mezcla insegura de políticas incompatibles. |
| Comunicativa | ¿Cómo declara y transmite su estado? | Opacidad, logs sin autoridad, trazabilidad débil. |

Estas cuatro propiedades no son decoración teórica. Son la base para que el Dernel pueda operar sobre un sistema que ya tiene una identidad mínima.

---

## Relación con systemd

systemd resuelve problemas reales: orden de arranque, servicios, cgroups, sesiones, logs, dependencias, activación de unidades y estado del sistema.

Pero lo hace dentro de un espacio que ya presupone que el sistema existe.

xGNUpeD se sitúa antes en la pregunta:

```text
¿qué tiene que quedar declarado para que ese sistema pueda existir con identidad propia?
```

Por eso maGNUx no plantea xGNUpeD como “otro systemd”, sino como una capa previa de identidad sobre la que luego el sistema operativo podrá decidir qué init, supervisor o gestor de servicios tiene sentido.

---

## Relación con Dernel

El Dernel necesita saber sobre qué host concede licencia operativa.

No puede conceder licencia sobre una máquina abstracta. Necesita una identidad de base:

```text
xGNUpeD declara identidad.
Dernel concede licencia.
Trilobytes verifica coherencia.
```

Sin xGNUpeD, el Dernel sería una autoridad sin sujeto claro.

---

## Secuencia de identidad

```text
Kernel
  └── xGNUpeD
        ├── identidad distributiva
        ├── identidad asociativa
        ├── identidad conmutativa
        └── identidad comunicativa
              ↓
            Dernel
              ↓
          Trilobytes
              ↓
        Entorno operativo
```

---

## Criterio de aceptación conceptual

xGNUpeD existe correctamente si permite responder antes del userspace ordinario:

1. qué sistema está arrancando;
2. qué distribución lo interpreta;
3. qué kernel lo sostiene;
4. qué política mínima lo legitima;
5. qué asociaciones acepta;
6. qué propiedades puede conmutar;
7. cómo comunica su estado;
8. qué continuidad mantiene hacia Dernel.

---

*← [Capas POSIX](../arquitectura/06-capas-posix.md) | [Índice](../README.md) | Siguiente: [Trilobytes →](08-trilobytes.md)*
