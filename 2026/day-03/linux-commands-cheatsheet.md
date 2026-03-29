## Day 03 – Linux Commands Practice

### Linux Command Cheat Sheet

### ⚙️ Process Management
- **Manage system resources, view running tasks, and control process execution.**

| Command      | Usage Example  | Description                                                        |
| :-------------| :-------------  | :-------------------------------------------------------------------|
| **`ps`**  | `ps aux`       | Displays a detailed snapshot of all currently running processes.   |
| **`top`** | `top`          | Shows real-time system statistics and a dynamic list of processes. |
| **`htop`** | `htop` | An interactive, colorful process viewer. |
| **`kill`** | `kill 1234` | Terminates the process with PID `1234`. |
| **`killall`** | `killall firefox` | Kills all processes named "firefox". |
| **`pkill`** | `pkill -u user` | Signals processes based on name or other attributes (e.g., specific user). |
| **`bg`** | `bg %1` | Resumes a suspended job in the background. |
| **`fg`** | `fg %1` | Brings a background job to the foreground. |
| **`systemctl/ journalctl`**|`systemctl status nginx` / `journalctl -xe` |`systemctl` manages system services; `journalctl` views system logs. |

### 📂 File System
- **Navigate directories, manipulate files, and manage permissions.**

| Command | Usage Example | Description |
| :--- | :--- | :--- |
| **`ls`** | `ls -lah` | Lists directory contents with details, including hidden files. |
| **`pwd`**|`pwd` | Prints the current working directory path. |
| **`cp/ mv/ rm`**| `cp file1.txt /tmp/` / `mv file1.txt file2.txt` / `rm file1.txt` | Copy, move/rename, and delete files or directories.|
| **`awk`** | `awk '{print $1}' file.txt` | Pattern scanning and processing tool for text/data extraction. |
| **`find`**|`find /home -name file.txt`|Searches for files/directories in a directory hierarchy. |
| **`grep`**|`grep "error" logfile.txt`| Searches for patterns in files or output.|
| **`chown`**| `chown user:group file.txt`| Changes file owner and group ownership.| 
| **`wc -l`**|`wc -l file.txt` | Counts the number of lines in a file.|
| **`mkdir`**| `mkdir new_folder`| Creates a new directory.|
| **`sed`**| `sed 's/old/new/g' file.txt`| Stream editor for modifying text in files.|
| **`apt/ apt-get`**|`apt update && apt install nginx `| Package management tool for installing/updating software.|
| **`touch/ vim/ cat`**|`touch file.txt` / `vim file.txt` / `cat file.txt` | Create empty files, edit files, and display file contents.|

### 👤 User Management 
- **Create, modify, and manage users and groups, including permissions and access control.**

| Command | Usage Example | Description |
| :--- | :--- | :--- |
| **`whoami`**|`whoami` | Displays the current logged-in username.|
| **`useradd/ usermod`**|`useradd john` /` usermod -aG sudo john`| Creates a new user / modifies existing user properties.|
| **`groupadd`**| `groupadd developers`|Creates a new user group. |


### 💾 Storage / Disk Management
- **Handle disk partitions, filesystems, mounting, and logical volume management (LVM).**

| Command | Usage Example | Description |
| :--- | :--- | :--- |
| **`mkfs.ext4/ mkfs -t ext4`**|`mkfs.ext4 /dev/sdb1` |Formats a partition with the ext4 filesystem. |
| **`lsblk`**|`lsblk` | Lists information about block devices (disks, partitions).|
| **`df -h`**| `df -h`| Shows disk space usage in human-readable format.|
| **`mount`**|`mount /dev/sdb1 /mnt`|Mounts a filesystem to a directory. |
| **`/mnt/fstab`**|`vim /etc/fstab`| Configuration file for automatically mounting filesystems at boot.|
| **`pvcreate/ vgcreate/ lvcreate`**| `pvcreate /dev/sdb1`|Creates physical, volume group, and logical volumes for LVM. |
| **`vgdisplay/ lvdisplay`**|`vgdisplay` / `lvdisplay` |Displays information about volume groups and logical volumes (LVM). |

### 🌐 Networking Troubleshooting
- **Diagnose connectivity issues, check configurations, and transfer data.**

| Command | Usage Example | Description |
| :--- | :--- | :--- |
| **`ip addr`** | `ip addr show` | Displays IP addresses and network interface properties. |
| **`ping`** | `ping -c 4 google.com` | Checks connectivity to a host by sending ICMP echo requests. |
| **`curl`** | `curl -I https://example.com` | Transfers data from or to a server; `-I` fetches headers only. |
| **`dig`** | `dig google.com` | DNS lookup utility to query DNS name servers. |
| **`traceroute`** | `traceroute google.com` | Traces the route packets take to a network host. |
| **`nslookup`** | `nslookup google.com` | Queries DNS servers to resolve domain names to IP addresses.|
