#!/bin/sh
# 10-install-zalty-dracut-module.sh
# Install the local Zalty dracut module into the host dracut modules directory.

set -eu

fail() {
    printf 'ERROR: %s\n' "$*" >&2
    exit 1
}

ok() {
    printf 'OK: %s\n' "$*"
}

[ "$(id -u)" -eq 0 ] || fail "run as root: sudo $0"

REPO_ROOT="${REPO_ROOT:-$(pwd)}"
MODULE_SRC="${MODULE_SRC:-$REPO_ROOT/zalty/initramfs/modules.d/90zalty-metal}"
MODULE_DEST="${DRACUT_MODULE_DEST:-/usr/lib/dracut/modules.d/90zalty-metal}"

printf 'Installing Zalty dracut module\n'
printf '==============================\n'
printf 'source: %s\n' "$MODULE_SRC"
printf 'dest:   %s\n\n' "$MODULE_DEST"

[ -d "$MODULE_SRC" ] || fail "module source directory not found: $MODULE_SRC"
[ -f "$MODULE_SRC/metal-inventory" ] || fail "missing metal-inventory: $MODULE_SRC/metal-inventory"

mkdir -p "$MODULE_DEST"

# Copy only regular files for now. This keeps the installed module predictable.
for file in "$MODULE_SRC"/*; do
    [ -f "$file" ] || continue
    cp -f "$file" "$MODULE_DEST/"
done

chmod 0755 "$MODULE_DEST" || true
find "$MODULE_DEST" -type f -name '*.sh' -exec chmod 0755 {} \;
[ -f "$MODULE_DEST/metal-inventory" ] && chmod 0755 "$MODULE_DEST/metal-inventory"
[ -f "$MODULE_DEST/metal-check" ] && chmod 0755 "$MODULE_DEST/metal-check"
[ -f "$MODULE_DEST/metal-report" ] && chmod 0755 "$MODULE_DEST/metal-report"

ok "installed module files into $MODULE_DEST"

printf '\nInstalled files:\n'
ls -la "$MODULE_DEST"
