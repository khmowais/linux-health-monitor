#!/bin/bash
# Linoox health monitoring script


set -euo pipefail

#Config
LOG_DIR="./logs"
LOG_FILE="$LOG_DIR/health-$(date '+%Y-%m-%d').log"
TOP_N=5

mkdir -p "$LOG_DIR"

#Metrics
DATE_STR=$(date '+%Y-%m-%d %H:%M:%S')
UPTIME=$(uptime -p)
LOAD_AVG=$(awk '{print $1, $2, $3}' /proc/loadavg)
MEMORY_USAGE=$(free -m | awk 'NR==2 {printf "%sMB/%sMB", $3, $2}')
DISK_USAGE=$(df -h / | awk 'NR==2 {printf "%s/%s (%s used)", $3, $2, $5}')

#Top procs
TOP_CPU=$(ps -eo comm,%cpu,%mem --sort=-%cpu | head -n $((TOP_N+1)) | tail -n $TOP_N | awk '{printf "%s(CPU:%s%% MEM:%s%%), ", $1,$2,$3}')
TOP_MEM=$(ps -eo comm,%cpu,%mem --sort=-%mem | head -n $((TOP_N+1)) | tail -n $TOP_N | awk '{printf "%s(CPU:%s%% MEM:%s%%), ", $1,$2,$3}')

#Logging
echo "Health checked at: $DATE_STR *******************" >> "$LOG_FILE"
echo "Uptime: $UPTIME | Load: $LOAD_AVG | Memory: $MEMORY_USAGE | Disk: $DISK_USAGE" >> "$LOG_FILE"
echo "Top $TOP_N Processes by CPU: $TOP_CPU" >> "$LOG_FILE"
echo "Top $TOP_N Processes by MEM: $TOP_MEM" >> "$LOG_FILE"

# NOTE: I intentionally didnt perform network check as i believe:
#1- Pinging untrusted servers is unnecessary for local system health monitoring
#2- I dont trust sending UNNESSARY traffic to external servers (especially google) without explicit user consent
#3- What if the network is accidently unmasked?
#4- Users who need network monitoring should configure their own trusted servers
