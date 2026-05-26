#!/bin/bash
# =============================================================
# maGNUx — run-qemu.sh
# Boots the maGNUx initramfs in QEMU for testing.
# No real disk needed: boots to emergency shell via initramfs.
# =============================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
BUILD_DIR="$ROOT_DIR/build"
INITRAMFS="$BUILD_DIR/magnux-initramfs.cpio.gz"

# Use a minimal kernel if available, otherwise the host kernel
KERNEL="${MAGNUX_KERNEL:-/boot/vmlinuz-$(uname -r)}"

if [ ! -f "$INITRAMFS" ]; then
    echo "ERROR: initramfs not found at $INITRAMFS"
    echo "Run: ./scripts/build-initramfs.sh"
    exit 1
fi

if [ ! -f "$KERNEL" ]; then
    echo "ERROR: kernel not found at $KERNEL"
    echo "Set MAGNUX_KERNEL=/path/to/vmlinuz or install a kernel"
    exit 1
fi

echo "=== maGNUx QEMU test ==="
echo "Kernel:    $KERNEL"
echo "Initramfs: $INITRAMFS"
echo ""
echo "Boot log will appear below."
echo "Expected output: see tests/expected-output.txt"
echo "Press Ctrl+A X to exit QEMU."
echo ""

qemu-system-x86_64 \
    -kernel "$KERNEL" \
    -initrd "$INITRAMFS" \
    -append "console=ttyS0 quiet magnux.debug=1" \
    -m 256M \
    -nographic \
    -no-reboot \
    2>&1 | tee "$BUILD_DIR/qemu-boot.log"

echo ""
echo "Boot log saved to: $BUILD_DIR/qemu-boot.log"

# Basic validation
echo ""
echo "=== Validation ==="
if grep -q "STRATUM ROOT complete" "$BUILD_DIR/qemu-boot.log" 2>/dev/null; then
    echo "  ✅ STRATUM ROOT completed"
else
    echo "  ❌ STRATUM ROOT did not complete"
fi

if grep -q "STRATUM COMM complete" "$BUILD_DIR/qemu-boot.log" 2>/dev/null; then
    echo "  ✅ STRATUM COMM completed"
else
    echo "  ❌ STRATUM COMM did not complete"
fi

if grep -q "identity established\|Identity fallback" "$BUILD_DIR/qemu-boot.log" 2>/dev/null; then
    echo "  ✅ Host identity established"
else
    echo "  ❌ Host identity NOT established"
fi

if grep -q "identity preserved across pivot_root" "$BUILD_DIR/qemu-boot.log" 2>/dev/null; then
    echo "  ✅ Identity persisted across pivot_root"
else
    echo "  ⚠️  pivot_root persistence not confirmed (may be expected without real root)"
fi
