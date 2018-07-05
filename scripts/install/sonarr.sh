sudo adduser --disabled-password --system --home /opt/ProgramData/sonarr --gecos "Sonarr Service" --group sonarr
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
echo "deb http://apt.sonarr.tv/ master main" | sudo tee /etc/apt/sources.list.d/sonarr.list
sudo apt-get update -y && sudo apt-get install nzbdrone -y
sudo chown -R sonarr:sonarr /opt/NzbDrone

sudo echo "[Unit]
Description=Sonarr Daemon
After=syslog.target network.target

[Service]
User=sonarr
Group=sonarr
Type=simple
ExecStart=/usr/bin/mono /opt/NzbDrone/NzbDrone.exe -nobrowser
TimeoutStopSec=20
KillMode=process
Restart=on-failure

[Install]
WantedBy=multi-user.target"> /lib/systemd/system/sonarr.service

sudo systemctl enable sonarr
sudo systemctl start sonarr
