#!/bin/bash
echo "Welcome to plexmation"

if [[ "$EUID" -ne 0 ]]; then
	echo "Please run this script with sudo (but not as root user)"
	exit 1
fi

sudo chmod +x install/*.sh
sudo ./install/update.sh
sudo ./install/prep.sh
sudo ./install/update.sh
sudo ./install/plex.sh
sudo ./install/sonarr.sh
sudo ./install/radarr.sh
sudo ./install/plexpy.sh
sudo ./install/ombi.sh
sudo ./install/jackett.sh
sudo ./install/mono-update.sh
sudo ./install/nginx.sh
sudo ./install/update.sh
