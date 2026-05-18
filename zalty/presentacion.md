# Zalty

> Distribución GNU/Linux basada en el manifiesto maGNUx.

Zalty nace como una primera implementación práctica del manifiesto maGNUx dentro del ecosistema GNU/Linux.

Su objetivo inicial es explorar una distribución capaz de incorporar soberanía sistémica, arranque temprano declarativo y nodos semióticos, sin abandonar la base técnica imperativa propia de Linux.

```text
maGNUx
→ manifiesto conceptual y contrato de soberanía sistémica

Zalty
→ distribución GNU/Linux que implementa ese manifiesto

otras distribuciones
→ posibles implementaciones compatibles mediante capas de transición
```

---

## 1. Propósito inicial

Zalty no se plantea únicamente como una distribución que instala paquetes.

Su propósito es declarar una forma de entender el sistema operativo como un conjunto de nodos capaces de ser operados técnicamente y, además, interpretados declarativamente.

La idea base es:

```text
Linux administra nodos técnicos.
Zalty pretende convertir esos nodos en nodos semióticos compatibles con maGNUx.
```

Esto permite que una distribución GNU/Linux pueda ser abordada no solo desde comandos, servicios, archivos y paquetes, sino también desde contratos, trazas, firmas, relaciones, estados y significados.

---

## 2. Relación entre maGNUx y Zalty

maGNUx no impone una distribución concreta.

maGNUx define una gramática de soberanía sistémica que una distribución puede implementar.

Zalty adopta esa gramática como base propia.

```text
maGNUx
→ define el manifiesto
→ declara el paradigma
→ establece la compatibilidad sistémica
→ propone nodos semióticos
→ fija la idea de contrato, traza e integridad

Zalty
→ implementa el manifiesto
→ organiza una distribución GNU/Linux compatible
→ experimenta con arranque temprano declarativo
→ estructura nodos técnicos como nodos semióticos
```

Por tanto, Zalty puede entenderse como:

```text
la primera distribución GNU/Linux compatible con el manifiesto maGNUx
```

sin que maGNUx quede limitado únicamente a Zalty.

---

## 3. Compatibilidad maGNUx

La compatibilidad maGNUx no sustituye el gestor de paquetes nativo de cada distribución.

No obliga a Debian a abandonar `apt`, ni a Fedora a abandonar `dnf`, ni a Arch a abandonar `pacman`, ni a Gentoo a abandonar `emerge`, ni a NixOS a abandonar `nix`.

La compatibilidad maGNUx añade una capa superior:

```text
gestor de paquetes nativo
→ instala, actualiza, elimina y resuelve dependencias

capa maGNUx
→ interpreta legitimidad, integridad, contrato, traza y estado sistémico
```

Así, una distribución puede mantener su filosofía de administración y, al mismo tiempo, declarar una ruta de compatibilidad con maGNUx.

---

## 4. Repositorios oficiales y repositorios de transición

Zalty puede usar repositorios oficiales maGNUx como referencia natural, al nacer directamente desde el manifiesto.

Otras distribuciones podrían incorporarse mediante repositorios de transición.

```text
repositorios oficiales maGNUx
→ estado general reconocido por el manifiesto

repositorios de transición
→ adaptan una distribución concreta hacia compatibilidad maGNUx
```

Ejemplo conceptual:

```text
Distro externa
→ estado propio
→ repositorio de transición maGNUx
→ compatibilidad parcial
→ migración validada
→ repositorio oficial maGNUx
→ estado compatible con maGNUx
```

La transición permite crear capas de transformación entre filosofías distintas de mantenimiento del sistema.

```text
Debian
→ estabilidad conservadora

Arch
→ rolling release

Gentoo
→ compilación personalizada

NixOS
→ estado declarativo reproducible

Fedora
→ ciclos definidos e integración comunitaria/empresarial

Zalty
→ implementación directa del manifiesto maGNUx
```

maGNUx no borra esas diferencias.

Las traduce hacia un contrato común de soberanía sistémica.

---

## 5. Actualización, migración e integridad de versión

Zalty distingue entre actualizar paquetes y migrar el estado del sistema.

Una actualización ordinaria debe avanzar dentro del mismo contrato de versión.

Una migración mayor debe cambiar de contrato de sistema mediante una transición validada.

```text
actualización menor
→ misma versión base
→ mismo contrato de compatibilidad
→ parches, correcciones y mejoras compatibles

migración mayor
→ nueva versión base
→ nuevo contrato de compatibilidad
→ cambios cualitativos de estabilidad, ABI o paradigma
```

Por ejemplo:

```text
Sistema instalado:
Zalty 8.3

Repositorio remoto:
Zalty 8.4 disponible
Zalty 9.1 disponible

Resultado:
Zalty 8.4 → actualización ordinaria aceptable
Zalty 9.1 → no debe mezclarse directamente con Zalty 8.3
Zalty 9.1 → solo aceptable mediante migración validada Zalty 8 → Zalty 9
```

La regla central es:

```text
oficial no significa automáticamente compatible
más moderno no significa automáticamente aplicable
firmado no significa aceptable para cualquier versión base
```

La compatibilidad depende de la traza, la firma, el canal, la versión base y el contrato de migración.

---

## 6. Firma de paquete y firma de estado

Zalty no debería limitarse a verificar paquetes individuales.

También debe poder verificar estados del sistema.

Un paquete puede tener:

```text
nombre
versión
arquitectura
hash
firma
fecha
canal
compatibilidad_base
```

Pero el sistema completo necesita una huella de estado:

```text
S8.t = {p1, p2, p3, ..., pn}

HASH(S8.t) = H(
  H(p1) || H(p2) || H(p3) || ... || H(pn)
)
```

La versión base puede declararse mediante un manifiesto firmado:

```text
MANIFEST_S8
→ lista de paquetes válidos
→ versiones permitidas
→ hashes permitidos
→ dependencias válidas
→ fechas de publicación
→ canales admitidos
→ política de actualización
→ firma de versión base
```

De este modo, actualizar no significa perseguir la versión más moderna, sino avanzar dentro de la línea de integridad que gobierna la versión base instalada.

```text
paquete válido =
hash correcto
+ firma válida
+ canal autorizado
+ pertenencia a la versión base
+ compatibilidad con el estado actual
```

---

## 7. Nodo técnico y nodo semiótico

Un nodo técnico es interpretable por un sistema técnico imperativo.

Puede ser ejecutado, leído, montado, arrancado, detenido, instalado o eliminado.

```text
archivo
paquete
servicio
dispositivo
socket
proceso
módulo
unidad de arranque
mountpoint
```

Un nodo semiótico conserva esa capacidad imperativa, pero añade claridad declarativa.

```text
nodo técnico
+ identidad
+ función
+ relación
+ contrato
+ firma
+ traza
+ estado
+ significado
```

La diferencia puede expresarse así:

```text
Nodo técnico
→ interpretable por ejecución imperativa

Nodo semiótico
→ interpretable por ejecución imperativa
→ interpretable por lectura declarativa
```

O de forma más breve:

```text
Un nodo técnico permite operar.
Un nodo semiótico permite operar y comprender.
```

---

## 8. Incorporar semiótica a una distribución Linux

Hacer compatible una distribución Linux con maGNUx significa integrar un nuevo paradigma en la gestión de sus nodos.

No basta con añadir repositorios.

La distribución debe ser capaz de expresar qué significan sus elementos dentro del contrato del sistema.

```text
este paquete
→ pertenece a esta versión base
→ está firmado por esta autoridad
→ conserva esta traza
→ se actualiza dentro de este contrato

este servicio
→ abre esta capacidad
→ pertenece a esta zona de confianza
→ requiere esta política de identidad

este repositorio
→ representa esta autoridad
→ ofrece esta ruta de actualización o transición

este dispositivo
→ representa este recurso material
→ participa en este mapa del sistema
→ se declara dentro de este contrato
```

La semiótica incorporada al nodo no sustituye su función técnica.

La transparenta dentro de un marco declarativo.

---

## 9. Arranque temprano y `/boot/metal`

Uno de los objetivos iniciales de Zalty es explorar un arranque temprano basado en nodos semióticos.

En el manifiesto maGNUx, `/boot/metal` representa una posible partición independiente, con UUID propio, montada como nodo declarativo del arranque soberano.

```text
/boot/efi
→ puerta firmware

/boot/metal
→ nodo semiótico soberano
→ declaración del metal
→ contratos
→ llaves
→ manifiestos
→ rutas de arranque
```

`/boot/metal` no debe entenderse solo como una carpeta.

Debe entenderse como una región material del almacenamiento capaz de declarar significado antes de que el kernel convierta el metal en sistema.

---

## 10. IA como motor interpretativo

Zalty contempla que los nodos semióticos puedan ser abordados por herramientas declarativas y motores de IA.

El objetivo no es que la IA gobierne el sistema.

El objetivo es que la IA pueda leer, interpretar, auditar y explicar el estado del sistema a partir de declaraciones claras.

```text
IA
→ interpreta nodos semióticos
→ detecta incoherencias
→ explica estados
→ propone transiciones
→ audita compatibilidad

contratos
→ legitiman

firmas
→ autorizan

repositorios
→ publican estados

sistema
→ ejecuta
```

La IA no sustituye la autoridad del sistema.

La autoridad debe seguir dependiendo de manifiestos, firmas, contratos, repositorios oficiales y políticas de versión.

La IA actúa como intérprete de una estructura declarativa.

---

## 11. Fórmula de apertura

```text
Zalty es una distribución GNU/Linux orientada a implementar el manifiesto maGNUx.

Su objetivo es transformar la administración clásica de nodos técnicos
en una administración transparente de nodos semióticos,
donde paquetes, servicios, dispositivos, repositorios, firmas y estados
puedan ser operados por el sistema e interpretados declarativamente
por herramientas humanas, técnicas o asistidas por IA.
```

---

## 12. Tesis inicial

```text
Linux administra recursos.
Zalty pretende que esos recursos puedan declarar significado.
```

Y, en relación con maGNUx:

```text
maGNUx no impone una distribución.
maGNUx define un manifiesto de compatibilidad sistémica.
Zalty nace como su primera implementación GNU/Linux.
```
