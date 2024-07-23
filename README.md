## BUILDING DEVOPSFETCH FOR SERVER INFORMATION RETRIEVAL AND MONITORING

Devopsfetch is a tool for server information retrieval and monitoring. It collects and displays system information, including active ports, user logins, Nginx configurations, Docker images, and container statuses. It also includes a systemd service for continuous monitoring and logging.

## Installation and Configuration

1. Clone the repository:
   git clone https://github.com/adeyemikafayatfolashade/HNG-stage-5_devopsfetch.git
   cd HNG-stage-5_devopsfetch
2. Run the installation script:
   sudo ./install_devopsfetch.sh

## Usage
  
 1. Display Active Ports and Services and provide detailed information about a soecific port:
    devopsfetch -p          
    devopsfetch -p 80      

 2. List Docker Images and Containers and provide detailed information about a specific container:
    devopsfetch -d          
    devopsfetch -d <container_name>  

 3. Display Nginx Domains and Ports and provide detailed configuration information for a specific domain:
    devopsfetch -n          
    devopsfetch -n <domain> 

 4. List Users and Last Login Times and provide detailed information about a specific user:
    devopsfetch -u          
    devopsfetch -u <username> 

 5. Display Activities Within a Specified Time Range:
    devopsfetch -t "2024-07-22" "2024-07-24"  

 ## Help
    To display usage instructions, run devopsfetch -h   

## Logging Mechanism
    The activities is logged to /var/log/devopsfetch.log.
    Log rotation is configured to keep logs for 7 days and compress older logs.
    The following command can be used to retrieve logs: 
    sudo cat /var/log/devopsfetch.log
    
