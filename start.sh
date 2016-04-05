#!/bin/bash

# enable camera
modprobe bcm2835-v4l2

#Set the root password as root if not set as an ENV variable (for dropbear)
export PASSWD=${PASSWD:=root}
echo "root:$PASSWD" | chpasswd

echo "Starting supervisor"
supervisord -n -c /usr/local/etc/supervisord.conf
