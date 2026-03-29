# Day 04 – Linux Practice: Processes and Services

## 🔹 Process Commands

### 1. `pgrep -a sshd`

**Explanation:**  
Lists all running processes related to `sshd`(SSH server daemon) the background service that listens for incoming SSH connections, including the main listener and each active SSH session. `-a` shows both their Process IDs (PIDs) and their full command-line arguments. 

**Observations from output:**
- `994` → main SSH daemon (listener)
- `1313` → privileged SSH processes
- `1400` → active user sessions (`pts/0`)

📸 Output:
![pgrep sshd ](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-04/pgrep.png)

---

### 2. `ps aux | grep sshd`

**Explanation:**  
Shows detailed resource usage and ownership of SSH daemon and session processes.

**Observations from output:**
- SSH daemon runs as `root`
- User sessions run as `ubuntu`
- Multiple sessions create multiple `sshd` processes (normal behavior)
- privileged SSH processes run as root 

📸 Output:
![ps aux sshd](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-04/grep.png)

---

## 🔹 Service Commands

### 3. `systemctl status ssh`

**Explanation:**  
Displays the health, uptime, and recent activity of the SSH service managed by systemd.

**Observations from output:**
- SSH is active (running)
- Listening on port 22
- EC2 Instance Connect is providing SSH keys
- Successful public key authentication

📸 Output:
![ssh service status](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-04/sshstatus.png)

---

### 4. `systemctl list-units --type=service --state=running`

**Explanation:**  
Lists all currently running system services, confirming overall system health.

**Observations from output:**
- `ssh.service` is running
- Core services (`cron`, `systemd-journald`, `networkd`) are active
- Instance is stable

📸 Output:
![running services](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-04/systemctl-list.png)

---

## 🔹 Log Commands

### 5. `journalctl -u ssh -n 20`

**Explanation:**  
Shows the latest SSH service logs, including service startup and authentication events.

**Observations from output:**
- SSH service startup
- Port 22 listening
- Accepted public key logins from real IPs
- Session creation events

📸 Output:
![ssh journal logs](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-04/journalctl.png)

---

### 6. `tail -n 20 /var/log/auth.log`

**Explanation:**  
Displays the most recent authentication and authorization activity on the system.

**Observations from output:**
- SSH session opened for user `ubuntu`
- `sudo` command activity logged
- `cron` jobs running as root
- Clear audit trail for security monitoring

📸 Output:
![auth logs](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-04/auth.png)

---

## ✅ Key Learnings

- SSH creates multiple processes per user session
- AWS EC2 uses key-based SSH authentication
- `systemctl` is used to inspect and manage services
- Logs (`journalctl`, `auth.log`) are essential for troubleshooting and security auditing