sudo adduser --disabled-password --system --no-create-home --gecos "Ombi Service" --group ombi
sudo wget -t 0 -T 15 -P /opt -O Ombi.tar.gz $( curl -s https://api.github.com/repos/tidusjar/Ombi/releases/latest | grep -E browser_download_url | grep -E linux.tar | cut -d \" -f 4 )
sudo mkdir /opt/ombi
tar xvfz /opt/Ombi.tar.gz -C /opt/ombi
#sudo unzip /opt/Ombi.zip -d /opt/ombi
sudo rm -rf /opt/Ombi.zip
sudo chown -R ombi:ombi /opt/ombi
sudo echo "[Unit]
Description=Ombi Service
After=network.target

[Service]
User=ombi
Group=ombi
Type=simple
WorkingDirectory=/opt/ombi/Release/
ExecStart=/usr/bin/mono /opt/ombi/Release/Ombi.exe
Restart=always
TimeoutStopSec=30

[Install]
WantedBy=multi-user.target"> /lib/systemd/system/ombi.service

sudo systemctl enable ombi
sudo systemctl start ombi
