#!/bin/bash

LOG_FILE="$HOME/Capstone_5/logs/update_cleanup.log"
mkdir -p "$(dirname "$LOG_FILE")"

echo "$(date '+%Y-%m-%d %H:%M:%S') - System update started." | tee -a "$LOG_FILE"

{
    sudo apt update &&
    sudo apt upgrade -y &&
    sudo apt autoremove -y &&
    sudo apt autoclean
} >>"$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    echo "✅ System update and cleanup completed successfully." | tee -a "$LOG_FILE"
else
    echo "❌ Update or cleanup failed. Check logs." | tee -a "$LOG_FILE"
fi
