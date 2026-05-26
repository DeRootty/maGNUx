/*
 * maGNUx — xGNUpeD prototype v0.1
 * host_identity.c
 *
 * Prototype implementation of host identity establishment.
 * Intended for initramfs; compiled as a static binary.
 *
 * NOTE: This is a prototype. Cryptographic functions are
 * simplified (djb2 hash). Replace with SHA-256 in production.
 */

#include "host_identity.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <time.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

/* =========================================================
 * Internal helpers
 * ========================================================= */

/* Simplified hash (prototype only — replace with SHA-256) */
static void simple_hash(const void *data, size_t len, uint8_t out[HASH_LEN])
{
    const uint8_t *p = (const uint8_t *)data;
    uint32_t h = 5381;
    for (size_t i = 0; i < len; i++)
        h = ((h << 5) + h) ^ p[i];

    memset(out, 0, HASH_LEN);
    /* Fill 32 bytes with derived values from the hash */
    for (int i = 0; i < HASH_LEN; i++)
        out[i] = (uint8_t)((h >> (i % 4 * 8)) ^ (i * 37));
}

static uint64_t get_timestamp_ns(void)
{
    struct timespec ts;
    if (clock_gettime(CLOCK_MONOTONIC, &ts) == 0)
        return (uint64_t)ts.tv_sec * 1000000000ULL + ts.tv_nsec;
    return 0;
}

/* =========================================================
 * API implementation
 * ========================================================= */

int host_identity_init(host_identity_t *id)
{
    if (!id) return -1;
    memset(id, 0, sizeof(*id));
    id->magic   = MAGNUX_MAGIC;
    id->version = MAGNUX_VERSION;
    id->boot_log_idx = 0;
    return 0;
}

host_context_t host_identity_detect_context(void)
{
    /* Check for common VM indicators */
    if (access("/sys/class/dmi/id/product_name", R_OK) == 0) {
        char buf[64] = {0};
        int fd = open("/sys/class/dmi/id/product_name", O_RDONLY);
        if (fd >= 0) {
            read(fd, buf, sizeof(buf) - 1);
            close(fd);
            if (strstr(buf, "QEMU")    ||
                strstr(buf, "VirtualBox") ||
                strstr(buf, "VMware"))
                return HOST_VM;
        }
    }

    /* Check for container (simplified) */
    if (access("/.dockerenv", F_OK) == 0)
        return HOST_CONTAINER;

    return HOST_BARE_METAL;
}

int host_identity_populate_distributive(host_identity_t *id)
{
    if (!id) return -1;

    /* distro_id: read from /etc/os-release if available,
     * otherwise use maGNUx default */
    strncpy(id->distributive.distro_id, "maGNUx-prototype",
            DISTRO_ID_LEN - 1);

    if (access("/etc/os-release", R_OK) == 0) {
        FILE *f = fopen("/etc/os-release", "r");
        if (f) {
            char line[128];
            while (fgets(line, sizeof(line), f)) {
                if (strncmp(line, "ID=", 3) == 0) {
                    char *val = line + 3;
                    val[strcspn(val, "\n\"")] = 0;
                    snprintf(id->distributive.distro_id,
                             DISTRO_ID_LEN, "maGNUx/%s", val);
                    break;
                }
            }
            fclose(f);
        }
    }

    /* kernel_version: read from /proc/version */
    if (access("/proc/version", R_OK) == 0) {
        FILE *f = fopen("/proc/version", "r");
        if (f) {
            char line[256];
            if (fgets(line, sizeof(line), f)) {
                /* Extract version number */
                char *ver = strstr(line, "version ");
                if (ver) {
                    ver += 8;
                    ver[strcspn(ver, " ")] = 0;
                    strncpy(id->distributive.kernel_version,
                            ver, KERNEL_VER_LEN - 1);
                }
            }
            fclose(f);
        }
    } else {
        strncpy(id->distributive.kernel_version, "unknown",
                KERNEL_VER_LEN - 1);
    }

    /* install_hash: hash of distro_id + kernel_version (prototype) */
    char combined[DISTRO_ID_LEN + KERNEL_VER_LEN];
    snprintf(combined, sizeof(combined), "%s%s",
             id->distributive.distro_id,
             id->distributive.kernel_version);
    simple_hash(combined, strlen(combined),
                id->distributive.install_hash);

    return 0;
}

void host_identity_log(host_identity_t *id,
                       boot_stage_t stage,
                       uint8_t event_type,
                       const char *message)
{
    if (!id || !message) return;

    uint32_t idx = id->boot_log_idx % MAX_BOOT_EVENTS;
    boot_event_t *ev = &id->boot_log[idx];

    ev->timestamp_ns = get_timestamp_ns();
    ev->stage        = (uint8_t)stage;
    ev->event_type   = event_type;
    strncpy(ev->message, message, EVENT_MSG_LEN - 1);
    ev->message[EVENT_MSG_LEN - 1] = '\0';

    id->boot_log_idx++;
}

void host_identity_seal(host_identity_t *id)
{
    if (!id) return;
    /* Checksum everything except the checksum field itself */
    size_t seal_len = offsetof(host_identity_t, checksum);
    simple_hash(id, seal_len, id->checksum);
}

int host_identity_verify(const host_identity_t *id)
{
    if (!id) return -1;
    if (id->magic != MAGNUX_MAGIC) return -1;
    if (id->version != MAGNUX_VERSION) return -1;

    uint8_t expected[HASH_LEN];
    size_t seal_len = offsetof(host_identity_t, checksum);
    simple_hash(id, seal_len, expected);

    return memcmp(id->checksum, expected, HASH_LEN) == 0 ? 0 : -1;
}

int host_identity_persist(const host_identity_t *id, const char *path)
{
    if (!id || !path) return -1;

    /* Ensure directory exists */
    char dir[256];
    strncpy(dir, path, sizeof(dir) - 1);
    char *slash = strrchr(dir, '/');
    if (slash) {
        *slash = '\0';
        mkdir(dir, 0700);
    }

    int fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0600);
    if (fd < 0) return -1;

    ssize_t written = write(fd, id, sizeof(*id));
    close(fd);

    return (written == (ssize_t)sizeof(*id)) ? 0 : -1;
}

int host_identity_load(host_identity_t *id, const char *path)
{
    if (!id || !path) return -1;

    int fd = open(path, O_RDONLY);
    if (fd < 0) return -1;

    ssize_t n = read(fd, id, sizeof(*id));
    close(fd);

    if (n != (ssize_t)sizeof(*id)) return -1;
    return host_identity_verify(id);
}

void host_identity_dump(const host_identity_t *id)
{
    if (!id) return;

    printf("\n=== maGNUx Host Identity ===\n");
    printf("Magic:   0x%08X %s\n", id->magic,
           id->magic == MAGNUX_MAGIC ? "(valid)" : "(INVALID)");
    printf("Version: %u\n", id->version);
    printf("\n[P1] Distributive identity:\n");
    printf("  Distro:  %s\n", id->distributive.distro_id);
    printf("  Kernel:  %s\n", id->distributive.kernel_version);
    printf("  Hash:    ");
    for (int i = 0; i < 8; i++)
        printf("%02x", id->distributive.install_hash[i]);
    printf("...\n");

    printf("\n[P2] Context: ");
    switch (id->context) {
        case HOST_BARE_METAL: printf("bare metal\n"); break;
        case HOST_VM:         printf("virtual machine\n"); break;
        case HOST_CONTAINER:  printf("container\n"); break;
        default:              printf("unknown\n"); break;
    }

    printf("\n[P3] Associative:\n");
    printf("  Update seq: %u\n", id->associative.update_seq);

    printf("\n[P4] Boot log (%u events):\n", id->boot_log_idx);
    uint32_t show = id->boot_log_idx < 8 ? id->boot_log_idx : 8;
    for (uint32_t i = 0; i < show; i++) {
        const boot_event_t *ev = &id->boot_log[i];
        printf("  [stage %u] %s\n", ev->stage, ev->message);
    }
    if (id->boot_log_idx > show)
        printf("  ... (%u more)\n", id->boot_log_idx - show);

    printf("\nIntegrity: %s\n",
           host_identity_verify(id) == 0 ? "OK" : "FAILED");
    printf("============================\n\n");
}
