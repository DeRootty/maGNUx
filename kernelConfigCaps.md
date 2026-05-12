> [⬆ Subir al índice principal](README.md) · [🏠 Inicio](README.md)

# Cómo condicionar las capacidades del Kernel

Este documento explica qué son los símbolos `CONFIG_*` del kernel Linux, cómo condicionan la compilación y qué relación tienen con las capacidades que después quedan disponibles en tiempo de ejecución para un init PID 1 o cualquier otro programa de espacio de usuario.

La idea central es:

```text
CONFIG_* no es una llamada al kernel.
CONFIG_* es una condición de compilación que decide qué capacidades tendrá el kernel final.
```

---

## 1. Qué es un símbolo CONFIG_*

Un símbolo `CONFIG_*` es una variable de configuración generada por el sistema Kconfig del kernel.

Ejemplos:

```text
CONFIG_PROC_FS=y
CONFIG_SYSFS=y
CONFIG_CGROUPS=y
CONFIG_BPF=y
CONFIG_SECCOMP=y
# CONFIG_DEBUG_FS is not set
```

Estos símbolos no son funciones, syscalls ni instrucciones ejecutadas por un proceso.

Son decisiones previas a la construcción del kernel.

En términos conceptuales:

```text
CONFIG_* = genoma de compilación del kernel
```

Determinan qué órganos funcionales podrá tener el kernel cuando arranque.

---

## 2. De Kconfig a .config

El proceso empieza en los ficheros `Kconfig` distribuidos por el árbol fuente del kernel.

El desarrollador o integrador selecciona opciones mediante herramientas como:

```bash
make menuconfig
make nconfig
make xconfig
make defconfig
make oldconfig
```

El resultado se guarda en:

```text
.config
```

Ese archivo contiene decisiones como:

```text
CONFIG_CGROUPS=y
CONFIG_BPF=y
CONFIG_NAMESPACES=y
CONFIG_PROC_FS=y
```

El `.config` representa la configuración elegida para construir un kernel concreto.

---

## 3. De .config a cabeceras generadas

Durante la preparación de la compilación, el sistema de build transforma `.config` en cabeceras generadas, entre ellas:

```text
include/generated/autoconf.h
```

Dentro aparecen definiciones C equivalentes:

```c
#define CONFIG_PROC_FS 1
#define CONFIG_SYSFS 1
#define CONFIG_CGROUPS 1
#define CONFIG_BPF 1
```

Estas macros permiten que el código fuente del kernel sea condicionado por el preprocesador.

Ejemplo conceptual:

```c
#ifdef CONFIG_CGROUPS
    /* código del subsistema de cgroups */
#endif
```

Si `CONFIG_CGROUPS` está activado, ese código entra en la compilación. Si no está activado, ese bloque no forma parte del kernel final.

---

## 4. CONFIG_* también condiciona los Makefile

Los símbolos `CONFIG_*` no solo afectan a cabeceras y `#ifdef`.

También condicionan qué objetos se compilan desde los `Makefile` del kernel.

Ejemplo conceptual:

```make
obj-$(CONFIG_PROC_FS) += proc/
obj-$(CONFIG_CGROUPS) += cgroup/
obj-$(CONFIG_BPF) += bpf/
```

Esto significa:

| Valor | Resultado |
|---|---|
| `CONFIG_ALGO=y` | El código se compila integrado en el kernel. |
| `CONFIG_ALGO=m` | El código se compila como módulo `.ko`. |
| `CONFIG_ALGO=n` | El código no se compila. |

Por tanto, `CONFIG_*` actúa sobre dos planos:

```text
1. Qué código C queda visible al compilador.
2. Qué directorios/objetos entran en la construcción final.
```

---

## 5. CONFIG_* no es una API

Un init PID 1 no llama a:

```text
CONFIG_PROC_FS
CONFIG_CGROUPS
CONFIG_BPF
CONFIG_SECCOMP
```

Lo que hace es usar las interfaces que existen como consecuencia de que esas opciones fueron activadas.

Ejemplo:

```text
CONFIG_PROC_FS=y
        ↓
procfs existe en el kernel
        ↓
PID 1 puede montar /proc
        ↓
PID 1 puede leer /proc/1/status, /proc/mounts, /proc/sys
```

Otro ejemplo:

```text
CONFIG_CGROUPS=y
        ↓
cgroupfs existe
        ↓
/sys/fs/cgroup puede estar disponible
        ↓
PID 1 puede crear cgroups, mover procesos y aplicar límites
```

La cadena correcta es:

```text
Kconfig
→ .config
→ autoconf.h + Makefiles
→ kernel compilado
→ interfaces runtime
→ init PID 1 verifica o usa esas interfaces
```

---

## 6. Diferencia entre compilación y runtime

Es importante separar dos mundos:

| Plano | Pregunta | Ejemplo |
|---|---|---|
| Compilación | ¿El kernel fue construido con esta capacidad? | `CONFIG_CGROUPS=y` |
| Runtime | ¿La capacidad está disponible y montada/usable ahora? | `/sys/fs/cgroup` existe |

Puede ocurrir que una capacidad esté compilada pero no esté disponible de forma práctica porque falta montar una interfaz.

Ejemplo:

```text
CONFIG_PROC_FS=y
```

pero si `/proc` no está montado, un init no puede usarlo todavía como filesystem.

Por eso un init robusto no debería limitarse a asumir que un `CONFIG_*` existe: debe comprobar la interfaz real.

---

## 7. CONFIG_* como potencial anatómico

Una forma útil de pensarlo:

```text
CONFIG_* = potencial anatómico del kernel
API      = órgano funcional expuesto
init     = verificador de contrato
```

Ejemplo:

| CONFIG | Órgano runtime | Uso posible por PID 1 |
|---|---|---|
| `CONFIG_PROC_FS` | `/proc` | Observar procesos y parámetros vivos. |
| `CONFIG_SYSFS` | `/sys` | Observar dispositivos, buses y atributos. |
| `CONFIG_DEVTMPFS` | `/dev` | Acceder a nodos de dispositivo. |
| `CONFIG_CGROUPS` | `/sys/fs/cgroup` | Controlar procesos y recursos. |
| `CONFIG_NAMESPACES` | `/proc/<pid>/ns/*` + `clone/unshare/setns` | Aislar servicios. |
| `CONFIG_BPF` | `bpf()` + mapas/programas BPF | Cargar políticas o filtros. |
| `CONFIG_SECCOMP` | `seccomp()` | Restringir syscalls. |
| `CONFIG_KEYS` | keyrings | Manejar credenciales. |
| `CONFIG_AUDIT` | audit events | Registrar acciones sensibles. |

---

## 8. Cómo condiciona esto a un init PID 1

Un init PID 1 puede adoptar varios grados de dependencia respecto al kernel.

### Init mínimo

Solo exige:

```text
procesos
señales
consola
scripts
/dev básico
```

Modelo aproximado:

```text
sysVinit
runit simple
```

### Init dependencial o supervisor

Exige más estructura:

```text
/proc
/run
scripts de servicio
dependencias
supervisión
estado de procesos
```

Modelo aproximado:

```text
OpenRC
dinit
runit
```

### Init profundamente dependiente del kernel

Puede exigir:

```text
cgroups
namespaces
seccomp
BPF
LSM
PSI
pidfd
udev/sysfs/devtmpfs
mount API moderna
TPM/IMA/EVM
```

Modelo aproximado:

```text
systemd
maGNUx-init extremo hipotético
```

---

## 9. Ejemplo de contrato de arranque

Un init puede definir un contrato mínimo como:

```text
Para arrancar en modo soberano:

- /proc debe poder montarse.
- /sys debe poder montarse.
- /dev debe existir.
- /run debe ser tmpfs.
- cgroups deben estar disponibles.
- namespaces deben estar soportados.
- seccomp debe estar disponible para servicios no confiables.
- BPF debe estar disponible si se aplican políticas dinámicas.
```

La comprobación no se haría leyendo directamente `.config`, sino probando runtime:

```text
mount("proc", "/proc", "proc", ...)
stat("/sys")
stat("/sys/fs/cgroup")
clone(... CLONE_NEWNS ...)
seccomp(...)
bpf(...)
```

Si una prueba falla, el init decide:

```text
- continuar en modo degradado;
- arrancar en modo rescate;
- rechazar el arranque soberano;
- provocar panic si el contrato exige cierre absoluto.
```

---

## 10. Relación con el preprocesador C

Los símbolos `CONFIG_*` llegan al código C como macros generadas.

Ejemplo conceptual:

```c
#if IS_ENABLED(CONFIG_BPF)
    habilitar_ruta_bpf();
#else
    deshabilitar_politicas_bpf();
#endif
```

La macro `IS_ENABLED()` permite tratar opciones que pueden estar integradas (`y`) o como módulo (`m`).

En cambio, un `#ifdef CONFIG_BPF` clásico solo comprueba si la macro existe en el contexto de compilación.

Esto permite que el kernel tenga múltiples rutas de código según la configuración seleccionada.

---

## 11. Relación con módulos

Cuando una opción permite compilar como módulo:

```text
CONFIG_DRIVER_X=m
```

el resultado suele ser un archivo:

```text
driver_x.ko
```

Eso significa que la capacidad no está integrada directamente en el kernel base, pero puede cargarse después.

Para PID 1 esto importa mucho:

```text
si una capacidad crítica está como módulo,
el init necesita que el módulo esté disponible antes de depender de ella.
```

Ejemplo:

```text
CONFIG_TCG_TPM=m
```

Si el init exige TPM desde el arranque temprano, puede que no baste con que exista como módulo: habría que cargarlo desde initramfs o compilarlo integrado (`y`).

---

## 12. Relación con initramfs

El initramfs puede funcionar como puente entre el kernel y el rootfs real.

Si ciertas capacidades están como módulos, el initramfs puede cargarlas antes de ejecutar el init real.

Ejemplo:

```text
kernel arranca
↓
initramfs carga módulos críticos
↓
monta /proc, /sys, /dev
↓
prepara rootfs real
↓
ejecuta /sbin/init
```

En un diseño soberano, initramfs puede actuar como primera etapa de verificación del contrato.

---

## 13. Qué significa condicionar capacidades del kernel

Condicionar capacidades del kernel significa decidir, antes de compilar, qué órganos funcionales podrá tener el kernel.

No es solo optimización.

Es una decisión de arquitectura:

| Decisión | Consecuencia |
|---|---|
| Activar cgroups | El init puede controlar recursos por grupo. |
| Desactivar cgroups | El init pierde control material fino. |
| Activar namespaces | El init puede aislar servicios. |
| Desactivar namespaces | El aislamiento debe delegarse o desaparecer. |
| Activar BPF | El init puede cargar políticas dinámicas. |
| Desactivar BPF | No hay filtros/políticas eBPF. |
| Activar seccomp | El init puede reducir syscalls por servicio. |
| Desactivar seccomp | Aumenta la superficie de ataque. |
| Activar IMA/EVM | Se puede medir/verificar integridad. |
| Desactivar IMA/EVM | Se pierde raíz de confianza de ficheros. |

---

## 14. Fórmula conceptual

```text
CONFIG_* no es la función.
CONFIG_* decide si la función puede existir.
```

Y aplicado a maGNUx:

```text
.config = declaración anatómica del kernel
kernel  = cuerpo funcional compilado
runtime = órganos disponibles y montados
PID 1   = primer intérprete del contrato operativo
```

Por tanto, si maGNUx define un init propio, debe distinguir:

```text
1. Qué CONFIG_* exige en la compilación.
2. Qué interfaces espera encontrar en runtime.
3. Qué hacer si el contrato no se cumple.
```

---

## 15. Ejemplo mínimo de tabla contractual

| Capacidad deseada | CONFIG recomendado | Prueba runtime | Decisión si falla |
|---|---|---|---|
| Observar procesos | `CONFIG_PROC_FS=y` | montar/abrir `/proc` | modo rescate o fallo crítico |
| Observar dispositivos | `CONFIG_SYSFS=y` | abrir `/sys` | degradar o detener |
| Dispositivos tempranos | `CONFIG_DEVTMPFS=y` | comprobar `/dev/console` | fallo crítico |
| Control de servicios | `CONFIG_CGROUPS=y` | comprobar `/sys/fs/cgroup` | modo sin control material |
| Aislamiento | `CONFIG_NAMESPACES=y` | probar `unshare()` | desactivar aislamiento |
| Seguridad syscall | `CONFIG_SECCOMP=y` | probar `seccomp()` | desactivar sandboxing |
| Políticas BPF | `CONFIG_BPF=y` | probar `bpf()` | desactivar política BPF |
| Integridad | `CONFIG_IMA=y` | comprobar securityfs/IMA | modo no verificado |
| Plataforma | `CONFIG_DMI_SYSFS=y` / `CONFIG_EFI=y` | leer `/sys/firmware` | modo genérico |
| TPM | `CONFIG_TCG_TPM=y` | comprobar `/sys/class/tpm` | no activar confianza fuerte |

---

## 16. Conclusión

Los tags `CONFIG_*` condicionan la compilación del kernel.

Actúan sobre:

```text
Kconfig
Makefiles
preprocesador C
cabeceras generadas
objetos compilados
módulos
```

Pero su efecto real se ve después, cuando el kernel arranca y expone o no expone capacidades mediante:

```text
syscalls
/proc
/sys
/dev
/sys/fs/cgroup
securityfs
tracefs
netlink
objetos kernel
```

Para un init PID 1, la cuestión no es llamar a `CONFIG_*`, sino comprobar si el kernel resultante cumple el contrato de capacidades que el sistema exige.

---

> [⬆ Subir al índice principal](README.md) · [🏠 Inicio](README.md)
