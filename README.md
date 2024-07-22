# Devopsfetch

Devopsfetch is a tool for server information retrieval and monitoring. It collects and displays system information, including active ports, user logins, Nginx configurations, Docker images, and container statuses. It also includes a systemd service for continuous monitoring and logging.

## Installation and Configuration

1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/devopsfetch.git
   cd devopsfetch
2. Run the installation script:
   sudo ./install_devopsfetch.sh

## Usage
  
 1. Display Active Ports and Services:
    devopsfetch -p          # Display all active ports and services
    devopsfetch -p 80       # Provide detailed information about port 80

 2. List Docker Images and Containers:
    devopsfetch -d          # List all Docker images and containers
    devopsfetch -d <container_name>   # Provide detailed information about a specific container

 3. Display Nginx Domains and Ports:
    devopsfetch -n          # Display all Nginx domains and their ports
    devopsfetch -n <domain> # Provide detailed configuration information for a specific domain

 4. List Users and Last Login Times:
    devopsfetch -u          # List all users and their last login times
    devopsfetch -u <username> # Provide detailed information about a specific user

 5. Display Activities Within a Specified Time Range
    devopsfetch -t "2023-07-01" "2023-07-19"   # Display activities from July 1, 2023, to July 19, 2023

 6. Help:
    devopsfetch -h   # Display usage instructions

## Logging Mechanism
    Devopsfetch logs activities to /var/log/devopsfetch.log. Log rotation is configured to keep logs for 7 days and compress older logs.
