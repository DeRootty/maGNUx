#!/bin/sh
# 20-build-zalty-initramfs.sh
# Build a test initramfs image including the Zalty dracut module.

set -eu

fail() {
    printf 'ERROR: %s\n' "$*" >&2
    exit 1
}

ok() {
    printf 'OK: %s\n' "$*"
}

[ "$(id -u)" -eq 0 ] || fail "run as root: sudo $0"
command -v dracut >/dev/null 2>&1 || fail "dracut not found"

KERNEL_VERSION="${KERNEL_VERSION:-$(uname -r)}"
INITRAMFS_OUT="${INITRAMFS_OUT:-/boot/initramfs-zalty-test-$KERNEL_VERSION.img}"
DRACUT_MODULE_NAME="${DRACUT_MODULE_NAME:-zalty-metal}"
MODULE_DEST="${DRACUT_MODULE_DEST:-/usr/lib/dracut/modules.d/90zalty-metal}"
FORCE="${FORCE:-yes}"
VERBOSE="${VERBOSE:-yes}"

printf 'Building Zalty initramfs\n'
printf '========================\n'
printf 'kernel:  %s\n' "$KERNEL_VERSION"
printf 'output:  %s\n' "$INITRAMFS_OUT"
printf 'module:  %s\n' "$DRACUT_MODULE_NAME"
printf 'moddir:  %s\n\n' "$MODULE_DEST"

[ -d "$MODULE_DEST" ] || fail "module not installed: $MODULE_DEST"
[ -f "$MODULE_DEST/module-setup.sh" ] || fail "missing module-setup.sh in $MODULE_DEST"
[ -f "$MODULE_DEST/zalty-metal-hook.sh" ] || fail "missing zalty-metal-hook.sh in $MODULE_DEST"
[ -f "$MODULE_DEST/metal-inventory" ] || fail "missing metal-inventory in $MODULE_DEST"

ARGS=""
[ "$FORCE" = "yes" ] && ARGS="$ARGS -f"
[ "$VERBOSE" = "yes" ] && ARGS="$ARGS -v"

# shellcheck disable=SC2086
dracut $ARGS -a "$DRACUT_MODULE_NAME" "$INITRAMFS_OUT" "$KERNEL_VERSION"

[ -f "$INITRAMFS_OUT" ] || fail "initramfs was not created: $INITRAMFS_OUT"
ok "created $INITRAMFS_OUT"
ls -lh "$INITRAMFS_OUT"
