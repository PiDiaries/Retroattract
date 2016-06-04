# Retroattract
Scripts to have Attract_mode the front end to Retrosmc instead of emulationstation


This is an alpha release right now. So I am not responsible for anything you do with this to your system. I am also very much a Noob. 




Disclaimer and other useful information. Read before installing!

First things first: I am NOT responsible if this does any harm to your system! I suggest only to install this on a system that the old installer wasn't run on already. You should have at least 2 GB of free space on your SD card.

Please report bugs and don't expect everything to work.  There are a few things I need to work out how to fix (The swap from KODI to Retropie isn't as smooth as I'd like. 



This will only work on a Raspberry Pi 1, 2 or 3  NOT on the Vero.
Installation

You will need to find your own Roms, artwork etc. 

wget https://raw.githubusercontent.com/PiDiaries/Retroattract/master/install-attract.sh

chmod +x install-attract.sh

./install-attract.sh

 Install Retrosmc first and use Binaries. Then Attarct, it will compile itself so go get pizza.  
 Set the controllers up in Emulationstation first for Libretro Emulators.  Then have fun configuring Attract-Mode. 

2/5/16 
Added the option to install some Emulator Configurations for Attract-Mode.  These should cover all the standard RetroPie Libretro Emulators that use the retroarch.cfg.  So no experimental emulators etc.  To save space Mame & FBA use the same folders in the Arcade directory for Artwork. 

To add extra folders in terminal 
            cd /home/osmc/RetroPie/roms/
            mkdir amstradcpc/boxart amstradcpc/marquee amstradcpc/snap amstradcpc/wheel arcade/flyer arcade/marquee arcade/snap arcade/wheel atari2600/boxart atari2600/marquee atari2600/snap atari2600/wheel atari7800/wheel atari7800/snap atari7800/marquee atari7800/boxart dreamcast/boxart dreamcast/marquee dreamcast/snap dreamcast/wheel atarilynx/boxart atarilynx/marquee atarilynx/snap atarilynx/wheel gamegear/boxart gamegear/marquee gamegear/snap gamegear/wheel gb/boxart gb/marquee gb/snap gb/wheel/ gba/boxart gba/marquee gba/snap gba/wheel gbc/boxart gbc/marquee gbc/snap gbc/wheel mastersystem/boxart mastersystem/marquee mastersystem/snap mastersystem/wheel megadrive/boxart megadrive/marquee megadrive/snap megadrive/wheel n64/boxart n64/marquee n64/snap n64/wheel nes/boxart nes/marquee nes/snap nes/wheel psx/boxart psx/marquee/ psx/snap psx/wheel snes/boxart snes/marquee snes/snap snes/wheel ngp/boxart ngp/marquee ngp/snap ngp/wheel  ngpc/boxart ngpc/marquee ngpc/snap ngpc/wheel neogeo/boxart neogeo/marquee neogeo/snap neogeo/wheel pcengine/boxart pcengine/marquee pcengine/snap pcengine/wheel psx/boxart psx/marquee psx/snap psx/wheel sega32x/boxart sega32x/marquee sega32x/snap sega32x/wheel segacd/boxart segacd/marquee segacd/snap segacd/wheel sg-1000/boxart sg-1000/marquee sg-1000/snap sg-1000/wheel vectrex/boxart vectrex/marquee vectrex/snap vectrex/wheel videopac/boxart videopac/marquee videopac/snap videopac/wheel wonderswan/boxart wonderswan/marquee wonderswan/snap wonderswan/wheel wonderswancolor/boxart wonderswancolor/marquee wonderswancolor/snap wonderswancolor/wheel zxspectrum/boxart zxspectrum/marquee zxspectrum/snap zxspectrum/wheel


WARNING.  I don't have roms for all systems so I couldn't test them all. So some of the rarer systems might need tweaked. 

I've also added some of the folders that are on Floobs image for Artwork. 

Credits

RetroPie 
OSMC 
mcobit for his Retrosmc. 
And Andrew Mickelson for his Attract-mode information.  
Without the above I would have nothing.
The people over at http://attractmode.org/ for their themes
Floob https://www.youtube.com/channel/UCdSu9Y0xAyY8V77vj6mQ-0g for his videos


Thanks to any one who gives it a go. 
http://pi-diaries.blogspot.co.uk/
