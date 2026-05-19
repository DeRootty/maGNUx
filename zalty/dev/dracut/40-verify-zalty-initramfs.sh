#!/bin/sh
# 40-verify-zalty-initramfs.sh
# Verify that a generated initramfs contains the expected Zalty files.

set -eu

fail() {
    printf 'ERROR: %s\n' "$*" >&2
    exit 1
}

ok() {
    printf 'OK: %s\n' "$*"
}

warn() {
    printf 'WARN: %s\n' "$*" >&2
}

KERNEL_VERSION="${KERNEL_VERSION:-$(uname -r)}"
INITRAMFS_OUT="${INITRAMFS_OUT:-/boot/initramfs-zalty-test-$KERNEL_VERSION.img}"

[ -f "$INITRAMFS_OUT" ] || fail "initramfs not found: $INITRAMFS_OUT"

printf 'Verifying Zalty initramfs\n'
printf '=========================\n'
printf 'image: %s\n\n' "$INITRAMFS_OUT"

if command -v lsinitrd >/dev/null 2>&1; then
    LIST_CMD="lsinitrd $INITRAMFS_OUT"
elif command -v lsinitramfs >/dev/null 2>&1; then
    LIST_CMD="lsinitramfs $INITRAMFS_OUT"
else
    fail "neither lsinitrd nor lsinitramfs found"
fi

# Store listing in a temp file for repeated grep checks.
TMP="${TMPDIR:-/tmp}/zalty-initramfs-list.$$"
# shellcheck disable=SC2086
$LIST_CMD > "$TMP"

check_path() {
    pattern="$1"
    label="$2"
    if grep -F "$pattern" "$TMP" >/dev/null 2>&1; then
        ok "$label found: $pattern"
    else
        warn "$label not found: $pattern"
    fi
}

check_path "bin/metal-inventory" "metal-inventory"
check_path "zalty-metal-hook.sh" "zalty hook"
check_path "90zalty-metal" "module reference"

printf '\nUseful manual inspection command:\n'
printf '%s | less\n' "$LIST_CMD"

rm -f "$TMP"
printf '\nVerification finished.\n'
