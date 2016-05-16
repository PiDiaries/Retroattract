#!/bin/bash

# This is a script by J to install Attract-Mode to Retrosmc.
# I am not responsible for any harm done to your system.
# Using this is on your own risk.
# Script by J adapted from Mcobits'

# Version 0.001

# import variables from configfile

source "/home/osmc/RetroPie/scripts/retrosmc-config.cfg"

# setting up the menu

cmd=(dialog --backtitle "attractmode scripts installation - Version $CURRENT_VERSION" --menu "Welcome to the attractmode installation.\nWhat would you like to do?\n " 14 50 16)

options=(1 "Install attract"
         2 "Install Launcher Addon"
         3 "Remove Launcher Addon"
         4 "Update scripts"
         5 "compile Attract_Mode *if not already done do this first*")
         
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)


# install some programs needed to run the installation 

            sudo apt-get update 2>&1 | dialog --title "Updating package database..." --infobox "\nPlease wait...\n" 11 70
            sudo apt-get --show-progress -y install dialog git pv bzip2 psmisc libusb-1.0 alsa-utils 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Installing dialog and pv programs if they are not present" --gauge "\nPlease wait...\n" 11 70

# download the attract_mode scripts 

            wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/attract.sh https://raw.githubusercontent.com/PiDiaries/Retroattract/blob/master/scripts/attract.sh
            wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/attract_watchdog.sh https://raw.githubusercontent.com/PiDiaries/Retroattract/blob/master/scripts/attract_watchdog.sh
            chmod +x /home/osmc/RetroPie/scripts/attract.sh
            chmod +x /home/osmc/RetroPie/scripts/attract_watchdog.sh





# end installation

            dialog --title "FINISHED!" --msgbox "\nEnjoy your Attract-Mode installation!\nPress OK to return to the menu.\n" 11 70

# restart script

            exec /home/osmc/install-attract.sh
            ;;
        2)


# get the addon archive file from github

	  wget --no-check-certificate -w 4 -O plugin.program.attract-launcher-0.0.1.tar.gz https://raw.githubusercontent.com/PiDiaries/Retroattract/blob/master/plugin.program.attract-launcher-0.0.1.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Addon" --gauge "\nPlease wait...\n"  11 70

# extract the addon to the kodi addon directory

	  (pv -n plugin.program.attract-launcher-0.0.1.tar.gz | sudo tar xzf - -C /home/osmc/ ) 2>&1 | dialog --title "Extracting Addon" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode setup script" --title "Installing Addon" --msgbox "\nAddon installed.\n" 11 70

# remove archive file

          rm plugin.program.attract-launcher-0.0.1.tar.gz

# restart script

            exec /home/osmc/install-attract.sh
            ;;
        3)

# delete the addon from kodi addon directory

	   rm -r /home/osmc/.kodi/addons/plugin.program.attract-launcher
	   dialog --backtitle "Attract-Mode setup script" --title "Removing Addon" --msgbox "\nAddon removed.\n" 11 70

# restart script

            exec /home/osmc/install-attract.sh
            ;;
        4)

# download new versions of all scripts and make them executable

            wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/attract.sh.1 https://raw.githubusercontent.com/PiDiaries/Retroattract/blob/master/master/scripts/attract.sh
            wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/attract_watchdog.sh.1 https://raw.githubusercontent.com/PiDiaries/Retroattract/blob/master/master/scripts/attract_watchdog.sh
            wget --no-check-certificate -w 4 -O /home/osmc/install-attract.sh.1 https://raw.githubusercontent.com/PiDiaries/Retroattract/blob/master/master/install-attract.sh
            chmod +x /home/osmc/RetroPie/scripts/attract.sh.1
            chmod +x /home/osmc/RetroPie/scripts/attract_watchdog.sh.1
            chmod +x /home/osmc/install-attract.sh.1

# replace old with new scripts

            mv /home/osmc/install-attract.sh.1 /home/osmc/install-attract.sh
            mv /home/osmc/RetroPie/scripts/attract.sh.1 /home/osmc/RetroPie/scripts/attract.sh
            mv /home/osmc/RetroPie/scripts/attract_watchdog.sh.1 /home/osmc/RetroPie/scripts/attract_watchdog.sh

# restart script

            exec /home/osmc/install-attract.sh
            ;;
        5)
            
#download compile and install Attract-Mode
	    cd ~
	    mkdir develop
	    
#Install "Smfl-pi" And Attract-Mode Dependancies

	   sudo apt-get install cmake libflac-dev libogg-dev libvorbis-dev libopenal-dev libjpeg62-turbo-dev libfreetype6-dev  libudev-dev libavutil-dev libavcodec-dev libavformat-dev libavfilter-dev libswscale-dev libavresample-dev libfontconfig1-dev 

#Download and build sfml-pi

	    cd ~/develop
	    git clone --depth 1 https://github.com/mickelson/sfml-pi sfml-pi
	    mkdir sfml-pi/build;cd sfml-pi/build
	    cmake .. -DSFML_RPI=1 -DEGL_INCLUDE_DIR=/opt/vc/include -DEGL_LIBRARY=/opt/vc/lib/libEGL.so -DGLES_INCLUDE_DIR=/opt/vc/include -DGLES_LIBRARY=/opt/vc/lib/libGLESv1_CM.so
	    sudo make install
	    sudo ldconfig
	    
#Download and build Attract-Mode

	    cd ~/develop
	    git clone --depth 1 https://github.com/mickelson/attract attract
	    cd attract
	    make USE_GLES=1
	    sudo make install
# restart script

            exec /home/osmc/install-attract.sh
            ;;	    
    esac
done
Status API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Contact Help
