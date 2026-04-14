# Day 05 – Linux Troubleshooting Drill: CPU, Memory, and Logs

## Target Service / Process

* **Service:** Docker (docker.service)
* **Daemon PID:** 3943
* **Status:** Active / Running

![docker_process](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-05/ps.png)

## Snapshot: CPU & Memory

* **CPU usage:** 0.0% 
* **Memory usage:** 3.1% of total RAM

![cpu_memory](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-05/ps.png)

## Snapshot: Disk & I/O

* **Root filesystem usage:** 18% (2.4G used of 14G)
* **/var/log size:** 67M

![disk](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-05/cpu_mem.png)

## Snapshot: Network

* **Docker socket:** No TCP ports found for Docker daemon (`dockerd`) — since it uses a Unix socket
* **Container connectivity:** `/ping` endpoint returns HTTP 200 OK

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