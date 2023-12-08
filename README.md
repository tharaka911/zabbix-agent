# Zabbix Agent 2 Installation Script

This bash script installs and configures the Zabbix Agent 2 on a Debian-based system. The script prompts the user to enter the IP address or hostname of the Zabbix server and the hostname for the machine. It also installs the necessary packages downloads and installs the Zabbix Agent 2 package, updates the Zabbix Agent 2 configuration file with the provided details, restarts the Zabbix Agent 2 service and enables it to start on boot.

# Usage

1. Clone the repository using the following command:
```bash
git clone https://github.com/tharaka911/zabbix-agent.git
```
2. Navigate to the cloned directory:
```bash
cd zabbix-agent
```
3. Make the script executable:
```bash
chmod +x install.sh
```
4. Run the script:
```bash
 ./install.sh
```
5. Enter the IP address or hostname of the Zabbix server and the hostname for the machine when prompted.

# Note: 

The script will add the zabbix user to the docker group and change the timezone to Asia/Seoul.

# Disclaimer

Use at your own risk. This script is provided as-is without any warranty or support. The author is not responsible for any damages or losses incurred while using this script.

