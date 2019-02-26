#!/usr/bin/env bash
#this script is used during testing

if [[ "$EUID" -ne 0 ]]; then
	echo "Please run this script with sudo (but not as root user)"
	exit 1
fi

sudo systemctl stop plexmediaserver
sudo systemctl stop sonarr
sudo systemctl stop radarr
sudo systemctl stop tautulli
sudo systemctl stop ombi
sudo systemctl stop jackett
sudo systemctl stop nginx
