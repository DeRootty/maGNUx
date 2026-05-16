> [⬆ Subir a Levantamiento de sistema tradicional](../research00.md) · [🏠 Inicio](../README.md)

# Comparativa de inits PID 1 y dependencia del kernel Linux

Esta carpeta reúne la primera serie de documentos comparativos sobre cómo distintos sistemas de inicio PID 1 se relacionan con el kernel Linux.

El objetivo no es ordenar los inits de mejor a peor, sino estudiar su **grado de acoplamiento con el kernel**:

```text
cuánto necesitan del kernel,
qué partes del kernel convierten en contrato de arranque,
y qué funciones delegan en scripts, servicios externos o convenciones de distribución.
```

---

## Documentos individuales

| Init | Documento | Perfil resumido |
|---|---|---|
| `systemd` | [Dependencias de systemd respecto al kernel Linux](initKernelDeps-systemd.md) | Administrador integral del sistema apoyado en APIs modernas del kernel. |
| `OpenRC` | [Dependencias de OpenRC respecto al kernel Linux](initKernelDeps-openrc.md) | Init dependencial basado en scripts/runlevels, menos acoplado que systemd. |
| `sysVinit` | [Dependencias de sysVinit respecto al kernel Linux](initKernelDeps-sysvinit.md) | Init clásico por `/etc/inittab`, runlevels y scripts externos. |
| `runit` | [Dependencias de runit respecto al kernel Linux](initKernelDeps-runit.md) | Init/supervisor minimalista: sysVinit vitaminado con supervisión permanente. |
| `dinit` | [Dependencias de dinit respecto al kernel Linux](initKernelDeps-dinit.md) | Init/supervisor moderno con dependencias explícitas y bajo acoplamiento kernel. |

---

## Mapa conceptual rápido

```text
sysVinit → arranque clásico por inittab/runlevels
runit    → supervisión permanente simple
OpenRC   → dependencias y scripts coordinados
dinit    → supervisión + dependencias explícitas modernas
systemd  → administración integral con cgroups, namespaces y políticas kernel
```

---

## Tabla comparativa global

| Campo | sysVinit | runit | OpenRC | dinit | systemd |
|---|---|---|---|---|---|
| Tipo | Init clásico | Init + supervisor | Init dependencial | Init/supervisor moderno | Gestor integral |
| Configuración central | `/etc/inittab` | scripts `run` | scripts + dependencias | service descriptions | unit files |
| Supervisión continua | Limitada | Central | Parcial/externa | Central | Central e integrada |
| Dependencias | Runlevels | Simples/externas | Centrales | Explícitas | Integradas |
| Cgroups | No central | No central | No central | No central | Central |
| Namespaces | No central | No central | No central | No central | Sandboxing declarativo |
| BPF/seccomp | No central | No central | No central | No central | Integrado en políticas |
| Gestión de dispositivos | Externa | Externa | Delegada | Delegada | Integrada en ecosistema |
| Event loop moderno | Bajo | Bajo/medio | Bajo/medio | Medio | Alto |
| Portabilidad | Alta | Alta | Media/alta | Media/alta | Baja fuera de Linux |
| Dependencia kernel moderno | Baja | Baja | Baja/media | Baja/media | Alta |
| Filosofía | Arrancar | Supervisar | Coordinar dependencias | Supervisar con dependencias | Administrar sistema completo |

---

## Lectura por grado de acoplamiento

### Bajo acoplamiento

```text
sysVinit
runit
```

Estos modelos dependen de primitivas clásicas del kernel:

```text
fork()
exec()
wait()/waitpid()
señales
PID
consola/TTY
scripts externos
```

No convierten cgroups, namespaces, BPF, seccomp o pidfd en el centro de su modelo.

### Acoplamiento medio

```text
OpenRC
dinit
```

Ambos introducen más semántica de servicio que sysVinit, pero sin absorber funciones completas del sistema.

- OpenRC destaca por dependencias, scripts y runlevels.
- dinit destaca por supervisión moderna y dependencias explícitas.

### Alto acoplamiento

```text
systemd
```

systemd convierte muchas funciones modernas del kernel en parte central de la administración del sistema:

```text
cgroups
namespaces
BPF/eBPF
seccomp
pidfd
PSI
udev/sysfs/devtmpfs
mount API moderna
unit files como contrato rico de ejecución
```

---

## Lectura para maGNUx

Para maGNUx, esta comparativa permite separar dos ideas:

1. **Init como arranque mínimo**: basta con procesos, señales, scripts y un contrato de sistema básico.
2. **Init como administrador soberano**: exige definir qué partes del kernel forman parte obligatoria del contrato de arranque.

En ese sentido:

```text
sysVinit y runit muestran el suelo mínimo histórico.
OpenRC y dinit muestran modelos intermedios de coordinación/supervisión.
systemd muestra el techo actual de integración con Linux moderno.
```

---

## Próximo paso documental

Tras esta primera serie, el siguiente paso lógico es enlazar este índice desde:

```text
README.md
research00.md
```

con una entrada como:

```md
[Comparativa de dependencias kernel de inits PID 1](init_pid1/README.md)
```

Ese enlace debe añadirse como complemento, sin sustituir los enlaces ya existentes.

---

> [⬆ Subir a Levantamiento de sistema tradicional](../research00.md) · [🏠 Inicio](../README.md)
