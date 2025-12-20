#/bin/bash
set -x
#Must be run as sudo
if [ $EUID -ne 0 ]
  then echo "Please run with sudo!"
  exit
fi


systemctl daemon-reload
systemctl stop dancepi.service
systemctl disable dancepi.service

