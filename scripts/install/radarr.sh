sudo adduser --disabled-password --system --gecos "Radarr Service" --group radarr
sudo apt update -y && sudo apt install -y libmono-cil-dev curl mediainfo
#cd /opt
wget -t 0 -T 15 -P /opt $( curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 )
tar -xvzf /opt/Radarr.develop.*.linux.tar.gz -C /opt
rm -rf /opt/Radarr.develop.*.linux.tar.gz
sudo chown -R radarr:radarr /opt/Radarr
sudo echo "[Unit]
Description=Radarr Daemon
After=syslog.target network.target

[Service]
User=radarr
Group=radarr

Type=simple
ExecStart=/usr/bin/mono /opt/Radarr/Radarr.exe -nobrowser
TimeoutStopSec=20
KillMode=process
Restart=on-failure

[Install]
WantedBy=multi-user.target"> /lib/systemd/system/radarr.service

sudo systemctl enable radarr.service
sudo systemctl start radarr.service