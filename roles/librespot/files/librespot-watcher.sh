#!/bin/bash

# Get the last 25 lines from journal (fix variable assignment)
journal_last_25_lines=$(journalctl --user -u librespot.service -r -n 25 --output cat --no-pager)

if [[ $journal_last_25_lines == *"thread 'tokio-runtime-worker' panicked"* ]]; then
    echo "Librespot service has crashed with tokio-runtime-error restarting it..."
    systemctl --user restart librespot.service
fi

# Get the last log entry's timestamp
last_log_timestamp=$(journalctl --user -u librespot.service -r -n 1 --output=short-iso | head -n 1 | awk '{print $1}')

if [ -z "$last_log_timestamp" ]; then
    echo "No log entries found for librespot service"
    exit 0
fi

# Get current timestamp
current_timestamp=$(date +"%Y-%m-%dT%H:%M:%S")

# Convert timestamps to seconds since epoch
last_log_seconds=$(date -d "$last_log_timestamp" +%s)
current_seconds=$(date -d "$current_timestamp" +%s)

# Calculate difference in minutes
time_diff_minutes=$(( (current_seconds - last_log_seconds) / 60 ))

# Check if the difference is greater than 90 minutes
if [ $time_diff_minutes -gt 90 ]; then
    echo "Last librespot log entry is $time_diff_minutes minutes old (more than 90 minutes). Restarting service..."
    systemctl --user restart librespot.service
else
    echo "Last librespot log entry is $time_diff_minutes minutes old. No restart needed."
fi