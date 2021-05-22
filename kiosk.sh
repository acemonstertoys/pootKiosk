#!/bin/bash
# /home/pi/kiosk.sh
# Setting up the Raspberry Pi Kiosk

# set the current xsession not to blank out the screensaver
xset s noblank
# disables the screensaver
xset s off
# disables the entire “display power management system”
xset -dpms

# hide the mouse
unclutter -idle 0.5 -root &

# search through the Chromium preferences file 
# and clear out any flags that would make the warning bar appear
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences

# clear Chromium cache
sudo rm -r  ~/.cache/Chromium/Default/Cache/*

# launch Chromium
/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk "https://your.ui.url.goes.here" & 
