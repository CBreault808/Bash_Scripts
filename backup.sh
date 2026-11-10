#!/bin/bash

# --- DEFINE SOURCE AND DESTINATION PATHS ---
SOURCE="/home"
DEST_DIR="/mnt/backup"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$DEST_DIR/home_backup_$TIMESTAMP.tar.gz"


# --- CHECK IF BACKUP DESTINATION EXISTS ---
if [ ! -d "$DEST_DIR" ]; then
    echo "Error: Backup directory $DEST_DIR does not exist. Is the disk mounted?"
    exit 1
fi 

echo "Starting backup of $SOURCE to $BACKUP_FILE..."

# --- RUN TAR TO CREATE A G-ZIPPED ARCHIVE ---
# -c: create a new archive
# -z: compress the archive using gzip
# -f: use archive file
# Errors are routed to a log file in the destination directory instead of being destroyed
tar -czf "$BACKUP_FILE" "$SOURCE" 2>"$DEST_DIR/backup_log.txt"

# --- VERIFY IF THE BACKUP COMMAND SUCCEEDED ---
# tar exit code 0 = successful backup
# tar exit code 1 = minor warnings
if [ $? -eq 0 ] || [ $? -eq 1 ]; then
    echo "Backup completed successfully!"
    echo "Archive size: $(du -sh "$BACKUP_FILE" | cut -f1)"
else 
    echo "Backup failed. Please check permissions or available disk space."
    echo "See $DEST_DIR/backup_log.txt for error details."
fi 
