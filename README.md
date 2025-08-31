# Manifiesto de maGNUx

## Introducción
maGNUx nace como una propuesta de evolución del kernel tradicional, inspirado en Linux, pero orientado hacia un modelo **managed** que permita el aislamiento seguro de procesos, la coherencia integral del sistema y la segmentación conceptual de la memoria.  

El objetivo de maGNUx es ofrecer un entorno donde la interacción del usuario y de las capas internas del sistema se organice en tres segmentos bien definidos, gestionados por un agente central denominado **Trilobytes**.

---

## Segmentación de la memoria
La memoria en maGNUx se organiza en tres espacios diferenciados:

1. **Segmento Máquina**  
   Contiene los procesos básicos de la clase máquina, encargados de la ejecución fundamental y la interacción con el hardware.

2. **Segmento Comm**  
   Espacio intermedio que actúa como bus de comunicación y sincronización entre el nivel máquina y el nivel administrativo.  
   - Gestiona permisos.  
   - Filtra interacciones entre periferia y procesos.  
   - Mantiene coherencia en la comunicación.

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
- Gestionar el sandbox de periféricos antes de permitir su integración real en el sistema.  
- Servir como base para que el `bash` emerja como entorno coherente en el nivel `/root-admin>`.

---

## Kernel Managed
El **kernel managed** de maGNUx parte de la base del código de Linux, pero reestructurado para:  
- Segmentar la memoria en **máquina/comm/admin**.  
- Introducir una capa de gestión centralizada por **Trilobytes**.  
- Ofrecer al usuario un entorno familiar (similar a Linux), pero con un **aislamiento seguro del kernel** y mayor control de la interacción entre hardware, procesos y privilegios.

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
