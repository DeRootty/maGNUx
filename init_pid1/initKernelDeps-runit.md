> [⬆ Subir a Levantamiento de sistema tradicional](../research00.md) · [🏠 Inicio](../README.md)

# Dependencias de `runit` respecto al kernel Linux

Este documento continúa la comparativa entre sistemas de inicio PID 1 y su grado de dependencia respecto al kernel Linux.

Después de `systemd`, `OpenRC` y `sysVinit`, `runit` representa un punto intermedio muy interesante:

```text
sysVinit = init clásico por runlevels
runit    = init clásico + supervisión permanente de servicios
systemd  = administrador integral del sistema apoyado en APIs modernas del kernel
```

La idea central es que `runit` puede entenderse como un `sysVinit` vitaminado en supervisión, pero no como un mini-systemd.

---

## 1. Perfil general de runit

`runit` es un sistema de init y supervisión de servicios. Su diseño se apoya en tres ideas:

```text
1. arranque por fases simples;
2. supervisión permanente de servicios;
3. reinicio automático de servicios caídos.
```

A diferencia de `sysVinit`, no se limita a ejecutar procesos por runlevel y dejar gran parte de la vida del servicio en manos de scripts externos.

A diferencia de `systemd`, no convierte cgroups, namespaces, BPF, seccomp, pidfd o la nueva mount API en el centro de su modelo.

Interpretación para maGNUx:

```text
runit aumenta la robustez operativa respecto a sysVinit,
pero conserva un acoplamiento bajo con el kernel moderno.
```

---

## 2. Terreno común entre runit, sysVinit, OpenRC y systemd

Todo init PID 1 funcional en Linux comparte un suelo mínimo:

| Área común | runit | sysVinit | OpenRC | systemd |
|---|---|---|---|---|
| PID 1 | Sí | Sí | Puede trabajar con init del sistema | Sí |
| Procesos hijos | Sí | Sí | Sí | Sí, clasificados por cgroup |
| Señales | Sí | Sí | Sí | Sí, integradas en event loop |
| Consola/TTY | Según sistema | Sí | Sí | Sí |
| `/proc` | Muy útil | Muy útil | Muy útil | Estructural |
| `/sys` | Útil/delegado | Útil/delegado | Útil/delegado | Estructural |
| `/dev` | Necesario | Necesario | Necesario | Estructural |
| `/run` | Útil | Útil | Útil | Requisito fuerte |
| Scripts externos | Sí, pero organizados por servicio | Sí | Sí | Compatibles, no centrales |

Conclusión:

```text
runit comparte la base Unix/Linux clásica,
pero no requiere que el kernel actúe como plano rico de administración.
```

---

## 3. Diferencia central frente a sysVinit

La diferencia más importante entre `sysVinit` y `runit` está en la supervisión.

```text
sysVinit arranca procesos por runlevel.
runit mantiene servicios vigilados de forma continua.
```

En `runit`, cada servicio suele tener un directorio propio y un script `run`. Un supervisor mantiene vivo el proceso asociado.

Esto significa:

```text
si un servicio cae,
runit puede reiniciarlo sin convertir esa capacidad
en una dependencia avanzada del kernel.
```

---

## 4. Diferencia central frente a systemd

Frente a `systemd`, `runit` mantiene una frontera mucho más estrecha con el kernel.

| Área | runit | systemd |
|---|---|---|
| Servicio como unidad kernelizada | No | Sí, unidad asociada a cgroup |
| Supervisión | Sí, directa y simple | Sí, integrada con unidad/cgroup |
| Cgroups | No eje central | Eje estructural |
| Namespaces | No lenguaje principal | Sandboxing declarativo |
| BPF/seccomp | No central | Integrado en políticas |
| Gestión de dispositivos | Delegada | Integrada en ecosistema systemd-udevd |
| Logging | Delegable/simple | journal integrado |
| Activación por socket | No núcleo del modelo | Muy integrada |

La fórmula conceptual sería:

```text
runit supervisa procesos.
systemd administra objetos de sistema.
```

---

## 5. Opciones `CONFIG_*` comunes razonables

`runit` no requiere una matriz extensa de opciones `CONFIG_*` modernas. Sus necesidades son más cercanas a un sistema Unix/Linux clásico.

| Opción | Papel en runit | Comparación con systemd |
|---|---|---|
| `CONFIG_PROC_FS` | Observación de procesos y estado. | systemd lo usa estructuralmente. |
| `CONFIG_SYSFS` | Útil para dispositivos y scripts externos. | systemd lo integra fuertemente. |
| `CONFIG_DEVTMPFS` | Útil para `/dev`. | systemd lo presupone como base moderna. |
| `CONFIG_TMPFS` | Útil para `/run` y estado volátil. | systemd exige semántica fuerte de `/run`. |
| `CONFIG_UNIX` | Sockets locales para servicios/herramientas. | systemd lo usa intensamente para IPC. |
| `CONFIG_TTY` | Consola, getty y login si aplica. | También relevante en systemd. |
| `CONFIG_NET` | Necesario para servicios de red, no para el init puro. | systemd puede integrarlo con networkd y políticas. |

Grado de dependencia común: **bajo/medio**.

---

## 6. Supervisión permanente y kernel

La supervisión de `runit` depende de mecanismos clásicos del kernel:

```text
fork()
exec()
wait()/waitpid()
kill()
signals
pipes/fifos
file descriptors
exit status
```

No necesita convertir en requisito central:

```text
cgroup.kill
pidfd
BPF LSM
seccomp filters
cgroup v2
PSI
mount API moderna
```

Esto es importante para la comparativa:

```text
runit obtiene robustez operativa con mecanismos clásicos,
sin exigir un Linux moderno como systemd.
```

---

## 7. Cgroups

### En systemd

Los cgroups son una dependencia estructural:

```text
- cada unidad tiene su cgroup;
- los procesos se agrupan y limitan;
- se puede matar una unidad completa;
- se integra control de recursos;
- se apoya systemd-oomd.
```

### En runit

`runit` no define su identidad a partir de cgroups. Puede convivir con ellos, y una distribución podría envolver servicios con cgroups, pero el modelo base no los necesita para supervisar procesos.

| Aspecto | runit | systemd |
|---|---|---|
| Cgroups como eje | No | Sí |
| Servicio = cgroup | No | Sí |
| Reinicio de servicio | Supervisor clásico | Manager + cgroup/unit |
| Control fino de recursos | Externo | Integrado |
| OOM por presión | Externo | systemd-oomd + PSI/MEMCG |

Grado de dependencia de runit: **bajo**.  
Grado de dependencia de systemd: **muy alto**.

---

## 8. Namespaces

`runit` no usa namespaces como lenguaje declarativo de servicio.

Puede arrancar programas que creen namespaces por sí mismos, o puede ser combinado con herramientas externas de aislamiento, pero no define servicios mediante opciones equivalentes a:

```text
PrivateNetwork=
PrivateUsers=
ProtectSystem=
PrivateTmp=
RestrictNamespaces=
```

| Aspecto | runit | systemd |
|---|---|---|
| Namespaces por servicio | No central | Sí |
| Aislamiento declarativo | No | Sí |
| `CONFIG_NET_NS` | Solo si un servicio externo lo usa | Relevante para `PrivateNetwork=` |
| `CONFIG_USER_NS` | Solo si un servicio externo lo usa | Relevante para `PrivateUsers=` |

Grado de dependencia de runit: **bajo**.  
Grado de dependencia de systemd: **alto**.

---

## 9. BPF, eBPF, LSM y seccomp

`runit` no hace de BPF/eBPF/seccomp/LSM una parte ordinaria de su modelo.

Puede coexistir con políticas externas:

```text
SELinux
AppArmor
seccomp aplicado por wrappers
firewalls externos
contenedores
supervisores complementarios
```

Pero el init/supervisor no las necesita para definir qué es un servicio.

| Área | runit | systemd |
|---|---|---|
| BPF/eBPF | No estructural | Políticas avanzadas |
| seccomp | No central | Integrado en unit files |
| LSM/BPF | Externo | Puede ser requisito funcional |
| Filtrado de syscalls | Externo | Declarativo por unidad |

Grado de dependencia de runit: **muy bajo**.  
Grado de dependencia de systemd: **alto**.

---

## 10. Gestión de dispositivos

`runit` no es un gestor de dispositivos.

Necesita que el sistema resuelva `/dev` mediante alguna estrategia:

```text
devtmpfs
udev
eudev
mdev
nodos estáticos
scripts de distribución
```

| Aspecto | runit | sysVinit | OpenRC | systemd |
|---|---|---|---|---|
| Gestión de dispositivos | Externa | Externa | Delegada | Integrada en ecosistema |
| Dependencia de sysfs | Práctica | Práctica | Práctica | Muy alta |
| Dependencia de devtmpfs | Útil | Útil | Útil | Base moderna |
| Modelo | Delegación | Delegación | Delegación | Integración |

Grado de dependencia de runit: **medio**, pero externo/delegado.

---

## 11. Event loop moderno

`systemd` usa APIs modernas de evento:

```text
epoll
signalfd
timerfd
eventfd
pidfd
close_range()
```

`runit` se apoya en mecanismos clásicos de procesos y supervisión:

```text
wait/waitpid
signals
pipes
file descriptors
exit status
process supervision
```

| API moderna | runit | systemd |
|---|---|---|
| `epoll` | No núcleo conceptual | Muy importante |
| `signalfd` | No núcleo conceptual | Importante |
| `timerfd` | No núcleo conceptual | Importante |
| `pidfd` | No núcleo conceptual | Cada vez más relevante |
| `close_range()` | No núcleo conceptual | Útil en modelo moderno |

Grado de dependencia de runit: **bajo**.  
Grado de dependencia de systemd: **alto**.

---

## 12. Portabilidad

`runit` conserva una fuerte orientación minimalista y portable dentro del mundo Unix.

No se apoya en una pila exclusiva de Linux moderno para definir servicios.

| Aspecto | runit | systemd |
|---|---|---|
| Portabilidad conceptual | Alta | Baja fuera de Linux |
| Dependencia de Linux moderno | Baja | Alta |
| Modelo de configuración | Directorios/scripts `run` | unit files + APIs Linux |
| Complejidad PID 1 | Baja | Alta |
| Filosofía | Supervisión simple y permanente | Administración integral |

---

## 13. Grado de acoplamiento de runit

| Área | Grado |
|---|---|
| Arranque mínimo como PID 1 | Medio |
| Supervisión de servicios | Alto, pero con primitivas clásicas |
| Cgroups | Bajo |
| Namespaces | Bajo |
| BPF/seccomp/LSM | Muy bajo |
| `/proc`, `/sys`, `/dev`, `/run` | Bajo/medio según distribución |
| Gestión de dispositivos | Delegada |
| Portabilidad fuera de Linux | Alta comparada con systemd |
| Dependencia de kernel moderno | Baja |

Resumen:

```text
runit aumenta la robustez sobre sysVinit mediante supervisión permanente,
pero mantiene un contrato bajo con el kernel moderno.
```

---

## 14. Razón de diseño

`runit` se distancia de `systemd` porque no intenta representar cada servicio como una unidad rica administrada por múltiples subsistemas del kernel.

En forma conceptual:

```text
sysVinit = arranque por inittab/runlevels
runit    = supervisión permanente de procesos
OpenRC   = dependencias y scripts coordinados
systemd  = unidades administradas con cgroups, namespaces y políticas
```

La potencia de runit no viene de integrar más kernel, sino de simplificar la supervisión.

---

## 15. Comparativa resumida runit vs sysVinit vs OpenRC vs systemd

| Campo | sysVinit | runit | OpenRC | systemd |
|---|---|---|---|---|
| Tipo | Init clásico | Init + supervisor | Init basado en dependencias | Gestor integral |
| Configuración central | `/etc/inittab` | directorios/scripts `run` | scripts + dependencias | unit files |
| Supervisión continua | Limitada | Central | Parcial/externa según servicio | Central e integrada |
| Runlevels | Eje principal | Fases simples/servicios | Runlevels/dependencias | Targets |
| Cgroups | No central | No central | No central | Central |
| Namespaces | No central | No central | No central | Sandboxing declarativo |
| BPF/seccomp | No central | No central | No central | Integrado en políticas |
| Gestión de dispositivos | Externa | Externa | Delegada | Integrada |
| Portabilidad | Alta | Alta | Media/alta | Baja fuera de Linux |
| Dependencia kernel moderno | Baja | Baja | Baja/media | Alta |
| Filosofía | Arrancar | Supervisar | Coordinar dependencias | Administrar sistema completo |

---

## 16. Ficha resumida para comparativa

| Campo | runit |
|---|---|
| Tipo | Init y supervisor minimalista. |
| Relación con PID 1 | PID 1 pequeño con fases simples y supervisión permanente. |
| Dependencia de Linux | Baja/media cuando corre sobre Linux. |
| Dependencia de cgroups | Baja. |
| Dependencia de namespaces | Baja. |
| Dependencia de BPF/seccomp | Muy baja. |
| Dependencia de `/proc`, `/sys`, `/dev`, `/run` | Baja/media, según distribución. |
| Portabilidad | Alta comparada con systemd. |
| Modelo de degradación | Si faltan APIs modernas, mantiene su identidad básica. |
| Perfil maGNUx | Punto intermedio: más robusto que sysVinit por supervisión, pero con bajo acoplamiento kernel. |

---

## 17. Próximo init a comparar

Siguiendo el orden del README, el siguiente candidato natural es:

```text
dinit
```

La comparación esperada será interesante porque dinit introduce dependencias y supervisión moderna, pero sin asumir necesariamente el acoplamiento profundo de systemd con el kernel Linux.

---

> [⬆ Subir a Levantamiento de sistema tradicional](../research00.md) · [🏠 Inicio](../README.md)
