#!/usr/bin/env bash
#this script is used during testing

if [[ "$EUID" -ne 0 ]]; then
	echo "Please run this script with sudo (but not as root user)"
	exit 1
fi

sudo systemctl disable plexmediaserver
sudo systemctl disable sonarr
sudo systemctl disable radarr
sudo systemctl disable tautulli
sudo systemctl disable ombi
sudo systemctl disable jackett
sudo systemctl disable nginx
