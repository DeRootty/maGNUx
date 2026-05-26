#ifndef HOST_IDENTITY_H
#define HOST_IDENTITY_H

#include <stdint.h>

/* =========================================================
 * maGNUx — xGNUpeD prototype v0.1
 * host_identity.h
 *
 * Central data structure for host identity.
 * Established in initramfs, persists through pivot_root.
 * ========================================================= */

#define MAGNUX_MAGIC        0x474E5558   /* "GNUX" */
#define MAGNUX_VERSION      1
#define MAX_BOOT_EVENTS     256
#define DISTRO_ID_LEN       64
#define KERNEL_VER_LEN      32
#define HASH_LEN            32
#define SIG_LEN             64
#define EVENT_MSG_LEN       128

/* --- Boot stages --- */
typedef enum {
    STAGE_PRE_INIT   = 0,
    STAGE_KERNEL     = 1,
    STAGE_XGNUPED    = 2,
    STAGE_DERNEL     = 3,
    STAGE_COMM       = 4,
    STAGE_ADMIN      = 5
} boot_stage_t;

/* --- Host context (P2: conmutative identity) --- */
typedef enum {
    HOST_BARE_METAL  = 0,
    HOST_VM          = 1,
    HOST_CONTAINER   = 2,
    HOST_UNKNOWN     = 255
} host_context_t;

/* --- P1: Distributive identity --- */
typedef struct {
    char    distro_id[DISTRO_ID_LEN];
    char    kernel_version[KERNEL_VER_LEN];
    uint8_t install_hash[HASH_LEN];
} distributive_id_t;

/* --- P3: Associative identity --- */
typedef struct {
    uint32_t update_seq;
    uint8_t  community_sig[SIG_LEN];
} associative_id_t;

/* --- P4: Communicative identity — boot event log --- */
typedef struct {
    uint64_t timestamp_ns;
    uint8_t  stage;
    uint8_t  event_type;
    char     message[EVENT_MSG_LEN];
} boot_event_t;

/* --- Master structure --- */
typedef struct {
    uint32_t          magic;
    uint32_t          version;
    distributive_id_t distributive;     /* P1 */
    host_context_t    context;          /* P2 */
    associative_id_t  associative;      /* P3 */
    boot_event_t      boot_log[MAX_BOOT_EVENTS]; /* P4 */
    uint32_t          boot_log_idx;
    uint8_t           checksum[HASH_LEN];
} host_identity_t;

/* =========================================================
 * API
 * ========================================================= */

/*
 * Initialize the host identity structure.
 * Must be called before any other function.
 * Returns 0 on success, -1 on failure.
 */
int host_identity_init(host_identity_t *id);

/*
 * Detect host context (bare metal, VM, container).
 */
host_context_t host_identity_detect_context(void);

/*
 * Populate distributive identity from system info.
 */
int host_identity_populate_distributive(host_identity_t *id);

/*
 * Log a boot event (P4: communicative identity).
 */
void host_identity_log(host_identity_t *id,
                       boot_stage_t stage,
                       uint8_t event_type,
                       const char *message);

/*
 * Compute and store checksum of the identity structure.
 */
void host_identity_seal(host_identity_t *id);

/*
 * Verify that the identity has not been tampered with.
 * Returns 0 if valid, -1 if integrity check fails.
 */
int host_identity_verify(const host_identity_t *id);

/*
 * Persist the identity to a memory-backed location
 * that survives pivot_root.
 * Returns 0 on success, -1 on failure.
 */
int host_identity_persist(const host_identity_t *id, const char *path);

/*
 * Load a previously persisted identity.
 * Returns 0 on success, -1 on failure.
 */
int host_identity_load(host_identity_t *id, const char *path);

/*
 * Print identity summary to stdout (for debug/testing).
 */
void host_identity_dump(const host_identity_t *id);

#endif /* HOST_IDENTITY_H */
