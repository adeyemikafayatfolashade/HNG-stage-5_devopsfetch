## Building Devopsfetch for Server Information Retrieval and Monitoring 

Devopsfetch is a tool for server information retrieval and monitoring. It collects and displays system information, including active ports, user logins, Nginx configurations, Docker images, and container statuses. It also includes a systemd service for continuous monitoring and logging.

## Prerequisites
- Bash
- Docker
- Nginx

## Installation and Configuration

1. Clone the repository:
    git clone https://github.com/adeyemikafayatfolashade/HNG-stage-5_devopsfetch.git
    cd HNG-stage-5_devopsfetch
2. Make the Script Executable and Run the Installation Script:
    chmod +x devopsfetch.sh
    sudo /.install_devopsfetch.sh
3. Create and enable the systemd service:
    sudo cp devopsfetch.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl enable devopsfetch.service
    sudo systemctl start devopsfetch.service
    sudo systemctl status devopsfetch.service

## Usage

1. Display Active Ports and Services and Provide Detailed Information about a Specific Port:
    devopsfetch -p          
    devopsfetch -p 80      
2. List Docker Images and Containers and Provide Detailed Information about a Specific Container:
    devopsfetch -d          
    devopsfetch -d alpine

3. Display Nginx Domains and Ports and Provide Detailed Configuration Information for a Specific Domain:
    devopsfetch -n          
    devopsfetch -n https://proxy.twinmom.com

4. List Users and Last Login Times and Provide Detailed Information about a Specific User:
    devopsfetch -u          
    devopsfetch -u kafayat-adeyemi

5. Display Activities Within a Specified Time Range:
    devopsfetch -t "2024-07-22" "2024-07-24"  

 ## Help
 
- To display usage instructions:
    devopsfetch -h   

## Logging Mechanism

- The activities is logged to /var/log/devopsfetch.log and log rotation is configured to keep logs for 7 days and compress older logs.
- The following command can be used to retrieve logs: 
    sudo cat /var/log/devopsfetch.log    
- To view the logs:
    journalctl -u devopsfetch.service
