#!/bin/sh
# 00-check-dracut-env.sh
# Check whether the current Linux system can build a Zalty initramfs with dracut.

set -eu

fail() {
    printf 'ERROR: %s\n' "$*" >&2
    exit 1
}

warn() {
    printf 'WARN: %s\n' "$*" >&2
}

ok() {
    printf 'OK: %s\n' "$*"
}

require_cmd() {
    if command -v "$1" >/dev/null 2>&1; then
        ok "command found: $1"
    else
        fail "required command not found: $1"
    fi
}

printf 'Zalty dracut environment check\n'
printf '================================\n\n'

[ "$(id -u)" -eq 0 ] || warn "not running as root; checks are possible, but install/build scripts should run with sudo"

require_cmd uname
require_cmd dracut
require_cmd ls
require_cmd cp
require_cmd mkdir
require_cmd chmod

KERNEL_VERSION="${KERNEL_VERSION:-$(uname -r)}"
REPO_ROOT="${REPO_ROOT:-$(pwd)}"
MODULE_SRC="${MODULE_SRC:-$REPO_ROOT/zalty/initramfs/modules.d/90zalty-metal}"
MODULE_DEST="${DRACUT_MODULE_DEST:-/usr/lib/dracut/modules.d/90zalty-metal}"

printf '\nDetected configuration\n'
printf '----------------------\n'
printf 'kernel version: %s\n' "$KERNEL_VERSION"
printf 'repo root:       %s\n' "$REPO_ROOT"
printf 'module source:  %s\n' "$MODULE_SRC"
printf 'module dest:    %s\n' "$MODULE_DEST"

[ -d /boot ] || fail "/boot does not exist"
ok "/boot exists"

if [ -d "/lib/modules/$KERNEL_VERSION" ] || [ -d "/usr/lib/modules/$KERNEL_VERSION" ]; then
    ok "kernel modules directory found for $KERNEL_VERSION"
else
    warn "kernel modules directory not found for $KERNEL_VERSION"
fi

[ -d "$MODULE_SRC" ] || fail "Zalty dracut module source not found: $MODULE_SRC"
ok "Zalty module source exists"

[ -f "$MODULE_SRC/metal-inventory" ] || fail "missing metal-inventory in module source"
ok "metal-inventory exists"

if [ -f "$MODULE_SRC/module-setup.sh" ]; then
    ok "module-setup.sh exists"
else
    warn "module-setup.sh does not exist yet; create it before building with dracut"
fi

if [ -f "$MODULE_SRC/zalty-metal-hook.sh" ]; then
    ok "zalty-metal-hook.sh exists"
else
    warn "zalty-metal-hook.sh does not exist yet; create it before building with dracut"
fi

printf '\nDracut version\n'
printf '--------------\n'
dracut --version || true

printf '\nEnvironment check finished.\n'
