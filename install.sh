#!/bin/bash

# Prompt user to enter the Zabbix server details
echo "Please enter the Zabbix server IP address or hostname:"
read zabbix_server

# Prompt user to enter the hostname for this machine
echo "Please enter the hostname for this machine:"
read hostname

# Download the Zabbix agent 2 package for Debian based systems
sudo wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_7.0-2+ubuntu22.04_all.deb

# Install the Zabbix repository configuration package
sudo dpkg -i zabbix-release_7.0-2+ubuntu22.04_all.deb

# Update package lists
sudo apt update

# Install the Zabbix agent 2 package
sudo apt install zabbix-agent2 zabbix-agent2-plugin-*

# Backup the original Zabbix agent 2 configuration file
sudo cp /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf.bak

# Update the Zabbix agent 2 configuration file with the Zabbix server details and hostname
sudo sed -i "s/Server=127.0.0.1/Server=$zabbix_server/g" /etc/zabbix/zabbix_agent2.conf
sudo sed -i "s/ServerActive=127.0.0.1/ServerActive=$zabbix_server/g" /etc/zabbix/zabbix_agent2.conf
sudo sed -i "s/Hostname=Zabbix server/Hostname=$hostname/g" /etc/zabbix/zabbix_agent2.conf

# Restart the Zabbix agent 2 service
sudo systemctl restart zabbix-agent2
sudo systemctl enable zabbix-agent2

