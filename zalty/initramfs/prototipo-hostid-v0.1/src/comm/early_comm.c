/*
 * maGNUx — Kommu services prototype v0.1
 * early_comm.c
 */

#include "early_comm.h"

#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>

int early_comm_init(early_comm_t *comm)
{
    if (!comm) return -1;
    memset(comm, 0, sizeof(*comm));
    comm->magic   = EARLY_COMM_MAGIC;
    comm->version = 1;
    comm->last_msg = 0;
    comm->stage_flags = 0;
    strncpy(comm->identity_path, "/dev/shm/magnux-host-identity",
            sizeof(comm->identity_path) - 1);
    return 0;
}

int early_comm_send(early_comm_t *comm, comm_msg_type_t msg)
{
    if (!comm) return -1;
    comm->last_msg = msg;
    return early_comm_persist(comm);
}

void early_comm_stage_done(early_comm_t *comm, boot_stage_t stage)
{
    if (!comm) return;
    comm->stage_flags |= (1 << (uint8_t)stage);
}

int early_comm_persist(const early_comm_t *comm)
{
    if (!comm) return -1;
    int fd = open(EARLY_COMM_PATH, O_WRONLY | O_CREAT | O_TRUNC, 0600);
    if (fd < 0) return -1;
    ssize_t w = write(fd, comm, sizeof(*comm));
    close(fd);
    return (w == (ssize_t)sizeof(*comm)) ? 0 : -1;
}

int early_comm_load(early_comm_t *comm)
{
    if (!comm) return -1;
    int fd = open(EARLY_COMM_PATH, O_RDONLY);
    if (fd < 0) return -1;
    ssize_t n = read(fd, comm, sizeof(*comm));
    close(fd);
    if (n != (ssize_t)sizeof(*comm)) return -1;
    return (comm->magic == EARLY_COMM_MAGIC) ? 0 : -1;
}

int early_comm_stage_done_check(const early_comm_t *comm, boot_stage_t stage)
{
    if (!comm) return 0;
    return (comm->stage_flags & (1 << (uint8_t)stage)) ? 1 : 0;
}
