# 🔐 Network Security Threats — Research Report

> **Course:** Network Security & Cybersecurity Fundamentals  
> **Task:** Task 4 — Common Network Security Threats  
> **Author:** Cybersecurity Research Division  
> **Date:** June 2026  
> **Version:** 1.0

---

## 📋 Table of Contents

1. [Introduction](#1-introduction)
2. [Denial-of-Service (DoS) & DDoS Attacks](#2-denial-of-service-dos--ddos-attacks)
   - [How It Works](#21-how-it-works)
   - [Types of DoS/DDoS Attacks](#22-types-of-dosddos-attacks)
   - [Real-World Examples](#23-real-world-examples)
   - [Impact](#24-impact)
   - [Mitigation & Prevention](#25-mitigation--prevention)
3. [Man-in-the-Middle (MITM) Attacks](#3-man-in-the-middle-mitm-attacks)
   - [How It Works](#31-how-it-works)
   - [Types of MITM Attacks](#32-types-of-mitm-attacks)
   - [Real-World Examples](#33-real-world-examples)
   - [Impact](#34-impact)
   - [Mitigation & Prevention](#35-mitigation--prevention)
4. [Spoofing Attacks](#4-spoofing-attacks)
   - [How It Works](#41-how-it-works)
   - [Types of Spoofing Attacks](#42-types-of-spoofing-attacks)
   - [Real-World Examples](#43-real-world-examples)
   - [Impact](#44-impact)
   - [Mitigation & Prevention](#45-mitigation--prevention)
5. [Comparative Overview](#5-comparative-overview)
6. [Layered Defence Framework](#6-layered-defence-framework)
7. [Emerging Threats (2025–2026)](#7-emerging-threats-20252026)
8. [Conclusion](#8-conclusion)
9. [References](#9-references)

---

## 1. Introduction

Network security is the practice of protecting computer networks and their services from unauthorised access, misuse, modification, or denial. As organisations increasingly rely on digital infrastructure — cloud platforms, IoT devices, remote workforces — the **attack surface grows larger and more complex**.

Three threat categories are responsible for a significant proportion of all network attacks:

| Threat | Core Objective |
|--------|---------------|
| **DoS / DDoS** | Overwhelm a target until it becomes unavailable |
| **Man-in-the-Middle (MITM)** | Secretly intercept and possibly alter communications |
| **Spoofing** | Impersonate a trusted identity to deceive systems or users |

This report examines each threat in depth — covering mechanisms, real-world incidents, measurable impacts, and evidence-based countermeasures.

> 💡 **Key Statistic:** The global cost of cybercrime is projected to exceed **$10.5 trillion annually by 2025** (Cybersecurity Ventures, 2023).

---

## 2. Denial-of-Service (DoS) & DDoS Attacks

### 2.1 How It Works

A **Denial-of-Service (DoS)** attack attempts to make a machine, network service, or resource **unavailable to legitimate users** by:
- Flooding it with more requests than it can handle
- Exploiting protocol weaknesses to crash or hang a service
- Consuming all available bandwidth or processing capacity

A **Distributed Denial-of-Service (DDoS)** attack scales this concept by coordinating **hundreds of thousands of compromised machines** (called a **botnet**) to flood the target simultaneously — generating attack volumes no single machine could achieve.

```
Attacker
   │
   ▼
Command & Control Server
   │
   ├──▶ Compromised Device 1 ──▶ ┐
   ├──▶ Compromised Device 2 ──▶ ├──▶ TARGET (Overwhelmed)
   ├──▶ Compromised Device 3 ──▶ ┘
   └──▶ ... (thousands more)
```

---

### 2.2 Types of DoS/DDoS Attacks

| Type | Layer | Description |
|------|-------|-------------|
| **Volumetric** | L3/L4 | Floods bandwidth with UDP/ICMP packets. E.g., DNS amplification, NTP reflection. Measured in Gbps. |
| **Protocol** | L3/L4 | Exploits protocol weaknesses — SYN floods exhaust the server's TCP connection table. |
| **Application Layer** | L7 | Sends seemingly legitimate HTTP requests (Slowloris, HTTP flood) — harder to filter. |
| **Amplification** | L3 | Attacker uses a spoofed victim IP to trigger large replies from open servers, flooding the victim. |

#### SYN Flood — Step by Step

```
Normal TCP Handshake:       SYN Flood Attack:
Client  →  SYN  →  Server   Attacker → SYN (fake IP) → Server
Client  ←  SYN-ACK ← Server Server ← SYN-ACK (no reply, table fills up)
Client  →  ACK  →  Server   Server waits... waits... runs out of capacity
```

---

### 2.3 Real-World Examples

#### 🔴 Example 1 — GitHub DDoS Attack (February 2018)
- **Peak traffic:** 1.35 Tbps — the largest ever recorded at the time
- **Method:** Attackers exploited misconfigured **Memcached servers**, achieving a **51,000× amplification factor**
- **Duration:** ~10 minutes of downtime before Akamai Prolexic scrubbed the traffic
- **Outcome:** No data breach; mitigated by upstream traffic scrubbing

#### 🔴 Example 2 — Mirai Botnet / Dyn DNS Attack (October 2016)
- **Botnet size:** 600,000+ compromised IoT devices (cameras, routers, DVRs)
- **Target:** Dyn, a major DNS provider
- **Impact:** Twitter, Netflix, Reddit, Spotify, PayPal offline for up to **6 hours**
- **Estimated loss:** $110M+ in revenue across affected platforms
- **Lesson:** Unsecured IoT devices represent a massive botnet risk

#### 🔴 Example 3 — Google Cloud DDoS (August 2023)
- **Peak:** 398 million requests per second — the **largest DDoS in history**
- **Method:** HTTP/2 Rapid Reset vulnerability (CVE-2023-44487)
- **Duration:** ~2 minutes; mitigated by Google's global scrubbing infrastructure

---

### 2.4 Impact

| Category | Description | Severity |
|----------|-------------|----------|
| Service Unavailability | Legitimate users blocked from resources | 🔴 Critical |
| Revenue Loss | E-commerce and SaaS platforms lose direct income | 🔴 High |
| Reputational Damage | SLA violations, customer trust erosion | 🟠 High |
| Operational Cost | Incident response, forensics, overtime | 🟡 Medium |
| Cascading Failures | Dependent services (DNS, CDN) fail in sequence | 🔴 Critical |

> 💸 **Average cost of DDoS downtime for large enterprises: $22,000 per minute**

---

### 2.5 Mitigation & Prevention

#### Technical Controls

| Control | Description |
|---------|-------------|
| **Rate Limiting** | Cap requests per IP per second at routers and firewalls |
| **Anycast Scrubbing** | Route attack traffic through global scrubbing centres (Cloudflare, Akamai) |
| **Blackhole Routing (RTBH)** | Null-route malicious traffic at the ISP level during an attack |
| **SYN Cookies** | Validate TCP handshakes without maintaining state — defeats SYN floods |
| **Web Application Firewall (WAF)** | Filter Layer 7 attacks using signature and behavioural rules |
| **CDN Distribution** | Absorb volumetric attacks by distributing load geographically |

#### Operational Controls

- 📋 Maintain an **Incident Response Plan** with DDoS-specific runbooks
- 📞 Engage **ISP-level BGP filtering** for upstream mitigation
- 📊 **Baseline normal traffic** to enable anomaly detection
- 🔒 **Harden IoT devices** — change default credentials, apply firmware patches, segment on separate VLANs

---

## 3. Man-in-the-Middle (MITM) Attacks

### 3.1 How It Works

A **Man-in-the-Middle (MITM)** attack occurs when an adversary **secretly positions themselves between two communicating parties**, intercepting and potentially altering messages without either party's knowledge.

The attacker simultaneously impersonates:
- **The server** to the client (client thinks it is talking to the real server)
- **The client** to the server (server thinks it is talking to the real client)

```
NORMAL COMMUNICATION:
Client ──────────────────────────────▶ Server

MITM ATTACK:
Client ──▶ [ATTACKER intercepts] ──▶ Server
Client ◀── [ATTACKER intercepts] ◀── Server
              ↑
         Reads / alters data silently
```

---

### 3.2 Types of MITM Attacks

| Type | Description |
|------|-------------|
| **ARP Spoofing** | Broadcasts fake ARP replies to associate the attacker's MAC with a legitimate IP — all local traffic redirected through attacker |
| **SSL Stripping** | Downgrades HTTPS connections to HTTP by intercepting the initial request before it is upgraded |
| **DNS Spoofing** | Poisons the DNS cache to redirect domain queries to attacker-controlled servers |
| **BGP Hijacking** | Announces more specific IP prefixes via BGP, rerouting internet traffic through malicious networks |
| **Evil Twin (Wi-Fi)** | Rogue access point with an identical SSID tricks users into connecting through attacker infrastructure |
| **Session Hijacking** | Steals session cookies via XSS or packet sniffing to impersonate authenticated users |

---

### 3.3 Real-World Examples

#### 🔴 Example 1 — Lenovo Superfish Adware (2015)
- **What happened:** Lenovo pre-installed VisualDiscovery (Superfish) adware on consumer laptops. It performed **SSL interception** using a self-signed root certificate to inject ads into HTTPS pages.
- **Critical flaw:** The same private key was shared across **all ~750,000 affected laptops** — any attacker who extracted it could intercept HTTPS sessions for every affected device on any network.
- **Outcome:** FTC investigation; $8.3M class-action settlement

#### 🔴 Example 2 — DigiNotar Certificate Authority Breach (2011)
- **What happened:** Iranian hackers compromised Dutch CA DigiNotar and issued **500+ fraudulent SSL certificates**, including one for `*.google.com`
- **Impact:** Gmail communications of approximately **300,000 Iranian users intercepted for over a month**
- **Outcome:** DigiNotar filed for bankruptcy; incident motivated creation of **Certificate Transparency logs**

#### 🔴 Example 3 — BGP Hijacking of Amazon Route 53 (April 2018)
- **What happened:** Attackers announced fake BGP routes for Amazon's DNS service, redirecting queries for MyEtherWallet to a phishing site with a valid-looking certificate
- **Impact:** ~$150,000 in cryptocurrency stolen over a 2-hour window
- **Lesson:** BGP has no built-in authentication — RPKI adoption is critical

---

### 3.4 Impact

| Category | Description | Severity |
|----------|-------------|----------|
| Credential Theft | Login details harvested in cleartext | 🔴 Critical |
| Data Exfiltration | Sensitive data intercepted in transit | 🔴 Critical |
| Financial Fraud | Banking sessions hijacked; cryptocurrency stolen | 🔴 Critical |
| Privacy Violation | Personal communications monitored without consent | 🟠 High |
| Corporate Espionage | Business IP and communications intercepted | 🟠 High |

> 💸 **Average cost per MITM-related breach: $4.5M** (IBM Cost of a Data Breach Report, 2024)

---

### 3.5 Mitigation & Prevention

#### Cryptographic Controls

| Control | Description |
|---------|-------------|
| **TLS 1.3 Everywhere** | Enforce HTTPS with HSTS (HTTP Strict Transport Security) and preloading |
| **Certificate Pinning** | Hard-code expected certificate fingerprints in applications |
| **Mutual TLS (mTLS)** | Both client and server present certificates — prevents impersonation from either side |
| **DNSSEC** | Cryptographically sign DNS records to prevent cache poisoning |

#### Network Controls

| Control | Description |
|---------|-------------|
| **Dynamic ARP Inspection (DAI)** | Validate ARP packets against DHCP snooping binding table on managed switches |
| **RPKI** | Cryptographically validate BGP route origins to prevent hijacking |
| **802.1X Port Authentication** | Require device authentication before granting network access |
| **Network Segmentation** | Use VLANs to limit ARP spoofing blast radius |

#### Monitoring Controls

- 🔍 **Certificate Transparency Monitoring** — use `crt.sh` to detect fraudulent certificates for your domains
- 📡 **BGP Monitoring** — subscribe to services like BGPmon to detect unexpected route announcements
- 🛡️ **SSL Inspection at Gateway** — detect SSL stripping and anomalous certificate substitution

---

## 4. Spoofing Attacks

### 4.1 How It Works

**Spoofing** is the act of **falsifying the origin of communications** to impersonate a trusted identity. Unlike MITM attacks that require active interception, spoofing may only require crafting packets, emails, or web pages that *appear* to come from a legitimate source.

Spoofing frequently serves as a **precursor** to other attacks — enabling phishing, DDoS amplification, or access control bypass.

```
LEGITIMATE EMAIL:
From: ceo@company.com  ──▶  Employee reads and trusts it

SPOOFED EMAIL:
From: ceo@company.com  ──▶  Employee reads and trusts it
      ↑
  Actually sent by attacker
  (forged header, different mail server)
```

---

### 4.2 Types of Spoofing Attacks

| Type | Description |
|------|-------------|
| **IP Spoofing** | Forges the source IP in packet headers to disguise origin, bypass ACLs, or amplify DDoS attacks |
| **Email Spoofing** | Forges the `From` header to conduct phishing, Business Email Compromise (BEC), or spread malware |
| **DNS Spoofing** | Injects false DNS responses to redirect traffic to attacker-controlled servers |
| **MAC Spoofing** | Changes hardware MAC address to impersonate another device or bypass MAC-based filtering |
| **Caller ID Spoofing** | Falsifies the calling number in VoIP/PSTN calls (vishing) to impersonate banks or government agencies |
| **Website Spoofing** | Creates pixel-perfect clones of legitimate login pages at typosquatted or lookalike domains |

---

### 4.3 Real-World Examples

#### 🔴 Example 1 — FBI Email Spoofing Incident (November 2021)
- **What happened:** Attackers exploited a misconfigured component of the FBI's Law Enforcement Enterprise Portal to send emails **from legitimate FBI servers** (`eims@ic.fbi.gov`)
- **Scale:** ~100,000 emails delivered, warning of a fictitious cyberattack
- **Why it worked:** Emails genuinely originated from FBI infrastructure — **SPF and DKIM checks passed**, making filtering nearly impossible
- **Lesson:** Even high-security environments are vulnerable to misconfiguration

#### 🔴 Example 2 — Twitter Bitcoin Scam via Account Spoofing (July 2020)
- **What happened:** Attackers social-engineered their way into Twitter's internal admin tools and hijacked verified accounts (Elon Musk, Barack Obama, Apple, Uber) to post identical Bitcoin scam messages
- **Impact:** **$120,000+ in Bitcoin** collected within hours; 130 high-profile accounts compromised
- **Outcome:** Three individuals arrested; exposed weaknesses in privileged access management

#### 🔴 Example 3 — Toyota Boshoku BEC Attack (2019)
- **What happened:** Attackers used **email domain spoofing** to impersonate a Toyota business partner and convinced an employee to change banking details for an electronic funds transfer
- **Financial loss:** **$37 million** transferred to attacker-controlled accounts
- **Lesson:** Wire transfers must require out-of-band voice verification regardless of email content

---

### 4.4 Impact

| Category | Description | Severity |
|----------|-------------|----------|
| Financial Fraud | BEC and wire transfer fraud — average loss $125,000+ | 🔴 Critical |
| Credential Harvesting | Phishing via spoofed domains and emails | 🔴 Critical |
| Reputation Damage | Brand impersonation erodes customer trust | 🟠 High |
| Regulatory Liability | GDPR/HIPAA penalties for data exposed via phishing | 🟠 High |
| Network Bypass | IP spoofing defeats IP-based access control lists | 🟡 Medium |

---

### 4.5 Mitigation & Prevention

#### Email Authentication (The SPF + DKIM + DMARC Stack)

```
Incoming Email
      │
      ▼
  SPF Check ──── Does sending server IP match domain's SPF record?
      │
      ▼
  DKIM Check ─── Is the cryptographic signature valid?
      │
      ▼
 DMARC Policy ── Pass → Deliver | Fail → Quarantine or Reject
      │
      ▼
  (Optional) BIMI ── Display verified brand logo in email client
```

| Control | Purpose |
|---------|---------|
| **SPF** | Lists authorised mail servers for your domain in DNS |
| **DKIM** | Cryptographically signs outgoing emails; recipients verify the signature |
| **DMARC (p=reject)** | Defines what to do with mail failing SPF/DKIM; provides aggregate reports |
| **BIMI** | Displays your logo in supported clients for authenticated messages |

#### Network Controls

| Control | Description |
|---------|-------------|
| **BCP38 / Ingress Filtering** | ISP and perimeter routers drop packets with impossible source IPs |
| **DNSSEC** | Sign and validate DNS records to prevent DNS spoofing |
| **Anti-Spoofing ACLs** | Block outbound packets with source IPs outside the local address space |

#### User & Process Controls

- 🎯 **Phishing Simulation** — run regular simulated campaigns with immediate educational feedback
- 🔍 **Domain Monitoring** — track lookalike/typosquatted domain registrations (DomainTools, Bolster)
- 📞 **Out-of-Band Verification** — require a voice call to confirm wire transfers or banking detail changes, always
- 🏫 **Security Awareness Training** — make staff the last line of defence, not the weakest link

---

## 5. Comparative Overview

| Attribute | DoS / DDoS | Man-in-the-Middle | Spoofing |
|-----------|-----------|-------------------|----------|
| **Primary Goal** | Disrupt availability | Intercept / alter data | Impersonate trusted identity |
| **OSI Layer** | L3, L4, L7 | L2, L3, L4, L7 | L2, L3, L4, L7 |
| **Requires Network Position** | No | Yes (local or routing) | No |
| **Detection Difficulty** | Medium (volume anomaly) | High (passive phase) | Medium–High |
| **Data Confidentiality Risk** | Low | Critical | High |
| **Primary Defence** | Rate limiting, scrubbing, CDN | TLS, DNSSEC, cert pinning | SPF/DKIM/DMARC, BCP38 |
| **Average Cost (large org)** | $22k/min downtime | $4.5M per incident | $125k–$37M per BEC |
| **Common Tools Used** | Botnets, amplification | ARP/DNS tools, Ettercap | Email spoofing kits, scapy |

---

## 6. Layered Defence Framework

Effective network security requires **defence-in-depth** — overlapping controls at every layer so that no single failure leads to a complete compromise.

```
┌─────────────────────────────────────────────────────────┐
│  LAYER 8 — People                                        │
│  Security awareness, phishing simulation, BEC policies   │
├─────────────────────────────────────────────────────────┤
│  LAYER 7 — Monitoring                                    │
│  SIEM, SOAR, NetFlow analysis, threat intelligence       │
├─────────────────────────────────────────────────────────┤
│  LAYER 6 — Identity                                      │
│  MFA, FIDO2 hardware tokens, PAM                         │
├─────────────────────────────────────────────────────────┤
│  LAYER 5 — Application                                   │
│  WAF, CSP headers, CSRF protection, SameSite cookies     │
├─────────────────────────────────────────────────────────┤
│  LAYER 4 — Email                                         │
│  SPF + DKIM + DMARC (p=reject), BIMI, anti-phishing GW  │
├─────────────────────────────────────────────────────────┤
│  LAYER 3 — Transport                                     │
│  TLS 1.3, mTLS, HSTS preloading, cert transparency      │
├─────────────────────────────────────────────────────────┤
│  LAYER 2 — DNS                                           │
│  DNSSEC, DNS-over-HTTPS (DoH), DNS monitoring            │
├─────────────────────────────────────────────────────────┤
│  LAYER 1 — Perimeter                                     │
│  Firewalls, IPS/IDS, BCP38, DDoS scrubbing centres      │
└─────────────────────────────────────────────────────────┘
```

> 🛡️ **Principle:** A breach at any single layer should be contained by the layers above and below it. No single control is sufficient alone.

---

## 7. Emerging Threats (2025–2026)

### 🤖 AI-Augmented Attacks
Large language models now allow attackers to craft **highly personalised phishing emails at scale**, bypassing traditional keyword-based filters. Deepfake audio is being used in **vishing campaigns** — one UK energy firm CEO authorised a £200,000 fraudulent wire transfer after receiving an AI-generated voice call impersonating their parent company's CEO.

### ⚛️ Quantum Computing & Encryption
Sufficiently powerful quantum computers could break **RSA and ECC encryption**, undermining TLS, PKI, and DNSSEC. Organisations should begin **post-quantum cryptography (PQC)** migration planning. NIST finalised initial PQC standards in 2024:
- **CRYSTALS-Kyber** (FIPS 203) — key encapsulation
- **CRYSTALS-Dilithium** (FIPS 204) — digital signatures

### 📡 5G Network Slicing Attacks
As 5G adoption accelerates, improper **network slice isolation** creates new MITM and spoofing opportunities at the core network level — particularly in multi-tenant deployments.

### 🔗 Software Supply Chain Attacks
The **SolarWinds (2020)** and **XZ Utils (2024)** incidents demonstrated that attackers increasingly target software build pipelines and update mechanisms to distribute malicious code through trusted channels — completely bypassing perimeter defences.

---

## 8. Conclusion

DoS/DDoS attacks, Man-in-the-Middle attacks, and spoofing remain among the **most damaging and frequently deployed techniques** in the modern threat landscape. Each exploits fundamental characteristics of network protocols that were designed for efficiency and trust — not adversarial environments.

### Key Takeaways

| # | Takeaway |
|---|----------|
| 1 | **Availability, Confidentiality, and Integrity** are each threatened by different attack classes |
| 2 | **Defence-in-depth** with overlapping controls is the only reliable strategy |
| 3 | **Human awareness** is a technical control — invest in it |
| 4 | **Monitoring and visibility** are as important as prevention |
| 5 | **Plan ahead** — quantum computing and AI are changing the threat landscape now |

> *"Security is not a product — it is a process. Organisations that build a culture of continuous improvement and rapid incident response will significantly outperform those that treat security as a checkbox compliance exercise."*

---

## 9. References

1. **NIST SP 800-61r2** — Computer Security Incident Handling Guide. National Institute of Standards and Technology, 2012.
2. **CISA** — Understanding and Responding to Distributed Denial-of-Service Attacks, 2022. https://www.cisa.gov
3. **Verizon DBIR 2024** — Data Breach Investigations Report. Verizon Enterprise Solutions.
4. **RFC 7489** — Domain-based Message Authentication, Reporting, and Conformance (DMARC). IETF, 2015.
5. **RFC 2827 (BCP38)** — Network Ingress Filtering: Defeating Denial of Service Attacks. IETF, 2000.
6. **NIST FIPS 203/204/205** — Post-Quantum Cryptography Standards, 2024.
7. **IBM Security** — Cost of a Data Breach Report 2024.
8. **Cloudflare** — DDoS Attack Trends Q1 2024. https://blog.cloudflare.com
9. **GitHub Engineering Blog** — February 28th DDoS Incident Report, 2018.
10. **CVE-2023-44487** — HTTP/2 Rapid Reset Attack. NIST NVD, 2023.

---

<div align="center">

**📁 Repository:** `network-security-research`  
**📄 File:** `network_security_threats_report.md`  
**🔖 Task:** Task 4 — Network Security Threats  

*© 2026 Cybersecurity Research Division. For educational use.*

</div>
