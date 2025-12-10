# Linux Health Monitor

A shell based system health monitoring tool that logs system performance metrics including CPU load, memory usage, disk consumption, top processes and network reachability. Designed for basic Linux administration and system diagnostics.

## Features
- CPU usage and load average
- Memory usage
- Disk usage
- Top processes by CPU and Memory
- Ping network check
- Daily timestamped logs
- Cron based scheduling

## Run manually
./monitor.sh

## Schedule (cron)
*/10 * * * * /path/to/monitor.sh

## Logs
stored in logs/ directory
