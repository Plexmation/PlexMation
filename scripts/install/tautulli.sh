#!/bin/bash

#install dependencies
sudo apt-get install python python-setuptools tzdata

#adding user and group
sudo addgroup tautulli
sudo adduser --system --no-create-home tautulli --ingroup tautulli

#cloning repo
cd /opt
sudo git clone https://github.com/Tautulli/Tautulli.git

#permissions
sudo chown tautulli:tautulli -R /opt/Tautulli
sudo chown tautulli:tautulli -R /opt/ProgramData/Tautulli

mkdir /opt/ProgramData/Tautulli
#creating daemon scripts
echo echo "[Unit]
Description=Tautulli - Stats for Plex Media Server usage
Wants=network-online.target
After=network-online.target

[Service]
ExecStart=/opt/Tautulli/Tautulli.py --config /opt/ProgramData/Tautulli/config.ini --datadir /opt/Tautulli --quiet --daemon --nolaunch
GuessMainPID=no
Type=forking
User=tautulli
Group=tautulli

[Install]
WantedBy=multi-user.target"> /lib/systemd/system/tautulli.service

sudo systemctl enable tautulli
sudo systemctl start tautulli

#config location is in /opt/ProgramData/Tautulli
#for nginx reverse proxy: use module.conf in sites-availabe
#change http_root in config.ini for tautulli
#dont forget to clear nginx cache with: rm -rf /var/cache/nginx/*
#if it is default location
