#ifndef EARLY_COMM_H
#define EARLY_COMM_H

#include "host_identity.h"

/* =========================================================
 * maGNUx — Kommu services prototype v0.1
 * early_comm.h
 *
 * Minimal inter-stage communication channel.
 * Establishes the earliest form of COMM stratum:
 * a shared memory region that allows boot stages to
 * communicate without relying on userspace IPC.
 * ========================================================= */

#define EARLY_COMM_PATH     "/dev/shm/magnux-early-comm"
#define EARLY_COMM_MAGIC    0x4B4F4D4D   /* "KOMM" */

typedef enum {
    MSG_IDENTITY_READY   = 0x01,  /* xGNUpeD → Dernel */
    MSG_POLICY_LOADED    = 0x02,  /* Dernel runtime → Dernel guest */
    MSG_HOST_STABLE      = 0x03,  /* Dernel runtime → all */
    MSG_GUEST_LICENSED   = 0x04,  /* Dernel guest → Trilobytes */
    MSG_BOOT_COMPLETE    = 0xFF   /* final signal */
} comm_msg_type_t;

typedef struct {
    uint32_t        magic;
    uint32_t        version;
    comm_msg_type_t last_msg;
    uint8_t         stage_flags;  /* bitmask of completed stages */
    char            identity_path[256]; /* where host_identity_t is stored */
    uint32_t        reserved[8];
} early_comm_t;

/*
 * Initialize the early comm channel.
 * Creates the shared region.
 */
int early_comm_init(early_comm_t *comm);

/*
 * Send a message to the next stage.
 */
int early_comm_send(early_comm_t *comm, comm_msg_type_t msg);

/*
 * Mark a boot stage as complete.
 */
void early_comm_stage_done(early_comm_t *comm, boot_stage_t stage);

/*
 * Persist the comm structure to EARLY_COMM_PATH.
 */
int early_comm_persist(const early_comm_t *comm);

/*
 * Load an existing comm structure.
 */
int early_comm_load(early_comm_t *comm);

/*
 * Check if a stage has completed.
 */
int early_comm_stage_done_check(const early_comm_t *comm, boot_stage_t stage);

#endif /* EARLY_COMM_H */
