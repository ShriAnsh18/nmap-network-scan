#!/bin/bash

# UFW Firewall Configuration Script

# Install UFW
sudo apt install ufw -y

# Reset UFW to default
sudo ufw reset

# Set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH
sudo ufw allow ssh

# Deny HTTP traffic
sudo ufw deny http

# Enable UFW
sudo ufw enable

# Check status
sudo ufw status verbose
