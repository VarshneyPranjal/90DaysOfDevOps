## Quick Concepts 
### OSI layers (L1–L7) vs TCP/IP stack (Link, Internet, Transport, Application)

| No. | OSI Layer  | TCP/IP Layer | Protocols |
|--------------|------------------|------------------|--------------------------|
| 7 | Application | Application | HTTP, HTTPS, FTP, SMTP, DNS |
| 6 | Presentation | Application | SSL/TLS, Encryption, Compression |
| 5 | Session | Application | Session Management |
| 4 | Transport | Transport | TCP, UDP |
| 3 | Network | Internet | IP, Route, ICMP, IPSec |
| 2 | Data Link | Network Access | Ethernet, ARP, VLAN, MAC Address |
| 1 | Physical | Network Access | Cables, NIC, Signals |

#### Where **IP**, **TCP/UDP**, **HTTP/HTTPS**, **DNS** sit in the stack
1. IP Protocol comes under Internet layer of TCP/IP Model.
2. TCP/UDP Protocols comes under Transport layer of TCP/IP Model.
3. HTTP/HTTPS Protocols comes under Application layer of TCP/IP Model.
4. DNS Protocol comes under Application layer of TCP/IP Model.

#### One real example: “`curl https://example.com`= App layer over TCP over IP”

- Layer 7 (Application): curl creates the HTTP request (GET /index.html).
- Layer 6 (Presentation): Encrypts the data with SSL/TLS (Locked box).
- Layer 5 (Session): Adds Session ID to manage the conversation.
- Layer 4 (Transport): Wraps in TCP for reliability (Port 54321 -> 443).
- Layer 3 (Network): Adds IP addressing (Src: 192.168.1.100 -> Dst: 93.184.216.43).
- Layer 2 (Data Link): Adds MAC addresses for the local router.
- Layer 1 (Physical): Converts data to electrical signals/radio waves to travel the wire.s1s3

## Hands-on Checklist (run these; add 1–2 line observations)
-  **Identity:** `hostname -I` (or `ip addr show`)

    `hostname -i` provides `172.31.7.81` private IPv4 address, quickly display the IP address(es) associated with the system's hostname entry.

    `ip addr show` provides a verbose and detailed output for all network interfaces on the system, including the loopback interface, even if they are down. The below output includes:
     1. Interface name (e.g., eth0, wlan0, lo).
     2. MAC address (link/ether).
     3. Interface status flags (e.g., UP, LOWER_UP).
     4. MTU (Maximum Transmission Unit).
     5. IPv4 (inet) and IPv6 (inet6) addresses, along with subnet masks (scope and brd information).

    ![hostname-i](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-14/hostname_i.png)

    And so, the primary IP address(inet) for my network interface (ens5) is `172.31.7.81` with a subnet mask of `/20`.

- **Reachability:** `ping <target>` — mention latency and packet loss.

  ```
  --- google.com ping statistics ---
  93 packets transmitted, 93 received, 0% packet loss, time 92092ms
  ```

- **Path:** `traceroute <target>` (or `tracepath`) — note any long hops/timeouts.

  Successfully reached the destination at hop 20, despite a block of timeouts (* * *) on hops 11-29 caused by network security filtering.

  ![hostname-i](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-14/traceroute.png)

- **Ports:** `ss -tulpn` (or `netstat -tulpn`) — list one listening service and its port.

  SSH is listening on port 22 (on 0.0.0.0, meaning it accepts outside connections),and the local DNS resolver is listening on port 53 (on 127.0.0.53, for internal system use only)

  ![hostname-i](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-14/tulpn.png)

- **Name resolution:** `dig <domain>` or `nslookup <domain>` — record the resolved IP.

  The DNS query returned status: NOERROR and successfully resolved google.com to 6 IP addresses: 
  `142.251.179.102, 142.251.179.101, 142.251.179.138, 142.251.179.113, 142.251.179.100, 142.251.179.139.`

  ![hostname-i](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-14/dig.png)

- **HTTP check:** `curl -I <http/https-url>` — note the HTTP status code.
  Received HTTP/1.1 status 301 (Moved Permanently), indicating the server is redirecting the request to http://www.google.com/

  ![hostname-i](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-14/curl.png)

- **Connections snapshot:** `netstat -an | head` — count ESTABLISHED vs LISTEN (rough).

  Captured 1 ESTABLISHED connection on port 22 (the active SSH session) and multiple ports in LISTEN state.

  ![hostname-i](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-14/netstat.png)

## Mini Task: Port Probe & Interpret
1) Identify one listening port from `ss -tulpn` (e.g., SSH on 22 or a local web app).  

![hostname-i](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-14/tulpn.png)

2) From the same machine, test it: `nc -zv localhost <port>` (or `curl -I http://localhost:<port>`).  
```
ubuntu@ip-172-31-7-81:~$ nc -zv localhost 22
Connection to localhost (127.0.0.1) 22 port [tcp/ssh] succeeded!
```

3) Write one line: is it reachable? If not, what’s the next check? (e.g., service status, firewall).
  - yes, its reachable. 
  - If not reachable: Next steps would be checking service status (systemctl status ssh) or firewall rules.

## Reflection (add to your markdown)
- Which command gives you the fastest signal when something is broken?   ```ping```

- What layer (OSI/TCP-IP) would you inspect next if DNS fails? If HTTP 500 shows up?

  **If DNS Fails**
    - OSI: Layer 7 (Application)
    - TCP-IP: Application layer

    - Reason:
      - DNS is an application-layer protocol
      - Common issues include resolver misconfiguration,DNS service failure,or invalid records
      - If unresolved,move to:`Transport layer`

  **If HTTP 500 Shows Up**
  - OSI: Layer 7 (Application)
  - TCP-IP: Application layer

  - Reason:
    - TCP connection succeeded
    - Request reached the server
    - HTTP 500 indicates a server-side,application error,not a network issue

- Two follow-up checks you’d run in a real incident.

  1. DNS Troubleshooting
  ```bash
  cat /etc/resolv.conf
  dig google.com
  ```

  2. HTTP 500 Troubleshooting
  ```bash
  tail -f application.log
  systemctl status <web-service>
  ```