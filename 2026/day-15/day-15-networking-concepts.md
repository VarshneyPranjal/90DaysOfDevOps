Going through these tasks, you will:
- Understand how **DNS** resolves names to IPs
- Learn **IP addressing** (IPv4, public vs private)
- Break down **CIDR notation** and **subnetting** basics
- Know common **ports** and why they matter
---
### Task 1: DNS – How Names Become IPs
#### 1. Explain in 3–4 lines: what happens when you type `google.com` in a browser?

Answer:
First the browser performs a DNS lookup to get the server IP address. Then it establishes a TCP connection using a three-way handshake. If HTTPS is used, a TLS handshake occurs to create a secure connection. The browser then sends an HTTP request to the server. The server processes the request and returns an HTTP response containing HTML, CSS, and JavaScript, which the browser renders to display the webpage.

#### 2. What are these record types? Write one line each:
   - `A`, `AAAA`, `CNAME`, `MX`, `NS`

Answer: 

- `A` - Maps a domain name to an IPv4 address (e.g., example.com → 192.168.1.1).
- `AAAA` - Maps a domain name to an IPv6 address (e.g., example.com → 2001:db8::1).
- `CNAME` - Creates an alias from one domain name to another domain name (e.g., www.example.com → example.com).
- `MX` - Specifies the mail server responsible for receiving emails for a domain.
- `NS` - Specifies the authoritative name servers responsible for a domain’s DNS records.

#### 3. Run: `dig google.com` — identify the A record and TTL from the output

Amswer: 

- A Record: `172.253.122.100`

- TTL: `71` (TTL means how long the DNS result can be cached.)

![dig](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-15/dig.png)

---
### Task 2: IP Addressing
#### 1. What is an IPv4 address? How is it structured? (e.g., `192.168.1.10`)

Answer: IPv4 address is a 32-bit numerical identifier assigned to devices on a network to enable communication. It is structured as four 8-bit decimal numbers (octets) ranging from 0 to 255, separated by dots (dotted-decimal notation) such as `192.168.1.10`. Ranging from 0.0.0.0 to 255.255.255.255 allowing for roughly 4.3 billion IPv4 addresses worldwide.

#### 2. Difference between **public** and **private** IPs — give one example of each

Answer: Public IP addresses are reachable from the internet (if network rules allow it). For example, an Amazon EC2 instance with a public IP can be accessed by users over the internet, provided that the security group and firewall rules allow incoming traffic.

Private IP addresses are used within a private network and are not directly accessible from the internet. This provides an additional layer of protection by isolating internal resources from external access. For example, in a 3-tier application architecture, a database such as MySQL is usually assigned a private IP address. This ensures that external users cannot directly access the database. However, internal services such as the frontend server or backend application can communicate with the database using its private IP within the same network. 

#### 3. What are the private IP ranges?
   - `10.x.x.x`, `172.16.x.x – 172.31.x.x`, `192.168.x.x`

Answer: Private IP addresses are reserved for internal, non-routable networks defined by RFC 1918.
Three Primary Ranges are :
10.0.0.0 – 10.255.255.255 (10.0.0.0/8)
172.16.0.0 – 172.31.255.255 (172.16.0.0/12)
192.168.0.0 – 192.168.255.255 (192.168.0.0/16)
These addresses are used in LANs, home routers, and virtual private clouds.

#### 4. Run: `ip addr show` — identify which of your IPs are private

Answer: `172.31.7.81/20, 172.31.15.255` are private IPs for my EC2 instance in a Class B target range.

![IPs](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-15/ip_add.png)

---
### Task 3: CIDR & Subnetting
#### 1. What does `/24` mean in `192.168.1.0/24`?

Answer: `/24` in `192.168.1.0/24` is **CIDR notation** that tells how many bits of the IP address are used for the network portion.

#### 2. How many usable hosts in a `/24`? A `/16`? A `/28`?

Answer: 

**Usable Hosts :**

- 254 for `/24`

- 65,534 for `/16`

- 14 for `/28`


#### 3. Explain in your own words: why do we subnet?

Answer: 
Subnetting means dividing a large network into smaller logical networks (subnets) using CIDR notation defined by Classless Inter-Domain Routing. This improves security, reduce network traffic, allows better network organization, and helps use IP addresses more efficiently.

#### 4. Quick exercise — fill in:

| CIDR |   Subnet Mask   | Total IPs | Usable Hosts |
|------|-----------------|-----------|--------------|
| /24  | 255.255.255.0   |    256    |     254      |
| /16  | 255.255.0.0     |   65,536  |   65,534     |
| /28  | 255.255.255.240 |    16     |      14      |

---
### Task 4: Ports – The Doors to Services
#### 1. What is a port? Why do we need them?

Answer: Networking ports are 16-bit logical identifiers (0–65535) used by transport layer protocols such as TCP and UDP to identify specific processes or services on a device, allowing the operating system to route incoming network traffic to the correct application.

why do we need them ? 
- Without ports, a server could only run one network service per IP address.
- Firewalls use port numbers to allow or block specific types of traffic to improve security.

#### 2. Document these common ports:

Answer: 
| Port |           Service              |
|------|--------------------------------|
| 22   | SSH (Secure remote access)     |
| 80   | HTTP (Unencrypted web traffic) |
| 443  | HTTPS (Encrypted web traffic)  |
| 53   | Domain Name System (DNS)       |
| 3306 | MySQL DB Server                |
| 6379 | Redis                          |
| 27017| MongoDB database               |

#### 3. Run `ss -tulpn` — match at least 2 listening ports to their services

Answer: 

- 22 - SSH remote login
- 53 - DNS resolver

![ss-tulpn](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-15/ss-tulpn.png)

---
### Task 5: Putting It Together
Answer in 2–3 lines each:
#### - You run `curl http://myapp.com:8080` — what networking concepts from today are involved?

Answer: 

1. **DNS:** Resolve DNS myapp.com → Provides IP

2. **TCP:** Reliable transport layer

3. **HTTP:** Application protocol

4. **Port 8080:** Directs request to specific service

#### - Your app can't reach a database at `10.0.1.50:3306` — what would you check first?

Answer: 
If app can't reach 10.0.1.50:3306:

- Check network connectivity: ping 10.0.1.50
- Check firewall rules: Ensure port 3306 is open
- Check database service: MySQL must be running and listening on 3306

### What I learned

1. ** How DNS Works and It is the Backbone of the Internet** – Domain names like google.com are translated into IP addresses enabling browsers to connect to the right server.

2. **IP Addressing, CIDR Notation, & Subnetting Organize Networks** – Understanding public vs private IPs, CIDR notation, and subnet masks helps manage networks efficiently and calculate usable hosts.

3. **Ports Direct Traffic to the Right Service** – Ports act as “doors” for applications; combined with IPs and protocols like TCP/HTTP, they ensure data reaches the correct service (e.g., web, database, email). Allow multiple Application to use the network.

---