#!/bin/bash

LOG_FILE="$HOME/Capstone_5/logs/log_monitor.log"
mkdir -p "$(dirname "$LOG_FILE")"
SCAN_LOG="/tmp/log_alerts.txt"
> "$SCAN_LOG"

KEYWORDS=("error" "fail" "critical")
SOURCE_LOG="/var/log/dpkg.log"

echo "🔍 Scanning system logs for issues..." | tee -a "$LOG_FILE"
echo "$(date '+%Y-%m-%d %H:%M:%S') - Log scan started." >> "$LOG_FILE"

for keyword in "${KEYWORDS[@]}"; do
    grep -i "$keyword" "$SOURCE_LOG" >> "$SCAN_LOG"
done

if [[ -s "$SCAN_LOG" ]]; then
    echo "🚨 Critical issues found in system logs!" | tee -a "$LOG_FILE"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Critical issues found:" >> "$LOG_FILE"
    cat "$SCAN_LOG" | tee -a "$LOG_FILE"
else
    echo "✅ No critical issues found in system logs." | tee -a "$LOG_FILE"
fi
