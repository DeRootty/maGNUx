> [⬆ Subir a Levantamiento de sistema tradicional](../research00.md) · [🏠 Inicio](../README.md)

# Dependencias de `OpenRC` respecto al kernel Linux

Este documento continúa la comparativa entre diferentes sistemas de inicio PID 1 y su grado de dependencia respecto al kernel Linux.

El objetivo específico es comparar `OpenRC` con `systemd` dejando claro:

1. qué bases comunes comparten frente al kernel;
2. qué aspectos `systemd` convierte en dependencias estructurales del kernel;
3. cómo `OpenRC` se distancia de ese modelo al delegar más en scripts, herramientas externas y convenciones del sistema.

---

## 1. Perfil general de OpenRC

OpenRC se define como un sistema de init basado en dependencias que trabaja con el init proporcionado por el sistema, normalmente `/sbin/init`.

Su diseño se aproxima más a:

```text
init / supervisor de arranque
+ resolución de dependencias entre servicios
+ ejecución de scripts de servicio
+ runlevels
+ integración con init del sistema
+ hooks para BSD init o SysVInit
```

Esto lo diferencia de `systemd`, que integra dentro de su modelo funciones mucho más amplias:

```text
cgroups como eje estructural
namespaces declarativos por unidad
BPF/eBPF para políticas
seccomp
udev integrado en el ecosistema systemd
journal
gestión amplia de recursos
activación por socket
servicios auxiliares fuertemente acoplados
```

Interpretación para maGNUx:

```text
OpenRC depende del kernel para arrancar y observar el sistema,
pero no convierte tantas APIs modernas de Linux en condición central
de su modelo de init.
```

---

## 2. Terreno común entre OpenRC y systemd

Tanto OpenRC como systemd, cuando funcionan sobre Linux, necesitan una base mínima del kernel para que el sistema sea arrancable y administrable.

| Área común | OpenRC | systemd |
|---|---|---|
| PID 1 o integración con init | Sí | Sí |
| `/proc` | Necesario/práctico para inspección de procesos y estado | Estructural |
| `/sys` | Necesario/práctico para dispositivos y estado del kernel | Estructural |
| `/dev` | Necesario para dispositivos | Estructural con devtmpfs/udev |
| `/run` | Estado volátil de servicios | Requisito explícito del modelo systemd |
| Señales Unix | Necesarias para controlar servicios | Necesarias e integradas con event loop moderno |
| Procesos y sesiones | Base del arranque | Base del arranque y de la clasificación por unidad |
| Montajes tempranos | Necesarios | Muy integrados en unidades y dependencias |
| Red | Según servicios | Integrada en systemd-networkd y políticas de unidad |

Conclusión:

```text
Ambos dependen del kernel para existir como init,
pero no dependen del kernel con la misma profundidad conceptual.
```

---

## 3. Diferencia central frente a systemd

La diferencia central puede formularse así:

```text
systemd usa el kernel como plano de administración estructural.
OpenRC usa el kernel como plano de ejecución del sistema,
pero mantiene la administración más cerca de scripts, runlevels y servicios externos.
```

En `systemd`, muchas capacidades del kernel se vuelven parte del contrato ordinario de cada unidad.

En `OpenRC`, esas capacidades pueden existir en el sistema, pero no suelen ser el eje que define el modelo de init.

---

## 4. Opciones `CONFIG_*` comunes razonables

OpenRC no publica una lista de opciones `CONFIG_*` tan extensa como systemd. Para su uso sobre Linux, las opciones comunes razonables son las propias de un sistema Unix/Linux arrancable.

| Opción | Papel en OpenRC | Comparación con systemd |
|---|---|---|
| `CONFIG_PROC_FS` | Permite observar procesos y estado del sistema mediante `/proc`. | En systemd es base estructural. |
| `CONFIG_SYSFS` | Permite observar dispositivos y atributos del kernel mediante `/sys`. | En systemd se integra fuertemente con udev. |
| `CONFIG_DEVTMPFS` | Facilita disponibilidad temprana de `/dev`. | En systemd es parte de la base moderna de dispositivos. |
| `CONFIG_TMPFS` | Útil para `/run` y estado volátil. | systemd exige semántica fuerte alrededor de `/run`. |
| `CONFIG_UNIX` | Sockets Unix locales para servicios y herramientas. | systemd lo usa intensamente para IPC. |
| `CONFIG_NET` | Necesario para servicios de red, no para el concepto puro de init. | systemd puede integrarlo en networkd y políticas. |
| `CONFIG_TTY` | Consolas, getty/login y control interactivo. | También necesario en sistemas systemd. |
| `CONFIG_SIGNALFD`, `CONFIG_TIMERFD`, `CONFIG_EPOLL` | No son el núcleo conceptual de OpenRC. | En systemd son parte del modelo moderno de eventos. |

Grado de dependencia común: **medio**.

---

## 5. Cgroups

### En systemd

Los cgroups son estructurales. systemd los usa para:

```text
- identificar qué procesos pertenecen a cada unidad;
- matar servicios completos;
- limitar CPU, memoria y procesos;
- aplicar jerarquía de recursos;
- integrar systemd-oomd;
- implementar parte de su modelo de administración.
```

### En OpenRC

OpenRC puede convivir con cgroups o con sistemas que los usen, pero su identidad de init no se basa de forma tan profunda en ellos.

OpenRC tiende a apoyarse más en:

```text
- scripts de servicio;
- dependencias declaradas;
- runlevels;
- PID files cuando aplica;
- herramientas externas;
- convenciones de distribución.
```

| Aspecto | OpenRC | systemd |
|---|---|---|
| Cgroups como eje del init | No de forma central | Sí |
| Gestión de procesos por unidad | Más tradicional | Estructural vía cgroups |
| Control fino de recursos | Externo o menos integrado | Integrado en unit files |
| Matar unidad completa | Más dependiente de scripts/PID/supervisión | Integrado con cgroups |

Grado de dependencia de OpenRC: **bajo/medio**.  
Grado de dependencia de systemd: **muy alto**.

---

## 6. Namespaces

### En systemd

systemd usa namespaces como parte de su modelo declarativo de sandboxing:

```text
PrivateNetwork=
PrivateUsers=
PrivateTmp=
ProtectSystem=
RestrictNamespaces=
```

### En OpenRC

OpenRC puede arrancar servicios que usen namespaces por su cuenta, contenedores o herramientas externas, pero el modelo base de OpenRC no convierte los namespaces en el lenguaje principal de definición de servicios.

| Aspecto | OpenRC | systemd |
|---|---|---|
| Namespaces como parte ordinaria del init | No | Sí, en sandboxing de unidades |
| `CONFIG_NET_NS` | Útil si un servicio lo necesita | Relevante para `PrivateNetwork=` |
| `CONFIG_USER_NS` | Útil si un servicio lo necesita | Relevante para `PrivateUsers=` |
| Aislamiento declarativo por servicio | No central | Central en muchas unidades |

Grado de dependencia de OpenRC: **bajo**.  
Grado de dependencia de systemd: **alto**.

---

## 7. BPF, eBPF, LSM y seccomp

### En systemd

systemd puede usar BPF/eBPF/LSM/seccomp para políticas como:

```text
IPAddressDeny=
IPAddressAllow=
RestrictNetworkInterfaces=
RestrictFileSystems=
SystemCallFilter=
```

### En OpenRC

OpenRC no basa su modelo principal de init en BPF/eBPF/LSM/seccomp.

Puede arrancar servicios que usen esas tecnologías, o puede coexistir con políticas externas de seguridad, pero no convierte esas funciones en elementos centrales de la semántica de arranque.

| Área | OpenRC | systemd |
|---|---|---|
| BPF/eBPF | No estructural | Importante para políticas avanzadas |
| seccomp | Externo al modelo base | Integrado en unit files |
| LSM/BPF | No central | Puede ser requisito para `RestrictFileSystems=` |
| Filtro de syscalls por servicio | No como rasgo base | Declarativo mediante systemd |

Grado de dependencia de OpenRC: **bajo**.  
Grado de dependencia de systemd: **alto**.

---

## 8. udev, devfs y gestión de dispositivos

OpenRC no equivale a udev. Normalmente necesita que alguna solución de gestión de dispositivos exista en el sistema:

```text
udev
eudev
mdev
devtmpfs
scripts propios de distribución
```

systemd, en cambio, forma parte de un ecosistema donde udev está muy integrado.

| Aspecto | OpenRC | systemd |
|---|---|---|
| Gestión de dispositivos | Delegada en udev/eudev/mdev/devtmpfs | Integrada en ecosistema systemd-udevd |
| Dependencia de sysfs | Práctica, vía gestor de dispositivos | Muy alta |
| Dependencia de devtmpfs | Muy útil | Base recomendada |
| Modelo | Delegación | Integración |

Grado de dependencia de OpenRC: **medio**, pero delegada.  
Grado de dependencia de systemd: **muy alto**, integrada.

---

## 9. Event loop moderno: epoll, signalfd, timerfd

systemd usa intensamente un modelo moderno de eventos basado en descriptores:

```text
epoll
signalfd
timerfd
eventfd
```

OpenRC puede funcionar sin convertir ese modelo en su identidad principal. Su lógica histórica se apoya más en scripts, procesos, shell, dependencias y ejecución secuencial/paralela de servicios.

| API | OpenRC | systemd |
|---|---|---|
| `epoll` | No núcleo conceptual | Muy importante |
| `signalfd` | No núcleo conceptual | Importante |
| `timerfd` | No núcleo conceptual | Importante |
| `eventfd` | No núcleo conceptual | Importante en ecosistema moderno |

Grado de dependencia de OpenRC: **bajo/medio**.  
Grado de dependencia de systemd: **alto**.

---

## 10. Portabilidad

OpenRC conserva una orientación más portable que systemd.

El README de OpenRC menciona hooks desde BSD init hacia OpenRC, `devd.conf` modificado desde FreeBSD y `inittab` para SysVInit en distribuciones Linux.

Esto sugiere un diseño menos atado a una única forma Linux-moderna de administrar el sistema.

| Aspecto | OpenRC | systemd |
|---|---|---|
| Portabilidad conceptual | Mayor | Menor |
| Dependencia de Linux moderno | Menor | Alta |
| Dependencia de cgroups v2 | No estructural | Muy relevante |
| Integración con BSD/SysV hooks | Sí | No es su modelo principal |

---

## 11. Grado de acoplamiento de OpenRC

| Área | Grado |
|---|---|
| Arranque mínimo como init | Medio |
| Gestión de servicios | Medio |
| Cgroups | Bajo/medio |
| Namespaces | Bajo |
| BPF/seccomp/LSM | Bajo |
| `/proc`, `/sys`, `/dev`, `/run` | Medio |
| udev/eudev/mdev/devtmpfs | Medio, pero delegado |
| Portabilidad fuera de Linux | Mayor que systemd |
| Dependencia de kernel moderno | Baja/media |

Resumen:

```text
OpenRC necesita un kernel funcional y las interfaces clásicas de un sistema Unix/Linux,
pero evita convertir muchas capacidades modernas del kernel en parte central de su modelo PID 1.
```

---

## 12. Razón de diseño

OpenRC se distancia de systemd porque su propósito principal es resolver dependencias y coordinar scripts/servicios, no construir una capa integral de administración del sistema sobre APIs modernas del kernel.

En forma conceptual:

```text
systemd = init como administrador integral apoyado en el kernel moderno
OpenRC  = init como coordinador de arranque y dependencias, delegando más fuera del kernel
```

Esto no significa que OpenRC ignore el kernel. Significa que su contrato con el kernel es más estrecho y menos invasivo.

---

## 13. Comparativa resumida OpenRC vs systemd

| Campo | OpenRC | systemd |
|---|---|---|
| Tipo | Init basado en dependencias | Gestor integral de sistema y servicios |
| PID 1 | Puede trabajar con init del sistema | PID 1 central del ecosistema |
| Cgroups | No eje principal | Eje estructural |
| Namespaces | No núcleo del modelo | Sandboxing declarativo |
| BPF/eBPF | No central | Políticas avanzadas |
| seccomp | Externo/no central | Integrado en unidades |
| udev | Delegado | Integrado en ecosistema |
| Portabilidad | Mayor | Baja fuera de Linux |
| Dependencia de kernel moderno | Baja/media | Alta |
| Filosofía | Coordinar arranque | Administrar sistema completo |

---

## 14. Ficha resumida para comparativa

| Campo | OpenRC |
|---|---|
| Tipo | Init basado en dependencias. |
| Relación con PID 1 | Puede trabajar con el init proporcionado por el sistema. |
| Dependencia de Linux | Media cuando corre sobre Linux, menor que systemd. |
| Dependencia de cgroups | Baja/media. |
| Dependencia de namespaces | Baja. |
| Dependencia de BPF/seccomp | Baja. |
| Dependencia de `/proc`, `/sys`, `/dev`, `/run` | Media. |
| Portabilidad | Mayor que systemd. |
| Modelo de degradación | Delega más en scripts, herramientas y servicios externos. |
| Perfil maGNUx | Init de acoplamiento moderado; buen punto intermedio entre sysVinit/runit y systemd. |

---

## 15. Próximo init a comparar

Siguiendo el orden del README, el siguiente candidato natural es:

```text
sysVinit
```

La comparación esperada será útil porque sysVinit representa un modelo todavía más clásico: menos integración con el kernel, más dependencia de `/etc/inittab`, runlevels y scripts externos.

---

> [⬆ Subir a Levantamiento de sistema tradicional](../research00.md) · [🏠 Inicio](../README.md)
