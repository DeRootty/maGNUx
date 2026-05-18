# Objetivos de Zalty

> Capa semiótica, IA agente y buena administración del sistema.

Este documento recoge los objetivos iniciales de Zalty como distribución GNU/Linux compatible con el manifiesto maGNUx.

Zalty parte de una idea central:

```text
Linux expone nodos técnicos.
maGNUx/Zalty añade significado declarativo.
Una IA agente puede interpretar ese significado.
El agente vigila si el sistema sigue siendo coherente con su contrato.
```

---

## 1. Objetivo principal

El objetivo de Zalty no es únicamente construir una distribución funcional.

El objetivo es construir una distribución GNU/Linux cuya administración pueda ser comprendida desde dos planos:

```text
plano imperativo
→ ejecutar, montar, instalar, actualizar, arrancar, detener, leer, escribir

plano declarativo
→ explicar, justificar, verificar, auditar, relacionar, legitimar
```

Linux ya opera sobre nodos técnicos.

Zalty pretende que esos nodos técnicos puedan convertirse en nodos semióticos compatibles con maGNUx.

```text
nodo técnico
→ interpretable por ejecución imperativa

nodo semiótico
→ interpretable por ejecución imperativa
→ interpretable por lectura declarativa
```

La tesis de partida es:

```text
Un nodo técnico permite operar.
Un nodo semiótico permite operar y comprender.
```

---

## 2. Buena administración del sistema

En Zalty, la buena administración no debe entenderse solo como que el sistema funcione.

Debe entenderse como la conservación de coherencia entre lo que el sistema declara ser y lo que realmente está haciendo.

```text
Buena administración =
funcionamiento técnico
+ coherencia declarativa
+ trazabilidad
+ legitimidad de cambios
+ mínima sorpresa sistémica
```

El sistema debe poder responder preguntas como:

```text
¿qué versión base gobierna este sistema?
¿qué repositorios están autorizados?
¿qué paquetes pertenecen a esta versión?
¿qué servicios están legitimados?
¿qué capacidades están expuestas?
¿qué hardware está vivo?
¿qué contratos permiten cada transición?
¿qué cambios requieren actualización menor?
¿qué cambios requieren migración mayor?
```

---

## 3. Estado esperado y estado real

Una IA agente encargada de vigilar la buena administración del sistema debe comparar dos planos:

```text
estado esperado
→ manifiestos, firmas, contratos, versión base, repositorios y políticas

estado real
→ /proc, /sys, /dev, paquetes instalados, servicios, logs, cgroups, mounts y procesos
```

La pregunta de vigilancia es:

```text
¿lo que está vivo en el sistema coincide con lo que el sistema dice que debe estar vivo?
```

Si no coincide, aparece una deriva.

---

## 4. Deriva semiótica

La deriva técnica significa:

```text
el sistema cambió
```

La deriva semiótica significa:

```text
el sistema cambió de forma que ya no coincide con lo que declara ser
```

Ejemplo:

```text
Zalty declara ser un host local sin exposición remota,
pero tiene SSH, Cockpit o Samba activos.
```

Eso no es únicamente una lista de servicios activos.

Es una contradicción entre identidad declarada y realidad operativa.

---

## 5. Diferencia entre monitor técnico y agente semiótico

Un monitor técnico tradicional puede detectar:

```text
CPU alta
servicio caído
disco lleno
paquete desactualizado
puerto abierto
proceso desconocido
```

Un agente semiótico debe poder inferir:

```text
el servicio SSH está activo,
pero el contrato de esta máquina no declara administración remota

este paquete pertenece a la línea Zalty 9,
pero el sistema está firmado como Zalty 8

este módulo del kernel está cargado,
pero no aparece en el manifiesto de capacidades permitidas

esta partición está montada,
pero no tiene declaración semiótica asociada

este proceso tiene CAP_SYS_ADMIN,
pero su servicio no declara autoridad administrativa
```

La diferencia está en que el agente no solo ve hechos técnicos.

También detecta incoherencias de significado.

---

## 6. Arquitectura conceptual del agente

Una IA agente para Zalty podría estructurarse así:

```text
Agente IA de administración
├── lector de manifiestos
├── lector de estado vivo
├── comparador semiótico
├── motor de inferencia
├── sistema de alertas
├── generador de explicación
└── modo de propuesta, no de autoridad directa
```

Flujo básico:

```text
1. Lee el manifiesto maGNUx/Zalty.
2. Lee la versión base instalada.
3. Lee firmas de estado y repositorios autorizados.
4. Lee nodos técnicos vivos del sistema.
5. Traduce esos nodos técnicos a nodos semióticos.
6. Compara estado declarado contra estado real.
7. Detecta desviaciones.
8. Clasifica riesgo.
9. Explica qué ocurre.
10. Propone acciones.
```

---

## 7. Fuentes de lectura del agente

El agente no debe inventar el estado del sistema.

Debe leer fuentes técnicas y semióticas.

```text
/boot/metal
→ contratos de arranque, identidad de host, rutas autorizadas

/etc
→ configuración persistente

/proc
→ estado vivo del kernel y procesos

/sys
→ hardware, drivers, buses, dispositivos, módulos

/dev
→ nodos de acceso a hardware

/var/lib/<gestor-paquetes>
→ paquetes instalados

/var/log o journal
→ historia del sistema

/sys/fs/cgroup
→ organización de procesos y recursos

manifiestos maGNUx/Zalty
→ significado declarado

firmas
→ autoridad

repositorios
→ estado remoto legítimo
```

Zalty podría disponer, en fases futuras, de rutas específicas:

```text
/etc/zalty/manifest.d/
/etc/zalty/contracts.d/
/etc/zalty/nodes.d/
/var/lib/zalty/state/
/var/lib/zalty/traces/
/boot/metal/
```

---

## 8. Niveles de intervención del agente

La IA agente no debe ser autoridad soberana por defecto.

Debe trabajar por niveles:

```text
Nivel 0 — lectura
solo observa

Nivel 1 — explicación
interpreta y resume

Nivel 2 — alerta
avisa de incoherencias

Nivel 3 — propuesta
sugiere comandos o cambios

Nivel 4 — preparación
genera manifiestos, parches o planes

Nivel 5 — ejecución limitada
aplica cambios permitidos por contrato

Nivel 6 — autoridad soberana
no debería pertenecer a la IA
```

Regla de gobierno:

```text
La IA interpreta.
El contrato autoriza.
El administrador decide.
El sistema ejecuta.
```

---

## 9. El agente como auditor de contratos

El agente debe poder comprobar preguntas como:

```text
¿este nodo existe?
¿está declarado?
¿tiene firma?
¿tiene autoridad?
¿pertenece a esta versión base?
¿fue instalado desde repositorio correcto?
¿está vivo cuando debería estar apagado?
¿está apagado cuando debería estar vivo?
¿tiene capacidades excesivas?
¿su configuración coincide con el contrato?
¿su comportamiento observado coincide con su descripción?
```

Esto convierte la administración en una auditoría continua de coherencia.

---

## 10. Grafo semiótico del sistema

La implementación natural de esta capa es un grafo.

```text
paquete
→ instala archivo

archivo
→ define servicio

servicio
→ lanza proceso

proceso
→ abre socket

socket
→ expone puerto

puerto
→ activa capacidad externa

capacidad externa
→ requiere contrato

contrato
→ autoriza o rechaza
```

Ejemplo:

```text
openssh-server
→ sshd.service
→ sshd PID 812
→ socket 0.0.0.0:22
→ capacidad: administración remota
→ contrato requerido: remote-admin
```

Si el contrato no existe, el agente debe generar una alerta semiótica.

---

## 11. Ejemplo: actualización de paquetes

Estado declarado:

```text
Sistema: Zalty 8.3
Contrato: S8
Repositorios autorizados:
- zalty-8-base
- zalty-8-security
- zalty-8-updates
```

Estado detectado:

```text
paquete openssl instalado desde canal zalty-9
```

Inferencia del agente:

```text
El paquete es oficial, pero no pertenece al contrato de versión S8.
La actualización rompe la línea de integridad de Zalty 8.
Debe revertirse o iniciar migración formal S8 → S9.
```

El problema no es que `openssl` exista.

El problema es que existe fuera de su legitimidad de versión.

---

## 12. Ejemplo: servicio activo no declarado

Estado declarado:

```text
Contrato de máquina:
- sin administración remota
- sin servicios públicos
- solo uso local
```

Estado real:

```text
sshd.service activo
puerto 22 abierto
```

Inferencia del agente:

```text
SSH está activo, pero no existe contrato de exposición remota.
Este nodo técnico funciona, pero no tiene legitimidad semiótica.
```

Acciones posibles:

```text
deshabilitar sshd
crear contrato remote-admin firmado
mover el host a un perfil donde SSH esté autorizado
```

---

## 13. Ejemplo: hardware vivo no declarado

Estado real:

```text
/sys/class/net/wlan0 existe
interfaz Wi-Fi activa
```

Estado declarado:

```text
perfil de host cableado
sin radio inalámbrica autorizada
```

Inferencia:

```text
El hardware inalámbrico está vivo, pero no declarado como capacidad permitida.
Puede ser un recurso legítimo no documentado, una configuración heredada o una exposición no autorizada.
```

El agente no debe acusar sin contexto.

Debe pedir coherencia.

---

## 14. Ejemplo: /boot/metal

Estado declarado:

```text
/boot/metal contiene:
- metal.manifest
- boot.contract
- host.id
- sovereign.pub
```

Estado real:

```text
/boot/metal no montado
UUID distinto
contrato no coincide con /proc/cmdline
```

Inferencia:

```text
El sistema arrancó sin exponer correctamente su nodo semiótico de metal.
La traza de arranque soberano no es verificable.
```

Este tipo de incoherencia debe considerarse crítica.

---

## 15. Riesgo y severidad

El agente puede clasificar desviaciones:

```text
informativo
→ nodo nuevo detectado, sin riesgo inmediato

advertencia
→ nodo no declarado pero no expuesto

alto
→ nodo activo con privilegios o exposición

crítico
→ nodo rompe contrato de versión, arranque o autoridad
```

Ejemplos:

```text
paquete de documentación no declarado
→ bajo

servicio local no declarado
→ medio

puerto externo no autorizado
→ alto

paquete de Zalty 9 en sistema Zalty 8
→ crítico si afecta libc, kernel, init o cadena de arranque
```

---

## 16. Papel durante actualizaciones

Antes de actualizar, el agente debería:

```text
leer estado actual
leer repositorio remoto
leer contrato de versión
simular transición
detectar incompatibilidades
explicar riesgos
```

Después de actualizar:

```text
recalcular estado
comprobar firmas
verificar servicios
comparar manifiesto anterior y nuevo
declarar si el sistema quedó coherente
```

Así, la IA no recomienda actualizar porque existan novedades.

Recomienda una transición si preserva el contrato.

---

## 17. Papel durante migraciones mayores

Para migrar Zalty 8 → Zalty 9, el agente podría:

```text
1. Leer manifiesto S8.
2. Leer manifiesto S9.
3. Leer contrato de migración.
4. Calcular nodos afectados.
5. Identificar servicios incompatibles.
6. Identificar paquetes que cambian de contrato.
7. Generar plan de transición.
8. Ejecutar solo acciones autorizadas.
9. Verificar nuevo estado S9.
```

Ejemplo de salida:

```text
Este sistema puede migrar a Zalty 9 con 3 advertencias:
- paquete X no tiene sucesor directo
- servicio Y cambia de contrato
- configuración Z requiere intervención manual
```

---

## 18. IA como notario semiótico

Una buena metáfora para este agente es:

```text
La IA no es el rey.
La IA es el notario semiótico del sistema.
```

Su función es:

```text
observar
registrar
interpretar
explicar
alertar
proponer
```

Pero no debe ser la fuente última de legitimidad.

La legitimidad debe depender de:

```text
manifiestos
firmas
contratos
repositorios oficiales
políticas de versión
trazas de actualización
```

---

## 19. Objetivo final

La capa semiótica convierte nodos técnicos en declaraciones interpretables.

La IA agente lee esas declaraciones, las compara con el estado vivo, detecta incoherencias, explica riesgos, propone transiciones y vigila la buena administración del sistema.

Frase central:

```text
Un agente IA sobre Linux ve síntomas.
Un agente IA sobre Zalty lee significado.
```

Tesis final:

```text
La buena administración deja de ser solo mantener el sistema funcionando;
pasa a ser mantenerlo coherente con lo que declara ser.
```
