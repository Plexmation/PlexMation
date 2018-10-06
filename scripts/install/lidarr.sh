#!/bin/bash
sudo adduser --disabled-password --system --home /opt/ProgramData/Lidarr --gecos "Lidarr Service" --group lidarr

sudo wget -t 0 -T 15 -P /opt $( curl -s https://api.github.com/repos/lidarr/Lidarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 )
sudo tar -xvzf /opt/Lidarr.develop.*.linux.tar.gz -C /opt
sudo rm -rf /opt/Lidarr.develop.*.linux.tar.gz

#specified by the install instructions over at the lidarr github
sudo chown -R lidarr:lidarr   /opt/ProgramData/Lidarr
sudo chmod -R a=,a+X,u+rw,g+r /opt/ProgramData/Lidarr

sudo echo "[Unit]
Description=Lidarr Daemon
After=network.target

[Service]
User=lidarr
Group=lidarr
Type=simple
ExecStart=/usr/bin/mono /opt/ProgramData/Lidarr/Lidarr.exe -nobrowser
TimeoutStopSec=20
KillMode=process
Restart=on-failure
[Install]
WantedBy=multi-user.target"> /lib/systemd/system/lidarr.service

systemctl enable lidarr.service
systemctl start lidarr.service
