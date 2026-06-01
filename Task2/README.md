# Task 2 - Basic Firewall Configuration with UFW

## Objective
Set up a basic firewall using UFW on Linux.

## Tools Used
- UFW (Uncomplicated Firewall)

## Steps Performed

### 1. Install UFW
sudo apt install ufw

### 2. Set Default Policies
- Deny all incoming traffic
- Allow all outgoing traffic

### 3. Allow SSH
sudo ufw allow ssh

### 4. Deny HTTP Traffic
sudo ufw deny http

### 5. Enable Firewall
sudo ufw enable

### 6. Check Status
sudo ufw status verbose

## Screenshot
![UFW Status](ufw_status.png)
