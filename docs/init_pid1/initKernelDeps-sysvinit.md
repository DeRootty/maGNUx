> [⬆ Subir a Levantamiento de sistema tradicional](../research00.md) · [🏠 Inicio](../README.md)

# Dependencias de `sysVinit` respecto al kernel Linux

Este documento continúa la comparativa entre sistemas de inicio PID 1 y su grado de dependencia respecto al kernel Linux.

Después de `systemd` y `OpenRC`, `sysVinit` representa el modelo clásico de init: pequeño, simple, basado en runlevels, `/etc/inittab`, señales, procesos hijos y scripts externos.

El objetivo es dejar claro:

1. qué comparte `sysVinit` con `systemd` y `OpenRC` frente al kernel;
2. qué dependencias modernas de `systemd` no forman parte del modelo central de `sysVinit`;
3. por qué `sysVinit` tiene un acoplamiento mucho menor con Linux moderno.

---

## 1. Perfil general de sysVinit

`sysVinit` es un init clásico de estilo System V.

Su función principal es:

```text
PID 1
+ leer /etc/inittab
+ entrar en un runlevel
+ lanzar procesos definidos para ese runlevel
+ reapadrinar procesos huérfanos
+ recibir señales
+ ejecutar transiciones de runlevel
+ coordinar apagado/reinicio mediante scripts externos
```

Frente a systemd:

```text
sysVinit no intenta convertir PID 1 en un administrador integral del sistema.
sysVinit intenta arrancar lo necesario, mantener el árbol de procesos básico
y delegar la administración en scripts y herramientas externas.
```

---

## 2. Terreno común entre sysVinit, OpenRC y systemd

Todo init PID 1 que arranca un sistema Linux comparte un suelo mínimo:

| Área común | sysVinit | OpenRC | systemd |
|---|---|---|---|
| PID 1 | Sí | Puede trabajar con init del sistema | Sí, central |
| Procesos hijos | Sí | Sí | Sí, más cgroups |
| Señales | Sí | Sí | Sí, integradas en event loop |
| Consola/TTY | Sí | Sí | Sí |
| Scripts externos | Muy importante | Muy importante | Compatibles, pero no centrales |
| `/proc` | Muy útil | Muy útil | Estructural |
| `/sys` | No núcleo del modelo | Útil/delegado | Estructural con udev |
| `/dev` | Necesario para consola/dispositivos | Necesario | Estructural con devtmpfs/udev |
| `/run` | Útil para estado runtime moderno | Útil | Requisito fuerte |

La diferencia está en la profundidad:

```text
sysVinit necesita el kernel para existir como PID 1,
pero no convierte tantas capacidades modernas del kernel
en lenguaje propio de administración.
```

---

## 3. Diferencia central frente a systemd

La diferencia conceptual puede expresarse así:

```text
systemd = PID 1 como administrador integral del sistema Linux moderno
OpenRC  = init dependencial que coordina servicios y scripts
sysVinit = init clásico que ejecuta inittab, runlevels y scripts externos
```

En `systemd`, cgroups, namespaces, BPF, seccomp, mount API moderna y otros mecanismos del kernel se convierten en parte del contrato de cada unidad.

En `sysVinit`, el contrato es mucho más simple:

```text
lee configuración
lanza procesos
espera procesos
responde a señales
cambia de runlevel
llama scripts
```

---

## 4. Opciones `CONFIG_*` comunes razonables

`sysVinit` no necesita una matriz moderna de `CONFIG_*` comparable a la de `systemd`.

Para un sistema Linux funcional con sysVinit, las opciones más razonables son las clásicas:

| Opción | Papel en sysVinit | Comparación con systemd |
|---|---|---|
| `CONFIG_PROC_FS` | Observación de procesos y estado del sistema. | systemd lo usa de forma estructural. |
| `CONFIG_SYSFS` | Útil para sistemas Linux modernos, aunque no define el modelo de sysVinit. | systemd lo integra fuertemente con udev. |
| `CONFIG_DEVTMPFS` | Muy útil para disponer de `/dev`; sysVinit puede coexistir con otras soluciones. | systemd lo presupone como parte del arranque moderno. |
| `CONFIG_TMPFS` | Útil para `/run`, `/tmp` u otros estados volátiles. | systemd exige semántica fuerte de `/run`. |
| `CONFIG_UNIX` | Sockets Unix para herramientas y servicios externos. | systemd lo usa intensamente para IPC. |
| `CONFIG_TTY` | Consola, getty y login. | También necesario en sistemas systemd. |
| `CONFIG_VT` | Consolas virtuales si se usan. | También puede usarse con systemd. |
| `CONFIG_NET` | No requerido por el init puro, sí por servicios de red. | systemd puede integrarlo con networkd y políticas. |

Grado de dependencia común: **bajo/medio**.

---

## 5. `/etc/inittab` y runlevels

La pieza central de sysVinit no es una API moderna del kernel, sino un archivo de configuración clásico:

```text
/etc/inittab
```

A partir de ahí, init decide qué procesos lanzar en cada runlevel.

Ejemplo conceptual:

```text
runlevel S → arranque monousuario / inicialización temprana
runlevel 1 → modo mantenimiento
runlevel 2-5 → modos multiusuario según distribución
runlevel 0 → apagado
runlevel 6 → reinicio
```

Esto desplaza el peso del diseño desde el kernel hacia:

```text
- ficheros de configuración;
- scripts de init;
- convenciones de distribución;
- herramientas externas;
- administración humana clásica.
```

---

## 6. Cgroups

### En systemd

Los cgroups son estructurales:

```text
- cada unidad se asocia a un cgroup;
- los procesos se clasifican por unidad;
- se aplican límites de recursos;
- se puede matar una unidad completa;
- se integra systemd-oomd;
- se aplican políticas de control.
```

### En sysVinit

`sysVinit` no se basa en cgroups como eje de su modelo.

Puede arrancar servicios que usen cgroups por su cuenta, o ejecutarse en una distribución que monte cgroups para otros subsistemas, pero el init clásico no depende de ellos para entender qué es un servicio.

| Aspecto | sysVinit | systemd |
|---|---|---|
| Cgroups como base del init | No | Sí |
| Servicio = cgroup | No | Sí, conceptualmente |
| Control fino de recursos | Externo | Integrado |
| Matar servicio completo | Scripts/PID/señales | cgroup/unit |
| OOM por presión | Externo | `systemd-oomd` con PSI/MEMCG |

Grado de dependencia de sysVInit: **bajo**.  
Grado de dependencia de systemd: **muy alto**.

---

## 7. Namespaces

`sysVinit` no usa namespaces como parte central de su lenguaje de configuración.

No existe un equivalente natural de:

```text
PrivateNetwork=
PrivateUsers=
PrivateTmp=
ProtectSystem=
RestrictNamespaces=
```

Eso puede lograrse con herramientas externas o wrappers, pero no forma parte del núcleo conceptual de sysVinit.

| Aspecto | sysVinit | systemd |
|---|---|---|
| Namespaces por servicio | No central | Central en sandboxing |
| `CONFIG_NET_NS` | Solo si servicios externos lo requieren | Relevante para `PrivateNetwork=` |
| `CONFIG_USER_NS` | Solo si servicios externos lo requieren | Relevante para `PrivateUsers=` |
| Aislamiento declarativo | No | Sí |

Grado de dependencia de sysVinit: **bajo**.  
Grado de dependencia de systemd: **alto**.

---

## 8. BPF, eBPF, LSM y seccomp

`sysVinit` no hace de BPF/eBPF/seccomp/LSM una parte ordinaria del modelo PID 1.

Puede convivir con:

```text
SELinux
AppArmor
seccomp aplicado por servicios
firewalls externos
wrappers de seguridad
contenedores
```

Pero esas funciones no están integradas como lenguaje nativo del init.

| Área | sysVinit | systemd |
|---|---|---|
| BPF/eBPF | No estructural | Políticas avanzadas |
| seccomp | No central | Integrado en unit files |
| LSM/BPF | Externo | Puede ser requisito funcional |
| Filtrado de syscalls | Externo | Declarativo por unidad |
| Restricción de filesystem | Externa | `RestrictFileSystems=` |

Grado de dependencia de sysVinit: **muy bajo**.  
Grado de dependencia de systemd: **alto**.

---

## 9. Gestión de dispositivos

`sysVinit` no es un gestor de dispositivos.

Necesita que el sistema tenga una estrategia para `/dev`:

```text
devtmpfs
udev
eudev
mdev
nodos estáticos
scripts de distribución
```

En el modelo clásico, la gestión de dispositivos queda fuera del init o se resuelve mediante scripts.

| Aspecto | sysVinit | OpenRC | systemd |
|---|---|---|---|
| Gestión de dispositivos | Externa | Delegada | Integrada en ecosistema systemd-udevd |
| Dependencia de sysfs | Práctica | Práctica/delegada | Muy alta |
| Dependencia de devtmpfs | Útil | Útil | Base moderna |
| Modelo | Delegación clásica | Delegación | Integración |

Grado de dependencia de sysVinit: **medio**, pero externo/delegado.

---

## 10. Señales, espera de hijos y consola

El núcleo operativo de sysVinit se parece más a una máquina clásica de procesos:

```text
fork()
exec()
wait()/waitpid()
signal()/sigaction()
kill()
setsid()
open()/close()
reboot()
```

También necesita consola/TTY para ciertos modos de arranque, mantenimiento o recuperación.

Esto lo hace dependiente del kernel, pero de un conjunto muy clásico y estable de llamadas.

| Área | Dependencia |
|---|---|
| Señales | Alta, pero clásica. |
| Reaping de procesos huérfanos | Alta: PID 1 debe adoptar/recolectar procesos. |
| Consola | Importante para recuperación/login. |
| Reboot/apagado | Importante mediante syscalls/herramientas. |
| Event loop moderno | No estructural. |

---

## 11. Event loop moderno

systemd se apoya en APIs modernas como:

```text
epoll
signalfd
timerfd
eventfd
pidfd
```

sysVinit pertenece a una tradición anterior:

```text
señales clásicas
wait/waitpid
ficheros de configuración
scripts
procesos hijos
FIFO/initctl para telinit
```

| API moderna | sysVinit | systemd |
|---|---|---|
| `epoll` | No estructural | Muy importante |
| `signalfd` | No estructural | Importante |
| `timerfd` | No estructural | Importante |
| `pidfd` | No estructural | Cada vez más relevante |
| `close_range()` | No estructural | Útil en modelo moderno |

Grado de dependencia de sysVinit: **bajo**.  
Grado de dependencia de systemd: **alto**.

---

## 12. Portabilidad

sysVinit es conceptualmente portable dentro del mundo Unix/POSIX.

No está diseñado alrededor de una pila exclusiva de Linux moderno como cgroups v2, BPF LSM o pidfd.

| Aspecto | sysVinit | systemd |
|---|---|---|
| Portabilidad conceptual | Alta | Baja fuera de Linux |
| Dependencia de Linux moderno | Baja | Alta |
| Modelo de configuración | `/etc/inittab`, scripts | unit files + APIs Linux |
| Complejidad PID 1 | Baja | Alta |
| Filosofía | Mantenerse fuera del camino | Administrar integralmente |

---

## 13. Grado de acoplamiento de sysVinit

| Área | Grado |
|---|---|
| Arranque mínimo como PID 1 | Medio |
| Gestión de servicios | Baja/media, vía scripts |
| Cgroups | Bajo |
| Namespaces | Bajo |
| BPF/seccomp/LSM | Muy bajo |
| `/proc`, `/sys`, `/dev`, `/run` | Bajo/medio según distribución |
| Gestión de dispositivos | Delegada |
| Portabilidad fuera de Linux | Alta comparada con systemd |
| Dependencia de kernel moderno | Baja |

Resumen:

```text
sysVinit depende del kernel como cualquier PID 1,
pero su contrato funcional es clásico: procesos, señales,
runlevels, inittab y scripts externos.
```

---

## 14. Razón de diseño

sysVinit se distancia de systemd porque no intenta administrar el sistema como una colección de objetos kernel modernos.

En forma conceptual:

```text
systemd  = servicios como unidades administradas con cgroups, namespaces y políticas
OpenRC   = servicios como dependencias y scripts coordinados
sysVinit = procesos por runlevel definidos en /etc/inittab
```

La dependencia de sysVinit con el kernel es más pequeña porque su ambición administrativa también es menor.

---

## 15. Comparativa resumida sysVinit vs OpenRC vs systemd

| Campo | sysVinit | OpenRC | systemd |
|---|---|---|---|
| Tipo | Init clásico System V | Init basado en dependencias | Gestor integral de sistema |
| Configuración central | `/etc/inittab` | scripts + dependencias | unit files |
| Runlevels | Eje principal | Compatible/conceptual | Compatibilidad parcial/targets |
| Cgroups | No central | No central | Central |
| Namespaces | No central | No central | Sandboxing declarativo |
| BPF/seccomp | No central | No central | Integrado en políticas |
| Gestión de dispositivos | Externa | Delegada | Integrada en ecosistema |
| Portabilidad | Alta | Media/alta | Baja fuera de Linux |
| Dependencia kernel moderno | Baja | Baja/media | Alta |
| Filosofía | Simple y clásico | Coordinar dependencias | Administrar el sistema completo |

---

## 16. Ficha resumida para comparativa

| Campo | sysVinit |
|---|---|
| Tipo | Init clásico System V. |
| Relación con PID 1 | PID 1 pequeño que lanza procesos por runlevel. |
| Dependencia de Linux | Baja/media cuando corre sobre Linux. |
| Dependencia de cgroups | Baja. |
| Dependencia de namespaces | Baja. |
| Dependencia de BPF/seccomp | Muy baja. |
| Dependencia de `/proc`, `/sys`, `/dev`, `/run` | Baja/media, según distribución. |
| Portabilidad | Alta comparada con systemd. |
| Modelo de degradación | Si faltan APIs modernas, normalmente no pierde su identidad básica. |
| Perfil maGNUx | Extremo clásico de bajo acoplamiento; útil como referencia mínima histórica. |

---

## 17. Próximo init a comparar

Siguiendo el orden del README, el siguiente candidato natural es:

```text
runit
```

La comparación esperada será interesante porque runit introduce una supervisión de servicios más clara que sysVinit, pero sin llegar al nivel de integración profunda con el kernel propio de systemd.

---

> [⬆ Subir a Levantamiento de sistema tradicional](../research00.md) · [🏠 Inicio](../README.md)
