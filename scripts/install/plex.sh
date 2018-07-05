#!/bin/bash

#adding repo
echo deb https://downloads.plex.tv/repo/deb ./public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -

#updating for repo to take effect
sudo apt-get update -y

#installing plex via repo
sudo apt-get install plexmediaserver -y
