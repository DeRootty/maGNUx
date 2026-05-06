> [Inicio](README.md)

# Contrato de Sistema Operativo
* A partir de aqui, se fijan las espectativas de arranque en modo distribucion. El kernel, asume la identidad para el levantamiento de un sistema completamente operativo, declarado por el VMKZ, o en su defecto (si hemos iniciado el sistema en modo especial), para el levantamiento de lo declarado en el contrato de sistema
> - Se pueden dar dos tipos de alarmas:
> * Kernel panic
> * Dernel panic
> - La excepcion viene establecida por el modo de inicio de sesion:
> * Modo mantenimiento
>> Login por defecto: Admin con escalado a root: el comando surooted es plenamente operativo.
> * Modo tecnico de sistemas
>> el dernel no se carga. Tu usuario aplica politicas de admondo y puedes solicitar surooted
> * Modo ingeniero
>> el kernel no se carga. Directamente eres surooted
> * Modo normal:
>>El sistema permite logueo de usuario. Para mantenimiento admin se adquiere mediante peticion admomdo, para mantenimiento root se adquiere mediante petidion surooted, y el proceso es: Primero adquieres admondo y luego solicitas surooted. Esto es para un mantenimiento de sistema. Si lo que el usario busca es el escalado de privilegios por operativa privilegiada, aplica el comando sudo, el cual, su rol para nada tiene que ver con un mantenimiento de sistema.

Si todo va bien, se espera la apertura de un terminal tipo TTY o de la pantalla de inicio de sesion grafico.
 
> [Inicio](README.md)
