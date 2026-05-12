> [⬆ Subir a Levantamiento de sistema tradicional](research00.md) · [🏠 Inicio](README.md)

# Dependencias de `systemd` respecto al kernel Linux

Este documento inaugura una comparativa entre diferentes sistemas de inicio PID 1 y su grado de dependencia respecto al kernel Linux durante el arranque y la operación temprana.

El objetivo no es medir si un init es mejor o peor, sino **cuánto acoplamiento tiene con el kernel**, qué partes del kernel necesita y por qué.

## Criterio de análisis

Para cada init se evaluarán estos puntos:

| Campo | Pregunta |
|---|---|
| Modelo de init | ¿Es solo lanzador de servicios o administrador integral del sistema? |
| Dependencia de Linux | ¿Puede funcionar fuera de Linux o está ligado a APIs Linux? |
| Dependencia de cgroups | ¿Usa cgroups como eje de control de servicios? |
| Dependencia de namespaces | ¿Usa aislamiento del kernel como parte ordinaria de su modelo? |
| Dependencia de BPF/seccomp/LSM | ¿Aplica políticas de seguridad avanzadas desde PID 1 o sus unidades? |
| Dependencia de `/proc`, `/sys`, `/dev`, `/run` | ¿Necesita pseudo-filesystems del kernel para observar/administrar el sistema? |
| Dependencia de APIs modernas | ¿Requiere syscalls o atributos de kernel recientes? |
| Degradación funcional | ¿Arranca igual si faltan APIs, o pierde capacidades importantes? |

---

## 1. Perfil general de `systemd`

`systemd` no es únicamente un programa que arranca scripts. Su diseño lo sitúa como:

```text
PID 1
+ gestor de servicios
+ supervisor de procesos
+ gestor de unidades
+ gestor de cgroups
+ integrador de udev
+ activador por socket
+ gestor de montaje y recursos
+ base de políticas de sandboxing
+ punto de coordinación para servicios auxiliares
```

Por eso su acoplamiento con Linux es **alto**.

La razón principal es conceptual: `systemd` usa capacidades modernas del kernel para convertir el PID 1 en un centro de administración del sistema, no solo en un lanzador de procesos.

---

## 2. Línea base de kernel

Según la documentación actual de `systemd`, la línea base relevante es:

| Nivel | Kernel |
|---|---|
| Mínimo no soportado por debajo de | Linux 5.10 |
| Recomendado | Linux 5.14 o superior |
| APIs modernas adicionales | Linux 6.x para pidfs, nuevos atributos `statx`, nuevos pidfd, tmpfs quota, `SO_PASSRIGHTS`, etc. |

Interpretación para maGNUx:

```text
systemd puede degradar funcionalidad cuando faltan APIs modernas,
pero su modelo real presupone un Linux moderno con cgroups,
procfs, sysfs, devtmpfs, namespaces y control avanzado de procesos.
```

---

## 3. Opciones `CONFIG_*` base

Opciones de kernel base señaladas por `systemd`:

| Opción | Papel en systemd |
|---|---|
| `CONFIG_DEVTMPFS` | Base temprana de `/dev`; permite disponer de nodos de dispositivo gestionables desde usuariospace. |
| `CONFIG_CGROUPS` | Eje del control de servicios, unidades, procesos y recursos. |
| `CONFIG_INOTIFY_USER` | Vigilancia de cambios en archivos, unidades y estado del sistema. |
| `CONFIG_SIGNALFD` | Gestión de señales mediante descriptores de archivo. |
| `CONFIG_TIMERFD` | Temporizadores integrables en el bucle de eventos. |
| `CONFIG_EPOLL` | Multiplexación eficiente de eventos. |
| `CONFIG_UNIX` | Sockets Unix locales; base de comunicación interna. |
| `CONFIG_SYSFS` | Exposición de dispositivos y objetos del kernel en `/sys`. |
| `CONFIG_PROC_FS` | Observación de procesos y estado del kernel mediante `/proc`. |
| `CONFIG_FHANDLE` | Manejo avanzado de ficheros, montajes y bind mounts. |

Estas opciones forman el suelo sobre el que `systemd` puede observar, clasificar y administrar procesos, servicios, dispositivos y montajes.

---

## 4. Cgroups como dependencia estructural

Para `systemd`, los cgroups no son un accesorio. Son una parte estructural de su modelo.

Usos principales:

```text
- asociar procesos a servicios reales;
- evitar depender solo de PID files;
- agrupar procesos hijos de una unidad;
- matar unidades completas;
- aplicar límites de CPU, memoria y procesos;
- integrar systemd-oomd;
- aplicar jerarquía de recursos.
```

Opciones relevantes:

| Opción | Uso |
|---|---|
| `CONFIG_CGROUPS` | Infraestructura base de cgroups. |
| `CONFIG_CGROUP_SCHED` | Control de planificación por cgroup. |
| `CONFIG_FAIR_GROUP_SCHED` | Distribución de CPU por grupos. |
| `CONFIG_CFS_BANDWIDTH` | Necesario para `CPUQuota=`. |
| `CONFIG_MEMCG` | Control de memoria por cgroup. |
| `CONFIG_PSI` | Pressure Stall Information, usado por `systemd-oomd`. |
| `CONFIG_CGROUP_BPF` | Integración de BPF con cgroups. |

Grado de dependencia: **muy alto**.

---

## 5. Namespaces y aislamiento

`systemd` integra aislamiento de servicios mediante opciones declarativas en unidades.

Ejemplos:

```text
PrivateNetwork=
PrivateUsers=
ProtectSystem=
PrivateTmp=
RestrictNamespaces=
```

Opciones relevantes:

| Opción | Uso |
|---|---|
| `CONFIG_NET_NS` | Requerido para `PrivateNetwork=`. |
| `CONFIG_USER_NS` | Requerido para `PrivateUsers=`. |

Interpretación:

`systemd` no se limita a iniciar servicios; intenta crear contextos de ejecución parcialmente aislados para cada unidad.

Grado de dependencia: **alto** para sandboxing; **medio** para arranque mínimo.

---

## 6. BPF, eBPF y LSM

`systemd` usa BPF para aplicar políticas avanzadas en unidades de servicio.

Opciones relevantes:

| Opción | Uso |
|---|---|
| `CONFIG_BPF` | Infraestructura BPF. |
| `CONFIG_BPF_SYSCALL` | Permite cargar programas BPF desde userspace. |
| `CONFIG_BPF_JIT` | Compilación JIT de BPF. |
| `CONFIG_HAVE_EBPF_JIT` | Soporte arquitectónico para JIT eBPF. |
| `CONFIG_CGROUP_BPF` | Hooks BPF asociados a cgroups. |
| `CONFIG_BPF_LSM` | LSM basado en BPF. |
| `CONFIG_DEBUG_INFO_BTF` | Información BTF necesaria para ciertos usos avanzados de BPF. |

Funciones de systemd relacionadas:

```text
IPAddressDeny=
IPAddressAllow=
IPIngressFilterPath=
IPEgressFilterPath=
SocketBindAllow=
SocketBindDeny=
RestrictNetworkInterfaces=
RestrictFileSystems=
```

Grado de dependencia: **alto** para políticas modernas; **no esencial** para lanzar un sistema mínimo.

---

## 7. Seccomp

Opciones relevantes:

| Opción | Uso |
|---|---|
| `CONFIG_SECCOMP` | Infraestructura seccomp. |
| `CONFIG_SECCOMP_FILTER` | Filtrado de llamadas al sistema. |

`systemd` puede restringir la superficie de llamadas al sistema permitida a cada unidad.

Interpretación:

Esto refuerza el modelo de contrato de ejecución: cada servicio puede arrancar con una superficie de kernel más reducida.

Grado de dependencia: **medio/alto** para sandboxing; **bajo** para arranque básico.

---

## 8. Pseudo-filesystems del kernel

`systemd` presupone la existencia funcional de varios puntos de control:

| Interfaz | Uso |
|---|---|
| `/proc` | Estado de procesos, PID 1, kernel y parámetros vivos. |
| `/sys` | Dispositivos, buses, atributos del kernel y uevents. |
| `/dev` | Nodos de dispositivo, normalmente con `devtmpfs` y udev. |
| `/run` | Estado volátil temprano de runtime. |
| cgroupfs | Jerarquía de control de procesos y unidades. |

Esto implica dependencia directa de:

```text
CONFIG_PROC_FS
CONFIG_SYSFS
CONFIG_DEVTMPFS
CONFIG_CGROUPS
```

Grado de dependencia: **muy alto**.

---

## 9. APIs modernas del kernel usadas por systemd

La documentación de `systemd` enumera muchas APIs por versión. Las más representativas para medir acoplamiento son:

| Kernel | API / funcionalidad | Impacto conceptual |
|---|---|---|
| ≥ 3.15 | `timerfd_create()` con `CLOCK_BOOTTIME` | Temporización robusta incluso con suspensión. |
| ≥ 3.17 | `memfd_create()`, `getrandom()`, `kexec_file_load()` | Memoria anónima, entropía, kexec moderno. |
| ≥ 4.3 | Ambient capabilities | Capacidades heredables más finas. |
| ≥ 4.5 | PIDs controller en cgroup v2 | Control de número de procesos por unidad. |
| ≥ 4.6 | Cgroup namespaces | Aislamiento de vista de cgroups. |
| ≥ 4.20 | PSI | Presión de CPU/memoria/IO para `systemd-oomd`. |
| ≥ 5.2 | Cgroup freezer y nueva mount API | Congelación de grupos y gestión moderna de montajes. |
| ≥ 5.4 | pidfd | Referencias estables a procesos sin carreras de PID. |
| ≥ 5.9 | `close_range()` | Cierre eficiente de rangos de file descriptors. |
| ≥ 5.12 | idmapped mounts | Montajes con mapeos de identidad. |
| ≥ 5.14 | `cgroup.kill`, `quotactl_fd()`, `MOUNT_ATTR_NOSYMFOLLOW` | Matar cgroups completos, cuotas y seguridad de montajes. |
| ≥ 6.9 | pidfs | Representación filesystem de procesos mediante pidfd/pidfs. |
| ≥ 6.13 | `PIDFD_GET_INFO`, `{set,remove}xattrat()` | Inspección avanzada y xattrs por descriptor/ruta extendida. |

Grado de dependencia: **alto**, aunque con degradación funcional si algunas APIs faltan.

---

## 10. Dependencias relacionadas con UEFI, Verity y credenciales

| Área | Opciones relevantes | Uso |
|---|---|---|
| UEFI | `CONFIG_EFIVAR_FS`, `CONFIG_EFI_PARTITION` | Variables EFI, particiones y arranque UEFI. |
| Verity firmado | `CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG` | Validación de imágenes Verity firmadas. |
| Claves MOK/DB | `CONFIG_INTEGRITY_MACHINE_KEYRING`, `CONFIG_IMA_ARCH_POLICY` | Integración con claves de plataforma. |
| SMBIOS | `CONFIG_DMI`, `CONFIG_DMI_SYSFS` | Lectura de credenciales y datos de firmware. |

Estas no definen el arranque mínimo de PID 1, pero sí amplían el modelo moderno de arranque medido, credenciales y verificación.

---

## 11. Grado de acoplamiento de systemd

| Área | Grado |
|---|---|
| Arranque mínimo como PID 1 | Medio/alto |
| Gestión de servicios | Alto |
| Cgroups | Muy alto |
| Namespaces | Alto en sandboxing |
| BPF/seccomp/LSM | Alto en políticas modernas |
| udev/sysfs/devtmpfs | Muy alto |
| Portabilidad fuera de Linux | Muy baja |
| Dependencia de kernel moderno | Alta |

Resumen:

```text
systemd tiene una dependencia alta del kernel Linux porque convierte PID 1
en un administrador integral del sistema, apoyado en cgroups, eventos,
pseudo-filesystems, namespaces, BPF, seccomp y APIs modernas de procesos.
```

---

## 12. Razón de diseño

La dependencia de `systemd` no es accidental. Procede de su diseño:

```text
sysVinit/runit/dinit/OpenRC tienden a lanzar o supervisar servicios;
systemd además clasifica, limita, aísla, observa, mata, reactiva,
monta, registra y aplica políticas sobre esos servicios.
```

Por eso, para una comparativa de inits, `systemd` debe aparecer como el extremo de mayor integración con Linux.

---

## 13. Ficha resumida para comparativa

| Campo | systemd |
|---|---|
| Tipo | Gestor integral de sistema y servicios. |
| Relación con PID 1 | PID 1 como centro administrativo del sistema. |
| Dependencia de Linux | Muy alta. |
| Dependencia de cgroups | Central. |
| Dependencia de namespaces | Alta para aislamiento. |
| Dependencia de BPF/seccomp | Alta para políticas modernas. |
| Dependencia de `/proc`, `/sys`, `/dev`, `/run` | Muy alta. |
| Portabilidad | Muy baja fuera de Linux. |
| Modelo de degradación | Puede degradar funciones, pero pierde capacidades relevantes. |
| Perfil maGNUx | Init de máxima integración con el kernel; útil como frontera superior de acoplamiento. |

---

## 14. Próximo init a comparar

Siguiendo el orden del README, el siguiente candidato natural es:

```text
OpenRC
```

La comparación esperada será interesante porque OpenRC tiende a tener menos acoplamiento directo con APIs modernas del kernel que `systemd`, delegando más en scripts, servicios externos y convenciones de distribución.

---

> [⬆ Subir a Levantamiento de sistema tradicional](research00.md) · [🏠 Inicio](README.md)
