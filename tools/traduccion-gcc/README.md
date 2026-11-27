# Motor de traducción documental — GCC 16.1.0

> [Aula de integración](../../docs/laboratorios/gentoo/aula-gcc/README.md) · [Inicio](../../README.md)

Objetivo: procesar el manual de usuario íntegro, sin seleccionar lenguajes ni arquitecturas. Se usa el [HTML tarball oficial](https://gcc.gnu.org/onlinedocs/16.1.0/) de la versión exacta 16.1.0, ya expandido desde Texinfo, para incluir los índices y todas las inclusiones. No se recompila el manual desde Texinfo en esta versión del motor. El original y el registro editorial previo se mantienen separados.

## GitHub Actions

[Workflow de traducción](../../.github/workflows/gcc-translation.yml) · [Ejecuciones](https://github.com/DeRootty/maGNUx/actions/workflows/gcc-translation.yml)

1. La primera ejecución de auditoría es gratuita respecto a la API: inventaría todas las páginas y segmentos y ejecuta pruebas pequeñas.
2. Para traducir, crea un secret de repositorio llamado OPENAI_API_KEY en Settings → Secrets and variables → Actions. Nunca publiques la clave en un archivo o comentario. Es una clave API con facturación independiente de ChatGPT.
3. En Actions → GCC 16.1.0 — traducción íntegra → Run workflow, selecciona master, modo translate y max_calls. El valor inicial es 5; máximo 50. Una llamada tiene límite de salida de 10.000 tokens; esto limita solicitudes y salida, no garantiza un coste en euros. Revisa consumo y facturación del proveedor.
4. Si deseas ejecución diaria automática, crea la variable de repositorio GCC_TRANSLATION_AUTO con valor true. Sin ella no hay traducción de pago programada. Cada ejecución programada tiene un máximo de 5 llamadas. Elimina o cambia la variable a false para detener el gasto futuro. La ejecución manual se puede cancelar desde Actions.
5. Opcional: variable GCC_TRANSLATION_MODEL para cambiar el modelo; por defecto gpt-5.4-mini. Las traducciones se guardan por segmento, con huella de la página fuente. Repetir la acción reanuda los pendientes. No se garantiza el guardado si se cancela abruptamente el runner; un fallo normal permite el paso final de commit. Si master cambia y el push falla, revisa el log; no se fuerza el push.

La salida se guarda bajo docs/laboratorios/gentoo/aula-gcc/manual/automatizado: fuente.json fija la huella SHA-256 del archivo, estado/ guarda segmentos y modelos, cobertura.json registra el inventario, html/ y markdown/ contienen solo páginas con todos sus segmentos procesados. README.md se genera cuando se ejecuta la traducción. No se sobrescriben los capítulos ya escritos. Los archivos legales en inglés se preservan adicionalmente; las traducciones legales son informativas. El texto automático no sustituye al aviso original ni acredita conformidad jurídica.

## Control de calidad y límites

- Se preservan etiquetas y anclas de HTML, código en elementos pre/code/samp/kbd/var/tt y nombres de opciones detectados; se comprueban marcadores e IDs de cada lote. El texto alternativo y los títulos visibles se incluyen.
- Se conserva la separación de nodos de HTML; algunos fragmentos necesitan revisión gramatical por contener código o enlaces intercalados. Los ejemplos y sus comentarios en bloques de código permanecen literales.
- El inventario contabiliza páginas del archivo oficial y segmentos; no demuestra que la traducción sea semánticamente completa o correcta. Se necesita cotejo de nodos y referencias con el original, revisión humana y auditoría de GFDL antes de declarar terminada la edición.
- HTML es la referencia de fidelidad estructural. Markdown se deriva con Pandoc; la navegación a fragmentos externos puede seguir en inglés. No se garantiza equivalencia tipográfica ni se han comprobado todas las anclas.
- Las páginas pendientes no se convierten en supuestas traducciones. Los enlaces desde los borradores a ellas llevan al original. No se publica automáticamente en therootty.online.
- El archivo oficial puede cambiar o no estar accesible; si cambia su huella, la ejecución se detiene. El primer inventario y la prueba API real deben verificarse en Actions.

## Ejecución local opcional

Python 3.11+, Beautiful Soup y Pandoc. Desde la raíz:

~~~sh
python3 -m pip install -r tools/traduccion-gcc/requirements.txt
python3 tools/traduccion-gcc/translate.py selftest
python3 tools/traduccion-gcc/translate.py audit
# Con OPENAI_API_KEY configurada de forma segura:
python3 tools/traduccion-gcc/translate.py translate --max-calls 5
~~~
