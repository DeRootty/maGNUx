# Emergencia de identidades en Zalty: root, admin y comm

> Documento conceptual sobre la aparición de tres identidades fundamentales dentro del modelo maGNUx/Zalty: `root`, `admin` y `comm`.

[⬅ Volver al índice de Zalty](readme.md) · [Objetivos de Zalty](objetivos_zalty.md)

---

Zalty parte de una distinción esencial entre nodos técnicos y nodos semióticos.

Un nodo técnico es interpretable por el sistema desde el plano imperativo. Puede ser leído, escrito, ejecutado, montado, detenido, instalado, eliminado o modificado.

Un nodo semiótico conserva esa capacidad imperativa, pero añade claridad declarativa. No solo puede ser operado, sino también interpretado, auditado, justificado y relacionado dentro de un contrato de sistema.

A partir de esta diferencia emergen tres identidades fundamentales:

```text
root
→ identidad técnica

admin
→ identidad semiótica

comm
→ identidad comunicativa
```

---

## 1. Identidad root

La identidad `root` emerge de la existencia de nodos técnicos.

Un sistema Linux tradicional ya expone nodos técnicos:

```text
archivos
procesos
dispositivos
mountpoints
syscalls
módulos
servicios
paquetes
cgroups
namespaces
interfaces de red
```

Estos nodos pueden ser operados imperativamente.

```text
leer
escribir
montar
desmontar
ejecutar
matar procesos
cargar módulos
cambiar permisos
alterar configuración
activar servicios
```

Por tanto, `root` representa la autoridad técnica máxima sobre los nodos técnicos del sistema.

```text
root nace donde existe capacidad técnica de operación.
```

`root` no necesita que el nodo tenga significado declarativo. Le basta con que el nodo exista técnicamente y sea manipulable por el sistema.

En este sentido, `root` pertenece al dominio de la máquina operable.

```text
root
→ soberanía operativa
→ autoridad técnica
→ dominio imperativo
```

---

## 2. Identidad admin

La identidad `admin` emerge de la existencia de nodos semióticos.

Un nodo semiótico no solo puede ser operado. También puede declarar significado.

```text
nodo técnico
→ se opera

nodo semiótico
→ se opera
→ se interpreta
→ se justifica
→ se audita
→ se relaciona
```

`admin` no representa simplemente la capacidad de hacer cambios. Representa la capacidad de administrar con sentido sistémico.

No se limita a preguntar:

```text
¿puedo cambiar esto?
```

Debe poder responder:

```text
¿qué significa cambiar esto?
¿qué contrato afecta?
¿qué traza modifica?
¿qué versión compromete?
¿qué relación altera?
¿qué legitimidad necesita?
```

Por tanto:

```text
admin nace donde existe capacidad declarativa de administración.
```

`admin` no sustituye a `root`.

`admin` interpreta, encuadra y somete la operación técnica a coherencia declarativa.

```text
admin
→ soberanía administrativa
→ autoridad declarativa
→ dominio semiótico
```

---

## 3. Identidad comm

La identidad `comm` queda planteada como una identidad en desarrollo dentro del manifiesto maGNUx/Zalty.

Su emergencia depende de la comunicación coherente entre nodos técnicos y nodos semióticos.

Inicialmente, `comm` puede entenderse como la identidad que nace de tres capacidades:

```text
1. Establecer comunicación coherente entre nodos técnicos y nodos semióticos.

2. Mantener coherencia entre lo que el sistema hace
   y lo que el sistema declara ser.

3. Gestionar el módulo de propiedades identitarias
   propuesto por maGNUx.
```

`comm` no debe entenderse simplemente como red, socket o mensajería.

Su sentido es más profundo.

`comm` permite que el sistema pueda declarar relaciones como:

```text
este nodo técnico corresponde a este nodo semiótico

esta acción imperativa altera esta declaración

esta actualización modifica esta traza

este servicio expone esta capacidad

este contrato autoriza esta transición

esta identidad conserva coherencia
```

Por tanto:

```text
comm nace donde existe traducción coherente entre operación y significado.
```

```text
comm
→ soberanía comunicativa
→ autoridad de coherencia
→ dominio relacional
```

---

## 4. Relación entre las tres identidades

Las tres identidades no deben confundirse.

Cada una pertenece a un plano distinto del sistema.

```text
root
→ opera nodos técnicos

admin
→ administra nodos semióticos

comm
→ comunica y mantiene coherencia entre ambos planos
```

O de forma más precisa:

```text
root
→ autoridad técnica

admin
→ autoridad declarativa

comm
→ autoridad comunicativa/coherente
```

---

## 5. Fórmula maGNUx/Zalty

```text
Sin nodos técnicos, no emerge root.

Sin nodos semióticos, no emerge admin.

Sin comunicación coherente entre ambos,
no emerge comm.
```

La identidad `root` pertenece al sistema como máquina operable.

La identidad `admin` pertenece al sistema como estructura interpretable.

La identidad `comm` pertenece al sistema como organismo comunicativo capaz de mantener coherencia entre lo que ejecuta, lo que declara y lo que legitima.

---

## 6. Tesis de cierre

```text
Linux permite que root gobierne los nodos técnicos.

Zalty propone que admin gobierne los nodos semióticos.

maGNUx apunta a que comm garantice la coherencia entre ambos mundos.
```

En este modelo, la administración del sistema deja de ser únicamente una cuestión de permisos técnicos.

Pasa a ser una cuestión de identidad, significado, contrato y coherencia.

---

[⬅ Volver al índice de Zalty](readme.md) · [Objetivos de Zalty](objetivos_zalty.md)
