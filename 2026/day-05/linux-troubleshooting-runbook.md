# Day 05 – Linux Troubleshooting Drill: CPU, Memory, and Logs

---

## Guidelines
Follow these rules while creating your runbook:

- Run and record output for **at least 8 commands** (save snippets in your runbook)  
  - **Environment basics (2):** `uname -a`, `lsb_release -a` (or `cat /etc/os-release`)  
  - **Filesystem sanity (2):** create a throwaway folder and file, e.g., `mkdir /tmp/runbook-demo`, `cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo`  
  - **CPU / Memory (2):** `top`/`htop`/`ps -o pid,pcpu,pmem,comm -p <pid>`, `free -h`, `vm_stat` (mac)  
  - **Disk / IO (2):** `df -h`, `du -sh /var/log`, `iostat`/`vmstat`/`dstat`  
  - **Network (2):** `ss -tulpn`/`netstat -tulpn`, `curl -I <service-endpoint>`/`ping`  
  - **Logs (2):** `journalctl -u <service> -n 50`, `tail -n 50 /var/log/<file>.log`
- Choose **one target service/process** (e.g., `ssh`, `cron`, `docker`, your web app) and stick to it for the drill.
- For each command, add a 1–2 line note on what you observed (e.g., “CPU spikes to 80% when restarting”, “No recent errors in last 50 lines”).
- End with a **“If this worsens”** section listing 3 next steps you would take (ex: restart strategy, increase log verbosity, collect `strace`).
- Keep it concise and actionable (aim for ~1 page).

Suggested structure for `linux-troubleshooting-runbook.md`:
- Target service / process
- Snapshot: CPU & Memory
- Snapshot: Disk & IO
- Snapshot: Network
- Logs reviewed
- Quick findings
- If this worsens (next steps)

---

## Target Service / Process

* **Service:** systemd (`systemd.service`)
* **Daemon PID:** 1
* **Status:** Active / Running

![docker_process](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-05/ps.png)

## Snapshot: CPU & Memory

* **CPU usage:** 0.3% 
* **Memory usage:** 1.4% of total RAM

![cpu_memory](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-05/ps.png)

## Snapshot: Disk & I/O

* **Root filesystem usage:** 18% (2.4G used of 14G)
* **/var/log size:** 67M

![disk](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-05/cpu_mem.png)

## Snapshot: Network

* **Docker socket:** TCP ports found for systemd (`systemd`)
* **Container connectivity:** No container exist. `/ping` endpoint returns "(curl: 1) Received HTTP/0.9 when not allowed"

![network](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-05/network.png)

## Logs Reviewed

* Docker startup logs: Daemon initialized successfully, API listening on socket.
* Images pulled (`nginx:latest`, `httpd:latest`), containers attached to networks.

![logs](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-05/logs.png)

## Quick Findings

* Docker daemon stable and running.
* System resources (CPU, memory, disk) healthy.
* Container networking working as expected.
* No major errors in logs affecting service operation.

## If This Worsens

1. **Monitor & Limit Resources:** Use `docker stats` and set CPU/memory limits on containers.
2. **Investigate Logs:** Check `journalctl -u docker -f` and `docker logs <container-id>` for errors.
3. **Restart / Scale Services:** Restart problematic containers or update services with `docker service update --force <service>`; scale nodes if needed.