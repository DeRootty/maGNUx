# 09 — Dernel: licencia operativa

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> Dernel expresa una intuición importante: el sistema necesita una capa capaz de **traducir soberanía material en capacidad operativa legítima**.

---

## En pocas palabras

Dernel hace lo que systemd hace, pero **solo y únicamente lo que debería de hacer** en un entorno de ejecución de seguridad heredada.

Su función principal: **dar licencia operativa sobre el host al guest**.

---

## Qué no es Dernel

Dernel **no sustituye al kernel**: prolonga su filosofía hacia el plano operativo acreditado.

No es:
- Un nuevo `init`.
- Un reemplazo de systemd completo.
- Un gestor de servicios genérico.

---

## Qué sí es Dernel

Dernel es una **capa intermedia** orientada a conceder licencia operativa sobre el host al guest o entorno operativo acreditado.

Su función conceptual sería mediar entre:

```
Autoridad estructural del sistema (kernel + xGNUpeD)
              ↕
    Software que pretende usar el host
    sin acceder indiscriminadamente
    a todos los privilegios de la raíz
```

---

## Composición del Dernel

El Dernel se define entre dos áreas:

### Dernel run time
Parte del área del host. Gestiona el ciclo de ejecución acreditado sobre el hardware.

### Dernel guest
Parte del área guest. Gestiona la licencia otorgada al entorno operativo del usuario.

```
Host:
  ├── Kernel host
  ├── Kommu services
  └── Dernel run time     ← área de host

Guest:
  ├── Dernel guest        ← límite de licencia
  ├── Logon service
  └── Login sesión
```

---

## El problema que resuelve

### El idle como vector de ataque

Los scripts en bash producen tiempos de ejecución lentos y en ocasiones generan idle en el procesador.

En épocas anteriores, un idle era **hackeable**: una ventana temporal para crear una interrupción de solicitud que, si abarcaba el tiempo natural de idle planteado por el sistema, pasaba completamente desapercibida al administrador.

### La solución de systemd

SystemD mantiene al procesador principal atareado, sin tiempos para respirar. Eso resolvió el problema del idle, pero a costa de crear una **línea recta** que mezcla fundamento con operación.

### La propuesta del Dernel

Definir un host **temprano y volutivo**, que va ganando áreas de dominio mientras el arranque hace disponible todo el hardware:

> Para que un proceso se ejecute, las directrices tempranas del levantamiento del host detectarán si es una pieza crítica para continuar con el levantamiento del host, o si sencillamente no aporta nada.
>
> - Si **no aporta** → es un exploit.
> - Si **aporta** → es un proceso válido.

Un arranque de este estilo sería **virtualmente invulnerable a los idle**.

---

## Identidades que gestiona el sistema completo

### Área del Host

| Componente | Función |
|---|---|
| Kernel host | Reconocimiento y esclavización de núcleos a la identidad host. |
| Kommu services | IPC, DBus, mediación de comunicaciones. |
| Dernel run time | Ejecución acreditada sobre el hardware. |

### Área del Guest

| Componente | Función |
|---|---|
| Dernel guest | Licencia operativa sobre el host. |
| Logon service | Servicio de autenticación estructural. |
| Login sesión | Sesión operativa del usuario. |

---

*← [Trilobytes](08-trilobytes.md) | [Índice](../README.md) | Siguiente: [Host y Guest →](10-host-guest.md)*
