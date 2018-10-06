#!/bin/bash
sudo adduser --disabled-password --system --no-create-home --gecos "PlexPy Service"  --group plexpy
sudo git clone https://github.com/JonnyWong16/plexpy.git /opt/ProgramData/plexpy
sudo chown -R plexpy:plexpy /opt/ProgramData/plexpy
sudo echo "[Unit]
Description=PlexPy Daemon

[Service]
ExecStart=/opt/ProgramData/plexpy/PlexPy.py --quiet --daemon --nolaunch --config /opt/ProgramData/plexpy/config.ini --datadir /opt/ProgramData/plexpy
GuessMainPID=no
Type=forking
User=plexpy
Group=plexpy

[Install]
WantedBy=multi-user.target"> /lib/systemd/system/plexpy.service
sudo systemctl enable plexpy
sudo systemctl start plexpy
