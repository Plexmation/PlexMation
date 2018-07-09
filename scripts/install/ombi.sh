#!/bin/bash
sudo adduser --disabled-password --system --no-create-home --gecos "Ombi Service" --group ombi
sudo mkdir /opt/ombi
sudo wget -t 0 -T 15 -O /opt/Ombi.tar.gz $( curl -s https://api.github.com/repos/tidusjar/Ombi/releases/latest | grep -E browser_download_url | grep -E linux.tar | cut -d \" -f 4 )
tar xvfz /opt/Ombi.tar.gz -C /opt/ombi
sudo rm -rf /opt/Ombi.tar.gz
sudo chown -R ombi:ombi /opt/ombi
sudo echo "[Unit]
Description=Ombi Service
After=network.target

[Service]
User=ombi
Group=ombi
Type=simple
WorkingDirectory=/opt/ombi/
ExecStart=/opt/ombi/Ombi
Restart=always
TimeoutStopSec=30

[Install]
WantedBy=multi-user.target"> /lib/systemd/system/ombi.service

sudo systemctl enable ombi
sudo systemctl start ombi
