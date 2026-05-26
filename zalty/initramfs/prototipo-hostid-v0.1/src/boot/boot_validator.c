/*
 * maGNUx — Dernel prototype v0.1
 * boot_validator.c
 */

#include "boot_validator.h"
#include "../identity/host_identity.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

/* =========================================================
 * Internal helpers
 * ========================================================= */

static void trim(char *s)
{
    char *end;
    while (*s == ' ' || *s == '\t') s++;
    end = s + strlen(s) - 1;
    while (end > s && (*end == '\n' || *end == '\r' ||
                        *end == ' '  || *end == '\t'))
        *end-- = '\0';
}

/* =========================================================
 * API implementation
 * ========================================================= */

int boot_policy_load(boot_policy_t *policy)
{
    if (!policy) return -1;
    memset(policy, 0, sizeof(*policy));
    policy->deny_unknown  = 0;  /* default: permissive */
    policy->policy_version = 0;

    FILE *f = fopen(POLICY_FILE_PATH, "r");
    if (!f) {
        fprintf(stderr, "[boot_validator] No policy file at %s"
                        " — running in permissive mode\n",
                POLICY_FILE_PATH);
        return -1;
    }

    char line[512];
    while (fgets(line, sizeof(line), f)) {
        trim(line);

        /* Skip comments and empty lines */
        if (line[0] == '#' || line[0] == '\0') continue;

        /* Section headers */
        if (strncmp(line, "[runtime]", 9) == 0) continue;
        if (strncmp(line, "[guest]",   7) == 0) break; /* stop at guest */

        /* policy_version */
        if (strncmp(line, "policy_version", 14) == 0) {
            char *val = strchr(line, '=');
            if (val) policy->policy_version = (uint32_t)atoi(val + 1);
            continue;
        }

        /* deny_unknown */
        if (strncmp(line, "deny_unknown", 12) == 0) {
            char *val = strchr(line, '=');
            if (val) {
                while (*val == '=' || *val == ' ') val++;
                policy->deny_unknown = (strncmp(val, "true", 4) == 0) ? 1 : 0;
            }
            continue;
        }

        /* allow = /path/to/binary */
        if (strncmp(line, "allow", 5) == 0) {
            char *val = strchr(line, '=');
            if (val && policy->n_binaries < MAX_ALLOWED_BINARIES) {
                while (*val == '=' || *val == ' ') val++;
                strncpy(policy->binaries[policy->n_binaries].path,
                        val, BINARY_PATH_LEN - 1);
                policy->binaries[policy->n_binaries].hash_verified = 0;
                policy->n_binaries++;
            }
            continue;
        }
    }

    fclose(f);
    return 0;
}

int boot_policy_authorize(const boot_policy_t *policy,
                          const char *binary_path)
{
    if (!policy || !binary_path) return 0;

    /* Permissive mode: authorize everything */
    if (!policy->deny_unknown) return 1;

    for (uint32_t i = 0; i < policy->n_binaries; i++) {
        if (strcmp(policy->binaries[i].path, binary_path) == 0)
            return 1;
    }

    fprintf(stderr, "[boot_validator] DENIED: %s\n", binary_path);
    return 0;
}

int boot_sequence_validate(const host_identity_t *id)
{
    if (!id) return -1;

    /* Verify identity integrity first */
    if (host_identity_verify(id) != 0) {
        fprintf(stderr, "[boot_validator] Identity integrity check FAILED\n");
        return -1;
    }

    /* Check that xGNUpeD stage was logged */
    int found_xgnuped = 0;
    uint32_t events = id->boot_log_idx < MAX_BOOT_EVENTS
                      ? id->boot_log_idx : MAX_BOOT_EVENTS;

    for (uint32_t i = 0; i < events; i++) {
        if (id->boot_log[i].stage == STAGE_XGNUPED) {
            found_xgnuped = 1;
            break;
        }
    }

    if (!found_xgnuped) {
        fprintf(stderr, "[boot_validator] WARNING: xGNUpeD stage not found"
                        " in boot log\n");
        /* Non-fatal in prototype */
    }

    return 0;
}

void boot_policy_dump(const boot_policy_t *policy)
{
    if (!policy) return;
    printf("\n=== Boot Policy ===\n");
    printf("Version:       %u\n", policy->policy_version);
    printf("Deny unknown:  %s\n", policy->deny_unknown ? "yes" : "no");
    printf("Allowed (%u):\n", policy->n_binaries);
    for (uint32_t i = 0; i < policy->n_binaries; i++)
        printf("  %s\n", policy->binaries[i].path);
    printf("===================\n\n");
}
