#Plex Home Location
#/var/lib/plexmediaserver/Library/Application\ Support/Plex\ Media\ Server/Plug-ins/

#Download the latest version from github and stick it in the plex plug-ins folder
#assuming plex plug-ins is in default location
sudo wget -t 0 -T 15 -P /var/lib/plexmediaserver/Library/Application\ Support/Plex\ Media\ Server/Plug-ins/ $( curl -s https://api.github.com/repos/ukdtom/WebTools.bundle/releases | grep browser_download_url | head -1 | cut -d \" -f 4 )
unzip WebTools*.zip && rm WebTools.*.zip
chown -R plex:plex /var/lib/plexmediaserver/Library/Application\ Support/Plex\ Media\ Server/Plug-ins/WebTools.bundle/
chmod -R 755 /var/lib/plexmediaserver/Library/Application\ Support/Plex\ Media\ Server/Plug-ins/WebTools.bundle/
