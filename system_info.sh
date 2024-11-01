#!/bin/bash

# Define Thresholds
CPU_THRESHOLD=80       # Trigger log if CPU usage exceeds 80%
RAM_THRESHOLD=80       # Trigger log if RAM usage exceeds 80%
DISK_THRESHOLD=80      # Trigger log if Disk usage exceeds 80%

# Define the log file to store data
LOG_FILE="system_usage_log.txt"
echo "System Resource Analyzer Log" > $LOG_FILE
echo "Timestamp, CPU(%), RAM(%), Disk(%)" >> $LOG_FILE

get_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    echo "$cpu_usage"
}

get_ram_usage() {
    ram_total=$(free | grep Mem | awk '{print $2}')
    ram_used=$(free | grep Mem | awk '{print $3}')
    ram_usage=$((ram_used * 100 / ram_total))
    echo "$ram_usage"
}

get_disk_usage() {
    disk_usage=$(df / | grep / | awk '{print $5}' | sed 's/%//')
    echo "$disk_usage"
}

monitor_resources() {
    cpu=$(get_cpu_usage)
    ram=$(get_ram_usage)
    disk=$(get_disk_usage)
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")

    echo "$timestamp, CPU: $cpu%, RAM: $ram%, Disk: $disk%"

    if (( $(echo "$cpu > $CPU_THRESHOLD" | bc -l) || $ram > $RAM_THRESHOLD || $disk > $DISK_THRESHOLD )); then
        echo "$timestamp, CPU: $cpu%, RAM: $ram%, Disk: $disk%" >> $LOG_FILE
    fi
}

while true; do
    monitor_resources
    sleep 10
done

