#!/bin/bash

# https://superuser.com/questions/1561076/systemctl-user-failed-to-connect-to-bus-no-such-file-or-directory-debian-9/1663752#1663752
# Fix error => systemd timer failed to create bus connection: No such file or directory
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"


export LOGGING_LEVEL=INFO
source /home/birdofprey/dancyPi-audio-reactive-led/.venv/bin/activate
python3 visualization.py scroll
# Save the exit status
STATUS=$?

exit $STATUS

