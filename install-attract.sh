#!/bin/bash

# This is a script by J to install Attract-Mode to Retrosmc.
# I am not responsible for any harm done to your system.
# Using this is on your own risk.
# Script by J adapted from Mcobits'

# Version 0.001

# import variables from configfile

source "/home/osmc/RetroPie/scripts/retrosmc-config.cfg"

# setting up the menu

cmd=(dialog --backtitle "attract-mode scripts installation - Version $CURRENT_VERSION" --menu "Welcome to the Retrosmc Attract-Mode Installation.\nWhat would you like to do?\n " 14 100 16)

options=(1 "Install  Retrosmc"
	 2 "Install Attract-Mode"
	 3 "Install Themes"
	 4 "Install Libretro Emulator Configs + Basic Setup"
         5 "Remove Launcher Addons"
         6 "Update scripts"
         )
         
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
# create the config directory and file

            mkdir -p /home/osmc/RetroPie/scripts
            touch "/home/osmc/RetroPie/scripts/retrosmc-config.cfg"

# install some programs needed to run the installation and retrosmc

            sudo apt-get update 2>&1 | dialog --title "Updating package database..." --infobox "\nPlease wait...\n" 11 70
            sudo apt-get --show-progress -y install dialog git pv bzip2 psmisc libusb-1.0 alsa-utils joystick 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Installing dialog and pv programs if they are not present" --gauge "\nPlease wait...\n" 11 70

# download the retrosmc scripts and files

            wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/retropie.sh https://raw.githubusercontent.com/mcobit/retrosmc/master/scripts/retropie.sh
            wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/retropie_watchdog.sh https://raw.githubusercontent.com/mcobit/retrosmc/master/scripts/retropie_watchdog.sh
            chmod +x /home/osmc/RetroPie/scripts/retropie.sh
            chmod +x /home/osmc/RetroPie/scripts/retropie_watchdog.sh

# add fix to config.txt for sound

if [[ ! $(grep "dtparam=audio=on" "/boot/config.txt") ]]; then
sudo su -c 'echo -e "dtparam=audio=on" >> "/boot/config.txt"'
fi

# set the output volume

amixer set PCM 100

# clone the retropie git and start the installation

            cd
            git clone git://github.com/RetroPie/RetroPie-Setup.git
            cd /home/osmc/RetroPie-Setup
            sudo ./retropie_setup.sh

# check for the right configuration and existance of the es_input file to ensure joystick autoconfig to work (important on update)

            if [ ! "$(grep Action /home/osmc/.emulationstation/es_input.cfg)" ]; then
                mkdir "/home/osmc/.emulationstation"
                cat > "/home/osmc/.emulationstation/es_input.cfg" << _EOF_
<?xml version="1.0"?>
<inputList>
  <inputAction type="onfinish">
    <command>/opt/retropie/supplementary/emulationstation/scripts/inputconfiguration.sh</command>
  </inputAction>
</inputList>
_EOF_
            fi
# get the addon archive file from github

	wget --no-check-certificate -w 4 -O plugin.program.retropie-launcher-0.0.1.tgz https://github.com/mcobit/retrosmc/raw/master/plugin.program.retropie-launcher-0.0.1.tgz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Addon" --gauge "\nPlease wait...\n"  11 70
	
	# extract the addon to the kodi addon directory

	  (pv -n plugin.program.retropie-launcher-0.0.1.tgz | sudo tar xzf - -C /home/osmc/ ) 2>&1 | dialog --title "Extracting Addon" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "RetroPie-OSMC setup script" --title "Installing Addon" --msgbox "\nAddon installed.\n" 11 70
       
# remove archive file
	rm  plugin.program.retropie-launcher-0.0.1.tgz
	
# restart script

            exec /home/osmc/install-attract.sh
            ;;	
	
	2)
	
# install some programs needed to run the installation 

            sudo apt-get update 2>&1 | dialog --title "Updating package database..." --infobox "\nPlease wait...\n" 11 70
            sudo apt-get --show-progress -y install dialog git pv bzip2 psmisc libusb-1.0 alsa-utils pulseaudio 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Installing dialog and pv programs if they are not present" --gauge "\nPlease wait...\n" 11 70
            
#download compile and install Attract-Mode
	    cd ~
	    mkdir develop
	    mkdir .attract
	    cd .attract
	    mkdir layouts
	    mkdir scripts
	    mkdir emulators
	    cd ~
	    
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
	    
# download the attract_mode scripts 

            wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/attract.sh https://raw.githubusercontent.com/PiDiaries/Retroattract/master/scripts/attract.sh
            wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/attract_watchdog.sh https://raw.githubusercontent.com/PiDiaries/Retroattract/master/scripts/attract_watchdog.sh
            wget --no-check-certificate -w 4 -O /home/osmc/.attract/scripts/themes.sh https://raw.githubusercontent.com/PiDiaries/Retroattract/master/scripts/themes.sh
            wget --no-check-certificate -w 4 -O /home/osmc/.attract/emulators/scripts.cfg https://raw.githubusercontent.com/PiDiaries/Retroattract/master/Configs/scripts.cfg
            wget --no-check-certificate -w 4 -O /home/osmc/.attract/scripts/Shutdown.sh https://raw.githubusercontent.com/PiDiaries/Retroattract/master/scripts/Shutdown.sh
            
# make executable 
 
 	    chmod +x /home/osmc/RetroPie/scripts/attract.sh
            chmod +x /home/osmc/RetroPie/scripts/attract_watchdog.sh
            chmod +x /home/osmc/.attract/scripts/themes.sh
            chmod +x /home/osmc/.attract/scripts/Shutdown.sh


            

# Add extra folders
            cd /home/osmc/RetroPie/roms/
            mkdir amstradcpc/boxart amstradcpc/marquee amstradcpc/snap amstradcpc/wheel arcade/flyer arcade/marquee arcade/snap arcade/wheel atari2600/boxart atari2600/marquee atari2600/snap atari2600/wheel atari7800/wheel atari7800/snap atari7800/marquee atari7800/boxart dreamcast/boxart dreamcast/marquee dreamcast/snap dreamcast/wheel atarilynx/boxart atarilynx/marquee atarilynx/snap atarilynx/wheel gamegear/boxart gamegear/marquee gamegear/snap gamegear/wheel gb/boxart gb/marquee gb/snap gb/wheel/ gba/boxart gba/marquee gba/snap gba/wheel gbc/boxart gbc/marquee gbc/snap gbc/wheel mastersystem/boxart mastersystem/marquee mastersystem/snap mastersystem/wheel megadrive/boxart megadrive/marquee megadrive/snap megadrive/wheel n64/boxart n64/marquee n64/snap n64/wheel nes/boxart nes/marquee nes/snap nes/wheel psx/boxart psx/marquee/ psx/snap psx/wheel snes/boxart snes/marquee snes/snap snes/wheel ngp/boxart ngp/marquee ngp/snap ngp/wheel  ngpc/boxart ngpc/marquee ngpc/snap ngpc/wheel neogeo/boxart neogeo/marquee neogeo/snap neogeo/wheel pcengine/boxart pcengine/marquee pcengine/snap pcengine/wheel psx/boxart psx/marquee psx/snap psx/wheel sega32x/boxart sega32x/marquee sega32x/snap sega32x/wheel segacd/boxart segacd/marquee segacd/snap segacd/wheel sg-1000/boxart sg-1000/marquee sg-1000/snap sg-1000/wheel vectrex/boxart vectrex/marquee vectrex/snap vectrex/wheel videopac/boxart videopac/marquee videopac/snap videopac/wheel wonderswan/boxart wonderswan/marquee wonderswan/snap wonderswan/wheel wonderswancolor/boxart wonderswancolor/marquee wonderswancolor/snap wonderswancolor/wheel zxspectrum/boxart zxspectrum/marquee zxspectrum/snap zxspectrum/wheel
             
            
# get the addon archive file from github

	  wget --no-check-certificate -w 4 -O plugin.program.attract-launcher-0.0.1.tar.gz https://raw.githubusercontent.com/PiDiaries/Retroattract/master/plugin.program.attract-launcher-0.0.1.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Addon" --gauge "\nPlease wait...\n"  11 70

# extract the addon to the kodi addon directory

	  (pv -n plugin.program.attract-launcher-0.0.1.tar.gz | sudo tar xzf - -C /home/osmc/.kodi/addons/ ) 2>&1 | dialog --title "Extracting Addon" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode setup script" --title "Installing Addon" --msgbox "\nAddon installed.\n" 11 70

# remove archive file

          rm plugin.program.attract-launcher-0.0.1.tar.gz
# end installation

            dialog --title "FINISHED!" --msgbox "\nEnjoy your Attract-Mode installation!\nPress OK to return to the menu.\n" 11 70

# restart script

            exec /home/osmc/install-attract.sh
            ;;
        
        3)
        #Install Themes
        
        wget --no-check-certificate -w 4 -O /home/osmc/themes.sh https://raw.githubusercontent.com/PiDiaries/Retroattract/master/scripts/themes.sh
        
        chmod +x /home/osmc/themes.sh
        sudo ./themes.sh
        
        exec /home/osmc/install-attract.sh
            ;;
        
        4)
        #Download and extract the Emulator Cofiguration files. 
            cd ~
            mkdir .attract
            mkdir .attract/emulators/
            wget --no-check-certificate -w 4 -O emulators.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/emulators.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Archive" --gauge "\nPlease wait...\n"  11 70
            
            (pv -n emulators.tar.gz | sudo tar xzf - -C /home/osmc/.attract/emulators/ ) 2>&1 | dialog --title "Extracting Emulator Configuration Files" --gauge "\nPlease wait...\n" 11 70
            dialog --backtitle "Attract-Mode setup script" --title "Installing Files" --msgbox "\nEmulator Configuration Files installed.\n" 11 70
            
            #Install Robospin-betanew
            
            wget --no-check-certificate -w 4 -O robospinbetanew.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/robospinbetanew.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n robospinbetanew.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode setup script" --title "Installing set up" --msgbox "\nSetup installed.\n" 11 70
	  
	  rm robospinbetanew.tar.gz
           
#Get Attract config
            wget --no-check-certificate -w 4 -O /home/osmc/.attract/attract.cfg https://raw.githubusercontent.com/PiDiaries/Retroattract/master/Configs/attract.cfg
            
            
           exec /home/osmc/install-attract.sh
            ;;
            
        5)

# delete the addon from kodi addon directory

	   rm -r /home/osmc/.kodi/addons/plugin.program.attract-launcher /home/osmc/.kodi/addons/plugin.program.retropie-launcher
	   dialog --backtitle "Attract-Mode setup script" --title "Removing Addon" --msgbox "\nAddon removed.\n" 11 70

# restart script

            exec /home/osmc/install-attract.sh
            ;;
        6)

# download new versions of all scripts and make them executable
	    wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/retropie.sh.1 https://raw.githubusercontent.com/mcobit/retrosmc/master/scripts/retropie.sh
            wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/retropie_watchdog.sh.1 https://raw.githubusercontent.com/mcobit/retrosmc/master/scripts/retropie_watchdog.sh
            wget --no-check-certificate -w 4 -O /home/osmc/install-retrosmc.sh.1 https://raw.githubusercontent.com/mcobit/retrosmc/master/install-retrosmc.sh
            wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/attract.sh https://raw.githubusercontent.com/PiDiaries/Retroattract/master/scripts/attract.sh
	    wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/attract_watchdog.sh.1 https://raw.githubusercontent.com/PiDiaries/Retroattract/master/scripts/attract_watchdog.sh
	    wget --no-check-certificate -w 4 -O /home/osmc/RetroPie/scripts/install-attract.sh.1 https://raw.githubusercontent.com/PiDiaries/Retroattract/master/install-attract.sh
	    wget --no-check-certificate -w 4 -O /home/osmc/.attract/emulators/scripts.cfg.1 https://raw.githubusercontent.com/PiDiaries/Retroattract/master/Configs/scripts.cfg
            wget --no-check-certificate -w 4 -O /home/osmc/.attract/scripts/Shutdown.sh.1 https://raw.githubusercontent.com/PiDiaries/Retroattract/master/scripts/Shutdown.sh
	    
	    
# make executable            
        
	chmod +x /home/osmc/RetroPie/scripts/retropie.sh.1
        chmod +x /home/osmc/RetroPie/scripts/retropie_watchdog.sh.1
        chmod +x /home/osmc/install-retrosmc.sh.1
	chmod +x /home/osmc/RetroPie/scripts/attract.sh.1
        chmod +x /home/osmc/RetroPie/scripts/attract_watchdog.sh.1
        chmod +x /home/osmc/install-attract.sh.1
# replace old with new scripts

         
	    mv /home/osmc/install-retrosmc.sh.1 /home/osmc/install-retrosmc.sh
            mv /home/osmc/RetroPie/scripts/retropie.sh.1 /home/osmc/RetroPie/scripts/retropie.sh
            mv /home/osmc/RetroPie/scripts/retropie_watchdog.sh.1 /home/osmc/RetroPie/scripts/retropie_watchdog.sh
            mv /home/osmc/.attract/scripts/Shutdown.sh.1 /home/osmc/.attract/scripts/Shutdown.sh
            mv /home/osmc/.attract/emulators/scripts.cfg.1 /home/osmc/.attract/emulators/scripts.cfg
# restart script

            exec /home/osmc/install-attract.sh
            ;;
    esac
done

