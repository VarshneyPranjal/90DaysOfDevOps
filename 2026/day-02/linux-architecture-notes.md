## Day 02 – Linux Architecture, Processes, and systemd

### Goal - Understand how Linux works under the hood

#### Q1. Core components of Linux (kernel, user space, init/systemd) ?
Answer: 
`Kernel` - kernel is the heart of the Operating System. It helps users or applications to communicate to Operating System using Shell commands. Kernel is written in some programming language like C so it understands things in binary form i.e. 0s and 1s which for a human was not easy to learn. So, human or user communicate to kernel using shell commands and then kernel perform tasks to OS. 

`User Space` - It is the place where applications or users exist. this is the top most layer of OS architecture. 

``init\systemd``- Its the first command that runs on our Operating System after boot and so its PID is 1. 

#### Q2. How processes are created and managed ?
Answer: 
In Linux, processes are created and managed by the kernel which assigns a unique Process ID (PID).The Linux kernel manages processes by scheduling them for CPU time and allocating resources, while users and administrators can interact with and control these processes using various command-line tools.

#### Q3. What systemd does and why it matters ?
Answer:
Systemd acts as the "conductor" of the operating system after the kernel loads. Its core responsibilities include Init System (PID 1): Starts and manages system processes and daemons.It starts, manages, and supervises background processes (services).
It matters because it provides consistent service management (`systemctl`), logging (`journald`), and dependency handling across Linux.

#### Q4. Explain **process states** (running, sleeping, zombie, etc.) ?
Answer: 
A process moves through different states during its lifecycle: 

`Running (R)`: The process is either currently executing on the CPU or is ready to run.

`Sleeping (S)`: The process is paused, waiting for an event or resource (like I/O completion).

`Stopped (T)`: The process has been paused, usually by a user or a signal (e.g., Ctrl+Z).

`Zombie (Z)`: The process has finished execution, but its entry still remains in the process table until the parent process reads its exit status. 

#### Q5. List **5 commands** you would use daily (`ps`, `top`, `systemctl`)
Answer:
* `systemctl (Management/Monitoring)`

Usage: systemctl status <service>, systemctl restart <service>

Why Daily: Essential for checking if services (Nginx, Apache, Docker) are running, stopping them, or restarting them after configuration changes.

* `top (Monitoring)`
Usage: top (or htop)

Why Daily: Provides a real-time, dynamic view of CPU, RAM, and process activity to quickly identify system bottlenecks or rogue processes.
* `ps (Process Management)`

Usage: ps aux | grep <process_name>

Why Daily: Captures a snapshot of running processes, allowing administrators to find specific Process IDs (PIDs) and confirm if an application is running.
* `tail (Log Monitoring)`

Usage: tail -f /var/log/syslog or tail -f /var/log/nginx/error.log

Why Daily: Used to follow log files in real-time to troubleshoot application errors, website downtime, or security issues as they happen.
* `journalctl (Log Analysis)`

Usage: journalctl -u <service_name> or journalctl -xe

Why Daily: In systemd-based systems, this is the primary tool for querying and viewing logs from services and the kernel, enabling deep troubleshooting