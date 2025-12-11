# Linux Health Monitor

A shell based system health monitoring tool that logs system performance metrics including CPU load, memory usage, disk consumption, top processes.
Designed for basic Linux administration and system diagnostics.

## Features

* **CPU usage** and **load average**
* **Memory usage**
* **Disk usage**
* **Top processes by CPU**
* **Top processes by memory**
* **Daily timestamped logs**
* **Cron based scheduling**

## Run manually

To run the health monitor manually:

```
./monitor.sh
```

## Schedule (cron)

To schedule the script to run every 10 minutes using cron, add this line to your crontab:

```
*/10 * * * * /path/to/monitor.sh
```

## Logs

* Logs are stored in the `logs/` directory.
* Each log entry contains a timestamp, system metrics (CPU, memory, disk usage) and top processes by CPU and memory.
* Each run is logged in **4 compact lines**, with the following format:

  1. **Timestamp delimiter**
  2. **Key system metrics (uptime, load, memory, disk)**
  3. **Top processes by CPU**
  4. **Top processes by memory**

* Script now logs 4 lines per run making it easier to quickly compare logs using `tail`.
