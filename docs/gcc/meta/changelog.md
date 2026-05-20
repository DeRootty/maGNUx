# CHANGELOG

## Entrega 09

- Se conserva toda la estructura de la entrega 08.
- Se continúa y se cierra la parte principal de **3.5 Options Controlling C++ Dialect**.
- Se añaden cuatro archivos Markdown nuevos:
  - `35-cpp-warnings-reorder-move-range.md`;
  - `36-cpp-warnings-tags-linkage-effective.md`;
  - `37-cpp-warnings-overload-memory-hierarchy.md`;
  - `38-objc-intro-runtime.md`.
- Se cubren advertencias C++ sobre:
  - `-Wreorder`;
  - `-Wpessimizing-move`;
  - `-Wredundant-move`;
  - `-Wrange-loop-construct`;
  - `-Wredundant-tags`;
  - `-Wmismatched-tags`;
  - `-Wsubobject-linkage`;
  - `-Weffc++`;
  - `-Wsfinae-incomplete`;
  - `-Wstrict-null-sentinel`;
  - `-Wold-style-cast`;
  - `-Woverloaded-virtual`;
  - `-Wmismatched-new-delete`;
  - `-Wmultiple-inheritance`;
  - `-Wvirtual-inheritance`;
  - `-Wsized-deallocation`;
  - `-Wsuggest-final-types`;
  - `-Wsuggest-final-methods`;
  - `-Wsuggest-override`.
- Se inicia **3.6 Options Controlling Objective-C and Objective-C++ Dialects**.
- Se cubren opciones iniciales Objective-C/Objective-C++:
  - `-fconstant-string-class=class-name`;
  - `-fgnu-runtime`;
  - `-fnext-runtime`;
  - `-fno-nil-receivers`;
  - `-fobjc-abi-version=n`;
  - `-fobjc-call-cxx-cdtors`.
- Se amplía el glosario técnico con terminología de movimientos C++, ODR, SFINAE, Objective-C runtime y despacho de mensajes.
- Se actualiza `README.md` con la navegación completa de la entrega 09.
- Se actualiza `MANIFIESTO_CONTINUIDAD.md` con el siguiente punto de avance.

## Entrega 08

- Continuación de **3.5 Options Controlling C++ Dialect**.
- Cobertura de temporales en `range-for`, reflexión, RTTI, deallocation sized, enumeraciones estrictas, orden de evaluación, plantillas, estáticos thread-safe, visibilidad, DSO, compatibilidad Microsoft y advertencias C++ iniciales.

## Entrega 07

- Inicio de **3.5 Options Controlling C++ Dialect**.
- Cobertura de ABI, `char8_t`, conceptos, `constexpr`, contratos, corrutinas, plantillas y módulos.

## Entrega 06

- Inicio de **3.4 Options Controlling C Dialect**.
- Cobertura de `-ansi`, `-std=`, C23/GNU23, `-fhosted`, `-ffreestanding`, builtins, inline, signedness y arrays flexibles.


## Entrega 10

- Se continúa y cierra la sección 3.6 como lectura técnica inicial.
- Se añaden opciones Objective-C/Objective-C++ sobre despacho directo, excepciones, GC, comprobación de `nil`, dialecto `objc1`, clases reemplazables, Zero-Link, variables de instancia, visibilidad y generación de declaraciones.
- Se añaden advertencias Objective-C específicas: `-Wassign-intercept`, `-Wno-property-assign-default`, `-Wno-protocol`, `-Wobjc-root-class`, `-Wselector`.
- Se inicia la sección 3.7 sobre OpenMP, OpenACC y offload.
- Se documentan `-foffload=`, `-foffload-options=`, `-fopenacc`, `-fopenacc-dim=`, `-fopenmp`, `-fopenmp-simd` y `-fopenmp-target-simd-clone`.
- Se actualiza glosario, README y manifiesto de continuidad.
