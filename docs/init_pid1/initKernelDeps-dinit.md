> [⬆ Subir a Levantamiento de sistema tradicional](../research00.md) · [🏠 Inicio](../README.md)

# Dependencias de `dinit` respecto al kernel Linux

Este documento completa la primera serie comparativa entre sistemas de inicio PID 1 y su grado de dependencia respecto al kernel Linux.

Después de `systemd`, `OpenRC`, `sysVinit` y `runit`, `dinit` representa un init/supervisor moderno con dependencias explícitas, supervisión de servicios y diseño portable.

La posición conceptual de la serie queda así:

```text
sysVinit = init clásico por runlevels
runit    = init clásico + supervisión permanente
OpenRC   = init dependencial basado en scripts/runlevels
dinit    = init/supervisor moderno con dependencias explícitas
systemd  = administrador integral apoyado en APIs modernas del kernel
```

---

## 1. Perfil general de dinit

`dinit` es un service manager e init system. Su documentación lo describe como un supervisor de servicios con soporte de dependencias que también puede actuar como init del sistema.

Su diseño busca:

```text
- supervisión de servicios;
- dependencias explícitas;
- arranque paralelo cuando sea posible;
- reinicio de servicios;
- rollback de dependientes cuando una dependencia cae;
- portabilidad;
- integración con otro software del sistema;
- evitar feature bloat.
```

Esto lo sitúa más cerca de `runit` y `OpenRC` que de `systemd`, pero con una semántica de dependencias y estados más moderna que la de sysVinit.

Interpretación para maGNUx:

```text
dinit moderniza la idea de init/supervisor,
pero no convierte el kernel Linux moderno en la base total de su lenguaje.
```

---

## 2. Terreno común con los demás inits

Todo init PID 1 en Linux necesita un suelo común:

| Área común | dinit | runit | sysVinit | OpenRC | systemd |
|---|---|---|---|---|---|
| PID 1 | Puede actuar como init | Sí | Sí | Puede integrarse con init | Sí |
| Supervisión | Sí | Sí, central | Limitada | Parcial/servicios | Sí, integrada |
| Dependencias | Sí, explícitas | Simples/externas | Runlevels | Sí, central | Sí, unit dependencies |
| `/proc` | Útil | Útil | Útil | Útil | Estructural |
| `/sys` | Útil/delegado | Útil/delegado | Útil/delegado | Útil/delegado | Estructural |
| `/dev` | Necesario | Necesario | Necesario | Necesario | Estructural |
| `/run` | Útil | Útil | Útil | Útil | Requisito fuerte |
| Procesos/señales | Sí | Sí | Sí | Sí | Sí |

Conclusión:

```text
dinit comparte la base clásica Unix/Linux,
pero añade dependencias y supervisión moderna sin llegar al acoplamiento de systemd.
```

---

## 3. Diferencia central frente a runit

`runit` es fuerte en supervisión permanente.

`dinit` añade un modelo más explícito de dependencias, estados y relación entre servicios.

Dinit puede:

```text
- arrancar servicios en paralelo;
- esperar dependencias;
- reiniciar servicios;
- hacer rollback de servicios dependientes si cae una dependencia;
- distinguir tipos de servicio;
- usar una herramienta de control (`dinitctl`).
```

Esto hace que `dinit` sea más expresivo que `runit`, pero sin absorber el sistema completo al estilo de systemd.

---

## 4. Diferencia central frente a systemd

Dinit está diseñado para **integrarse con** el resto del software del sistema, no para sustituirlo o absorberlo.

Frente a systemd:

| Área | dinit | systemd |
|---|---|---|
| Modelo | Supervisor/init moderno | Administrador integral del sistema |
| Cgroups | No eje estructural | Eje estructural |
| Namespaces | No lenguaje principal | Sandboxing declarativo |
| BPF/seccomp/LSM | No central | Políticas avanzadas por unidad |
| udev | Delegado | Integrado en ecosistema systemd |
| Logging | Delegable/configurable | journal integrado |
| Red | Delegada a servicios | Puede integrarse con networkd/resolved |
| Objetivo | Supervisar e integrar | Administrar integralmente |

Fórmula conceptual:

```text
dinit administra servicios y dependencias.
systemd administra servicios como objetos ricos del sistema Linux moderno.
```

---

## 5. Opciones `CONFIG_*` comunes razonables

Dinit no requiere una matriz de `CONFIG_*` comparable a la de systemd.

Sus necesidades son las de un sistema POSIX/Linux funcional con supervisión de procesos:

| Opción | Papel en dinit | Comparación con systemd |
|---|---|---|
| `CONFIG_PROC_FS` | Observación de procesos y estado. | systemd lo usa estructuralmente. |
| `CONFIG_SYSFS` | Útil para scripts/servicios de sistema. | systemd lo integra con udev. |
| `CONFIG_DEVTMPFS` | Útil para `/dev`. | systemd lo presupone como base moderna. |
| `CONFIG_TMPFS` | Útil para `/run` y estado volátil. | systemd exige semántica fuerte de `/run`. |
| `CONFIG_UNIX` | IPC local para herramientas/servicios. | systemd lo usa intensamente. |
| `CONFIG_TTY` | Consola, login y recuperación si aplica. | También relevante en systemd. |
| `CONFIG_NET` | Necesario para servicios de red, no para el init puro. | systemd puede integrarlo más profundamente. |

Grado de dependencia común: **bajo/medio**.

---

## 6. Supervisión y dependencias

La potencia de dinit está en la relación entre servicios.

Tipos de servicio comunes en su documentación:

```text
process
bgprocess
scripted
internal
triggered
```

Esto permite modelar:

```text
- procesos persistentes;
- scripts de arranque/parada;
- agrupaciones internas;
- eventos externos;
- dependencias explícitas.
```

La dependencia con el kernel sigue siendo clásica:

```text
fork()
exec()
wait()/waitpid()
signals
file descriptors
pipes/sockets
process IDs
exit status
```

No exige convertir en centro del modelo:

```text
cgroup v2
BPF LSM
pidfd
PSI
cgroup.kill
mount API moderna
```

---

## 7. Cgroups

### En systemd

Los cgroups son estructurales: cada unidad está asociada a una jerarquía de control.

### En dinit

Dinit puede convivir con cgroups si la distribución o un servicio externo los usa, pero su modelo base no depende de ellos para definir qué es un servicio.

| Aspecto | dinit | systemd |
|---|---|---|
| Cgroups como eje | No | Sí |
| Servicio = cgroup | No necesariamente | Sí, conceptualmente |
| Control de recursos | Externo | Integrado |
| Reinicio de servicio | Supervisor/dependencias | Manager + unidad/cgroup |
| OOM por presión | Externo | systemd-oomd + PSI/MEMCG |

Grado de dependencia de dinit: **bajo**.  
Grado de dependencia de systemd: **muy alto**.

---

## 8. Namespaces

Dinit no convierte namespaces en un lenguaje declarativo central equivalente a systemd.

Puede arrancar servicios que usen aislamiento, contenedores o wrappers externos, pero no define su identidad alrededor de:

```text
PrivateNetwork=
PrivateUsers=
ProtectSystem=
PrivateTmp=
RestrictNamespaces=
```

| Aspecto | dinit | systemd |
|---|---|---|
| Namespaces por servicio | No central | Sí |
| Aislamiento declarativo | Limitado/externo | Sí |
| `CONFIG_NET_NS` | Solo si un servicio externo lo requiere | Relevante para `PrivateNetwork=` |
| `CONFIG_USER_NS` | Solo si un servicio externo lo requiere | Relevante para `PrivateUsers=` |

Grado de dependencia de dinit: **bajo**.  
Grado de dependencia de systemd: **alto**.

---

## 9. BPF, eBPF, LSM y seccomp

Dinit no hace de BPF/eBPF/seccomp/LSM el núcleo de sus descripciones de servicio.

Puede convivir con:

```text
SELinux
AppArmor
seccomp externo
firewalls
wrappers de seguridad
contenedores
```

Pero el init/supervisor no requiere esas tecnologías para definir dependencias y supervisión.

| Área | dinit | systemd |
|---|---|---|
| BPF/eBPF | No estructural | Políticas avanzadas |
| seccomp | No central | Integrado en unit files |
| LSM/BPF | Externo | Puede ser requisito funcional |
| Filtrado de syscalls | Externo | Declarativo por unidad |

Grado de dependencia de dinit: **muy bajo**.  
Grado de dependencia de systemd: **alto**.

---

## 10. Gestión de dispositivos

Dinit no es un gestor de dispositivos.

Necesita que el sistema resuelva `/dev` por otra vía:

```text
devtmpfs
udev
eudev
mdev
scripts de distribución
nodos estáticos
```

| Aspecto | dinit | runit | OpenRC | systemd |
|---|---|---|---|---|
| Gestión de dispositivos | Externa | Externa | Delegada | Integrada |
| Dependencia de sysfs | Práctica | Práctica | Práctica | Muy alta |
| Dependencia de devtmpfs | Útil | Útil | Útil | Base moderna |
| Modelo | Integración externa | Delegación | Delegación | Integración |

Grado de dependencia de dinit: **medio**, pero delegado.

---

## 11. Event loop moderno

Dinit usa una biblioteca propia de manejo de eventos, Dasynq, diseñada para soportar su funcionamiento.

Esto lo diferencia de sysVinit y lo acerca a diseños modernos, pero no implica que dependa del mismo conjunto de APIs Linux que systemd.

| Aspecto | dinit | systemd |
|---|---|---|
| Event handling | Sí, mediante Dasynq | Sí, integrado en sd-event |
| Supervisión | Sí | Sí |
| Dependencias | Sí | Sí |
| pidfd/cgroup.kill/PSI | No eje central | Cada vez más relevantes |
| BPF/seccomp como lenguaje | No | Sí, en políticas |

Interpretación:

```text
dinit es moderno en estructura de servicio,
pero conservador en acoplamiento kernel.
```

---

## 12. Portabilidad

Dinit está diseñado para sistemas POSIX-like como Linux y OpenBSD, y también puede ejecutarse como gestor de servicios de usuario.

Esto lo distancia de systemd:

| Aspecto | dinit | systemd |
|---|---|---|
| Portabilidad conceptual | Alta/media | Baja fuera de Linux |
| Linux como único centro | No | Sí, en la práctica |
| Uso como user service manager | Sí | También existe user manager, pero dentro del ecosistema systemd |
| Dependencia de kernel moderno | Baja/media | Alta |
| Diseño | Integrar, no absorber | Integrar y absorber muchas funciones del sistema |

---

## 13. Grado de acoplamiento de dinit

| Área | Grado |
|---|---|
| Arranque mínimo como PID 1 | Medio |
| Supervisión de servicios | Alto |
| Dependencias explícitas | Alto |
| Cgroups | Bajo |
| Namespaces | Bajo |
| BPF/seccomp/LSM | Muy bajo |
| `/proc`, `/sys`, `/dev`, `/run` | Bajo/medio según distribución |
| Gestión de dispositivos | Delegada |
| Portabilidad fuera de Linux | Mayor que systemd |
| Dependencia de kernel moderno | Baja/media |

Resumen:

```text
dinit ofrece una semántica moderna de servicios y dependencias,
pero no necesita convertir las APIs avanzadas del kernel Linux
en el centro de su contrato PID 1.
```

---

## 14. Razón de diseño

Dinit se distancia de systemd porque busca robustez, limpieza de diseño, portabilidad y ausencia de feature bloat.

En forma conceptual:

```text
sysVinit = arranque clásico por inittab/runlevels
runit    = supervisión permanente simple
OpenRC   = dependencias y scripts coordinados
dinit    = supervisión + dependencias explícitas modernas
systemd  = administración integral con cgroups, namespaces y políticas kernel
```

Dinit no rechaza el kernel. Simplemente no lo convierte en el lugar donde reside toda la semántica de administración del sistema.

---

## 15. Comparativa resumida

| Campo | sysVinit | runit | OpenRC | dinit | systemd |
|---|---|---|---|---|---|
| Tipo | Init clásico | Init + supervisor | Init dependencial | Init/supervisor moderno | Gestor integral |
| Configuración central | `/etc/inittab` | scripts `run` | scripts + dependencias | service descriptions | unit files |
| Supervisión continua | Limitada | Central | Parcial/externa | Central | Central e integrada |
| Dependencias | Runlevels | Simples/externas | Centrales | Explícitas | Integradas |
| Cgroups | No central | No central | No central | No central | Central |
| Namespaces | No central | No central | No central | No central | Sandboxing declarativo |
| BPF/seccomp | No central | No central | No central | No central | Integrado en políticas |
| Gestión de dispositivos | Externa | Externa | Delegada | Delegada | Integrada |
| Portabilidad | Alta | Alta | Media/alta | Media/alta | Baja fuera de Linux |
| Dependencia kernel moderno | Baja | Baja | Baja/media | Baja/media | Alta |
| Filosofía | Arrancar | Supervisar | Coordinar | Supervisar con dependencias | Administrar sistema completo |

---

## 16. Ficha resumida para comparativa

| Campo | dinit |
|---|---|
| Tipo | Init/supervisor moderno con dependencias explícitas. |
| Relación con PID 1 | Puede actuar como init del sistema y también como gestor de servicios de usuario. |
| Dependencia de Linux | Baja/media cuando corre sobre Linux. |
| Dependencia de cgroups | Baja. |
| Dependencia de namespaces | Baja. |
| Dependencia de BPF/seccomp | Muy baja. |
| Dependencia de `/proc`, `/sys`, `/dev`, `/run` | Baja/media, según distribución. |
| Portabilidad | Mayor que systemd. |
| Modelo de degradación | Mantiene su identidad básica sin APIs modernas de Linux. |
| Perfil maGNUx | Modelo moderno y contenido: dependencias explícitas y supervisión sin acoplamiento kernel profundo. |

---

## 17. Siguiente paso de la serie

Con `dinit`, queda completada la primera tanda de documentos individuales:

```text
systemd
OpenRC
sysVinit
runit
dinit
```

El siguiente paso coherente será crear un índice de carpeta:

```text
init_pid1/README.md
```

Ese índice debe enlazar los cinco documentos y ofrecer una tabla comparativa global.

---

> [⬆ Subir a Levantamiento de sistema tradicional](../research00.md) · [🏠 Inicio](../README.md)
