 
#!/bin/bash

# This scripts starts the emulationstation watchdog deamon and
# emulationstation itself while stopping KODI afterwards.
# Script by mcobit

#clear the virtaul terminal 7 screen

sudo openvt -c 7 -s -f clear

# start the watchdog script

sudo su osmc -c "sh /home/osmc/RetroPie/scripts/attract_watchdog.sh &" &

# stop kodi to free input devices for attract

sudo su -c "systemctl stop mediacenter &" &


# start Attract-Mode on vitrual terminal 7 and detach it

sudo su osmc -c "nohup openvt -c 7 -f -s attract >/dev/null 2>&1 &" &

# clear the screen again

sudo openvt -c 7 -s -f clear

# wait a bit to make sure Attract-Mode is running detached from kodi

sleep 1



exit