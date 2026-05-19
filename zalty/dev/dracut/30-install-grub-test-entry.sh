#!/bin/sh
# 30-install-grub-test-entry.sh
# Create an optional GRUB custom entry for a Zalty test initramfs.
#
# This script does not overwrite the default boot entry. It appends a custom
# menuentry to /etc/grub.d/40_custom and then tries to regenerate grub.cfg.

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

[ "$(id -u)" -eq 0 ] || fail "run as root: sudo $0"

KERNEL_VERSION="${KERNEL_VERSION:-$(uname -r)}"
INITRAMFS_OUT="${INITRAMFS_OUT:-/boot/initramfs-zalty-test-$KERNEL_VERSION.img}"
CUSTOM_FILE="${GRUB_CUSTOM_FILE:-/etc/grub.d/40_custom}"
ENTRY_TITLE="${ENTRY_TITLE:-Zalty OS semantic initramfs test ($KERNEL_VERSION)}"
ROOT_CMDLINE="${ROOT_CMDLINE:-}"

[ -f "$INITRAMFS_OUT" ] || fail "initramfs not found: $INITRAMFS_OUT"
[ -f "/boot/vmlinuz-$KERNEL_VERSION" ] || warn "kernel image /boot/vmlinuz-$KERNEL_VERSION not found; trying generic path anyway"

KERNEL_PATH="${KERNEL_PATH:-/boot/vmlinuz-$KERNEL_VERSION}"
INITRD_PATH="$INITRAMFS_OUT"

# Paths inside GRUB entries are usually relative to the boot partition. If /boot
# is its own partition this can differ. This script keeps the explicit /boot path
# as a conservative first prototype.

if grep -F "$ENTRY_TITLE" "$CUSTOM_FILE" >/dev/null 2>&1; then
    fail "GRUB entry already exists in $CUSTOM_FILE: $ENTRY_TITLE"
fi

cat >> "$CUSTOM_FILE" <<EOF

menuentry '$ENTRY_TITLE' {
    echo 'Loading Zalty semantic initramfs test...'
    linux $KERNEL_PATH $ROOT_CMDLINE rd.debug
    initrd $INITRD_PATH
}
EOF

ok "added GRUB custom entry to $CUSTOM_FILE"

if command -v grub-mkconfig >/dev/null 2>&1; then
    grub-mkconfig -o /boot/grub/grub.cfg
    ok "regenerated /boot/grub/grub.cfg with grub-mkconfig"
elif command -v update-grub >/dev/null 2>&1; then
    update-grub
    ok "regenerated grub configuration with update-grub"
else
    warn "could not find grub-mkconfig or update-grub; regenerate GRUB configuration manually"
fi

printf '\nReview the generated GRUB entry before rebooting.\n'
printf 'Do not make it the default until the test boot is confirmed.\n'
