#!/bin/bash

# This is a script by J to install Themes tp Attract-Mode on Retrosmc.
# I am not responsible for any harm done to your system.
# Using this is on your own risk.
# Script by J 

# Version 0.001

# setting up the menu

cmd=(dialog --backtitle "Attract-Mode Themes Installation - Version $CURRENT_VERSION" --menu "Welcome to the Attract-Mode Theme Installation.\nWhat would you like to do?\n " 14 50 16)

options=(1 "ArcadeBliss"
	 2 "Cockpit"
	 3 "Coinops"
         4 "Concept"
         5 "Emulation-Station"
         6 "FinalBurn"
         7 "Game Station"
         8 "MvsComplete"
         9 "Nevato"
         10 "Robospin"
         11 "Robospin-betanew"
         12 "Uni_Cade"
         13 "Working"
         14 "Xtras"
          )

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
        #Install ArcadeBliss
        
         wget --no-check-certificate -w 4 -O arcadebliss.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/arcadebliss.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n arcadebliss.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode Theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm arcadebliss.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            2)
            #Install Cockpit
            wget --no-check-certificate -w 4 -O cockpit.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/cockpit.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	    (pv -n cockpit.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	     dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	   
	   rm cockpit.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            
            3)
            #Install Coinops
            
            wget --no-check-certificate -w 4 -O coinops.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/coinops.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n coinops.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm coinops.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            4)
            #Install Concept
            
            wget --no-check-certificate -w 4 -O concept.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/concept.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n concept.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm concept.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            5)
            #Install emulationstation
            
            wget --no-check-certificate -w 4 -O emulationstation.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/emulationstation.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n emulationstation.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm emulationstation.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            6)
              #Install Final Burn
            
            wget --no-check-certificate -w 4 -O finalburn.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/finalburn.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n finalburn.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm finalburn.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            7)
              #Install Game Station
            
            wget --no-check-certificate -w 4 -O gamestation.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/gamestation.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n gamestation.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm gamestation.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            8)
              #Install MvsComplete
            
            wget --no-check-certificate -w 4 -O mvscomplete.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/mvscomplete.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n mvscomplete.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm mvscomplete.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            9)
              #Install Nevato
            
            wget --no-check-certificate -w 4 -O nevato.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/nevato.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n nevato.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm nevato.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            10)
            
              #Install Robospin
            
            wget --no-check-certificate -w 4 -O robospin.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/robospin.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n robospin.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm robospin.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            11)
            
              #Install Robospin-betanew
            
            wget --no-check-certificate -w 4 -O robospinbetanew.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/robospinbetanew.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n robospinbetanew.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm robospinbetanew.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            12)
            
              #Install Unicade
            
            wget --no-check-certificate -w 4 -O unicade.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/unicade.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n unicade.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm unicade.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            13)
            
              #Install Working
            
            wget --no-check-certificate -w 4 -O working.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/working.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n working.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm working.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
            14)
            
              #Install Xtras
            
            wget --no-check-certificate -w 4 -O xtras.tar.gz https://github.com/PiDiaries/Retroattract/raw/master/themes/xtras.tar.gz 2>&1 | grep --line-buffered -oP "(\d+(\.\d+)?(?=%))" | dialog --title "Downloading Theme" --gauge "\nPlease wait...\n"  11 70

        
	  (pv -n xtras.tar.gz | sudo tar xzf - -C /home/osmc/.attract/layouts/ ) 2>&1 | dialog --title "Extracting Theme" --gauge "\nPlease wait...\n" 11 70
	  dialog --backtitle "Attract-Mode theme setup script" --title "Installing Theme" --msgbox "\nTheme installed.\n" 11 70
	  
	  rm xtras.tar.gz
	  
	   exec /home/osmc/themes.sh
            ;;
            
    esac
done