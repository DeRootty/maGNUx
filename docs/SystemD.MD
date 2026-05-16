> [Inicio](README.md)
# Postulando SystemD
- El contenido actual, pone en blanco y negro las interacciones de systemd con el kernel.
## Flags necesarias tener activadas en el kernel, para que systemd no tenga problemas en el arranque:
* CONFIG_DEVTMPFS
* CONFIG_CGROUPS
* CONFIG_INOTIFY_USER
* CONFIG_SIGNALFD
* CONFIG_TIMERFD
* CONFIG_EPOLL
* CONFIG_UNIX
* CONFIG_NET
* CONFIG_SYSFS
* CONFIG_PROC_FS
* CONFIG_FHANDLE
---
***Estas no son “activar y ya”, sino valores esperados:***
* CONFIG_SYSFS_DEPRECATED=n
* CONFIG_UEVENT_HELPER_PATH=""
* CONFIG_FW_LOADER_USER_HELPER=n
* CONFIG_RT_GROUP_SCHED=n
---
***udev, hardware, discos y detección de plataforma***
* CONFIG_DMIID
* CONFIG_DMI
* CONFIG_DMI_SYSFS
* CONFIG_BLK_DEV_BSG
---
***Namespaces y aislamiento de servicios***
* CONFIG_NET_NS
* CONFIG_USER_NS
---
***Opciones recomendadas para un sistema systemd moderno***
* CONFIG_IPV6
* CONFIG_AUTOFS_FS
* CONFIG_TMPFS_XATTR
* CONFIG_{TMPFS,EXT4_FS,XFS,BTRFS_FS,...}_POSIX_ACL
* CONFIG_SECCOMP
* CONFIG_SECCOMP_FILTER
* CONFIG_KCMP
* CONFIG_NET_SCHED
* CONFIG_NET_SCH_FQ_CODEL
---
***Control de recursos CPU con cgroups***
* CONFIG_CGROUP_SCHED
* CONFIG_FAIR_GROUP_SCHED
---
> ***Para CPUQuota=:***
>* CONFIG_CFS_BANDWIDTH
---
***BPF, cgroup-BPF y políticas de red***
* Para estas directivas de systemd:
>IPAddressDeny=
>IPAddressAllow=
>IPIngressFilterPath=
>IPEgressFilterPath=
>SocketBindAllow=
>SocketBindDeny=
>RestrictNetworkInterfaces=

* flags del kernel usadas:
>CONFIG_BPF
>CONFIG_BPF_SYSCALL
>CONFIG_BPF_JIT
>CONFIG_HAVE_EBPF_JIT
>CONFIG_CGROUP_BPF
---
***BPF LSM y restricciones de sistemas de ficheros***
* Para RestrictFileSystems= en unidades systemd:
> CONFIG_BPF
> CONFIG_BPF_SYSCALL
> CONFIG_BPF_LSM
> CONFIG_DEBUG_INFO_BTF
> CONFIG_LSM="...,bpf"
* Alternativamente, el kernel debe arrancarse con:
lsm="...,bpf"
---
***UEFI, particiones EFI y systemd-boot/ukify/verity***
* Para sistemas UEFI:
> CONFIG_EFIVAR_FS
> CONFIG_EFI_PARTITION

* Para imágenes Verity firmadas:
> CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG

* Para verificar imágenes Verity firmadas usando claves MOK y DB de UEFI:
> CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG_SECONDARY_KEYRING
> CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG_PLATFORM_KEYRING
> CONFIG_IMA_ARCH_POLICY
> CONFIG_INTEGRITY_MACHINE_KEYRING
---
***systemd-oomd***
* CONFIG_PSI
* CONFIG_MEMCG
>CONFIG_PSI habilita Pressure Stall Information, usado por systemd-oomd. CONFIG_MEMCG habilita memory cgroups, necesario para que >systemd-oomd tenga sentido práctico.

---
# APIs del kernel que systemd usa según versión

Además de las opciones `CONFIG_*`, systemd lista APIs concretas por versión de kernel. Esto es relevante porque una opción puede estar activa, pero una API concreta puede no existir si el kernel es demasiado antiguo.

| Kernel | API/funcionalidad usada por systemd |
|---|---|
| ≥ 3.15 | `timerfd_create()` con `CLOCK_BOOTTIME` |
| ≥ 3.17 | `memfd_create()`, `getrandom()`, `kexec_file_load()` en x86-64 |
| ≥ 4.3 | Ambient capabilities |
| ≥ 4.5 | PIDs controller en cgroup v2 |
| ≥ 4.6 | Cgroup namespaces |
| ≥ 4.9 | `RENAME_NOREPLACE` en vfat |
| ≥ 4.10 | cgroup-BPF ingress/egress hooks |
| ≥ 4.11 | nsfs `NS_GET_NSTYPE` |
| ≥ 4.13 | `TIOCGPTPEER`, propiedad `SYNTH_UUID=` en uevents |
| ≥ 4.15 | cgroup-BPF device hook, CPU controller en cgroup v2 |
| ≥ 4.17 | cgroup-BPF socket address hooks, `/sys/power/resume_offset`, `FRA_PROTOCOL` |
| ≥ 4.20 | PSI, usado por `systemd-oomd` |
| ≥ 5.1 | `SO_BINDTOIFINDEX` |
| ≥ 5.2 | Cgroup freezer, nueva mount API |
| ≥ 5.3 | Bucles acotados en BPF, keyring namespacing, nexthop |
| ≥ 5.4 | pidfd, imágenes Verity firmadas |
| ≥ 5.6 | `getrandom(GRND_INSECURE)` |
| ≥ 5.7 | `CLONE_INTO_CGROUP`, `memory_recursiveprot`, BPF links, BPF LSM hook |
| ≥ 5.8 | `LOOP_CONFIGURE`, `STATX_ATTR_MOUNT_ROOT`, opciones procfs `hidepid=`/`subset=` por instancia |
| ≥ 5.9 | `close_range()` |
| ≥ 5.10 | `STATX_MNT_ID`, `MS_NOSYMFOLLOW` |
| ≥ 5.11 | `epoll_pwait2()` |
| ≥ 5.12 | idmapped mounts mediante `mount_setattr()` |
| ≥ 5.14 | `cgroup.kill`, `quotactl_fd()`, `MOUNT_ATTR_NOSYMFOLLOW` |
| ≥ 6.3 | `MFD_EXEC`, `MFD_NOEXEC_SEAL`, tmpfs `noswap` |
| ≥ 6.5 | `name_to_handle_at(AT_HANDLE_FID)`, `SO_PEERPIDFD`, `SO_PASSPIDFD`, `MOVE_MOUNT_BENEATH` |
| ≥ 6.6 | quota en tmpfs |
| ≥ 6.7 | `memory_hugetlb_accounting` en cgroup2fs |
| ≥ 6.8 | `STATX_MNT_ID_UNIQUE` |
| ≥ 6.9 | pidfs |
| ≥ 6.10 | `fcntl(F_DUPFD_QUERY)`, `linkat(AT_EMPTY_PATH)` sin privilegios, atributo sysfs `partscan` |
| ≥ 6.12 | `AT_HANDLE_MNT_ID_UNIQUE` |
| ≥ 6.13 | `PIDFD_GET_INFO`, `{set,remove}xattrat()`, `FSCONFIG_SET_FD` para capas overlayfs |
| ≥ 6.16 | patrón `%F` de coredump para pidfd, `SO_PASSRIGHTS` |

* Fuente: `README` upstream de systemd, sección `REQUIREMENTS`.
* [Enlace al repositorio SystemD](https://github.com/systemd/systemd)
