# 07 — xGNUpeD: la capa de identidad

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> Si no existieran las comunidades Linux, esto no sería necesario.

---

## En pocas palabras

xGNUpeD asocia la máquina a la distribución Linux instalada y a la versión de kernel, permitiendo al Dernel articular autoridad sobre los usuarios.

---

## Qué es

xGNUpeD no debe entenderse como un nuevo `init`.

Es la **finalización de la carga del kernel como tal**: si el kernel tuviera una longitud, este acabaría justo aquí. Se le podría llamar el **driver del sistema**.

Realiza tareas que actualmente hace `systemd` y que suponen en la actualidad un potencial fallo de sistema.

Establece el **lenguaje base** con el que el Dernel se comunicará con el kernel, de forma universal.

> Pueden salir nuevas versiones actualizadas de xGNUpeD a virtud de la comunidad que se encargue de dotar de coherencia a la seguridad sistémica.

---

## Las cuatro propiedades de identidad

xGNUpeD proyecta cuatro propiedades en la comunicación con el kernel, que dotan al Dernel de una **identidad emergente**:

### 1. Identidad distributiva

Relación del sistema con su comunidad o distribución.

> El sistema sabe de dónde viene y a qué comunidad pertenece. No es un Linux genérico anónimo; es un sistema con linaje.

### 2. Identidad conmutativa

Capacidad del sistema para **filtrar, asegurar y distinguir** su propia naturaleza frente a otras formas de despliegue compatibles.

> El sistema puede reconocer qué es propio y qué es ajeno, incluso dentro de la compatibilidad POSIX.

### 3. Identidad asociativa

Posibilidad de que el usuario y la comunidad contribuyan con libertad, manteniendo **integridad y coherencia estructural**.

> La libertad de contribución no diluye la identidad del sistema; la enriquece sin romperla.

### 4. Identidad comunicativa

Trazabilidad y auditabilidad del funcionamiento del sistema mediante una forma de **registro coherente**.

> Lo que el sistema hace puede ser rastreado, auditado y verificado sin ambigüedad.

---

## Lo que estas propiedades describen

Estas propiedades no describen todavía una implementación cerrada. Describen una **necesidad funcional**:

> Que el sistema pueda **reconocerse a sí mismo** antes de operar como un Linux convencional.

---

## Posición en la secuencia

```
Kernel
  └── xGNUpeD  ← aquí (finalización del kernel / driver del sistema)
        └── Dernel
              └── Trilobytes
                    └── Entorno operativo (ADMIN)
```

Si tuviéramos que dibujar conceptualmente estos conceptos como tramos:

- **Primer tramo:** xGNUpeD
- **Segundo tramo:** Dernel
- **Tercer tramo:** Trilobytes

---

*← [Capas POSIX](../arquitectura/06-capas-posix.md) | [Índice](../README.md) | Siguiente: [Trilobytes →](08-trilobytes.md)*
