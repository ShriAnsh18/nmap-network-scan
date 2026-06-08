# Social Engineering Attacks — Research Report

**Course:** Cybersecurity Fundamentals  
**Task:** Task 5 — Social Engineering Attacks  
**Date:** June 2026  

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Phishing](#2-phishing)
3. [Pretexting](#3-pretexting)
4. [Baiting](#4-baiting)
5. [Other Social Engineering Techniques](#5-other-social-engineering-techniques)
6. [Case Studies](#6-case-studies)
7. [Why These Attacks Keep Working](#7-why-these-attacks-keep-working)
8. [Prevention and Recommendations](#8-prevention-and-recommendations)
9. [Conclusion](#9-conclusion)
10. [References](#10-references)

---

## 1. Introduction

Most people think of hacking as something technical — someone sitting in a dark room writing code to break into systems. The reality is often much simpler and far more human.

Social engineering is the practice of **manipulating people** rather than machines. Instead of finding a flaw in a firewall, an attacker finds a flaw in human behaviour — trust, curiosity, fear, urgency — and exploits that instead.

What makes social engineering so dangerous is that it bypasses technical security entirely. You can have the best antivirus software, the strongest passwords, and the most advanced firewalls, and still lose everything because one employee clicked a link in an email or held the door open for a stranger in a suit.

According to Verizon's 2024 Data Breach Investigations Report, **68% of breaches involved a human element** — social engineering, errors, or misuse. That number has barely changed in a decade, which tells you something important: technical defences have improved massively, but people remain just as vulnerable.

This report looks at the three most common forms of social engineering — phishing, pretexting, and baiting — along with real incidents that show how they play out in practice, and what organisations can actually do to reduce their exposure.

---

## 2. Phishing

### What It Is

Phishing is the most widespread social engineering attack. The name comes from "fishing" — the attacker casts a wide net (usually via email) and waits for someone to bite.

The basic idea is simple: send someone a message that looks like it came from a trusted source, and trick them into doing something they shouldn't — clicking a link, entering their password, downloading a file, or transferring money.

### How It Works

A typical phishing attack follows this pattern:

1. The attacker registers a domain that looks similar to a real one (e.g., `paypa1.com` instead of `paypal.com`)
2. They design an email that matches the style and branding of the real organisation
3. They create a fake login page hosted on that domain
4. They send the email to thousands of people with a message that creates urgency — "Your account will be suspended", "Unusual activity detected", "Action required"
5. The victim clicks the link, enters their credentials on the fake page, and the attacker captures them

### Variants of Phishing

**Spear Phishing** is targeted phishing. Instead of sending the same email to a million people, the attacker researches a specific individual — their name, job title, colleagues, recent activity — and crafts a message that feels personal and credible. These are far harder to spot.

**Whaling** is spear phishing aimed at executives (CEOs, CFOs). The goal is usually to authorise large wire transfers or gain access to sensitive systems.

**Smishing** uses SMS instead of email. A text message claiming to be from a bank or delivery company asking you to "verify your details" through a link.

**Vishing** is voice phishing — phone calls from someone pretending to be from IT support, a bank, or a government agency.

### A Phishing Email — What to Look For

```
From: support@paypa1.com                ← misspelled domain
Subject: ⚠️ Urgent: Your account has been locked

Dear Customer,

We have detected unusual activity on your PayPal account.
To avoid permanent suspension, please verify your identity
within 24 hours.

[Verify My Account]                     ← link goes to fake site

PayPal Security Team
```

Red flags: generic greeting, artificial urgency, mismatched sender domain, suspicious link.

---

## 3. Pretexting

### What It Is

Pretexting is when an attacker **creates a fabricated scenario** (a "pretext") to extract information or gain access. Unlike phishing, which often relies on fear or urgency, pretexting relies on building a believable identity and story.

The attacker essentially becomes an actor — playing a role convincingly enough to earn the target's trust and get what they need.

### How It Works

A pretexting attack typically involves:

1. **Research** — the attacker learns enough about the target organisation to sound credible (employee names, internal terminology, vendors, procedures)
2. **Identity construction** — they adopt a believable persona (IT technician, auditor, new employee, vendor representative)
3. **Contact** — they reach out via phone, email, or in person
4. **Extraction** — through conversation, they gather credentials, sensitive data, or physical access

### Real Example Scenario

An attacker calls the HR department pretending to be a payroll software vendor:

> *"Hi, this is David from ADP support. We're doing a scheduled system update and I need to verify a few employee records to make sure payroll goes out correctly on Friday. Can you confirm the direct deposit information for your finance team?"*

The HR employee, not wanting to be responsible for missed payroll, hands over the information without questioning it.

### Why It Works

Pretexting works because humans are wired to be helpful and to trust people who seem to belong. When someone sounds confident, uses the right terminology, and has a plausible reason for their request, most people don't think to question it. Saying "no" or asking for verification feels rude or obstructive.

---

## 4. Baiting

### What It Is

Baiting exploits **human curiosity**. The attacker leaves something tempting — a physical device or a digital lure — and waits for the victim to interact with it.

### How It Works

**Physical Baiting:**
The most classic example is leaving USB drives in car parks, lobbies, or common areas near a target organisation. The drives are labelled with something irresistible — "Salary Data 2026", "Confidential — HR", "Project X Final". Someone picks one up, plugs it into their work computer out of curiosity, and malware silently installs itself.

**Digital Baiting:**
Online versions include fake download links ("Download the full movie free here"), fake software updates, or too-good-to-be-true offers that deliver malware instead of what was promised.

### How Effective Is It?

A study by Google and the University of Illinois dropped 297 USB drives around a university campus. **98% were picked up**, and **45% were plugged into a computer** — many within minutes of being found. Of those who plugged them in, the majority said they were just trying to find the owner. Curiosity and good intentions both became vulnerabilities.

---

## 5. Other Social Engineering Techniques

Beyond the three main types, there are several other techniques worth understanding:

**Tailgating / Piggybacking**  
Walking into a secure building by following closely behind an authorised employee who holds the door open. It exploits politeness — most people feel awkward letting a door close in someone's face.

**Quid Pro Quo**  
Offering something in exchange for information. An attacker might call employees pretending to be IT support, offering to "fix a problem" in exchange for their login credentials.

**Watering Hole Attacks**  
The attacker identifies websites that employees of a target organisation frequently visit, compromises those sites, and waits for the victims to come to them.

**Scareware**  
Pop-ups or alerts that claim your computer is infected and prompt you to "download this tool immediately to fix it" — the tool itself is the malware.

---

## 6. Case Studies

### Case Study 1 — The Twitter Hack (July 2020)

In July 2020, attackers managed to compromise some of the most high-profile accounts on Twitter — Barack Obama, Elon Musk, Bill Gates, Apple, Uber — and used them to run a Bitcoin scam. Within hours, they collected over $120,000.

What made this remarkable was how they got in. There was no sophisticated technical exploit. Attackers called Twitter employees by phone, impersonating the company's internal IT department. They convinced employees to hand over credentials to Twitter's internal admin tools, which gave them control over any account on the platform.

The FBI arrested three individuals. The youngest was 17 years old.

**What went wrong:** No callback verification for internal IT requests. Too much access available to too many employees. No out-of-band authentication for sensitive admin actions.

---

### Case Study 2 — RSA SecurID Breach (2011)

RSA Security — a company that makes security tokens used by millions of employees worldwide — was breached through a single phishing email sent to a small group of employees. The email had the subject line "2011 Recruitment Plan" and contained an Excel attachment. One employee retrieved it from their junk folder and opened it.

The attachment exploited an Adobe Flash vulnerability to install a backdoor. Attackers eventually extracted data related to RSA's SecurID two-factor authentication products. The breach cost RSA's parent company EMC an estimated **$66 million** in remediation and affected millions of organisations that relied on SecurID tokens.

**What went wrong:** An employee opened an attachment from their spam folder. One click was enough to compromise a major security company and trigger a global security crisis.

---

### Case Study 3 — Toyota Boshoku BEC Attack (2019)

Toyota's subsidiary Toyota Boshoku lost **$37 million** in a single transaction after attackers used email spoofing to impersonate a legitimate business partner. The attacker sent an email to an employee in the finance department, claiming that banking details for an upcoming transfer needed to be updated.

The employee followed the instructions and transferred the funds. By the time the fraud was discovered, the money was gone.

**What went wrong:** No verification process for changes to banking details. Finance staff had not been trained to recognise Business Email Compromise. The attacker did not need to break into any system — they just sent an email.

---

### Case Study 4 — Ubiquiti Networks Fraud (2015)

Networking company Ubiquiti lost **$46.7 million** after attackers impersonated company executives and sent emails to the finance department instructing them to transfer funds for an acquisition. The emails appeared to come from senior leadership and the requests seemed legitimate.

Finance employees processed multiple transfers before anyone realised something was wrong. Only $8.1 million was recovered.

**What went wrong:** Email impersonation of internal executives went undetected. No secondary approval process for large transfers. Finance team was not trained to verify unusual requests through a separate channel.

---

## 7. Why These Attacks Keep Working

It is worth asking: if these attacks are well known, why do they keep succeeding?

The honest answer is that they exploit things that cannot be patched — basic human psychology.

**Authority** — People tend to comply with requests from figures of authority without questioning them. An email from "the CEO" or a call from "the IT department" triggers compliance.

**Urgency** — When people feel pressure to act quickly, they stop thinking carefully. "Your account will be suspended in 24 hours" overrides rational evaluation.

**Trust** — People extend trust to those who seem to belong — who use the right language, know the right names, and sound confident.

**Curiosity** — A USB drive labelled "Confidential Salaries" is almost impossible to ignore.

**Helpfulness** — Most people want to be cooperative. Saying no or demanding verification feels confrontational.

Attackers do not need to be technically skilled. They need to understand people — and that is something that cannot be fixed with a software update.

---

## 8. Prevention and Recommendations

### Security Awareness Training

This is the single most important control. Employees need to understand what social engineering looks like and feel empowered to question suspicious requests — even from apparent authority figures.

Training should be:
- Ongoing, not a one-time event
- Practical, using real examples and simulations
- Psychologically realistic — focused on the actual pressure employees feel, not just the technical details

### Phishing Simulations

Regularly send simulated phishing emails to employees. When someone clicks, use it as a teaching moment rather than a punitive one. Organisations that run frequent simulations see click rates drop significantly over time.

### Verification Procedures

Establish clear, non-negotiable procedures for sensitive actions:

- Any request to change banking or payment details must be verified by phone using a number already on record — not one provided in the request
- Any request for credentials or access — even from IT — should be verified through a separate channel
- Large wire transfers should require approval from multiple people

### Principle of Least Privilege

Employees should only have access to what they need for their job. If an attacker compromises one account, least privilege limits how far they can move.

### Physical Security

- Visitor access should be controlled and logged
- Employees should be trained not to hold doors open for strangers, regardless of how awkward it feels
- USB drives found on the premises should be handed to IT, not plugged in

### Technical Controls

While social engineering targets people, technical controls can reduce the damage:

| Control | What It Prevents |
|---------|-----------------|
| Multi-Factor Authentication (MFA) | Stolen passwords alone are not enough to gain access |
| Email Authentication (SPF, DKIM, DMARC) | Prevents email spoofing and domain impersonation |
| Endpoint Detection & Response (EDR) | Catches malware delivered via phishing or baiting |
| Email Filtering / Sandboxing | Blocks known malicious attachments and links |
| USB Port Restrictions | Prevents baiting via physical media |

### Culture of Scepticism

The goal is not to make employees paranoid but to make them comfortable asking questions. An organisation where someone feels safe saying "I'd like to verify that before I proceed" is far more resilient than one where employees fear looking obstructive.

---

## 9. Conclusion

Social engineering works because it targets the part of any system that cannot be updated with a patch — people. The attacks covered in this report — phishing, pretexting, and baiting — are not new, and they are not particularly sophisticated. What they are is effective, consistently and repeatedly, across every industry and organisation size.

The case studies here show that even security companies (RSA), major tech platforms (Twitter), and large corporations (Toyota, Ubiquiti) can be brought down by a well-crafted email or a convincing phone call. The financial losses run into the tens of millions. The reputational damage is harder to quantify but often just as severe.

The path forward is not purely technical. It involves investing in people — training them, testing them, and building a culture where verification is normal and scepticism is encouraged rather than penalised. Combined with sensible technical controls and clear internal procedures, this approach can significantly reduce an organisation's exposure to social engineering.

The best firewall in the world cannot stop someone from picking up a USB drive in the car park. But a well-informed employee can.

---

## 10. References

1. Verizon — Data Breach Investigations Report 2024
2. FBI Internet Crime Complaint Center (IC3) — 2023 Annual Report
3. KnowBe4 — Phishing by Industry Benchmarking Report 2024
4. University of Illinois / Google — "Users Really Do Plug in USB Drives They Find" (2016)
5. Twitter — Transparency Report on July 2020 Security Incident
6. RSA Security — Open Letter on SecurID Breach (2011)
7. FBI — Business Email Compromise: The $50 Billion Scam (2023)
8. CISA — Avoiding Social Engineering and Phishing Attacks (2021). https://www.cisa.gov
9. SANS Institute — Social Engineering Fundamentals
10. Cialdini, R. — *Influence: The Psychology of Persuasion* (referenced for psychological principles)

---

*File: `social_engineering_report.md` | Task 5 | Cybersecurity Fundamentals*
