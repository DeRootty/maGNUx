# Manifiesto de maGNUx

## Introducción
maGNUx nace como una propuesta de evolución del kernel tradicional, inspirado en Linux, pero orientado hacia un modelo **managed** que permita el aislamiento seguro de procesos, la coherencia integral del sistema y la segmentación conceptual de la memoria.  

El objetivo de maGNUx es ofrecer un entorno donde la interacción del usuario y de las capas internas del sistema se organice. Desde el arranque, se levanta un agente del sistema denominado Paleolito, que mapea todo el hardware central en un tronco de nodos, en el que a todo su conjunto lo instancia en memoria dentro de la clase maquina como root-maquina (heredamos codigo del kernel de Linux más puro). En el segundo segmento, se levantan las comunicaciones internas denominadas en su conjunto como host: Se cargan drivers, se levantan las comunicaciones de red basicas y se habilita un interprete ad hoc de C/C++ en modo compilador a tiempo real (es un modulo, que está configurado para entender el lenguaje C/C++, pero bien se puede acomodar a RUST) y se reconoce el rol de ROOT-MAQUINA, ROOT-COMM y ROOT-ADMIN. Por último, en la capa administrativa, es en donde Trilobytes adquiere su importancia, pues es un agente de sistema en tres segmentos bien definidos, gestionados por un agente que lateraliza la dinamica del sistema, denominado **Trilobytes**.
El agente de sistema Trilobytes es el unico con los permisos suficientes como para pasearse por los segmentos de memoria, por el contrario, Paleolito es el agente de sistema que verifica que los accesos tienen las credenciales.

---

## Segmentación de la memoria
La memoria en maGNUx se organiza en tres espacios diferenciados:

1. **Segmento Máquina**  
   Contiene los procesos básicos de la clase máquina, encargados de la ejecución fundamental y la interacción con el hardware.

2. **Segmento Comm**  
   Espacio intermedio que actúa como bus de comunicación y sincronización entre el nivel máquina y el nivel administrativo.  
   - Reconoce hardware conectado a los buses PCIe, NVME, GPUs, NPUs, APUs, Ethernet, etc que se acopla en modo de expansión relativo al mapeo hecho por Paleolito
   - Gestiona permisos.  
   - Filtra interacciones entre periferia y procesos.  
   - Mantiene coherencia en la comunicación.
   - En los procesoso de mantenimiento, el proceso de arranque se puede abstraer a este nivel, ofreciendo el tipico prompt / con el especial significado de que no estas en un entorno BASH sino que estas en un entorno de programacion C/C++ o RUST. el propio prompt / es el objeto instanciado de la clase maquina definido por paleolito como ghost o sombra del host. El funcionamiento es el mismo al de un framework en programación, pudiendo solicitar el compilado en codigo objeto de las instrucciones que se han necesitado para añadir, mantener, mejorar o cambiar aspectos del funcionamiento del siguiente segmento. Es un área de medio-bajo nivel que permite la programación ad hoc o de toda la vida, con la ventaja que tienes a Paleolito monitorizando la estabilidad del sistema y de lo que haces.

3. **Segmento Admin**  
   Espacio reservado para la ejecución de órdenes del usuario en modo privilegiado.  
   Desde aquí emerge el prompt especial:  
   ```
   /root-admin>
   ```  
   En este entorno, el usuario percibe un **bash Linux completo**, donde comandos como `ls` muestran el árbol de directorios que representan los nodos de los cuales depende la máquina.

---

## Rol de Trilobytes
**Trilobytes** actúa como el **gateway del sistema**, integrando y orquestando los tres segmentos de memoria.  
Sus funciones clave son:  
- Asegurar coherencia integral del sistema.  
- Validar interacciones de los dispositivos de entrada/salida con el kernel.  
- Gestionar el sandbox de periféricos evaluando lo positivo de su integración real en el sistema.  
- Servir como base para que el `bash` emerja como entorno coherente en el nivel `/root-admin>`.

---

## Kernel Managed: Paleolito
El **Paleolito** de maGNUx parte de la base del código de Linux, pero reestructurado para:  
- Segmentar la memoria en **máquina/comm/admin**.  
- Introducir un protocolo de capa de gestión centralizada usado por **Trilobytes**.
- Instanciar sandboxes de periféricos antes de permitir su integración real en el sistema.  
- Ofrecer al usuario un entorno familiar (puro GNU Linux en capa root-admin) pero dinamizado por el managed o Paleolito-Trilobytes, que es el **aislamiento seguro del kernel** y mayor control de la interacción entre hardware, procesos y privilegios: Permite la ejecución del kernel en memoria separada de las ejecuciones de las apps, que se ejecutan en la capa root-admin.

---

## Filosofía de maGNUx
maGNUx se fundamenta en:  
- **Seguridad estructural**: aislamiento entre capas mediante segmentación de memoria.  
- **Transparencia al usuario**: la experiencia en `/root-admin>` es equivalente a la de un sistema Linux clásico.  
- **Coherencia integral**: garantizada por Trilobytes, como núcleo de verificación y control.  
- **Evolución del kernel**: transición hacia un modelo gestionado (*managed kernel*), que mantenga compatibilidad con la tradición Linux pero avance hacia un diseño emergente.

---

## Conclusión
maGNUx no pretende sustituir a Linux, sino **emergir de él** como un kernel gestionado, seguro y coherente.  
La introducción de la segmentación memoria y el rol de Trilobytes abre la posibilidad de redefinir el paradigma operativo:  
un sistema que no solo ejecuta procesos, sino que los **supervisa, valida y organiza** en capas jerárquicas.  
