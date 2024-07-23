#!/bin/bash

# Install necessary dependencies
sudo apt update
sudo apt install -y docker.io nginx

# Enable and start Docker and Nginx services
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl enable nginx
sudo systemctl start nginx

# Copy devopsfetch.sh to /usr/local/bin
sudo cp devopsfetch.sh /usr/local/bin/devopsfetch
sudo chmod +x /usr/local/bin/devopsfetch

# Create systemd service file
cat <<EOF | sudo tee /etc/systemd/system/devopsfetch.service
[Unit]
Description=Devopsfetch Service
After=network.target

[Service]
ExecStart=/usr/local/bin/devopsfetch.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# Enable and start the devopsfetch service
sudo systemctl enable devopsfetch
sudo systemctl start devopsfetch

# Setup log rotation
cat <<EOF | sudo tee /etc/logrotate.d/devopsfetch
/var/log/devopsfetch.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
    create 0640 root adm
}
EOF

echo "Installation and setup complete."
