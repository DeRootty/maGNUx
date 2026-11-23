# 08 — Trilobytes: coherencia integral y representación

> [⬆ Subir a sección](README.md) · [📚 Índice docs](../README.md) · [🏠 Inicio](../../README.md)

> Toda arquitectura declarativa real necesita una instancia que no solo observe, sino que también **verifique, compare, decida y, llegado el caso, niegue**.

---

## En pocas palabras

**Trilobytes** verifica la coherencia integral entre identidad, política, operación y sesión orgánica; la ampliación propuesta lo habilita además como agente de representación e intermediación, únicamente bajo triple delegación positiva y mandato válido.

Si xGNUpeD declara la identidad inicial del sistema, y Dernel concede licencia operativa, Trilobytes comprueba que la actividad que va a desplegarse en el entorno de usuario es coherente con ambas cosas.

No es solo login. No es solo autenticación. No es solo auditoría.

Es el punto donde el sistema pregunta:

```text
¿esta actividad orgánica que va a comenzar
está legitimada por la identidad del sistema,
por la política vigente
y por la licencia operativa concedida?
```

---

## Qué problema resuelve

En sistemas tradicionales, varias operaciones quedan separadas:

- autenticación de usuario;
- inicio de sesión;
- carga del entorno gráfico;
- permisos;
- sesiones;
- políticas;
- servicios por usuario;
- logs;
- límites de recursos;
- comunicación con DBus, PAM, systemd-logind o equivalentes.

Funcionan, pero no forman necesariamente una sola declaración semántica.

Trilobytes propone que el paso hacia la actividad del usuario no sea una suma de piezas, sino un **umbral coherente**.

---

## Logon y Login absorbidos

El corpus anterior distinguía dos ideas que aquí quedan integradas:

| Concepto | Función refundida en Trilobytes |
|---|---|
| **Logon** | Servicio que legitima la actividad orgánica antes de que exista sesión plena. |
| **Login** | Declaración explícita de la dinámica orgánica: inicio efectivo de la operación del usuario. |

La diferencia es importante:

```text
Logon
→ comprueba si la entidad orgánica puede ser reconocida.

Login
→ despliega la sesión operativa bajo una identidad ya legitimada.
```

Trilobytes contiene ambos momentos dentro de una misma lógica:

```text
identidad del sistema
→ licencia operativa
→ legitimación orgánica
→ sesión operativa
```

---

## Qué verifica Trilobytes

Trilobytes compara cinco planos:

| Plano | Pregunta |
|---|---|
| Identidad | ¿Quién dice ser el sistema? |
| Política | ¿Qué permite el contrato declarado? |
| Licencia | ¿Qué ha concedido el Dernel al guest? |
| Operación | ¿Qué se está intentando ejecutar? |
| Estado efectivo | ¿Qué está ocurriendo realmente? |

La misión es garantizar la **veracidad estructural**:

> Que lo que el sistema declara ser, lo que debe ser y lo que efectivamente ejecuta no diverjan de forma ilegítima.

---

## Trilobytes como delimitador administrativo

Trilobytes actúa como delimitador administrativo porque evita que la sesión de usuario se confunda con la raíz estructural del sistema.

En un sistema clásico, la frontera entre:

- root;
- administración;
- usuario;
- servicios;
- entorno gráfico;
- sesión;
- aplicaciones;

puede quedar repartida entre muchas capas.

Trilobytes intenta formular esa frontera explícitamente:

```text
el usuario puede operar,
pero no porque el sistema se abra sin más,
sino porque la actividad orgánica ha sido legitimada.
```

---

## Coherencia integral

Trilobytes no observa únicamente credenciales. Observa coherencia.

Una credencial correcta puede no bastar si:

- el host no está en estado legítimo;
- la identidad xGNUpeD no coincide con la política esperada;
- la licencia Dernel no permite ese tipo de sesión;
- la sesión solicita capacidades fuera del contrato;
- la actividad se presenta como usuario, pero actúa como explotación;
- la política de distribución no reconoce ese flujo.

Por eso Trilobytes no es un login bonito: es una instancia de coherencia.

---

## Relación con systemd, PAM y sesiones

En Linux actual, partes de este problema se reparten entre:

- PAM;
- systemd-logind;
- gestores de sesión;
- display managers;
- DBus;
- políticas de escritorio;
- permisos de grupos;
- polkit;
- cgroups;
- logs.

Trilobytes no niega esas piezas. Las reinterpreta desde una pregunta más alta:

```text
¿qué significa que una actividad orgánica quede legitimada por el sistema?
```

En una implementación inicial, Trilobytes podría apoyarse en mecanismos existentes. En una madurez futura, podría ordenar esos mecanismos bajo una semántica más explícita.

---

## Cuándo actúa

Trilobytes actúa en el umbral entre Host y Guest:

```text
Host estructural
  → xGNUpeD
  → Dernel
  → Trilobytes
  → Guest operativo
  → sesión del usuario
```

Su lugar natural es el proceso de entrada a la sesión, pero su alcance conceptual empieza antes del escritorio y continúa durante la sesión.

---

## El testigo de carrera

Una forma intuitiva de entender Trilobytes es la carrera de relevos.

Cada capa del sistema corre un tramo:

```text
kernel
→ xGNUpeD
→ Dernel
→ Trilobytes
→ sesión
```

El problema no es solo correr. El problema es **pasar el testigo sin falsear identidad**.

Trilobytes verifica que el testigo que llega desde la autoridad estructural es el mismo que recibe la actividad orgánica.

---

## Decisión y negación

Trilobytes debe poder hacer tres cosas:

| Resultado | Significado |
|---|---|
| Aceptar | La sesión es coherente con identidad, política y licencia. |
| Degradar | La sesión puede abrirse con capacidades reducidas. |
| Negar | La actividad no es legítima y no debe convertirse en sesión. |

La capacidad de negar es esencial. Sin negación, Trilobytes sería solo un registrador pasivo.

---

## Relación con Dernel

Dernel concede licencia operativa al guest.

Trilobytes comprueba que esa licencia no se convierta en actividad incoherente.

```text
Dernel
→ concede marco operativo

Trilobytes
→ verifica que la actividad orgánica respeta ese marco
```

---

## Ampliación: Trilobytes como interfaz y agente de representación

Se conserva **íntegra** la función original de coherencia, Logon/Login y legitimación orgánica. La evolución propuesta incorpora un segundo momento: la **intermediación activa**. La primera función comprueba si una actividad es legítima; la segunda representa intereses ante las capacidades del sistema, siempre que haya sido habilitada.

Una presentación posible ante el usuario es:

> Hola, soy Trilobytes, la interfaz de comunicación de tu computadora. ¿En qué puedo ayudarte? >_

### TRi + Lobby + Bytes

- **Tri:** los tres ámbitos de la arquitectura.
- **Lobby:** intermediación especializada en representación de intereses.
- **Bytes:** servicio computacional (byte de ocho bits).

No se trata de una etimología histórica, sino de la **intención conceptual de la denominación**.

### El edificio y su escalera de incendios

La planta baja es el **Kernel**, ante el que opera **ROOT**; la planta media es **xGNUpeD**, ante el que opera **COMM**; la planta alta es **Dernel**, ante el que opera **ADMIN**. **Trilobytes es la escalera de incendios** que relaciona las tres plantas, no una cuarta planta ni un nivel de autoridad superior.

La escalera simboliza conexión transversal e independencia funcional potencial. No constituye una vía para evitar controles, suplantar autoridades ni apropiarse de privilegios.

### La triple luz verde

La intermediación solo queda habilitada si concurren **delegaciones positivas, explícitas y vigentes de ROOT, COMM y ADMIN**, cada una dentro de su ámbito. No basta la aprobación de dos; tampoco la ausencia de oposición. La triple habilitación **no subordina ROOT al Dernel**, ni equivale a conceder todas las facultades de las tres autoridades al agente.

La composición tradicional del manifiesto `hroot + croot + droot = root` se mantiene distinta: describe los dominios constitutivos de ROOT, mientras que esta triple delegación legitima únicamente a **Trilobytes como intermediario**. La validación de coherencia puede existir antes de que se habilite la intermediación.

### A quién representa

La concesión estructural no determina por sí sola el representado. Un **mandato específico** distingue mandante, representado, beneficiario y alcance.

- **Orientación al proveedor:** Trilobytes coordina servicios ofrecidos por un proveedor a sus usuarios.
- **Orientación al usuario:** Trilobytes procura, compara e integra servicios en representación de las necesidades del usuario.

**En un modelo, Trilobytes lleva servicios al usuario; en el otro, los busca en su nombre.** Ni el proveedor ni el usuario reciben privilegios por esa orientación. Toda operación debe respetar concesiones y mecanismos de ejecución.

### Consecuencia para el diseño

Se propone separar un componente **verificador/guard** de un **agente de interacción** implementable en Go. La caída de Trilobytes o la revocación de una aprobación no deben comprometer la continuidad esencial del Host. Trilobytes deja de **iniciar intermediaciones nuevas** si pierde una de las tres aprobaciones; las operaciones en curso exigen una política de cancelación o recuperación.

La especificación preliminar de contratos, estados y pruebas está en [03 — Trilobytes: legitimación e intermediación](../propuesta-tecnica/03-trilobytes-mediacion-spec.md).

---

## Revelado RAW de sesiones y canal α

La arquitectura RGBA añade a Trilobytes una **función de composición operativa** que no elimina su misión original de coherencia ni sustituye la intermediación bajo mandato.

Se distinguen tres actividades:

1. **Verificar:** contrastar identidad del Host, principales, objetos declarados por R/G/B, contratos y dependencias.
2. **Revelar:** convertir el estado constitutivo de una sesión (su **RAW sistémico**) en un descriptor operativo que exprese visibilidad, operaciones admitidas y disponibilidad de colaboración α. La aplicación real de permisos corresponde a mecanismos nativos y servicios competentes.
3. **Intermediar activamente:** representar intereses dentro de un mandato válido cuando estén vigentes las tres delegaciones positivas ROOT, COMM y ADMIN. La mera verificación o composición no sustituye esta condición.

En el revelado participan objetos del kernel (R), servicios derivados de xGNUpeD (G), entidades administrativas de Dernel (B) y —cuando existe y está autorizada— la identidad del **usuario IA α** como colaborador transversal. La IA no ocupa una cuarta planta del edificio, no recibe privilegios superiores y no comparte automáticamente las credenciales privadas del humano.

El prompt representa el resultado validado: `3/$` señala Trilobytes sin α; `α/$` representa una sesión USER con IA coadyuvante habilitada. Ni el prompt ni la metáfora de iluminación conceden permisos. Si α falla, el objetivo es recuperar la sesión `3/$` con continuidad humana y revocación o finalización segura de tareas pendientes.

**La imagen de la sesión no es la fotografía del kernel:** puede revelar objetos G y B con realidad funcional y dependencias verificables que no tienen un tipo equivalente en el inventario nativo R. Trilobytes debe preservar su procedencia, no inventarlos.

Consultar [04 — Modelo ecológico RGBA](../manifesto/04-modelo-ecologico-rgba.md), [ADR-0001](../propuesta-tecnica/adr-0001-composicion-rgba.md) y la [especificación de sesiones](../propuesta-tecnica/04-sesion-rgba-spec.md). **Estado:** definición propuesta; no es un componente implementado en Zalty.

---

## Retina semiótica, atribución de valor y deliberación α

La nueva analogía del **ojo humano** delimita una cuestión que la metáfora del revelado fotográfico no explica por sí sola: **percibir y ordenar señales no equivale a determinar por qué deben importarle a alguien**.

La retina utiliza conos y bastones para transducir estímulos luminosos y realiza parte del procesamiento visual; la percepción consciente y la valoración práctica involucran circuitos posteriores. En maGNUx, la comparación no pretende reproducir neurobiología literalmente:

- **Nodos semióticos:** reconocen, codifican y relacionan acontecimientos dentro de su competencia y de sus contratos. La semántica contractual proporciona un significado *estructural* legible por la máquina.
- **Trilobytes sin IA (`3/$`):** verifica y revela al usuario esa composición, de manera comparable a una red sensora que entrega una escena interpretable. Puede clasificar por reglas, umbrales y contratos, pero **no presupone un sujeto neuronal autónomo que debata el valor de lo observado**.
- **Usuario humano:** interpreta la escena desde sus objetivos, experiencia y circunstancias; atribuye valor práctico, prioridad o relevancia a lo que la sesión hace visible.
- **Usuario IA α (`α/$`):** añade la posibilidad de una **segunda interpretación inferencial**. Puede argumentar que cierta señal importa más o menos de lo que el humano aprecia, presentar hipótesis y evidencias, comparar alternativas y aceptar objeciones. Este intercambio es **deliberación**, no una fuente de autoridad.

Se separan tres nociones de «valor»:

1. **Significado semiótico:** qué acontecimiento ocurrió, qué objeto afecta y a qué contratos se refiere.
2. **Valor práctico o contextual:** cuánto importa para los objetivos de un sujeto, con qué coste y qué prioridad debería concedérsele.
3. **Validez normativa:** si una operación puede ejecutarse bajo contratos, autorizaciones y controles efectivos.

Sin α, las dos primeras no desaparecen: el sistema aporta significado semiótico y un usuario humano puede valorar ese significado. Con α, la **valoración contextual puede ser discutida**; no por ello se altera la validez normativa ni las competencias de ROOT, COMM o ADMIN.

Ejemplo: COMM declara una degradación intermitente de red. En `3/$`, Trilobytes puede mostrar el acontecimiento y su relación con la actividad; el usuario decide qué relevancia tiene. En `α/$`, el usuario IA puede correlacionarlo con fallos anteriores y **proponer** que existe un problema de continuidad más grave. El humano puede aceptar, rechazar o debatir esa inferencia. Toda acción ulterior sigue sometida a contratos y a su legítimo mandante.

**Regla de diseño:** Trilobytes permite el diálogo y muestra con claridad si algo es un hecho observado, una evaluación humana, una inferencia α o una decisión autorizada. La presencia de IA no debe desposeer al sujeto humano de su juicio ni eludir la política contractual; el mandato puede definir otros destinatarios o representados, pero debe identificarlos explícitamente.

La semiótica estructural y el revelado de Trilobytes siguen disponibles cuando la NPU o α faltan. Esa separación sostiene la continuidad ordinaria de maGNUx.

## Criterio de aceptación conceptual

Trilobytes existe correctamente si permite responder:

1. qué entidad orgánica intenta operar;
2. bajo qué identidad de sistema opera;
3. qué licencia Dernel recibe;
4. qué política de sesión se aplica;
5. qué capacidades se conceden;
6. qué divergencias se detectan;
7. qué se acepta, degrada o niega;
8. cómo queda registrada la legitimación.

---

## Posición en la secuencia

```text
Kernel
  └── xGNUpeD
        └── Dernel
              └── Trilobytes
                    ├── Logon
                    ├── Login
                    └── Sesión del usuario
```

---

*← [xGNUpeD](07-xgnuped.md) | [Índice](../README.md) | Siguiente: [Dernel →](09-dernel.md)*
