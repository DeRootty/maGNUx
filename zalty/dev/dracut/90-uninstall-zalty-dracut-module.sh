#!/bin/sh
# 90-uninstall-zalty-dracut-module.sh
# Remove the installed Zalty dracut module from the host system.
#
# This does not remove generated initramfs images or GRUB entries.

set -eu

fail() {
    printf 'ERROR: %s\n' "$*" >&2
    exit 1
}

ok() {
    printf 'OK: %s\n' "$*"
}

[ "$(id -u)" -eq 0 ] || fail "run as root: sudo $0"

MODULE_DEST="${DRACUT_MODULE_DEST:-/usr/lib/dracut/modules.d/90zalty-metal}"

printf 'Uninstalling Zalty dracut module\n'
printf '=================================\n'
printf 'target: %s\n\n' "$MODULE_DEST"

if [ ! -e "$MODULE_DEST" ]; then
    ok "module directory does not exist; nothing to remove"
    exit 0
fi

case "$MODULE_DEST" in
    /usr/lib/dracut/modules.d/90zalty-metal|/lib/dracut/modules.d/90zalty-metal)
        rm -rf "$MODULE_DEST"
        ok "removed $MODULE_DEST"
        ;;
    *)
        fail "refusing to remove unexpected path: $MODULE_DEST"
        ;;
esac

printf '\nGenerated initramfs images and GRUB entries were not removed.\n'
printf 'Remove them manually after confirming they are no longer needed.\n'
