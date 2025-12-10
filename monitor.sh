#!/bin/bash
#echo "linux health monitor script is working"
LOG_FILE="$(pwd)/logs/health-$(date '+%Y-%m-%d').log"
echo "Health check at: $(date)" >> "$LOG_FILE"


# CPU load averages
LOAD_AVG=$(uptime | awk -F 'load average: ' '{print $2}')

# Memory usage (used / total)
MEMORY_USAGE=$(free -h | awk 'NR==2 {print $3 "/" $2}')

# Disk usage for root filesystem
DISK_USAGE=$(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 " used)"}')

{
  echo "Uptime:       $(uptime -p)"
  echo "Load average: $LOAD_AVG"
  echo "Memory:       $MEMORY_USAGE"
  echo "Disk (/):     $DISK_USAGE"
  echo
} >> "$LOG_FILE"

# Top 5 processes by CPU usage
TOP_CPU=$(ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6)

{
  echo "Top 5 processes by CPU:"
  echo "$TOP_CPU"
  echo
} >> "$LOG_FILE"

# Top 5 processes by CPU usage
TOP_CPU=$(ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6)

{
  echo "Top 5 processes by CPU:"
  echo "$TOP_CPU"
  echo
} >> "$LOG_FILE"

# Top 5 processes by Memory usage
TOP_MEM=$(ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6)

{
  echo "Top 5 processes by Memory:"
  echo "$TOP_MEM"
  echo
} >> "$LOG_FILE"

# Simple network reachability check (Google DNS)
PING_RESULT=$(ping -c 2 8.8.8.8 2>/dev/null | tail -n 2)

{
  echo "Ping check (8.8.8.8):"
  echo "$PING_RESULT"
  echo
  echo "----------------------------------------------"
  echo
} >> "$LOG_FILE"
