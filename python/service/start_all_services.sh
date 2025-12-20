#/bin/bash
set -x
#Must be run as sudo
if [ $EUID -ne 0 ]
  then echo "Please run with sudo!"
  exit
fi


cp dancepi.service /etc/systemd/system
systemctl daemon-reload
systemctl enable dancepi.service
systemctl start dancepi.service

