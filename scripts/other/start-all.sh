#!/usr/bin/env bash
#this script is used during testing

if [[ "$EUID" -ne 0 ]]; then
	echo "Please run this script with sudo (but not as root user)"
	exit 1
fi

sudo systemctl start plexmediaserver
sudo systemctl start sonarr
sudo systemctl start radarr
sudo systemctl start tautulli
sudo systemctl start ombi
sudo systemctl start jackett
sudo systemctl start nginx
