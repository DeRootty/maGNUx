#!/usr/bin/env bash
set -euo pipefail
export LC_ALL=C
cc=${CC:-gcc}
src=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
out=$(mktemp -d "${TMPDIR:-/tmp}/magnux-g01.XXXXXXXX")
cp -- "$src/config.h" "$src/feature.h" "$src/demo.c" "$out/"
cd -- "$out"
printf "Evidence: %s\n" "$out"
"$cc" -v > toolchain.txt 2>&1
"$cc" -dumpmachine >> toolchain.txt
objdump --version >> toolchain.txt
sha256sum config.h feature.h demo.c > sources.sha256
mkdir 0 1 diff
for v in 0 1; do
  (
    set -x
    "$cc" -std=gnu11 -O2 -DFEATURE="$v" -E -H demo.c -o "$v/demo.i" 2>"$v/headers.txt"
    "$cc" -std=gnu11 -O2 -DFEATURE="$v" -E -dM demo.c >"$v/macros.txt"
    "$cc" -std=gnu11 -O2 -DFEATURE="$v" -M -MT demo.o demo.c >"$v/deps.mk"
    "$cc" -std=gnu11 -O2 -fdump-tree-gimple -fdump-tree-optimized -S "$v/demo.i" -o "$v/demo.s"
    "$cc" -c "$v/demo.s" -o "$v/demo.o"
    objdump -dr "$v/demo.o" >"$v/disassembly.txt"
  ) 2>"$v/commands.log"
done
for f in headers.txt macros.txt deps.mk demo.i demo.s disassembly.txt; do
  diff -u "0/$f" "1/$f" >"diff/$f.diff" || { rc=$?; [[ $rc -eq 1 ]] || exit "$rc"; }
done
sha256sum 0/demo.i 1/demo.i 0/demo.o 1/demo.o > artifacts.sha256
printf "Completed. Inspect %s/diff and %s/{0,1}\n" "$out" "$out"
