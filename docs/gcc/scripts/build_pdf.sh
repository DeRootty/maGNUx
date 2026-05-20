#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/dist"
mkdir -p "$OUT"

pandoc \
  "$ROOT/docs"/*.md \
  --from markdown \
  --to pdf \
  --pdf-engine=xelatex \
  --metadata title="Uso de la GNU Compiler Collection - GCC 16.1.0" \
  --metadata lang="es" \
  -o "$OUT/gcc-es-tecnico.pdf"

echo "PDF generado en: $OUT/gcc-es-tecnico.pdf"
