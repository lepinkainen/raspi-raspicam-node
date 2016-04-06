#!/bin/bash

echo "Enabling raspi camera module"
modprobe bcm2835-v4l2
echo "Enabling i2c"
i2c-bcm2708
i2c-dev

#Set the root password as root if not set as an ENV variable (for dropbear)
export PASSWD=${PASSWD:=root}
echo "root:$PASSWD" | chpasswd

echo "Starting supervisor"
supervisord -n -c /usr/local/etc/supervisord.conf
