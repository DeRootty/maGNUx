# 10 — Dinámica de identidades: Host y Guest

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> maGNUx: **Ser y no Ser** — el área de mínima acción materializada en la arquitectura CISC x86_64.

---

## En pocas palabras

maGNUx distingue entre **Host** y **Guest** para evitar que la máquina, el sistema, la administración y el usuario queden mezclados en una sola masa de privilegios.

| Concepto | Definición |
|---|---|
| **Host** | Identidad material y estructural de la máquina como sistema. |
| **Guest** | Identidad operativa delegada que actúa sobre el Host bajo licencia. |

El Host no es simplemente “el ordenador”. El Guest no es simplemente “el usuario”.

Host es el sistema como entidad material reconocida.

Guest es la actividad autorizada que opera sobre esa entidad.

---

## La separación fundamental

La separación Host/Guest permite formular:

```text
una cosa es sostener el sistema;
otra cosa es usarlo.
```

En sistemas tradicionales, el usuario, la sesión, los servicios, la administración y los privilegios pueden acabar dependiendo de una noción demasiado amplia de root o del userspace.

maGNUx propone separar:

```text
Host
→ base material y estructural

Guest
→ operación delegada, orgánica o administrativa
```

---

## La pregunta de la identidad droide

El corpus anterior planteaba una imagen poderosa:

> ¿Cómo una hormiga entiende cuál es su hormiguero?

Trasladado al sistema:

```text
¿cómo sabe un servicio,
un demonio,
un proceso,
o una sesión,
cuál es su hormiguero técnico?
```

La identidad droide no es una fantasía antropomórfica. Es la pregunta por los límites algorítmicos:

- qué soy;
- a qué sistema pertenezco;
- qué puedo tocar;
- qué debo ignorar;
- qué autoridad me ha delegado capacidad;
- qué ocurre si actúo fuera de mi dominio.

Host/Guest responde a esa necesidad de límite.

---

## La madeja del hormiguero Linux

Linux puede verse como una madeja de galerías de hormiguero:

- kernel;
- módulos;
- drivers;
- initramfs;
- init;
- servicios;
- sockets;
- buses;
- sesiones;
- permisos;
- dispositivos;
- políticas;
- escritorios;
- aplicaciones.

Esa riqueza es su fuerza. Pero también dificulta responder de forma simple:

```text
¿qué parte sostiene el hormiguero
y qué parte solo circula dentro de él?
```

Host es el hormiguero como estructura.

Guest es la entidad que circula dentro de él con autorización.

---

## VMKZ: levantamiento del Host

El corpus anterior usaba **VMKZ** para describir el levantamiento del plano raíz/host.

Refundido en esta lectura:

```text
VMKZ
→ proceso conceptual por el cual el Host queda constituido
  como base material, identificada y gobernable.
```

VMKZ no es simplemente una máquina virtual. Es una forma de nombrar el momento en que la máquina deja de ser solo hardware arrancado y pasa a ser Host reconocido.

Secuencia conceptual:

```text
firmware
  → bootloader
    → kernel
      → initramfs
        → xGNUpeD
          → VMKZ
            → Host constituido
```

---

## VMDZ: giro hacia el plano delegado

El corpus anterior usaba **VMDZ** como motor del plano delegado/guest.

Refundido aquí:

```text
VMDZ
→ transición desde el Host constituido
  hacia un Guest autorizado para operar.
```

Si VMKZ levanta el plano estructural, VMDZ permite el giro hacia la operación.

```text
VMKZ
→ Host soberano

VMDZ
→ Guest delegado
```

La simetría entre ambos evita que el usuario aparezca como una intrusión dentro del sistema. El usuario aparece como Guest legitimado.

---

## Bypass VMKZ a VMDZ

El bypass no debe entenderse como un atajo inseguro. En maGNUx expresa la transición regulada desde el estado temprano del Host hacia el estado avanzado de operación delegada.

```text
Host temprano
→ identidad estructural
→ licencia Dernel
→ validación Trilobytes
→ Guest operativo
```

El bypass solo es legítimo si conserva:

- identidad del Host;
- política de arranque;
- licencia operativa;
- coherencia de sesión;
- trazabilidad;
- posibilidad de revocación.

---

## Host

La identidad del Host se forma gradualmente:

```text
Bootloader
  → define ruta de arranque
Kernel
  → reconoce hardware
initramfs
  → prepara transición temprana
xGNUpeD
  → declara identidad
Dernel run time
  → concede licencia estructural
Host
  → queda constituido como base operable
```

Componentes del Host:

| Componente | Función |
|---|---|
| Kernel host | Reconoce hardware, memoria, CPU, dispositivos y superficie técnica. |
| xGNUpeD | Declara identidad temprana del sistema. |
| Kommu services | Media comunicaciones internas desde el plano COMM. |
| Dernel run time | Gestiona licencia operativa desde el lado Host. |
| hroot / croot / droot | Dominios raíz que sostienen autoridad material, comunicativa y operativa. |

---

## Guest

El Guest no es un intruso. Es una identidad operativa autorizada.

Puede representar:

- usuario orgánico;
- sesión gráfica;
- servicio autorizado;
- entorno administrativo;
- contenedor;
- subsistema compatible;
- plano delegado de operación.

Componentes del Guest:

| Componente | Función |
|---|---|
| Dernel guest | Recibe licencia operativa desde el Host. |
| Trilobytes | Verifica coherencia de actividad orgánica. |
| Logon | Legitima la entrada de la entidad orgánica. |
| Login | Despliega la sesión operativa. |
| ADMIN | Ejecuta operación cotidiana. |

---

## Relación con entorno gráfico

El corpus anterior mencionaba X11 y Wayland como ejemplos de entidades que dotan de identidad a ventanas, superficies y sesiones gráficas.

Refundido aquí, el punto es:

```text
el escritorio no debería ser el primer lugar donde aparece la identidad operativa.
```

Wayland, X11, KDE, GNOME u otros entornos pueden gestionar ventanas y sesiones, pero maGNUx sitúa la legitimidad antes:

```text
Host
→ Dernel
→ Trilobytes
→ Guest
→ sesión gráfica
```

Así, el entorno gráfico no inventa la identidad: la recibe.

---

## Diagrama completo

```text
┌─────────────────────────────────────────────┐
│                    HOST                      │
│                                             │
│  Kernel host                                │
│      ↓                                      │
│  xGNUpeD                                    │
│      ↓                                      │
│  VMKZ  → Host constituido                   │
│      ↓                                      │
│  Kommu services                             │
│      ↓                                      │
│  Dernel run time                            │
├─────────────────────────────────────────────┤
│              BYPASS VMKZ → VMDZ             │
├─────────────────────────────────────────────┤
│                    GUEST                     │
│                                             │
│  Dernel guest                               │
│      ↓                                      │
│  Trilobytes                                 │
│      ↓                                      │
│  Logon                                      │
│      ↓                                      │
│  Login                                      │
│      ↓                                      │
│  ADMIN / sesión / servicios                 │
└─────────────────────────────────────────────┘
```

---

## Ser y no ser

La frase “Ser y no Ser” expresa una tensión:

- el Host es sistema;
- el Guest opera como si el sistema fuera suyo;
- pero el Guest no debe confundirse con la raíz material del Host.

```text
El Guest usa.
El Host sostiene.
El Dernel licencia.
Trilobytes verifica.
```

---

## Criterio de aceptación conceptual

La dinámica Host/Guest queda correctamente definida si permite responder:

1. qué constituye al Host;
2. cuándo el Host queda reconocido;
3. qué identidad Guest solicita operar;
4. qué transición VMKZ → VMDZ se produce;
5. qué licencia Dernel se concede;
6. qué valida Trilobytes;
7. qué sesión se abre;
8. qué límites impiden confundir uso con soberanía.

---

*← [Dernel](09-dernel.md) | [Índice](../README.md) | Siguiente: [Root y dominios →](11-root-dominios.md)*
