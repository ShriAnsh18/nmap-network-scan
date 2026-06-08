# Patch Management in Cybersecurity — Research Report

**Course:** Cybersecurity Fundamentals  
**Task:** Task 6 — Importance of Patch Management  
**Date:** June 2026  

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [What Is Patch Management](#2-what-is-patch-management)
3. [Why Patches Exist](#3-why-patches-exist)
4. [The Consequences of Not Patching](#4-the-consequences-of-not-patching)
5. [Real-World Incidents Caused by Unpatched Systems](#5-real-world-incidents-caused-by-unpatched-systems)
6. [The Patch Management Lifecycle](#6-the-patch-management-lifecycle)
7. [Challenges Organisations Face](#7-challenges-organisations-face)
8. [Best Practices for Effective Patch Management](#8-best-practices-for-effective-patch-management)
9. [Patch Management Tools](#9-patch-management-tools)
10. [Conclusion](#10-conclusion)
11. [References](#11-references)

---

## 1. Introduction

There is a particular kind of frustration that comes with being breached through a vulnerability that was already fixed. The patch existed. The vendor released it. The fix was sitting there, available, waiting to be applied — and it wasn't. And then attackers walked through the open door.

This is not a rare scenario. It is, in fact, one of the most common ways organisations get compromised. The 2017 Equifax breach exposed the personal data of 147 million people through a vulnerability in Apache Struts that had a patch available for two months before the attack. The WannaCry ransomware attack that crippled organisations across 150 countries exploited a Windows vulnerability that Microsoft had patched 59 days earlier.

Patch management — the process of identifying, testing, and applying updates to software and systems — sits at the foundation of any serious security programme. It is not glamorous work. It does not make headlines the way threat hunting or zero-day research does. But the data consistently shows that it prevents more breaches than almost any other single practice.

This report examines what patch management is, why it matters, what happens when it is neglected, and how to do it well.

---

## 2. What Is Patch Management

A **patch** is a piece of software designed to fix a problem in an existing programme. That problem might be a security vulnerability, a bug that causes crashes, a performance issue, or simply missing functionality. When a vendor discovers or is informed of such a problem, they typically release a patch — an update that corrects it.

**Patch management** is the systematic process of:

- Knowing what software and systems exist in your environment (inventory)
- Monitoring for new patches and vulnerabilities
- Evaluating which patches apply to your systems and how urgently
- Testing patches before deploying them broadly
- Deploying patches in a controlled, trackable way
- Verifying that patches were successfully applied
- Documenting everything for compliance and audit purposes

It sounds straightforward. In practice, across hundreds or thousands of systems, multiple operating systems, dozens of third-party applications, legacy software, and cloud workloads — it becomes one of the more operationally complex tasks in IT security.

### Types of Patches

| Type | Description |
|------|-------------|
| **Security Patch** | Fixes a specific vulnerability that could be exploited by an attacker |
| **Bug Fix** | Corrects functionality issues that cause errors or unexpected behaviour |
| **Feature Update** | Adds new capabilities or improvements to existing ones |
| **Hotfix** | An urgent, targeted fix released outside the normal update cycle |
| **Service Pack** | A collection of patches bundled together into a single update |
| **Firmware Update** | Updates to the software embedded in hardware devices |

---

## 3. Why Patches Exist

Software is written by humans, and humans make mistakes. A programme with a million lines of code will almost certainly contain errors — logic flaws, memory handling issues, input validation problems — that were not caught during development or testing.

Some of these errors are merely annoying. Others create **security vulnerabilities** — weaknesses that an attacker can exploit to gain unauthorised access, escalate privileges, execute malicious code, or steal data.

Vulnerabilities are catalogued publicly in the **Common Vulnerabilities and Exposures (CVE)** database, maintained by MITRE and sponsored by CISA. Each vulnerability gets a CVE ID (e.g., CVE-2021-44228) and a **CVSS score** (Common Vulnerability Scoring System) from 0 to 10, indicating its severity.

```
CVSS Score Ranges:

0.0        → None
0.1 – 3.9  → Low
4.0 – 6.9  → Medium
7.0 – 8.9  → High
9.0 – 10.0 → Critical
```

When a vendor patches a vulnerability, they are closing that door. When an organisation applies that patch, they are locking it on their end. The window between a patch being released and being applied is the most dangerous period — because attackers know the vulnerability exists, and they know many systems are still exposed.

This period is called the **patch gap**, and it is where most exploitation happens.

---

## 4. The Consequences of Not Patching

### Security Breaches

The most direct consequence is getting compromised. Attackers routinely scan the internet for systems running known vulnerable software. Tools like Shodan can find exposed systems in seconds. Once a CVE is public, exploit code often follows within days — sometimes hours.

An unpatched system is not just a risk — it is a known, documented, publicly listed risk with a working exploit available for download.

### Ransomware

Ransomware operators frequently target unpatched systems. The economics are simple: exploit a known vulnerability, deploy ransomware, demand payment. Many of the most damaging ransomware attacks in recent years — WannaCry, NotPetya, the Colonial Pipeline attack — involved systems that had available patches that were never applied.

The average ransomware payment in 2024 exceeded **$2 million**. The average total cost of a ransomware incident, including downtime, recovery, and reputational damage, was closer to **$5.13 million**.

### Compliance Violations

Regulatory frameworks — GDPR, HIPAA, PCI DSS, ISO 27001 — generally require organisations to maintain up-to-date systems and manage vulnerabilities. Failing to patch is not just a security failure; it can be a compliance failure that triggers fines, audits, and legal liability.

After the Equifax breach, the company faced regulatory action across multiple jurisdictions and ultimately paid over **$575 million** in settlements — partly because the breach was caused by a known vulnerability that had not been patched.

### Reputational Damage

Customers, partners, and investors lose confidence in organisations that suffer preventable breaches. The reputational cost is hard to quantify but often exceeds the direct financial losses, particularly for companies whose business depends on trust.

### Operational Disruption

Successful attacks on unpatched systems frequently cause significant downtime. The NotPetya attack — which exploited the same Windows vulnerability as WannaCry — caused an estimated **$10 billion in global damage**, shutting down entire companies for days or weeks.

---

## 5. Real-World Incidents Caused by Unpatched Systems

### The Equifax Breach (2017)

In March 2017, the Apache Software Foundation released a patch for a critical vulnerability in Apache Struts (CVE-2017-5638), a web framework used in many enterprise applications. The vulnerability allowed remote code execution — an attacker could run arbitrary commands on a vulnerable server.

Equifax, one of the three largest credit bureaus in the United States, used Apache Struts and was notified of the vulnerability. The patch was not applied. In May 2017 — two months after the patch was available — attackers began exploiting the vulnerability on Equifax's systems. The intrusion went undetected for 78 days.

By the time it was discovered, attackers had exfiltrated the personal data of **147 million people** — names, Social Security numbers, birth dates, addresses, and in some cases driver's licence and credit card numbers.

**Total cost:** Over $575 million in settlements. Incalculable reputational damage. The CEO, CIO, and CSO all left the company.

**The patch had been available for 59 days before the attack began.**

---

### WannaCry Ransomware (May 2017)

WannaCry was a ransomware worm that spread across the internet by exploiting EternalBlue, a vulnerability in Windows SMB (Server Message Block) protocol. Microsoft had released a patch for this vulnerability — MS17-010 — in March 2017, two months before WannaCry hit.

The worm spread automatically, without any user interaction required, infecting unpatched Windows systems across 150 countries. It hit the UK's National Health Service particularly hard, forcing hospitals to cancel appointments, divert ambulances, and revert to paper records. An estimated 80 out of 236 NHS trusts were affected.

**Global damage estimate:** $4–8 billion  
**NHS damage estimate:** £92 million  
**Systems affected:** Over 200,000 across 150 countries

**The patch had been available for 59 days before WannaCry launched.**

---

### Log4Shell (December 2021)

Log4Shell (CVE-2021-44228) was a critical vulnerability (CVSS 10.0) in Log4j, an extremely widely used Java logging library. The vulnerability allowed unauthenticated remote code execution — an attacker could trigger it simply by getting a server to log a specially crafted string.

Because Log4j was embedded in hundreds of thousands of applications, products, and services — many organisations did not even know they were running it. Within 72 hours of public disclosure, attackers were scanning the entire internet for vulnerable systems. Millions of exploitation attempts were logged daily.

Patching was difficult because the vulnerable component was often buried inside other software that organisations had not written themselves. It took months for many organisations to fully identify and remediate their exposure.

**What it showed:** The challenge is not always awareness or willingness to patch — sometimes organisations do not know what they are running. Asset inventory matters as much as patch speed.

---

### Colonial Pipeline (May 2021)

While the Colonial Pipeline attack began with a compromised VPN password rather than an unpatched vulnerability, the incident is relevant because the lack of multi-factor authentication — a basic security control — enabled the initial access. The resulting ransomware attack shut down the largest fuel pipeline on the US East Coast for six days, causing fuel shortages across multiple states.

**Ransom paid:** $4.4 million (partial recovery of $2.3 million by FBI)  
**Operational impact:** 45% of East Coast fuel supply disrupted for six days

---

## 6. The Patch Management Lifecycle

A structured patch management process follows a repeatable cycle:

```
1. INVENTORY
   Know exactly what software and systems exist in your environment
           │
           ▼
2. MONITOR
   Track CVEs, vendor advisories, and security bulletins continuously
           │
           ▼
3. ASSESS
   Determine which patches apply to your environment and prioritise by risk
           │
           ▼
4. TEST
   Apply patches to a non-production environment first and verify stability
           │
           ▼
5. DEPLOY
   Roll out patches in controlled waves — critical systems first
           │
           ▼
6. VERIFY
   Confirm patches were successfully applied and vulnerabilities closed
           │
           ▼
7. DOCUMENT
   Record what was patched, when, by whom, and any exceptions
           │
           ▼
        (back to 1)
```

### Prioritisation Framework

Not all patches are equal. Applying every patch immediately is rarely operationally feasible. A risk-based approach prioritises based on:

| Priority | Criteria | Target Timeframe |
|----------|----------|-----------------|
| **Critical** | CVSS 9.0+, actively exploited, internet-facing systems | 24–72 hours |
| **High** | CVSS 7.0–8.9, likely to be exploited | 7 days |
| **Medium** | CVSS 4.0–6.9, limited exploitability | 30 days |
| **Low** | CVSS below 4.0, minimal risk | 90 days |

CISA maintains a **Known Exploited Vulnerabilities (KEV) Catalog** — a list of vulnerabilities confirmed to be actively exploited in the wild. Anything on this list should be treated as critical regardless of its CVSS score.

---

## 7. Challenges Organisations Face

Understanding why patch management fails in practice is as important as knowing what it should look like.

**Asset Inventory Gaps**  
You cannot patch what you do not know you have. Many organisations lack a complete, current inventory of their software and systems — especially as cloud adoption, remote work, and shadow IT have made environments more complex.

**Compatibility Concerns**  
Patches sometimes break things. A kernel update might conflict with a legacy application. A database patch might change behaviour that other systems depend on. These concerns are legitimate, but they are often used to justify indefinite delay rather than proper testing.

**Operational Downtime**  
Patching often requires reboots or brief service interruptions. In environments where availability is critical — manufacturing, healthcare, utilities — scheduling downtime is genuinely difficult.

**Volume and Speed**  
The number of CVEs published annually has grown every year. In 2023, over 28,000 new vulnerabilities were published. Keeping up requires automation, tooling, and dedicated resources.

**Legacy Systems**  
Older systems sometimes run software that vendors no longer support. No patches means no fixes, and replacing the systems may not be feasible in the short term.

**Distributed Environments**  
Remote workers, branch offices, cloud workloads, and third-party systems all need to be reached by patch deployment — and they are all slightly different, which adds complexity.

---

## 8. Best Practices for Effective Patch Management

### Maintain a Complete Asset Inventory

You cannot manage what you cannot see. Use automated discovery tools to maintain a live inventory of every device, operating system, and application in your environment. Include cloud workloads, remote endpoints, and IoT devices.

### Use a Risk-Based Approach

Do not try to patch everything at once. Use CVSS scores, the CISA KEV catalog, and your knowledge of your environment to prioritise. An internet-facing server running software with a critical known-exploited vulnerability needs attention today — a patch for an internal tool used by three people can wait.

### Test Before You Deploy

Always test patches in a staging environment before rolling out to production. This catches compatibility issues and reduces the risk of a patch causing more disruption than the vulnerability it fixes. For critical patches, the testing window should be short — hours, not weeks.

### Automate Where Possible

Manual patching across hundreds of systems is slow and error-prone. Use patch management platforms to automate scanning, deployment, and verification. Automation reduces the patch gap and frees up staff for higher-value work.

### Define and Enforce SLAs

Set clear, written timelines for how quickly different categories of patches must be applied — and hold teams accountable for meeting them. Without defined SLAs, patching gets deprioritised whenever something else comes up.

### Track and Document Everything

Keep records of what was patched, when, on which systems, and who approved it. This is essential for compliance audits, for post-incident analysis, and for identifying systems that consistently fall behind.

### Handle Exceptions Formally

Sometimes a patch genuinely cannot be applied — a legacy system, a vendor dependency, an operational constraint. These exceptions should be documented formally, approved by the appropriate risk owner, and mitigated with compensating controls (network segmentation, enhanced monitoring, web application firewall rules).

### Include Third-Party Software

Operating system patches are often automated, but third-party applications — browsers, PDF readers, Java, office suites, media players — are frequently neglected. Many breaches involve third-party software. Patch management must cover the full software stack.

### Subscribe to Threat Intelligence

Follow vendor security advisories, CISA alerts, and vulnerability databases. Knowing about a critical patch the day it is released, rather than a week later, meaningfully reduces your exposure window.

---

## 9. Patch Management Tools

A range of tools exist to support patch management at different scales:

| Tool | Type | Description |
|------|------|-------------|
| **Microsoft WSUS** | Free (Windows) | Windows Server Update Services — manages Windows patches across a network |
| **Microsoft Intune** | Commercial | Cloud-based endpoint management including patch deployment |
| **Qualys VMDR** | Commercial | Vulnerability management, detection, and response with patch automation |
| **Tenable.io / Nessus** | Commercial | Vulnerability scanning with prioritisation and patch tracking |
| **Ivanti Patch** | Commercial | Patch management for Windows, Linux, macOS, and third-party apps |
| **ManageEngine Patch Manager Plus** | Commercial | Multi-platform patch management with reporting |
| **Ansible** | Open source | Automation platform that can be used to deploy patches at scale |
| **CISA KEV Catalog** | Free | List of known exploited vulnerabilities — essential prioritisation resource |

The right tool depends on the size and complexity of the environment. Small organisations may manage with built-in OS update mechanisms and a vulnerability scanner. Larger organisations need dedicated patch management platforms with centralised reporting and automation.

---

## 10. Conclusion

Patch management is one of the most straightforward things an organisation can do to improve its security posture — and one of the most commonly neglected. The attacks it prevents are not hypothetical. They are documented, they are common, and the organisations that suffered them often knew about the vulnerability and the available fix before the breach happened.

The Equifax breach exposed 147 million people's data. The patch was available for two months. WannaCry hit 200,000 systems across 150 countries. The patch was available for two months. These are not failures of technology — they are failures of process, prioritisation, and organisational discipline.

Effective patch management does not require perfect execution. It requires a complete inventory, a risk-based approach to prioritisation, clear timelines, automation where possible, and a culture that treats patching as a non-negotiable operational responsibility rather than an inconvenient IT chore.

The gap between a patch being released and being applied is the window attackers operate in. The goal of patch management is simply to make that window as small as possible.

Most attackers are not looking for a challenge. They are looking for an easy target. A well-patched environment is not an easy target.

---

## 11. References

1. Verizon — Data Breach Investigations Report 2024
2. CISA — Known Exploited Vulnerabilities Catalog. https://www.cisa.gov/known-exploited-vulnerabilities-catalog
3. NIST — National Vulnerability Database (NVD). https://nvd.nist.gov
4. Equifax — Data Breach Settlement Details. Federal Trade Commission, 2019
5. Microsoft — MS17-010 Security Bulletin (EternalBlue / WannaCry patch), March 2017
6. NHS Digital — WannaCry Cyber Attack and the NHS, October 2018
7. Apache Software Foundation — CVE-2017-5638 Advisory (Equifax breach vulnerability)
8. NIST SP 800-40r4 — Guide to Enterprise Patch Management Planning, 2022
9. IBM Security — Cost of a Data Breach Report 2024
10. Ponemon Institute — State of Vulnerability Response 2023
11. MITRE — Common Vulnerabilities and Exposures (CVE). https://cve.mitre.org
12. Cybersecurity Ventures — Cybercrime Report 2024

---

*File: `patch_management_report.md` | Task 6 | Cybersecurity Fundamentals*
