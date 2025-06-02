[Unit]
Description=Librespot (an open source Spotify client)
Documentation=https://github.com/librespot-org/librespot
Documentation=https://github.com/librespot-org/librespot/wiki/Options
Wants=network.target sound.target
After=network.target sound.target

[Service]
DynamicUser=yes
SupplementaryGroups=audio
Restart=always
RestartSec=10
ExecStart=/usr/bin/librespot --disable-audio-cache --zeroconf-port 2049 --name {{ device_name }} --bitrate 320 --enable-volume-normalisation --zeroconf-backend libmdns --normalisation-method basic


[Install]
WantedBy=multi-user.target
