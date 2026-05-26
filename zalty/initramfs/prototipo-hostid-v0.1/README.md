# Prototipo HostID v0.1

> [⬆ Subir a initramfs](../README.md) · [🏠 Inicio](../../../README.md)

**Versión:** 0.1  
**Objetivo:** demostrar identidad de host temprana y persistente en initramfs.  
**Herramientas:** C, shell, QEMU.

---

## Estructura

```text
prototipo-hostid-v0.1/
├── README.md
├── scripts/
│   ├── init
│   ├── build-initramfs.sh
│   └── policy.conf
├── src/
│   ├── identity/
│   │   ├── host_identity.h
│   │   └── host_identity.c
│   ├── boot/
│   │   ├── boot_validator.h
│   │   └── boot_validator.c
│   └── comm/
│       ├── early_comm.h
│       └── early_comm.c
└── tests/
    └── run-qemu.sh
```

---

## Qué demuestra este prototipo

1. **Identidad temprana:** el sistema puede generar una identidad de host antes de entregar el control al sistema raíz.
2. **Persistencia conceptual:** la identidad se concibe como estado temprano que debe sobrevivir a la transición hacia el sistema operativo completo.
3. **Política inicial:** `policy.conf` actúa como primera política declarativa de arranque.
4. **Validación de secuencia:** el bloque `boot/` modela la comprobación de condiciones antes de continuar.
5. **Comunicación temprana:** el bloque `comm/` reserva un canal mínimo entre etapas.

## Qué NO hace este prototipo

- No implementa Trilobytes completo.
- No implementa Kommu como sistema completo de servicios.
- No integra todavía KDE, Wayland ni capa gráfica.
- No requiere hardware específico.
- No sustituye al manifiesto maGNUx: solo ensaya una hipótesis técnica dentro de Zalty.

---

## Requisitos orientativos

```bash
# Compilador C
apt install gcc

# QEMU para pruebas
apt install qemu-system-x86

# Herramientas de empaquetado initramfs
apt install cpio
```

---

## Inicio rápido orientativo

```bash
cd zalty/initramfs/prototipo-hostid-v0.1
./scripts/build-initramfs.sh
./tests/run-qemu.sh
```

## Nota de integración

Este prototipo procede de la propuesta maGNUx v2 y se ubica aquí porque Zalty es el plano de implementación experimental.

```text
maGNUx declara.
Zalty ensaya.
Este prototipo prueba una hipótesis temprana de identidad de host.
```
