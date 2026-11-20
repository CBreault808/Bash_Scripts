#!/bin/bash


# Define the log file path for tracking update history
LOG_FILE="/var/log/proxmox_auto_update.log"

# Record the exact start time of the maintenance run
echo "=== Update started at $(date) ===" >> "$LOG_FILE"

# Refresh local package index from configured repositories (pve-no-subscription)
apt-get update >> "$LOG_FILE" 2>&1

# Perform a full distribution upgrade non-interactively to handle Proxmox kernel/dependency changes
DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y >> "$LOG_FILE" 2>&1

# Remove orphaned dependencies and old unused packages to conserve root disk space
apt-get autoremove -y >> "$LOG_FILE" 2>&1

# Check if the system generated the reboot-required flag (e.g., after a kernel update)
if [ -f /var/run/reboot-required ]; then
    echo "!!! REBOOT REQUIRED: A kernel or core system update was installed !!!" >> "$LOG_FILE"
    # Broadcast a live terminal alert to any active SSH/console sessions
    wall "NOTICE: Proxmox updates finished and a REBOOT is required."
fi

# Record the completion timestamp
echo "=== Update finished at $(date) ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
