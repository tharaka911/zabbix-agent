#!/bin/bash

# Prompt user to enter the Zabbix server details
echo "Please enter the Zabbix server IP address or hostname:"
read zabbix_server

# Prompt user to enter the hostname for this machine
echo "Please enter the hostname for this machine:"
read hostname

# Install required packages
sudo apt-get update
sudo apt-get install -y wget

# Download the Zabbix agent 2 package for Debian based systems
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix/zabbix-agent2_6.0.0-1%2Bubuntu20.04_amd64.deb

# Install the Zabbix repository configuration package
sudo dpkg -i zabbix-agent2_6.0.0-1+ubuntu20.04_amd64.deb

# Update package lists
sudo apt-get update

# Install the Zabbix agent 2 package
sudo apt-get install -y zabbix-agent2

# Backup the original Zabbix agent 2 configuration file
sudo cp /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf.bak

# Update the Zabbix agent 2 configuration file with the Zabbix server details and hostname
sudo sed -i "s/Server=127.0.0.1/Server=$zabbix_server/g" /etc/zabbix/zabbix_agent2.conf
sudo sed -i "s/ServerActive=127.0.0.1/ServerActive=$zabbix_server/g" /etc/zabbix/zabbix_agent2.conf
sudo sed -i "s/Hostname=Zabbix server/Hostname=$hostname/g" /etc/zabbix/zabbix_agent2.conf

# Restart the Zabbix agent 2 service
sudo systemctl restart zabbix-agent2

# Enable the Zabbix agent 2 service to start on boot
sudo systemctl enable zabbix-agent2

# Add zabbix user to docker group 
sudo usermod -aG docker zabbix

# Change timezone 
sudo timedatectl set-timezone Asia/Seoul