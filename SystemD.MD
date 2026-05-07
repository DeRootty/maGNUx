> [Inicio](README.md)
# Postulando SystemD
Archivo que contendra las investigaciones de este administrador de sistema.
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

***Estas no son “activar y ya”, sino valores esperados:***
* CONFIG_SYSFS_DEPRECATED=n
* CONFIG_UEVENT_HELPER_PATH=""
* CONFIG_FW_LOADER_USER_HELPER=n
* CONFIG_RT_GROUP_SCHED=n

* [Enlace al repositorio SystemD](https://github.com/systemd/systemd)
