#ifndef BOOT_VALIDATOR_H
#define BOOT_VALIDATOR_H

#include "host_identity.h"

/* =========================================================
 * maGNUx — Dernel prototype v0.1
 * boot_validator.h
 *
 * Validates the boot sequence and process whitelist.
 * Implements the "if it doesn't contribute, it's an exploit"
 * policy from the maGNUx manifesto.
 * ========================================================= */

#define MAX_ALLOWED_BINARIES    64
#define BINARY_PATH_LEN         256
#define POLICY_FILE_PATH        "/etc/dernel/policy.conf"

typedef struct {
    char    path[BINARY_PATH_LEN];
    uint8_t hash[HASH_LEN];
    int     hash_verified;   /* 1 if hash was checked, 0 if path-only */
} allowed_binary_t;

typedef struct {
    uint32_t        policy_version;
    allowed_binary_t binaries[MAX_ALLOWED_BINARIES];
    uint32_t        n_binaries;
    int             deny_unknown;   /* 1 = deny anything not listed */
} boot_policy_t;

/*
 * Load boot policy from POLICY_FILE_PATH.
 * Returns 0 on success, -1 if file not found (permissive mode).
 */
int boot_policy_load(boot_policy_t *policy);

/*
 * Check if a binary is authorized to run during boot.
 * Returns 1 if authorized, 0 if denied.
 */
int boot_policy_authorize(const boot_policy_t *policy,
                          const char *binary_path);

/*
 * Validate the entire boot sequence up to this point.
 * Checks that required binaries ran in correct order.
 * Returns 0 if sequence is valid, -1 if anomaly detected.
 */
int boot_sequence_validate(const host_identity_t *id);

/*
 * Print policy summary.
 */
void boot_policy_dump(const boot_policy_t *policy);

#endif /* BOOT_VALIDATOR_H */
