# Registro mínimo de evidencia

> [⬆ Laboratorio](README.md) · [🏠 Inicio](../../../README.md)

Cada ensayo deberá conservar esta ficha en Markdown, YAML o JSON, además de los artefactos originales.

~~~yaml
ensayo: G01
estado: pendiente_de_repetir_en_gentoo
fuentes:
  version: identificar
  revision: identificar
  hash: identificar
entorno:
  distro: identificar
  gcc: identificar
  target: identificar
  binutils: identificar
  configuracion: identificar
variantes:
  A:
    decision: FEATURE=0
  B:
    decision: FEATURE=1
interpretacion:
  mecanismo: preprocesador
  orden_real: referencia_al_log
  cambios_derivados: []
evidencias:
  cabeceras: referencia
  macros: referencia
  fuente_preprocesada: referencia
  gimple: referencia
  ensamblador: referencia
  objeto: referencia
  enlace: no_realizado
resultado:
  diferencia_observada: pendiente
  hipotesis: pendiente
  incertidumbre: pendiente
~~~

Distinguir observación, explicación, predicción y ausencia de evidencia. Para cada arista de la traza incluir ubicación en código, versión y mecanismo que la justifica. La primera fase no exige inferencia automática. El objetivo es que otra persona pueda repetir los comandos y obtener resultados contrastables.

**Criterio para avanzar:** terminar y verificar la metodología Gentoo antes de diseñar el traslado a Slackware y Arch. No se da por demostrada ninguna hipótesis arquitectónica de maGNUx a partir de un ensayo mínimo.
