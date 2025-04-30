#!/bin/bash

SOURCE_DIR="$HOME/Documents"
DEST_DIR="$HOME/backup"
LOG_FILE="$HOME/Capstone_5/logs/backup.log"
mkdir -p "$(dirname "$LOG_FILE")"

echo "$(date '+%Y-%m-%d %H:%M:%S') - Starting backup..." | tee -a "$LOG_FILE"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory $SOURCE_DIR does not exist. Creating it." | tee -a "$LOG_FILE"
    mkdir -p "$SOURCE_DIR"
fi

mkdir -p "$DEST_DIR"

BACKUP_FILE="$DEST_DIR/backup_$(date +%Y%m%d_%H%M%S).tar.gz"
if tar -czf "$BACKUP_FILE" "$SOURCE_DIR" 2>>"$LOG_FILE"; then
    echo "✅ Backup successful: $BACKUP_FILE" | tee -a "$LOG_FILE"
else
    echo "❌ Backup failed. Check logs." | tee -a "$LOG_FILE"
fi
