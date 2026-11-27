# 3.1. Resumen de opciones

> [Índice del manual](README.md) · [Aula de integración](../README.md) · [Edición y licencia](00-edicion-y-licencia.md)

**Estado:** sección completa en traducción inicial; revisión humana y cotejo tipográfico pendientes.  
**Original:** [gcc/doc/invoke.texi](https://github.com/gcc-mirror/gcc/blob/releases/gcc-16.1.0/gcc/doc/invoke.texi), nodo Option Summary, blob `9207a021e64224b74d5019719c3d7e39a2663807`.  
Copyright © 1988–2026 Free Software Foundation, Inc. GFDL 1.3 o posterior.

**Nota editorial:** se mantienen nombres de opciones, metavariables y orden de las listas; se convierte su marcado Texinfo a texto monoespaciado. Se incluyen todas las familias y objetivos del original, no solo x86.

A continuación se ofrece un resumen de todas las opciones, agrupadas por tipo. Las explicaciones se encuentran en las secciones siguientes.

## Opciones generales
Véase «Opciones que controlan el tipo de salida» en el [índice del manual](README.md).

~~~text
-c  -S  -E  -o file
-dumpbase dumpbase  -dumpbase-ext auxdropsuf
-dumpdir dumppfx  -x language
-v  -###  --help[=class[,...]]  --target-help  --version
-pass-exit-codes  -pipe  -wrapper
@file  -ffile-prefix-map=old=new  -fcanon-prefix-map
-fplugin=file  -fplugin-arg-name=arg
-fdump-ada-spec[-slim]  -fada-spec-parent=unit
-fdump-go-spec=file
--assemble  --compile  --dumpbase dumpbase
--dumpbase-ext auxdropsuf  --dumpdir dumppfx
--language=language  --output=file  --pass-exit-codes
--pipe  --preprocess  --verbose
~~~


## Opciones del lenguaje C
Véase «Opciones que controlan el dialecto C» en el [índice del manual](README.md).

~~~text
-ansi  -std=standard  -aux-info filename
-fno-asm
-fno-builtin  -fno-builtin-function  -fcond-mismatch
-ffreestanding  -fgimple  -fgnu-tm  -fgnu89-inline  -fhosted
-flax-vector-conversions  -fms-extensions
-fpermitted-flt-eval-methods=standard
-fplan9-extensions  -fsigned-bitfields  -funsigned-bitfields
-fsigned-char  -funsigned-char  -fstrict-flex-arrays[=n]
-fsso-struct=endianness  --ansi
~~~


## Opciones del lenguaje C++
Véase «Opciones que controlan el dialecto C++» en el [índice del manual](README.md).

~~~text
--compile-std-module
-fabi-compat-version=n  -fabi-version=n
-fno-access-control  -faligned-new=[n]
-fno-assume-sane-operators-new-delete
-fchar8_t  -fcheck-new
-fconcepts  -fconcepts-diagnostics-depth=n
-fconstexpr-depth=n  -fconstexpr-cache-depth=n
-fconstexpr-loop-limit=n  -fconstexpr-ops-limit=n
-fcontracts
-fcontract-evaluation-semantic=[ignore|observe|enforce|quick_enforce]
-fcontracts-conservative-ipa  -fcontract-checks-outlined
-fcontract-disable-optimized-checks
-fcontracts-client-check=[none|pre|all]
-fcontracts-definition-check=[on|off]
-fcoroutines  -fdiagnostics-all-candidates
-fno-elide-constructors
-fno-enforce-eh-specs
-fext-numeric-literals
-fno-gnu-keywords
-fno-immediate-escalation
-fno-implement-inlines
-fimplicit-constexpr
-fno-implicit-inline-templates
-fno-implicit-templates
-fmodule-header[=kind]
-fmodule-implicit-inline
-fno-module-lazy
-fmodule-mapper=specification
-fmodule-only
-fmodules
-fms-extensions
-fnew-inheriting-ctors
-fnew-ttp-matching
-fno-nonansi-builtins  -fnothrow-opt  -fno-operator-names
-fno-optional-diags
-fno-pretty-templates  -frange-for-ext-temps  -freflection
-fno-rtti  -fsized-deallocation
-fstrict-enums  -fstrong-eval-order[=kind]
-ftemplate-backtrace-limit=n
-ftemplate-depth=n
-fno-threadsafe-statics  -fuse-cxa-atexit  -fno-use-cxa-get-exception-ptr
-fno-weak  -nostdinc++
-fvisibility-inlines-hidden
-fvisibility-ms-compat
-flang-info-include-translate[=header]
-flang-info-include-translate-not
-flang-info-module-cmi[=module]
-stdlib=libstdc++,libc++
-Wabbreviated-auto-in-template-arg
-Wabi-tag  -Waligned-new[=kind]
-Wcatch-value  -Wcatch-value=n
-Wno-class-conversion  -Wclass-memaccess
-Wcomma-subscript  -Wconditionally-supported
-Wno-conversion-null  -Wctad-maybe-unsupported
-Wctor-dtor-privacy  -Wdangling-reference
-Wno-defaulted-function-deleted
-Wno-delete-incomplete
-Wdelete-non-virtual-dtor  -Wno-deprecated-array-compare
-Wdeprecated-copy  -Wdeprecated-copy-dtor
-Wno-deprecated-enum-enum-conversion  -Wno-deprecated-enum-float-conversion
-Wno-deprecated-literal-operator  -Wdeprecated-variadic-comma-omission
-Weffc++  -Wno-elaborated-enum-base
-Wno-exceptions  -Wno-expose-global-module-tu-local  -Wno-external-tu-local
-Wextra-semi  -Wno-global-module  -Wno-inaccessible-base
-Wno-inherited-variadic-ctor  -Wno-init-list-lifetime
-Winvalid-constexpr  -Winvalid-imported-macros
-Wno-invalid-offsetof  -Wno-literal-suffix
-Wmismatched-new-delete  -Wmismatched-tags
-Wmultiple-inheritance  -Wnamespaces  -Wnarrowing
-Wnoexcept  -Wnoexcept-type  -Wnon-virtual-dtor
-Wpessimizing-move  -Wno-placement-new  -Wplacement-new=n
-Wrange-loop-construct  -Wredundant-move  -Wredundant-tags
-Wreorder  -Wregister  -Wno-sfinae-incomplete
-Wstrict-null-sentinel  -Wno-subobject-linkage  -Wtemplates
-Wno-non-c-typedef-for-linkage  -Wno-non-template-friend  -Wold-style-cast
-Woverloaded-virtual  -Wno-pmf-conversions  -Wself-move  -Wsign-promo
-Wsized-deallocation  -Wsuggest-final-methods
-Wsuggest-final-types  -Wsuggest-override  -Wno-template-body
-Wno-template-id-cdtor  -Wtemplate-names-tu-local
-Wno-terminate  -Wno-vexing-parse  -Wvirtual-inheritance
-Wno-virtual-move-assign  -Wvolatile
~~~


## Opciones de los lenguajes Objective-C y Objective-C++
Véase «Opciones que controlan los dialectos Objective-C y Objective-C++» en el [índice del manual](README.md).

~~~text
-fconstant-string-class=class-name
-fgnu-runtime  -fnext-runtime
-fno-nil-receivers
-fobjc-abi-version=n
-fobjc-call-cxx-cdtors
-fobjc-direct-dispatch
-fobjc-exceptions
-fobjc-gc
-fobjc-nilcheck
-fobjc-std=objc1
-fno-local-ivars
-fivar-visibility=[public|protected|private|package]
-freplace-objc-classes
-fzero-link
-gen-decls
-Wassign-intercept  -Wno-property-assign-default
-Wno-protocol  -Wobjc-root-class  -Wselector
-Wstrict-selector-match
-Wundeclared-selector
~~~


## Opciones de OpenMP y OpenACC
Véase «Opciones que controlan OpenMP y OpenACC» en el [índice del manual](README.md).

~~~text
-foffload=arg  -foffload-options=arg
-fopenacc  -fopenacc-dim=geom
-fopenmp  -fopenmp-simd  -fopenmp-target-simd-clone[=device-type]
~~~


## Opciones de formato de mensajes de diagnóstico
Véase «Opciones que controlan el formato de los diagnósticos» en el [índice del manual](README.md).

~~~text
-fmessage-length=n
-fdiagnostics-plain-output
-fdiagnostics-show-location=[once|every-line]
-fdiagnostics-color=[auto|never|always]
-fdiagnostics-urls=[auto|never|always]
-fdiagnostics-format=[text|sarif-stderr|sarif-file]
-fdiagnostics-add-output=DIAGNOSTICS-OUTPUT-SPEC
-fdiagnostics-set-output=DIAGNOSTICS-OUTPUT-SPEC
-fno-diagnostics-json-formatting
-fno-diagnostics-show-option  -fno-diagnostics-show-caret
-fno-diagnostics-show-event-links
-fno-diagnostics-show-labels  -fno-diagnostics-show-line-numbers
-fno-diagnostics-show-cwe
-fno-diagnostics-show-rules
-fno-diagnostics-show-highlight-colors
-fno-diagnostics-show-nesting
-fno-diagnostics-show-nesting-locations
-fdiagnostics-show-nesting-levels
-fdiagnostics-minimum-margin-width=width
-fdiagnostics-parseable-fixits  -fdiagnostics-generate-patch
-fdiagnostics-show-template-tree  -fno-elide-type
-fdiagnostics-path-format=[none|separate-events|inline-events]
-fdiagnostics-show-path-depths
-fno-show-column
-fdiagnostics-column-unit=[display|byte]
-fdiagnostics-column-origin=origin
-fdiagnostics-escape-format=[unicode|bytes]
-fdiagnostics-text-art-charset=[none|ascii|unicode|emoji]
-fdiagnostics-show-context[=depth]
~~~


## Opciones de advertencia
Véase «Opciones para solicitar o suprimir advertencias» en el [índice del manual](README.md).

~~~text
-fsyntax-only  -fmax-errors=n  -Wpedantic
-pedantic-errors  -fpermissive
-w  -Wextra  -Wall  -Wabi=n
-Waddress  -Wno-address-of-packed-member  -Waggregate-return
-Walloc-size  -Walloc-size-larger-than=byte-size  -Walloc-zero
-Walloca  -Walloca-larger-than=byte-size  -Wauto-profile
-Wno-aggressive-loop-optimizations
-Warith-conversion
-Warray-bounds  -Warray-bounds=n  -Warray-compare
-Warray-parameter  -Warray-parameter=n
-Wno-attributes  -Wattribute-alias=n  -Wno-attribute-alias
-Wno-attribute-warning
-Wbidi-chars=[none|unpaired|any|ucn]
-Wbool-compare  -Wbool-operation
-Wno-builtin-declaration-mismatch
-Wno-builtin-macro-redefined  -Wc90-c99-compat  -Wc99-c11-compat
-Wc11-c23-compat  -Wc23-c2y-compat
-Wc++-compat  -Wc++11-compat  -Wc++14-compat  -Wc++17-compat
-Wc++20-compat  -Wc++26-compat
-Wno-c++11-extensions  -Wno-c++14-extensions  -Wno-c++17-extensions
-Wno-c++20-extensions  -Wno-c++23-extensions
-Wcalloc-transposed-args  -Wcannot-profile
-Wcast-align  -Wcast-align=strict  -Wcast-function-type  -Wcast-qual
-Wchar-subscripts
-Wclobbered  -Wcomment
-Wcompare-distinct-pointer-types
-Wno-complain-wrong-lang
-Wconversion  -Wno-coverage-mismatch  -Wno-cpp
-Wdangling-else  -Wdangling-pointer  -Wdangling-pointer=n
-Wdate-time
-Wno-deprecated  -Wno-deprecated-declarations  -Wno-designated-init
-Wno-deprecated-openmp
-Wdisabled-optimization
-Wno-discarded-array-qualifiers  -Wno-discarded-qualifiers
-Wno-div-by-zero  -Wdouble-promotion
-Wduplicated-branches  -Wduplicated-cond
-Wempty-body  -Wno-endif-labels  -Wenum-compare  -Wenum-conversion
-Wenum-int-mismatch
-Werror  -Werror=*  -Wexpansion-to-defined  -Wfatal-errors
-Wflex-array-member-not-at-end
-Wfloat-conversion  -Wfloat-equal  -Wformat  -Wformat=2
-Wno-format-contains-nul  -Wno-format-diag  -Wno-format-extra-args
-Wformat-nonliteral  -Wformat-overflow=n
-Wformat-security  -Wformat-signedness  -Wformat-truncation=n
-Wformat-y2k  -Wframe-address
-Wframe-larger-than=byte-size  -Wno-free-nonheap-object
-Wheader-guard  -Wno-if-not-aligned  -Wno-ignored-attributes
-Wignored-qualifiers  -Wno-incompatible-pointer-types  -Whardened
-Wimplicit  -Wimplicit-fallthrough  -Wimplicit-fallthrough=n
-Wno-implicit-function-declaration  -Wno-implicit-int
-Winfinite-recursion
-Winit-self  -Winline  -Wno-int-conversion  -Wint-in-bool-context
-Wno-int-to-pointer-cast  -Wno-invalid-memory-model
-Winvalid-pch  -Winvalid-utf8  -Wno-unicode  -Wjump-misses-init
-Wkeyword-macro
-Wlarger-than=byte-size  -Wleading-whitespace=kind
-Wlogical-not-parentheses  -Wlogical-op
-Wlong-long  -Wno-lto-type-mismatch -Wmain  -Wmaybe-uninitialized
-Wmemset-elt-size  -Wmemset-transposed-args
-Wmisleading-indentation  -Wmissing-attributes  -Wmissing-braces
-Wmissing-field-initializers  -Wmissing-format-attribute
-Wmissing-include-dirs  -Wmissing-noreturn  -Wmusttail-local-addr
-Wmaybe-musttail-local-addr  -Wno-missing-profile
-Wno-multichar  -Wmultistatement-macros  -Wnonnull  -Wnonnull-compare
-Wnormalized=[none|id|nfc|nfkc]
-Wnull-dereference  -Wno-odr
-Wopenacc-parallelism
-Wopenmp  -Wopenmp-simd
-Wno-overflow  -Woverlength-strings  -Wno-override-init-side-effects
-Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded
-Wparentheses  -Wno-pedantic-ms-format
-Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast
-Wno-pragmas  -Wno-pragma-once-outside-header  -Wno-prio-ctor-dtor
-Wno-psabi
-Wredundant-decls  -Wrestrict
-Wno-return-local-addr  -Wreturn-type
-Wno-scalar-storage-order  -Wsequence-point
-Wshadow  -Wshadow=global  -Wshadow=local  -Wshadow=compatible-local
-Wno-shadow-ivar
-Wno-shift-count-negative  -Wno-shift-count-overflow
-Wshift-negative-value  -Wno-shift-overflow  -Wshift-overflow=n
-Wsign-compare  -Wsign-conversion
-Wno-sizeof-array-argument
-Wsizeof-array-div
-Wsizeof-pointer-div  -Wsizeof-pointer-memaccess
-Wstack-protector  -Wstack-usage=byte-size  -Wstrict-aliasing
-Wstrict-aliasing=n  -Wstrict-overflow  -Wstrict-overflow=n
-Wstring-compare
-Wno-stringop-overflow  -Wno-stringop-overread
-Wno-stringop-truncation  -Wstrict-flex-arrays
-Wsuggest-attribute=attribute-name
-Wswitch  -Wno-switch-bool  -Wswitch-default  -Wswitch-enum
-Wno-switch-outside-range  -Wno-switch-unreachable  -Wsync-nand
-Wsystem-headers  -Wtautological-compare  -Wtrailing-whitespace
-Wtrailing-whitespace=kind  -Wtrampolines  -Wtrigraphs
-Wtrivial-auto-var-init  -Wno-tsan  -Wtype-limits  -Wundef
-Wuninitialized  -Wunknown-pragmas
-Wunsuffixed-float-constants
-Wunterminated-string-initialization
-Wunused
-Wunused-but-set-parameter  -Wunused-but-set-parameter=n
-Wunused-but-set-variable  -Wunused-but-set-variable=n
-Wunused-const-variable  -Wunused-const-variable=n
-Wunused-function  -Wunused-label  -Wunused-local-typedefs
-Wunused-macros
-Wunused-parameter  -Wno-unused-result
-Wunused-value  -Wunused-variable
-Wuse-after-free  -Wuse-after-free=n  -Wuseless-cast
-Wno-varargs  -Wvariadic-macros
-Wvector-operation-performance
-Wvla  -Wvla-larger-than=byte-size  -Wno-vla-larger-than
-Wvolatile-register-var  -Wwrite-strings
-Wno-xor-used-as-pow
-Wzero-as-null-pointer-constant
-Wzero-length-bounds
--all-warnings  --extra-warnings  --no-warnings
--pedantic  --pedantic-errors
~~~


## Opciones del analizador estático

~~~text

-fanalyzer
-fanalyzer-assume-nothrow
-fanalyzer-call-summaries
-fanalyzer-checker=name
-fno-analyzer-feasibility
-fanalyzer-show-events-in-system-headers
-fno-analyzer-state-merge
-fno-analyzer-state-purge
-fno-analyzer-suppress-followups
-fanalyzer-transitivity
-fno-analyzer-undo-inlining
-fanalyzer-verbose-edges
-fanalyzer-verbose-state-changes
-fanalyzer-verbosity=level
-fdump-analyzer
-fdump-analyzer-callgraph
-fdump-analyzer-exploded-graph
-fdump-analyzer-exploded-nodes
-fdump-analyzer-exploded-nodes-2
-fdump-analyzer-exploded-nodes-3
-fdump-analyzer-exploded-paths
-fdump-analyzer-feasibility
-fdump-analyzer-infinite-loop
-fdump-analyzer-json
-fdump-analyzer-state-purge
-fdump-analyzer-stderr
-fdump-analyzer-supergraph
-fdump-analyzer-untracked
-Wno-analyzer-double-fclose
-Wno-analyzer-double-free
-Wno-analyzer-exposure-through-output-file
-Wno-analyzer-exposure-through-uninit-copy
-Wno-analyzer-fd-access-mode-mismatch
-Wno-analyzer-fd-double-close
-Wno-analyzer-fd-leak
-Wno-analyzer-fd-phase-mismatch
-Wno-analyzer-fd-type-mismatch
-Wno-analyzer-fd-use-after-close
-Wno-analyzer-fd-use-without-check
-Wno-analyzer-file-leak
-Wno-analyzer-free-of-non-heap
-Wno-analyzer-imprecise-fp-arithmetic
-Wno-analyzer-infinite-loop
-Wno-analyzer-infinite-recursion
-Wno-analyzer-jump-through-null
-Wno-analyzer-malloc-leak
-Wno-analyzer-mismatching-deallocation
-Wno-analyzer-null-argument
-Wno-analyzer-null-dereference
-Wno-analyzer-out-of-bounds
-Wno-analyzer-overlapping-buffers
-Wno-analyzer-possible-null-argument
-Wno-analyzer-possible-null-dereference
-Wno-analyzer-putenv-of-auto-var
-Wno-analyzer-shift-count-negative
-Wno-analyzer-shift-count-overflow
-Wno-analyzer-stale-setjmp-buffer
-Wno-analyzer-tainted-allocation-size
-Wno-analyzer-tainted-assertion
-Wno-analyzer-tainted-array-index
-Wno-analyzer-tainted-divisor
-Wno-analyzer-tainted-offset
-Wno-analyzer-tainted-size
-Wno-analyzer-throw-of-unexpected-type
-Wanalyzer-symbol-too-complex
-Wanalyzer-too-complex
-Wno-analyzer-undefined-behavior-ptrdiff
-Wno-analyzer-undefined-behavior-strtok
-Wno-analyzer-unsafe-call-within-signal-handler
-Wno-analyzer-use-after-free
-Wno-analyzer-use-of-pointer-in-stale-stack-frame
-Wno-analyzer-use-of-uninitialized-value
-Wno-analyzer-va-arg-type-mismatch
-Wno-analyzer-va-list-exhausted
-Wno-analyzer-va-list-leak
-Wno-analyzer-va-list-use-after-va-end
-Wno-analyzer-write-to-const
-Wno-analyzer-write-to-string-literal

~~~


## Opciones de advertencia exclusivas de C y Objective-C

~~~text
-Wbad-function-cast  -Wdeprecated-non-prototype  -Wfree-labels
-Wmissing-declarations  -Wmissing-parameter-name  -Wmissing-parameter-type
-Wdeclaration-missing-parameter-type  -Wmissing-prototypes
-Wmissing-variable-declarations
-Wmultiple-parameter-fwd-decl-lists
-Wnested-externs  -Wold-style-declaration
-Wold-style-definition  -Wstrict-prototypes  -Wtraditional
-Wtraditional-conversion  -Wdeclaration-after-statement  -Wpointer-sign
~~~


## Opciones de depuración
Véase «Opciones para depurar su programa» en el [índice del manual](README.md).

~~~text
-g  -glevel  -gdwarf  -gdwarf-version
-gbtf  -gctf  -gctflevel
-gno-prune-btf  -ggdb  -gno-record-gcc-switches
-gstrict-dwarf  -gas-loc-support  -gas-locview-support
-gcodeview  -gcolumn-info  -gdwarf32  -gdwarf64
-gno-statement-frontiers
-gno-variable-location-views  -gvariable-location-views=incompat5
-ginternal-reset-location-views  -ginline-points
-gvms  -gz[=type]
-gsplit-dwarf  -gdescribe-dies
-fdebug-prefix-map=old=new  -fdebug-types-section
-fno-eliminate-unused-debug-types
-femit-struct-debug-baseonly  -femit-struct-debug-reduced
-femit-struct-debug-detailed[=spec-list]
-fno-eliminate-unused-debug-symbols  -femit-class-debug-always
-fno-merge-debug-strings  -fno-dwarf2-cfi-asm
-fvar-tracking  -fvar-tracking-assignments  -fvar-tracking-uninit
--debug
~~~


## Opciones de optimización
Véase «Opciones que controlan la optimización» en el [índice del manual](README.md).

~~~text
-faggressive-loop-optimizations
-falign-functions[=n[:m:[n2[:m2]]]]
-falign-jumps[=n[:m:[n2[:m2]]]]
-falign-labels[=n[:m:[n2[:m2]]]]
-falign-loops[=n[:m:[n2[:m2]]]]
-fmin-function-alignment=[n]
-fno-allocation-dce  -fallow-store-data-races
-fassociative-math  -fauto-profile  -fauto-profile[=path]
-fauto-profile-inlining  -fauto-inc-dec  -fbranch-probabilities
-fcaller-saves
-fcombine-stack-adjustments  -fconserve-stack
-ffold-mem-offsets
-fcompare-elim  -fcprop-registers  -fcrossjumping
-fcse-follow-jumps  -fcse-skip-blocks  -fcx-fortran-rules
-fcx-limited-range -fcx-method
-fdata-sections  -fdce  -fdelayed-branch
-fdelete-null-pointer-checks  -fdep-fusion  -fdevirtualize
-fdevirtualize-speculatively  -fdevirtualize-at-ltrans  -fdse
-fearly-inlining  -fexcess-precision=style
-fexpensive-optimizations  -fext-dce
-ffast-math  -ffat-lto-objects  -ffinite-loops
-ffinite-math-only  -ffloat-store
-fforward-propagate  -ffp-contract=style  -ffp-int-builtin-inexact
-ffunction-sections  -ffuse-ops-with-volatile-access
-fgcse  -fgcse-after-reload  -fgcse-las  -fgcse-lm  -fgraphite-identity
-fgcse-sm  -fhoist-adjacent-loads  -fif-conversion
-fif-conversion2  -findirect-inlining
-finline-atomics  -finline-functions  -finline-functions-called-once
-finline-limit=n  -finline-small-functions
-finline-stringops[=fn]
-fipa-modref  -fipa-cp  -fipa-cp-clone
-fipa-bit-cp  -fipa-vrp  -fipa-pta  -fipa-profile  -fipa-pure-const
-fipa-reference  -fipa-reference-addressable  -fipa-reorder-for-locality
-fipa-sra  -fipa-stack-alignment
-fipa-icf  -fipa-icf-functions  -fipa-icf-variables
-fira-algorithm=algorithm
-flate-combine-instructions  -flifetime-dse  -flive-patching=level
-fira-region=region  -fira-hoist-pressure
-fira-loop-pressure  -fno-ira-share-save-slots
-fno-ira-share-spill-slots
-fisolate-erroneous-paths-dereference  -fisolate-erroneous-paths-attribute
-fivopts  -fkeep-inline-functions  -fkeep-static-functions
-fkeep-static-consts  -flimit-function-alignment  -flive-range-shrinkage
-floop-block  -floop-interchange  -floop-strip-mine
-floop-unroll-and-jam  -floop-nest-optimize
-floop-parallelize-all  -flra-remat  -flto  -flto-compression-level=n
-flto-toplevel-asm-heuristics
-flto-partition=alg  -flto-incremental=path
-flto-incremental-cache-size=n  -fmalloc-dce  -fmerge-all-constants
-fmerge-constants  -fmodulo-sched  -fmodulo-sched-allow-regmoves
-fmove-loop-invariants  -fmove-loop-stores  -fno-branch-count-reg
-fno-defer-pop  -fno-function-cse
-fno-guess-branch-probability  -fno-inline  -fno-math-errno  -fno-peephole
-fno-peephole2  -fno-printf-return-value  -fno-sched-interblock
-fno-sched-spec  -fno-signed-zeros
-fno-toplevel-reorder  -fno-trapping-math  -fno-zero-initialized-in-bss
-fomit-frame-pointer  -foptimize-crc  -foptimize-sibling-calls
-fpartial-inlining  -fpeel-loops  -fpredictive-commoning
-fprefetch-loop-arrays
-fprofile-correction
-fprofile-use  -fprofile-use=path  -fprofile-partial-training
-fprofile-values  -fprofile-reorder-functions
-freciprocal-math  -free  -frename-registers  -freorder-blocks
-freorder-blocks-algorithm=algorithm
-freorder-blocks-and-partition  -freorder-functions
-frerun-cse-after-loop  -freschedule-modulo-scheduled-loops
-frounding-math  -fsave-optimization-record
-fsched2-use-superblocks  -fsched-pressure
-fsched-spec-load  -fsched-spec-load-dangerous
-fsched-stalled-insns-dep[=n]  -fsched-stalled-insns[=n]
-fsched-group-heuristic  -fsched-critical-path-heuristic
-fsched-spec-insn-heuristic  -fsched-rank-heuristic
-fsched-last-insn-heuristic  -fsched-dep-count-heuristic
-fschedule-fusion
-fschedule-insns  -fschedule-insns2  -fsection-anchors
-fselective-scheduling  -fselective-scheduling2
-fsel-sched-pipelining  -fsel-sched-pipelining-outer-loops
-fsemantic-interposition  -fshrink-wrap  -fshrink-wrap-separate
-fsignaling-nans
-fsingle-precision-constant  -fsplit-ivs-in-unroller  -fsplit-loops
-fspeculatively-call-stored-functions  -fsplit-paths
-fsplit-wide-types  -fsplit-wide-types-early  -fssa-backprop  -fssa-phiopt
-fstdarg-opt  -fstore-merging  -fstrict-aliasing -fipa-strict-aliasing
-fthread-jumps  -ftracer  -ftree-bit-ccp
-ftree-builtin-call-dce  -ftree-ccp  -ftree-ch  -ftree-coalesce-vars
-ftree-copy-prop  -ftree-cselim  -ftree-dce  -ftree-dominator-opts
-ftree-dse  -ftree-forwprop  -ftree-fre  -fcode-hoisting
-ftree-loop-if-convert  -ftree-loop-im
-ftree-phiprop  -ftree-loop-distribution  -ftree-loop-distribute-patterns
-ftree-loop-ivcanon  -ftree-loop-linear  -ftree-loop-optimize
-ftree-loop-vectorize
-ftree-parallelize-loops[=n]  -ftree-pre  -ftree-partial-pre  -ftree-pta
-ftree-reassoc  -ftree-scev-cprop  -ftree-sink  -ftree-slsr  -ftree-sra
-ftree-switch-conversion  -ftree-tail-merge
-ftree-ter  -ftree-vectorize  -ftree-vrp  -ftrivial-auto-var-init
-funconstrained-commons  -funit-at-a-time  -funroll-all-loops
-funroll-loops  -funsafe-math-optimizations  -funswitch-loops
-fipa-ra  -fvariable-expansion-in-unroller  -fvect-cost-model  -fvpt
-fweb  -fwhole-program  -fwpa  -fuse-linker-plugin  -fzero-call-used-regs
-O  -O0  -O1  -O2  -O3  -Os  -Ofast  -Og  -Oz  --optimize
~~~


## Opciones de instrumentación de programas
Véase «Opciones de instrumentación de programas» en el [índice del manual](README.md).

~~~text
-p  -pg  -fprofile-arcs  -coverage  -ftest-coverage
-fcondition-coverage
-fpath-coverage
-fprofile  -fprofile-abs-path
-fprofile-dir=path  -fprofile-generate  -fprofile-generate=path
-fprofile-info-section  -fprofile-info-section=name
-fprofile-note=path  -fprofile-prefix-path=path
-fprofile-update=method  -fprofile-filter-files=regex
-fprofile-exclude-files=regex
-fprofile-reproducible=[multithreaded|parallel-runs|serial]
-fsanitize=style  -fsanitize-recover  -fsanitize-recover=style
-fsanitize-trap   -fsanitize-trap=style
-fasan-shadow-offset=number  -fsanitize-sections=s1,s2,...
-fsanitize-undefined-trap-on-error  -fcf-protection
-fcf-protection=[full|branch|return|none|check]
-fharden-compares  -fharden-conditional-branches  -fhardened
-fharden-control-flow-redundancy  -fhardcfr-skip-leaf
-fhardcfr-check-exceptions  -fhardcfr-check-returning-calls
-fhardcfr-check-noreturn-calls=[always|no-xthrow|nothrow|never]
-fstack-protector  -fstack-protector-all  -fstack-protector-strong
-fstack-protector-explicit  -fstack-check
-fstack-limit-register=reg  -fstack-limit-symbol=sym
-fno-stack-limit  -fsplit-stack
-fstrub=disable  -fstrub=strict  -fstrub=relaxed
-fstrub=all  -fstrub=at-calls  -fstrub=internal
-fvtable-verify=[std|preinit|none]
-fvtv-counts  -fvtv-debug
-finstrument-functions  -finstrument-functions-once
-finstrument-functions-exclude-function-list=sym,sym,...
-finstrument-functions-exclude-file-list=file,file,...
-fprofile-prefix-map=old=new
-fpatchable-function-entry=N[,M]
--coverage --profile
~~~


## Opciones del preprocesador
Véase «Opciones que controlan el preprocesador» en el [índice del manual](README.md).

~~~text
-C  -CC  -Dmacro[=defn]
-dD  -dI  -dM  -dN  -dU
-fdebug-cpp  -fdirectives-only  -fdollars-in-identifiers
-fexec-charset=charset  -fextended-identifiers
-finput-charset=charset
-fmacro-prefix-map=old=new  -fmax-include-depth=depth
-fno-canonical-system-headers  -fpch-deps  -fpch-preprocess
-fpreprocessed  -ftabstop=width  -ftrack-macro-expansion
-fwide-exec-charset=charset  -fworking-directory
-H  -imacros file  -include file
-M  -MD  -MF  -MG  -MM  -MMD  -MP  -MQ  -MT -Mno-modules
-no-integrated-cpp  -P  -pthread  -remap
-traditional  -traditional-cpp  -trigraphs
-Umacro  -undef
-Wp,option  -Xpreprocessor option
--comments  --comments-in-macros
--define-macro=macro[=defn]
--dependencies  --dump=letters
--imacros=file  --include=file
--no-integrated-cpp  --no-line-commands
--print-missing-file-dependencies
--traditional  --traditional-cpp  --trigraphs  --trace-includes
--undefine-macro=macro
--user-dependencies  --write-dependencies  --write-user-dependencies

~~~


## Opciones del ensamblador
Véase «Transmisión de opciones al ensamblador» en el [índice del manual](README.md).

~~~text
-Wa,option  -Xassembler option
--for-assembler=option
~~~


## Opciones del enlazador
Véase «Opciones para el enlace» en el [índice del manual](README.md).

~~~text
object-file-name  -flink-libatomic  -fuse-ld=linker  -llibrary
-nostartfiles  -nodefaultlibs  -nolibc  -nostdlib  -nostdlib++
-e entry
-pie  -pthread  -r  -rdynamic
-s  -static  -static-pie  -static-libgcc  -static-libstdc++
-static-libasan  -static-libhwasan  -static-liblsan
-static-libtsan  -static-libubsan
-shared  -shared-libgcc  -symbolic
-T script  -Wl,option  -Xlinker option
-u symbol
-Tbss=addr  -Tdata=addr  -Ttext=addr
-N  -n  -t  -Z  -z keyword
--entry=entry  --for-linker=option
--force-link=symbol  --no-standard-library
--pie  --static  --static-pie  --symbolic
~~~


## Opciones de directorios
Véase «Opciones de búsqueda de directorios» en el [índice del manual](README.md).

~~~text
-Bprefix  -Idir  -I-
-idirafter dir
-imacros file  -imultilib dir  -imultiarch dir
-iplugindir=dir  -iprefix file
-iquote dir  -isysroot dir  -isystem dir
-iwithprefix dir  -iwithprefixbefore dir
-Ldir  -no-canonical-prefixes  --no-sysroot-suffix
-nostdinc  -nostdinc++
--embed-dir=dir  --embed-directory=dir
--include-barrier  --include-directory=dir
--include-directory-after=dir  --include-prefix=prefix
--include-with-prefix=prefix  --include-with-prefix-after=prefix
--include-with-prefix-before=prefix
--no-canonical-prefixes  --no-standard-includes
--prefix=prefix  --sysroot=dir
~~~


## Opciones de generación de código
Véase «Opciones para las convenciones de generación de código» en el [índice del manual](README.md).

~~~text
-fcall-saved-reg  -fcall-used-reg
-ffixed-reg  -fexceptions
-fnon-call-exceptions  -fdelete-dead-exceptions  -funwind-tables
-fasynchronous-unwind-tables
-fno-gnu-unique
-finhibit-size-directive  -fcommon  -fno-ident
-fpcc-struct-return  -fpic  -fPIC  -fpie  -fPIE  -fno-plt
-fno-jump-tables  -fno-bit-tests
-frecord-gcc-switches
-freg-struct-return  -fshort-enums  -fshort-wchar
-fverbose-asm  -fpack-struct[=n]
-fleading-underscore  -ftls-model=model
-fstack-reuse=reuse_level
-ftrampolines  -ftrampoline-impl=[stack|heap]
-ftrapv  -fwrapv  -fwrapv-pointer
-fvisibility=[default|internal|hidden|protected]
-fstrict-volatile-bitfields  -fsync-libcalls
-fzero-init-padding-bits=value
-Qy  -Qn
~~~


## Opciones para desarrolladores
Véase «Opciones para desarrolladores de GCC» en el [índice del manual](README.md).

~~~text
-dletters  -dumpspecs  -dumpmachine  -dumpversion
-dumpfullversion  -fcallgraph-info[=su,da]
-fchecking  -fchecking=n
-fdbg-cnt-list  -fdbg-cnt=counter-value-list
-fdisable-ipa-pass_name
-fdisable-rtl-pass_name
-fdisable-rtl-pass-name=range-list
-fdisable-tree-pass_name
-fdisable-tree-pass-name=range-list
-fdump-debug  -fdump-earlydebug
-fdump-noaddr  -fdump-unnumbered  -fdump-unnumbered-links
-fdump-final-insns[=file]
-fdump-internal-locations
-fdump-ipa-all  -fdump-ipa-cgraph  -fdump-ipa-inline
-fdump-lang-all
-fdump-lang-switch
-fdump-lang-switch-options
-fdump-lang-switch-options=filename
-fdump-passes
-fdump-rtl-pass  -fdump-rtl-pass=filename
-fdump-statistics
-fdump-tree-all
-fdump-tree-switch
-fdump-tree-switch-options
-fdump-tree-switch-options=filename
-fcompare-debug[=opts]  -fcompare-debug-second
-fenable-kind-pass
-fenable-kind-pass=range-list
-fira-verbose=n
-flto-report  -flto-report-wpa  -fmem-report-wpa
-fmem-report  -fpre-ipa-mem-report  -fpost-ipa-mem-report
-fopt-info  -fopt-info-options[=file]
-fmultiflags  -fprofile-report
-frandom-seed=string  -fsched-verbose=n
-fsel-sched-verbose  -fsel-sched-dump-cfg  -fsel-sched-pipelining-verbose
-fstats  -fstack-usage  -ftime-report  -ftime-report-details
-fvar-tracking-assignments-toggle  -gtoggle
-print-autofdo-gcov-version
-print-file-name=library  -print-libgcc-file-name
-print-multi-directory  -print-multi-lib  -print-multi-os-directory
-print-multiarch
-print-prog-name=program  -print-search-dirs  -Q
-print-sysroot  -print-sysroot-headers-suffix
-save-temps  -save-temps=cwd  -save-temps=obj
-specs=file  -time[=file]
--dump=letters
--print-autofdo-gcov-version
--print-file-name=library  --print-libgcc-file-file-name
--print-multi-directory  --print-multi-lib  --print-multi-os-directory
--print-multiarch  --print-prog-name=program
--print-search-dirs  --print-sysroot  --print-sysroot-headers-suffix
--save-temps  --specs=file
--param name=value

~~~


## Opciones específicas del objetivo
Véase «Opciones específicas del objetivo» en el [índice del manual](README.md).

### Opciones de AArch64

~~~text
-mabi=name  -mbig-endian  -mlittle-endian
-menable-sysreg-checking
-mgeneral-regs-only
-mcmodel=tiny  -mcmodel=small  -mcmodel=large
-mstrict-align  -momit-leaf-frame-pointer
-mtls-dialect=desc  -mtls-dialect=traditional
-mtls-size=size  -mtp=name
-mfix-cortex-a53-835769  -mfix-cortex-a53-843419
-mlow-precision-recip-sqrt  -mlow-precision-sqrt  -mlow-precision-div
-mmax-vectorization  -mautovec-preference=name
-mpc-relative-literal-loads
-msign-return-address=scope
-mbranch-protection=features
-mharden-sls=opts
-march=name  -mcpu=name  -mtune=name
-moverride=string
-mstack-protector-guard=guard  -mstack-protector-guard-reg=sysreg
-mstack-protector-guard-offset=offset  -mtrack-speculation
-moutline-atomics  -mearly-ra  -mearly-ldp-fusion  -mlate-ldp-fusion -mnarrow-gp-writes
-msve-vector-bits=bits
~~~


### Opciones de Adapteva Epiphany

~~~text
-mhalf-reg-file  -mprefer-short-insn-regs
-mbranch-cost=num  -mcmove  -mnops=num  -msoft-cmpsf
-msplit-lohi  -mpost-inc  -mpost-modify  -mstack-offset=num
-mround-nearest  -mlong-calls  -mshort-calls  -msmall16
-mfp-mode=mode  -mmay-round-for-trunc  -mfp-iarith
-mvect-double  -max-vect-align=num
-msplit-vecmove-early  -m1reg-reg
~~~


### Opciones de AMD GCN

~~~text
-march=gpu  -mtune=gpu
-mgang-private-size=bytes
-msram-ecc=[on|off|any]
-mxnack=[on|off|any]
-Wopenacc-dims
~~~


### Opciones de ARC

~~~text
-mbarrel-shifter  -mjli-always
-mcpu=cpu  -mA6  -mARC600  -mA7  -mARC700
-mdpfp  -mdpfp-compact  -mdpfp-fast  -mno-dpfp-lrsr
-mea  -mmul32x16  -mmul64  -matomic
-mnorm  -mspfp  -mspfp-compact  -mspfp-fast  -msimd  -msoft-float  -mswap
-mlock  -mswape
-mxy  -misize  -marclinux  -marclinux_prof
-mlong-calls  -mmedium-calls  -msdata  -mirq-ctrl-saved
-mrgf-banked-regs  -mlpc-width=width  -G num
-mvolatile-cache  -mtp-regno=regno
-mbitops  -mcmem  -munaligned-access
-mauto-modify-reg  -mno-brcc
-mcase-vector-pcrel  -mno-cond-exec  -mearly-cbranchsi
-mindexed-loads  -mlra-priority-none
-mlra-priority-compact -mlra-priority-noncompact  -mmillicode
-msize-level=level
-mtune=cpu  -mmultcost=num  -mcode-density-frame
-mmpy-option=multo
-mdiv-rem  -mcode-density  -mll64  -mfpu=fpu  -mrf16  -mbranch-index
~~~


### Opciones de ARM

~~~text
-mapcs-frame  -mapcs
-mabi=name
-mgeneral-regs-only  -mno-sched-prolog
-mlittle-endian  -mbig-endian
-mbe8  -mbe32
-mfloat-abi=name
-mfp16-format=name
-mthumb-interwork
-mcpu=name  -march=name  -mfpu=name  -mtune=name
-mstructure-size-boundary=n
-mabort-on-noreturn  -mlong-calls
-msingle-pic-base  -mpic-register=reg
-mpic-data-is-text-relative
-mnop-fun-dllimport
-mpoke-function-name
-mthumb  -marm
-mtpcs-frame  -mtpcs-leaf-frame
-mcaller-super-interworking  -mcallee-super-interworking
-mtp=name  -mtls-dialect=dialect
-mword-relocations
-mfix-cortex-m3-ldrd
-mfix-cortex-a57-aes-1742098
-mfix-cortex-a72-aes-1655431
-munaligned-access
-mslow-flash-data
-masm-syntax-unified
-mrestrict-it
-mpure-code
-mcmse
-mfix-cmse-cve-2021-35465
-mstack-protector-guard=guard
-mstack-protector-guard-offset=offset
-mfdpic
-mbranch-protection=features
-mvectorize-with-neon-quad  -mvectorize-with-neon-double
~~~


### Opciones de AVR

~~~text
-mmcu=mcu  -mabsdata  -maccumulate-args  -mcvt
-mbranch-cost=cost  -mfuse-add=level  -mfuse-move=level
-mfuse-move2  -mcall-prologues  -mgas-isr-prologues  -mint8  -mflmap
-mdouble=bits  -mlong-double=bits  -mno-call-main
-mn_flash=size  -mfract-convert-truncate  -mno-interrupts
-mmain-is-OS_task  -mrelax  -mpmem-wrap-around
-mrmw  -mstrict-X  -mtiny-stack
-mrodata-in-ram  -msplit-bit-shift  -msplit-ldst  -mshort-calls
-mskip-bug  -muse-nonzero-bits  -nodevicelib  -nodevicespecs
-Waddr-space-convert  -Wmisspelled-isr
~~~


### Opciones de Blackfin

~~~text
-mcpu=cpu[-sirevision]
-msim  -momit-leaf-frame-pointer
-mspecld-anomaly  -mcsync-anomaly
-mlow-64k  -mstack-check-l1  -mid-shared-library
-mleaf-id-shared-library
-mshared-library-id=n
-msep-data  -mlong-calls
-mfast-fp  -minline-plt  -mmulticore  -mcorea  -mcoreb  -msdram
-micplb
~~~


### Opciones de C6X

~~~text
-mbig-endian  -mlittle-endian  -march=cpu
-msim  -msdata=sdata-type  -mdsbt  -mlong-calls
~~~


### Opciones de CRIS

~~~text
-mcpu=cpu  -march=cpu
-mtune=cpu  -mmax-stackframe=n
-metrax4  -metrax100  -mpdebug  -mcc-init  -mno-side-effects
-mstack-align  -mdata-align  -mconst-align
-m32-bit  -m16-bit  -m8-bit  -mno-prologue-epilogue
-mbest-lib-options  -moverride-best-lib-options
-mtrap-using-break8  -mtrap-unaligned-atomic
-munaligned-atomic-may-use-library
-sim  -sim2
-mmul-bug-workaround
~~~


### Opciones de C-SKY

~~~text
-march=arch  -mcpu=cpu
-mbig-endian  -mlittle-endian
-mfpu=fpu  -mdouble-float  -mfdivdu
-mfloat-abi=name
-melrw  -mistack  -mmp  -mcp  -mcache  -msecurity  -mtrust
-mdsp  -medsp  -mvdsp
-mdiv  -msmart  -mhigh-registers  -manchor
-mpushpop  -mmultiple-stld  -mconstpool  -mstack-size  -mccrt
-mbranch-cost=n  -msched-prolog  -msim
~~~


### Opciones de Cygwin y MinGW

~~~text
-mconsole  -mcrtdll=library  -mdll
-mnop-fun-dllimport  -mthreads
-municode  -mwin32  -mwindows  -fno-set-stack-executable
-fwritable-relocated-rdata  -mpe-aligned-commons
-muse-libstdc-wrappers
~~~


### Opciones de Darwin

~~~text
-all_load  -allowable_client  -arch name
-arch_errors_fatal  -asm_macosx_version_min=version
-bind_at_load  -bundle  -bundle_loader
-client_name  -compatibility_version  -current_version
-dead_strip
-dependency-file  -dylib_file  -dylinker  -dylinker_install_name
-dynamic  -dynamiclib  -exported_symbols_list
-fapple-kext  -fconstant-cfstrings  -ffix-and-continue
-filelist  -findirect-data  -flat_namespace  -force_cpusubtype_ALL
-force_flat_namespace  -framework name  -gfull  -gused
-headerpad_max_install_names  -iframework
-image_base  -init symbol-name  -install_name  -keep_private_externs
-matt-stubs  -mconstant-cfstrings  -mdynamic-no-pic
-mfix-and-continue  -mkernel  -mmacosx-version-min=version
-mone-byte-bool  -msymbol-stubs  -mtarget-linker[=]version
-nodefaultexport  -nodefaultrpaths
-pagezero_size  -preload  -read_only_relocs
-sectalign  -sectcreate
-seg_addr_table
-seg1addr  -segaddr
-segprot  -segs_read_only_addr  -segs_read_write_addr
-sub_library  -sub_umbrella
-twolevel_namespace  -twolevel_namespace_hints
-umbrella  -undefined  -unexported_symbols_list
-weak_framework name  -weak_reference_mismatches
-whatsloaded  -whyload
-F  -ObjC  -ObjC++  -Wnonportable-cfstrings
~~~


### Opciones de DEC Alpha

~~~text
-mno-fp-regs  -msoft-float
-mieee  -mieee-with-inexact  -mieee-conformant
-mfp-trap-mode=mode  -mfp-rounding-mode=mode
-mtrap-precision=mode  -mbuild-constants
-mcpu=cpu-type  -mtune=cpu-type
-mbwx  -mmax  -mfix  -mcix
-msafe-bwa  -msafe-partial
-mfloat-vax  -mfloat-ieee
-mexplicit-relocs  -msmall-data  -mlarge-data
-msmall-text  -mlarge-text
-mmemory-latency=time
-mtls-kernel  -mtls-size=bitsize
-mlong-double-128  -mlong-double-64
~~~


### Opciones de eBPF

~~~text
-mbig-endian  -mlittle-endian
-mframe-limit=bytes  -mxbpf  -mco-re  -mjmpext  -mjmp32
-malu32  -mv3-atomics  -mbswap  -msdiv  -msmov  -mcpu=version
-masm=dialect  -minline-memops-threshold=bytes
-Wco-re
~~~


### Opciones de FR30

~~~text
-msmall-model  -mno-lsim
~~~


### Opciones de FRV

~~~text
-mgpr-32  -mgpr-64  -mfpr-32  -mfpr-64
-mhard-float  -msoft-float
-malloc-cc  -mfixed-cc  -mdword  -mdouble  -mmedia  -mmuladd
-mfdpic  -minline-plt  -mgprel-ro  -multilib-library-pic
-mlinked-fp  -mlong-calls  -malign-labels
-mlibrary-pic  -macc-4  -macc-8
-mpack  -mno-eflags  -mno-cond-move
-mno-optimize-membar  -mno-scc  -mno-cond-exec
-mno-vliw-branch  -mno-multi-cond-exec  -mno-nested-cond-exec
-mtomcat-stats
-mTLS  -mtls
-mcpu=cpu
~~~


### Opciones de FT32

~~~text
-msim  -mnodiv  -mft32b  -mcompress  -mnopm
~~~


### Opciones de GNU/Linux

~~~text
-mglibc  -muclibc  -mmusl  -mbionic  -mandroid
-tno-android-cc  -tno-android-ld
~~~


### Opciones de H8/300

~~~text
-mrelax  -mh  -ms  -mn  -msx  -ms2600
-mquickcall  -mslowbyte  -mexr  -mint32  -malign-300
~~~


### Opciones de HPPA

~~~text
-march=architecture-type
-mno-atomic-libcalls
-mcaller-copies  -mdisable-fpregs  -mdisable-indexing
-mordered  -mfast-indirect-calls  -mgas  -mgnu-ld   -mhp-ld
-mfixed-range=register-range
-mcoherent-ldcw  -mlinker-opt  -mlong-calls
-mlong-load-store
-mno-space-regs  -msoft-float  -mpa-risc-1-0
-mpa-risc-1-1  -mpa-risc-2-0  -mportable-runtime
-mschedule=cpu-type  -msoft-mult  -msio  -mwsio
-munix=unix-std  -nolibdld  -static  -threads
~~~


### Opciones de IA-64

~~~text
-mbig-endian  -mlittle-endian  -mgnu-as  -mgnu-ld  -mno-pic
-mvolatile-asm-stop  -mregister-names  -msdata
-mconstant-gp  -mauto-pic
-minline-float-divide-min-latency
-minline-float-divide-max-throughput
-mno-inline-float-divide
-minline-int-divide-min-latency
-minline-int-divide-max-throughput
-mno-inline-int-divide
-minline-sqrt-min-latency  -minline-sqrt-max-throughput
-mno-inline-sqrt
-mdwarf2-asm  -mearly-stop-bits
-mfixed-range=register-range  -mtls-size=tls-size
-mtune=cpu-type  -milp32  -mlp64
-msched-br-data-spec  -msched-ar-data-spec  -msched-control-spec
-msched-br-in-data-spec  -msched-ar-in-data-spec  -msched-in-control-spec
-msched-spec-ldc  -msched-spec-control-ldc
-msched-stop-bits-after-every-cycle  -msched-count-spec-in-critical-path
-msel-sched-dont-check-control-spec  -msched-fp-mem-deps-zero-cost
-msched-max-memory-insns-hard-limit  -msched-max-memory-insns=max-insns
~~~


### Opciones de LM32

~~~text
-mbarrel-shift-enabled  -mdivide-enabled  -mmultiply-enabled
-msign-extend-enabled  -muser-enabled
~~~


### Opciones de LoongArch

~~~text
-march=arch-type  -mtune=tune-type  -mabi=base-abi-type
-mfpu=fpu-type  -msimd=simd-type
-msoft-float  -msingle-float  -mdouble-float  -mlsx  -mlasx
-mbranch-cost=n  -maddr-reg-reg-cost=n  -mcheck-zero-division
-mbreak-code=code
-mcond-move-int  -mcond-move-float
-memcpy  -mstrict-align  -G num
-mmax-inline-memcpy-size=n
-mexplicit-relocs=style  -mexplicit-relocs  -mno-explicit-relocs
-mdirect-extern-access
-mcmodel=code-model  -mrelax  -mpass-mrelax-to-as
-mrecip  -mrecip=opt  -mfrecipe  -mdiv32
-mlam-bh  -mlamcas  -mld-seq-sa
-mscq  -mtls-dialect=opt
-mannotate-tablejump
~~~


### Opciones de LynxOS

~~~text
-mshared  -mthreads  -mlegacy-threads
~~~


### Opciones de M32C

~~~text
-mcpu=cpu  -msim  -memregs=number
~~~


### Opciones de M32R/D

~~~text
-m32r2  -m32rx  -m32r
-mdebug
-malign-loops
-missue-rate=number
-mbranch-cost=number
-mmodel=code-size-model-type
-msdata=sdata-type
-mno-flush-func  -mflush-func=name
-mno-flush-trap  -mflush-trap=number
-G num
~~~


### Opciones de M680x0

~~~text
-march=arch  -mcpu=cpu  -mtune=tune
-m68000  -m68020  -m68020-40  -m68020-60  -m68030  -m68040
-m68060  -m68302  -m68332  -m68851
-mcpu32  -mfidoa  -m5200  -m5206e  -m528x  -m5307  -m5407
-mcfv4e  -mbitfield  -mc68000  -mc68020
-mrtd  -mdiv  -mshort
-mhard-float  -m68881  -msoft-float  -mpcrel
-malign-int  -mstrict-align  -msep-data
-mshared-library-id=n  -mid-shared-library
-mxgot  -mxtls  -mlong-jump-table-offsets
~~~


### Opciones de MCore

~~~text
-mhardlit  -mdiv  -mrelax-immediates
-mwide-bitfields
-m4byte-functions  -mcallgraph-data
-mslow-bytes  -mno-lsim
-mlittle-endian  -mbig-endian  -m210  -m340  -mstack-increment
~~~


### Opciones de MicroBlaze

~~~text
-msoft-float  -mhard-float  -msmall-divides  -mcpu=cpu
-mmemcpy  -mxl-soft-mul  -mxl-soft-div  -mxl-barrel-shift
-mxl-pattern-compare  -mxl-gp-opt
-mxl-multiply-high  -mxl-float-convert  -mxl-float-sqrt
-mbig-endian  -mlittle-endian  -mxl-reorder  -mxl-mode-app-model
-mxl-prefetch  -mpic-data-is-text-relative
~~~


### Opciones de MIPS

~~~text
-EL  -EB  -mel  -meb  -march=arch  -mtune=arch
-mips1  -mips2  -mips3  -mips4  -mips32  -mips32r2  -mips32r3  -mips32r5
-mips32r6  -mips64  -mips64r2  -mips64r3  -mips64r5  -mips64r6
-mips16  -mmips16e2  -mflip-mips16
-minterlink-compressed  -minterlink-mips16
-mabi=abi  -mabicalls  -mshared  -mplt  -mxgot
-mgp32  -mgp64  -mfp32  -mfpxx  -mfp64  -mhard-float  -msoft-float
-mno-float  -msingle-float  -mdouble-float  -modd-spreg
-mabs=mode  -mnan=encoding
-mdsp  -mdspr2  -mmcu  -meva  -mvirt  -mxpa  -mcrc  -mginv
-mmicromips  -mmsa
-mloongson-mmi  -mloongson-ext  -mloongson-ext2
-mfpu=fpu-type
-msmartmips  -mpaired-single  -mdmx  -mips3d  -mmt  -mllsc
-mlong64  -mlong32  -msym32
-Gnum  -mno-local-sdata  -mno-extern-sdata  -mno-gopt
-membedded-data  -muninit-const-in-rodata
-mcode-readable=setting  -mno-data-in-code  -mcode-xonly
-msplit-addresses  -mexplicit-relocs  -mexplicit-relocs=release
-mno-check-zero-division  -mdivide-traps  -mdivide-breaks
-mno-load-store-pairs
-mstrict-align  -mno-unaligned-access
-mmemcpy  -mlong-calls
-mmad  -mimadd  -mno-fused-madd  -nocpp
-mfix-24k  -mfix-r4000  -mfix-r4400  -mfix-r5900
-mfix-r10000  -mfix-rm7000  -mfix-vr4120  -mfix-vr4130  -mfix-sb1
-mfix4300  -mr10k-cache-barrier=setting
-mflush-func=func  -mno-flush-func
-mbranch-cost=num  -mbranch-likely
-mcompact-branches=policy
-mno-fp-exceptions  -mvr4130-align  -msynci  -mno-lxc1-sxc1  -mno-madd4
-mno-relax-pic-calls  -mmcount-ra-address
-mframe-header-opt
~~~


### Opciones de MMIX

~~~text
-mlibfuncs  -mepsilon  -mabi=gnu  -mabi=mmixware
-mzero-extend  -mknuthdiv  -mtoplevel-symbols
-melf  -mbranch-predict  -mbase-addresses
-msingle-exit  -mset-data-start=address
-mset-program-start=address  -mno-set-program-start
~~~


### Opciones de MN10300

~~~text
-mmult-bug  -mno-mult-bug
-mam33  -mam33-2  -mam34
-mtune=cpu-type
-mno-return-pointer-on-d0
-mno-crt0  -mrelax  -mno-liw  -mno-setlb
~~~


### Opciones de Moxie

~~~text
-meb  -mel  -mmul.x  -mno-crt0
~~~


### Opciones de MSP430

~~~text
-msim  -masm-hex  -mmcu=name  -mlarge  -msmall  -mrelax
-mwarn-mcu  -mwarn-devices-csv
-mcode-region=where  -mdata-region=where
-muse-lower-region-prefix
-msilicon-errata=name[,name...]
-msilicon-errata-warn=name[,name...]
-mhwmult=type  -minrt  -mtiny-printf  -mmax-inline-shift=n
~~~


### Opciones de NDS32

~~~text
-mbig-endian  -mlittle-endian  -EB  -EL
-mabi=name  -mfloat-abi=name
-mreduced-regs  -mfull-regs
-malways-align  -malign-functions
-mfp-as-gp  -mcmov  -mhw-abs
-mext-perf  -mext-perf2  -mext-string  -mext-dsp
-mext-fpu-fma  -mext-fpu-sp  -mext-fpu-dp
-mv3push  -m16-bit  -mvh
-misr-vector-size=num  -misr-secure=num
-mcache-block-size=num
-march=arch  -mcpu=cpu
-mconfig-fpu=num  -mconfig-mul=type
-mconfig-register-ports=kind
-mcmodel=code-model
-mctor-dtor  -mrelax  -mrelax-hint
-msched-prolog-epilog  -mno-ret-in-naked-func
-malways-save-lp   -munaligned-access  -minline-asm-r15
~~~


### Opciones de Nvidia PTX

~~~text
-m64  -march=arch  -misa=arch  -march-map=arch
-mptx=version  -mmainkernel  -moptimize
-msoft-stack  -msoft-stack-reserve-local=size
-muniform-simt  -mgomp
~~~


### Opciones de OpenRISC

~~~text
-mboard=name  -mhard-mul  -mhard-div
-msoft-mul  -msoft-div
-msoft-float  -mhard-float  -mdouble-float -munordered-float
-mcmov  -mror  -mrori  -msext  -msfimm  -mshftimm
-mcmodel=code-model
~~~


### Opciones de PDP-11

~~~text
-mfpu  -msoft-float  -mac0  -m40  -m45  -m10
-mint32  -mint16
-msplit  -munix-asm  -mdec-asm  -mgnu-asm  -mlra
~~~


### Opciones de Picolibc

~~~text
--oslib=library --crt0=[none|minimal|hosted|semihost]
--printf=[d|f|l|i|m]  --scanf=[d|f|l|i|m]
~~~


### Opciones de PowerPC
Véanse las opciones de RS/6000 y PowerPC.

### Opciones de PRU

~~~text
-mmcu=mcu  -minrt  -mno-relax  -mloop
-mmul  -mfillzero  -mabi=variant
~~~


### Opciones de RISC-V

~~~text
-mbranch-cost=N-instruction
-mabi=ABI-string
-mfdiv  -mdiv
-mno-fence-tso
-misa-spec=ISA-spec-string
-march=[ISA|Profile|Profile_ISA|processor-string]
-mcpu=processor-string  -mtune=processor-string
-mpreferred-stack-boundary=num
-msmall-data-limit=N-bytes
-msave-restore  -mno-shorten-memrefs
-mstrict-align  -mscalar-strict-align  -mno-vector-strict-align
-mcmodel=medlow  -mcmodel=medany  -mcmodel=large
-mexplicit-relocs  -mrelax  -mriscv-attribute
-malign-data=type
-mbig-endian  -mlittle-endian
-mstack-protector-guard=guard  -mstack-protector-guard-reg=reg
-mstack-protector-guard-offset=offset
-mcsr-check  -momit-leaf-frame-pointer  -mmovcc
-mno-inline-atomics  -mno-inline-strlen
-mno-inline-strcmp  -mno-inline-strncmp
-mstringop-strategy=strategy
-mtls-dialect=desc  -mtls-dialect=trad
-mrvv-vector-bits=value  -mrvv-max-lmul=value
-madjust-lmul-cost  -mmax-vectorization  -mno-autovec-segment
~~~


### Opciones de RL78

~~~text
-msim  -mallregs  -mrelax  -mes0
-mmul=none  -mmul=g13  -mmul=g14  -mmul=rl78
-mcpu=g10  -mcpu=g13  -mcpu=g14  -mcpu=rl78
-mg10  -mg13  -mg14  -mrl78
-msave-mduc-in-interrupts
~~~


### Opciones de RS/6000 y PowerPC

~~~text
-mcpu=cpu-type
-mtune=cpu-type
-mcmodel=code-model  -mprofile-kernel
-mpowerpc64
-maltivec
-mpowerpc-gpopt  -mpowerpc-gfxopt  -mmfcrf  -mpopcntb  -mpopcntd
-mfprnd  -mcmpb  -mhard-dfp
-mfull-toc  -mminimal-toc  -mno-fp-in-toc  -mno-sum-in-toc
-maix64  -maix32  -m64  -m32  -mxl-compat  -mpe
-malign-power  -malign-natural
-msoft-float  -mhard-float  -mmultiple  -mupdate
-mavoid-indexed-addresses
-mfused-madd  -mbit-align  -mbit-word
-mstrict-align  -mrelocatable  -mrelocatable-lib
-mlittle  -mlittle-endian  -mbig  -mbig-endian
-mdynamic-no-pic  -msingle-pic-base
-mprioritize-restricted-insns=priority
-msched-costly-dep=dependence_type
-minsert-sched-nops=scheme
-mcall-aixdesc  -mcall-eabi  -mcall-freebsd
-mcall-linux  -mcall-netbsd  -mcall-openbsd
-mcall-sysv  -mcall-sysv-eabi  -mcall-sysv-noeabi
-mtraceback=traceback_type
-maix-struct-return  -msvr4-struct-return
-mabi=abi-type  -msecure-plt  -mbss-plt
-msplit-patch-nops
-mregnames  -mlongcall  -mpltseq  -mtls-markers
-mblock-move-inline-limit=num
-mblock-compare-inline-limit=num
-mblock-compare-inline-loop-limit=num
-mblock-ops-unaligned-vsx
-mstring-compare-inline-limit=num
-misel  -mvsx  -mvrsave  -mmulhw  -mdlmzb  -mprototype
-msim  -mmvme  -mads  -myellowknife  -memb  -meabi  -msdata
-msdata=opt  -mreadonly-in-sdata  -mvxworks  -G num
-mrecip  -mrecip=opt  -mno-recip  -mrecip-precision
-mveclibabi=type  -mfriz
-mpointers-to-nested-functions  -msave-toc-indirect  -mpower8-fusion
-mcrypto  -mhtm  -mquad-memory  -mquad-memory-atomic
-mcompat-align-parm
-mfloat128  -mfloat128-hardware
-mgnu-attribute
-mstack-protector-guard=guard  -mstack-protector-guard-reg=reg
-mstack-protector-guard-offset=offset  -mprefixed
-mpcrel  -mmma  -mrop-protect  -mprivileged
-mno-splat-word-constant  -mno-splat-float-constant
-mno-ieee128-constant  -mno-warn-altivec-long
~~~


### Opciones de RX

~~~text
-m64bit-doubles  -m32bit-doubles  -fpu  -nofpu
-mcpu=name
-mbig-endian-data  -mlittle-endian-data
-msmall-data-limit=N
-msim  -mas100-syntax  -mrelax
-mmax-constant-size=N  -mint-register=N
-mpid  -mno-allow-string-insns  -mjsr
-mno-warn-multiple-fast-interrupts  -msave-acc-in-interrupts
-mlra
~~~


### Opciones de S/390 y zSeries

~~~text
-mtune=cpu-type  -march=cpu-type
-mhard-float  -msoft-float  -mhard-dfp
-mlong-double-64  -mlong-double-128
-mbackchain  -mpacked-stack
-msmall-exec  -mmvcle
-m64  -m31  -mdebug  -mesa  -mzarch
-mhtm  -mvx  -mzvector
-mtpf-trace  -mtpf-trace-skip  -mmain
-mfused-madd  -mno-fused-madd
-mwarn-framesize=framesize  -mwarn-dynamicstack
-mstack-size=stack-size  -mno-stack-size
-mstack-guard=stack-guard  -mno-stack-guard
-mstack-protector-guard=guard
-mstack-protector-guard-record
-mhotpatch=pre-halfwords,post-halfwords
-mno-pic-data-is-text-relative
-mindirect-branch=choice
-mindirect-branch-jump=choice  -mindirect-branch-call=choice
-mfunction-return=choice
-mfunction-return-mem=choice  -mfunction-return-reg=choice
-mindirect-branch-table
-mfentry  -mrecord-mcount  -mnop-mcount
-mpreserve-args  -munaliged-symbols
~~~


### Opciones de SH

~~~text
-m1  -m2  -m2e
-m2a  -m2a-nofpu  -m2a-single  -m2a-single-only
-m3  -m3e
-m4  -m4-nofpu  -m4-single  -m4-single-only
-m4-100  -m4-100-nofpu  -m4-100-single  -m4-100-single-only
-m4-200  -m4-200-nofpu  -m4-200-single  -m4-200-single-only
-m4-300  -m4-300-nofpu  -m4-300-single  -m4-300-single-only
-m4-340  -m4-400  -m4-500
-m4a  -m4al  -m4a-nofpu  -m4a-single  -m4a-single-only
-mb  -ml  -mdalign  -mrelax
-mbigtable  -mbitops  -mfmovd  -mrenesas  -mnomacsave
-mieee  -misize  -minline-ic_invalidate
-mprefergot  -musermode  -multcost=number  -mdiv=strategy
-mdivsi3_libfunc=name  -mfixed-range=register-range
-maccumulate-outgoing-args
-matomic-model=atomic-model
-mbranch-cost=num  -mzdcbranch
-mcbranch-force-delay-slot
-mfsca  -mfsrra
-mpretend-cmove  -mfdpic  -mtas  -mlra
~~~


### Opciones de Solaris 2

~~~text
-mclear-hwcap  -mno-clear-hwcap  -mimpure-text  -mno-impure-text
-gsctf
~~~


### Opciones de SPARC

~~~text
-mcpu=cpu-type
-mtune=cpu-type
-mcmodel=code-model
-mmemory-model=mem-model
-m32  -m64  -mptr32  -mptr64  -mapp-regs
-mfaster-structs  -mflat
-mfpu  -mhard-float  -msoft-float
-mhard-quad-float  -msoft-quad-float
-mstack-bias  -mstd-struct-return
-munaligned-doubles  -muser-mode
-mv8plus  -mvis
-mvis2  -mvis3  -mvis3b  -mvis4  -mvis4b
-mcbcond  -mfmaf  -mfsmuld  -mpopc  -msubxc
-mfix-at697f  -mfix-ut699  -mfix-ut700  -mfix-gr712rc
~~~


### Opciones de System V

~~~text
-YP,paths  -Ym,dir
~~~


### Opciones de V850

~~~text
-mlong-calls  -mep
-mprolog-function  -mspace
-mtda=n  -msda=n  -mzda=n
-mv850  -mv850e3v5  -m850e2v4  -mv850e2v3
-mv850e2  -mv850e1  -mv850es  -mv850e
-mdisable-callt  -mrelax  -mlong-jumps
-msoft-float  -mhard-float  -mloop
-mrh850-abi  -mghs  -mgcc-abi
-m8byte-align  -mbig-switch  -mapp-regs  -msmall-sld
-mno-strict-align  -mjump-tables-in-data-section
~~~


### Opciones de VAX

~~~text
-munix  -mgnu  -md  -md-float  -mg  -mg-float  -mlra
-mvaxc-alignment  -mqmath
~~~


### Opciones de Visium

~~~text
-mdebug  -msim  -mfpu  -mhard-float  -msoft-float
-mcpu=cpu-type  -mtune=cpu-type  -msv-mode  -muser-mode
~~~


### Opciones de VMS

~~~text
-mvms-return-codes  -mdebug-main=prefix  -mmalloc64
-mpointer-size=size
~~~


### Opciones de VxWorks

~~~text
-mrtp  -msmp  -mvthreads  -non-static  -Bstatic  -Bdynamic
-Xbind-lazy  -Xbind-now
~~~


### Opciones de x86

~~~text
-mtune=cpu-type  -march=cpu-type
-mtune-ctrl=feature-list  -mdump-tune-features  -mno-default
-mfpmath=unit
-masm=dialect  -mno-fancy-math-387
-mno-fp-ret-in-387  -m80387  -mhard-float  -msoft-float  -mieee-fp
-mrtd  -malign-double
-mpreferred-stack-boundary=num
-mincoming-stack-boundary=num
-mcld  -mcx16  -msahf  -mmovbe  -mcrc32  -mmwait
-mrecip  -mrecip=opt
-mvzeroupper  -mstv  -mprefer-avx128  -mprefer-vector-width=opt
-mpartial-vector-fp-math
-mmove-max=bits  -mstore-max=bits
-mnoreturn-no-callee-saved-registers
-mmmx  -msse  -msse2  -msse3  -mssse3  -msse4.1  -msse4.2  -msse4  -mavx
-mavx2  -mavx512f  -mavx512cd  -mavx512vl
-mavx512bw  -mavx512dq  -mavx512ifma  -mavx512vbmi  -msha  -maes
-mpclmul  -mfsgsbase  -mrdrnd  -mf16c  -mfma  -mpconfig  -mwbnoinvd
-mptwrite  -mclflushopt  -mclwb  -mxsavec  -mxsaves
-msse4a  -m3dnow  -m3dnowa  -mpopcnt  -mabm  -mbmi  -mtbm  -mfma4  -mxop
-madx  -mlzcnt  -mbmi2  -mfxsr  -mxsave  -mxsaveopt  -mrtm  -mhle  -mlwp
-mmwaitx  -mclzero  -mpku  -mgfni  -mvaes  -mwaitpkg
-mshstk  -mmanual-endbr  -mcet-switch  -mforce-indirect-call
-mavx512vbmi2  -mavx512bf16  -menqcmd
-mvpclmulqdq  -mavx512bitalg  -mmovdiri  -mmovdir64b  -mavx512vpopcntdq
-mavx512vnni  -mprfchw  -mrdpid
-mrdseed  -msgx  -mavx512vp2intersect  -mserialize  -mtsxldtrk
-mamx-tile  -mamx-int8  -mamx-bf16  -muintr  -mhreset
-mavxvnni  -mamx-fp8  -mavx512fp16  -mavxifma  -mavxvnniint8
-mavxneconvert  -mcmpccxadd  -mamx-fp16  -mprefetchi  -mraoint
-mamx-complex  -mavxvnniint16  -msm3  -msha512  -msm4  -mapxf
-musermsr  -mavx10.1  -mavx10.2  -mamx-avx512  -mamx-tf32  -mmovrs
-mamx-movrs  -mavx512bmm  -mcldemote  -mms-bitfields
-mno-align-stringops  -minline-all-stringops
-minline-stringops-dynamically  -mstringop-strategy=alg
-mkl  -mwidekl
-mmemcpy-strategy=strategy  -mmemset-strategy=strategy
-mpush-args  -maccumulate-outgoing-args  -m128bit-long-double
-m96bit-long-double  -mlong-double-64  -mlong-double-80  -mlong-double-128
-mregparm=num  -msseregparm
-mveclibabi=type  -mvect8-ret-in-mem
-mpc32  -mpc64  -mpc80  -mdaz-ftz  -mstackrealign  -mstack-arg-probe
-momit-leaf-frame-pointer  -mno-red-zone  -mno-tls-direct-seg-refs
-mcmodel=code-model  -mabi=name  -maddress-mode=mode
-m32  -m64  -mx32  -m16  -miamcu  -mlarge-data-threshold=num
-msse2avx  -mfentry  -mrecord-mcount  -mnop-mcount  -m8bit-idiv
-minstrument-return=type  -mrecord-return
-mfentry-name=name  -mfentry-section=name
-mskip-rax-setup
-mavx256-split-unaligned-load  -mavx256-split-unaligned-store
-malign-data=type  -mstack-protector-guard=guard
-mstack-protector-guard-reg=reg
-mstack-protector-guard-offset=offset
-mstack-protector-guard-symbol=symbol
-mgeneral-regs-only  -mcall-ms2sysv-xlogues  -mtls-dialect=type
-mrelax-cmpxchg-loop
-mindirect-branch=choice  -mfunction-return=choice
-mindirect-branch-register  -mharden-sls=choice
-mindirect-branch-cs-prefix  -mapx-inline-asm-use-gpr32
-mgather  -mscatter
-mneeded  -mno-direct-extern-access
-munroll-only-small-loops  -mdispatch-scheduler  -mlam=choice
~~~


### Opciones de x86 Windows
Véanse las opciones de Cygwin y MinGW.

### Opciones de Xstormy16

~~~text
-msim
~~~


### Opciones de Xtensa

~~~text
-mconst16  -mforce-no-pic  -mno-serialize-volatile
-mtext-section-literals  -mauto-litpools  -mno-target-align
-mlongcalls  -mabi=abi-type
-mextra-l32r-costs=cycles  -mstrict-align
~~~


### Opciones de zSeries
Véanse las opciones de S/390 y zSeries.

---

[Anterior: introducción](03-introduccion.md) · [Índice](README.md) · [Siguiente: 3.2](03-02-tipo-salida.md)
