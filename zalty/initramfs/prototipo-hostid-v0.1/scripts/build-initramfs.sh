#!/bin/bash
# =============================================================
# maGNUx — build-initramfs.sh
# Compiles C sources and packages the initramfs cpio archive.
# =============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
BUILD_DIR="$ROOT_DIR/build"
INITRAMFS_DIR="$BUILD_DIR/initramfs-root"
OUTPUT="$BUILD_DIR/magnux-initramfs.cpio.gz"

CC="${CC:-gcc}"
CFLAGS="-static -Os -Wall -Wextra -I$ROOT_DIR/src/identity \
        -I$ROOT_DIR/src/boot -I$ROOT_DIR/src/comm"

echo "=== maGNUx initramfs build ==="
echo "Root:   $ROOT_DIR"
echo "Output: $OUTPUT"
echo ""

# --- 1. Prepare build directories ---
rm -rf "$INITRAMFS_DIR"
mkdir -p "$INITRAMFS_DIR"/{sbin,bin,dev,proc,sys,etc/dernel,dev/shm,mnt/real-root,mnt/old-initramfs}

# --- 2. Compile C sources ---
echo "[1/4] Compiling identity module..."
$CC $CFLAGS \
    "$ROOT_DIR/src/identity/host_identity.c" \
    -c -o "$BUILD_DIR/host_identity.o" \
    || { echo "ERROR: identity compile failed"; exit 1; }

echo "[2/4] Compiling boot validator..."
$CC $CFLAGS \
    "$ROOT_DIR/src/boot/boot_validator.c" \
    -c -o "$BUILD_DIR/boot_validator.o" \
    || { echo "ERROR: boot_validator compile failed"; exit 1; }

echo "[3/4] Compiling early comm..."
$CC $CFLAGS \
    "$ROOT_DIR/src/comm/early_comm.c" \
    -c -o "$BUILD_DIR/early_comm.o" \
    || { echo "ERROR: early_comm compile failed"; exit 1; }

# --- 3. Link xgnuped-init ---
# (Requires a main — see src/identity/xgnuped_main.c, to be written)
if [ -f "$ROOT_DIR/src/identity/xgnuped_main.c" ]; then
    echo "[3b] Linking xgnuped-init..."
    $CC $CFLAGS \
        "$BUILD_DIR/host_identity.o" \
        "$BUILD_DIR/early_comm.o" \
        "$ROOT_DIR/src/identity/xgnuped_main.c" \
        -o "$INITRAMFS_DIR/sbin/xgnuped-init" \
        || echo "WARNING: xgnuped-init link failed (shell fallback will be used)"
else
    echo "[3b] xgnuped_main.c not found — shell fallback will be used"
fi

# --- 4. Copy init script and policy ---
echo "[4/4] Assembling initramfs root..."
install -m 755 "$SCRIPT_DIR/init"         "$INITRAMFS_DIR/init"
install -m 644 "$SCRIPT_DIR/policy.conf"  "$INITRAMFS_DIR/etc/dernel/policy.conf"

# Symlink busybox utilities if available
if command -v busybox >/dev/null 2>&1; then
    cp "$(which busybox)" "$INITRAMFS_DIR/bin/busybox"
    chmod 755 "$INITRAMFS_DIR/bin/busybox"
    for tool in sh mount umount pivot_root switch_root; do
        ln -sf /bin/busybox "$INITRAMFS_DIR/bin/$tool" 2>/dev/null || true
        ln -sf /bin/busybox "$INITRAMFS_DIR/sbin/$tool" 2>/dev/null || true
    done
    echo "  busybox installed"
else
    echo "  WARNING: busybox not found — install it for a complete initramfs"
fi

# --- 5. Package as cpio.gz ---
echo ""
echo "Packaging initramfs..."
cd "$INITRAMFS_DIR"
find . | cpio -o -H newc 2>/dev/null | gzip -9 > "$OUTPUT"

SIZE=$(du -sh "$OUTPUT" | cut -f1)
echo ""
echo "=== Build complete ==="
echo "Output: $OUTPUT ($SIZE)"
echo ""
echo "Test with:"
echo "  ./tests/run-qemu.sh"
