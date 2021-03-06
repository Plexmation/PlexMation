#!/bin/bash
echo "Welcome to plexmation"

if [[ "$EUID" -ne 0 ]]; then
	echo "Please run this script with sudo (but not as root user)"
	exit 1
fi

sudo chmod +x scripts/install/*.sh
sudo ./scripts/install/update.sh
sudo ./scripts/install/prep.sh
sudo ./scripts/install/update.sh
sudo ./scripts/install/plex.sh
sudo ./scripts/install/sonarr.sh
sudo ./scripts/install/radarr.sh

#to be replaced with tautulli
#sudo ./scripts/install/plexpy.sh

sudo ./scripts/install/tautulli.sh

#irrelevent
#sudo ./scripts/install/webtools.sh

sudo ./scripts/install/ombi.sh
sudo ./scripts/install/jackett.sh
sudo ./scripts/install/mono-update.sh
sudo ./scripts/install/nginx.sh
sudo ./scripts/install/update.sh
