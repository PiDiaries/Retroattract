 
#!/bin/bash

# Script by J based on one by mcobit

. /home/osmc/RetroPie/scripts/retrosmc-config.cfg

# ugly fix for people having trouble with CEC

if [ "$CECFIX" = 1 ]; then
sudo /usr/osmc/bin/cec-client -p 1 &
sleep 1
sudo kill -9 $(pidof cec-client)
fi

# deactivate the hyperion deamon if it is running

if [ "$HYPERIONFIX" = 1 ]; then
   if [ $(pgrep hyperion) ]; then
      sudo service hyperion stop
   fi
fi

# give attract-mode time to start up

sleep 5

# activate hyperion daemon if it is not running

if [ "$HYPERIONFIX" = 1 ]; then
   if [ ! $(pgrep hyperion) ]; then
      sudo service hyperion start
   fi
fi

# check for attract-mode running

while [ true ]; do
	VAR1="$(pgrep attract)"

# if attract-mode is quit, clear the screen of virtual terminal 7 and show a message

		if [ ! "$VAR1" ]; then
			sudo openvt -c 7 -s -f clear

# restart kodi

	sudo su -c "sudo systemctl start mediacenter &" &

# exit script

			exit
		else

# if attract-mode is still running, wait 2 seconds and check again (could probably be longer, but doesn't seem to impact performance by much)

			sleep 2
fi
done
exit