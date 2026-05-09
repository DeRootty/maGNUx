#!/usr/bin/env bash
set -euo pipefail

# Añade barras de navegación a los bloques CONFIG_* dentro de kernel/.
# Ejecutar desde la raíz del repositorio maGNUx.
#
# Uso:
#   bash scripts/add-kernel-config-navigation.sh
#
# La operación es idempotente: si una barra ya existe, no la duplica.

KERNEL_DIR="kernel"
NAV_TOP="> [⬆ Subir al índice CONFIG_*](README.md) · [🏠 Inicio](../README.md)"
OLD_TOP="> [Atras](../research00.md)"

if [ ! -d "$KERNEL_DIR" ]; then
  echo "ERROR: no existe el directorio $KERNEL_DIR" >&2
  echo "Ejecuta este script desde la raíz del repositorio." >&2
  exit 1
fi

find "$KERNEL_DIR" -maxdepth 1 -type f \( -name 'config_*.md' -o -name 'CONFIG-*.md' \) | sort | while read -r file; do
  echo "Procesando: $file"

  tmp="$(mktemp)"

  first_line="$(head -n 1 "$file" || true)"

  if [ "$first_line" = "$NAV_TOP" ]; then
    cp "$file" "$tmp"
  elif [ "$first_line" = "$OLD_TOP" ]; then
    {
      printf '%s\n' "$NAV_TOP"
      tail -n +2 "$file"
    } > "$tmp"
  else
    {
      printf '%s\n\n' "$NAV_TOP"
      cat "$file"
    } > "$tmp"
  fi

  if ! tail -n 12 "$tmp" | grep -Fq "$NAV_TOP"; then
    {
      cat "$tmp"
      printf '\n---\n\n%s\n' "$NAV_TOP"
    } > "${tmp}.2"
    mv "${tmp}.2" "$tmp"
  fi

  mv "$tmp" "$file"
done

echo
printf 'Listo. Revisa cambios con:\n\n'
printf '  git diff -- kernel/\n  git status\n\n'
printf 'Si todo es correcto:\n\n'
printf '  git add kernel/\n  git commit -m "docs: add navigation bars to kernel CONFIG blocks"\n\n'
