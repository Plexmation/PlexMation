sudo adduser --disabled-password --system --home /opt/ProgramData/jackett --gecos "Jackett Service" --group jackett
wget -t 0 -T 15 -P /opt $( curl -s https://api.github.com/repos/Jackett/Jackett/releases/latest | grep browser_download_url | head -1 | cut -d \" -f 4 )
sudo tar -xvf /opt/Jackett.Binaries.Mono.tar.gz -C /opt
sudo rm /opt/Jackett.Binaries.Mono.tar.gz
sudo chown -R jackett:jackett /opt/Jackett
echo "[Unit]
Description=Jackett Daemon
After=network.target

[Service]
User=jackett
Group=jackett
Type=simple
ExecStart=/usr/bin/mono /opt/Jackett/JackettConsole.exe
TimeoutStopSec=20
Restart=no
RemainAfterExit=yes


[Install]
WantedBy=multi-user.target"> /lib/systemd/system/jackett.service

sudo systemctl enable jackett
sudo systemctl start jackett
