#!/usr/bin/env bash
#this script is used during testing

if [[ "$EUID" -ne 0 ]]; then
	echo "Please run this script with sudo (but not as root user)"
	exit 1
fi

sudo systemctl enable plexmediaserver
sudo systemctl enable sonarr
sudo systemctl enable radarr
sudo systemctl enable tautulli
sudo systemctl enable ombi
sudo systemctl enable jackett
sudo systemctl enable nginx
