#!/bin/bash

LOG_FILE="$HOME/Capstone_5/logs/maintenance_suite.log"
mkdir -p "$(dirname "$LOG_FILE")"

while true; do
    echo ""
    echo "===== System Maintenance Menu ====="
    echo "1. Backup Files"
    echo "2. System Update and Cleanup"
    echo "3. Monitor System Logs"
    echo "4. Exit"
    echo "==================================="
    read -p "Enter your choice: " choice

    case $choice in
        1) echo "$(date '+%Y-%m-%d %H:%M:%S') - User selected Backup" >> "$LOG_FILE"
           bash backup.sh ;;
        2) echo "$(date '+%Y-%m-%d %H:%M:%S') - User selected System Update" >> "$LOG_FILE"
           bash update_cleanup.sh ;;
        3) echo "$(date '+%Y-%m-%d %H:%M:%S') - User selected Log Monitor" >> "$LOG_FILE"
           bash log_monitor.sh ;;
        4) echo "$(date '+%Y-%m-%d %H:%M:%S') - User exited the suite." >> "$LOG_FILE"
           echo "👋 Exiting Maintenance Suite. Goodbye!" ; exit ;;
        *) echo "❗ Invalid option, please try again." | tee -a "$LOG_FILE" ;;
    esac
done
