# Point of Occupancy Tracking (POOT) Kiosk
The POOT kiosks run on a Raspberry Pi 3 with the [Raspberry Pi Touch Display](https://www.adafruit.com/product/2718). The user interface is presented in [Chromium running in kiosk mode](https://pimylifeup.com/raspberry-pi-kiosk/). The screen resolution of the display is 800 x 480 pixels.

## Set Up Instructions
1. [Install the Desktop version of the Raspberry OS](https://www.raspberrypi.org/documentation/installation/installing-images/README.md).
2. Rotate the screen display if necessary by the **config.txt** file and adding the line ***lcd_rotate=2*** to the top of the file.
3. Install require packages: [unclutter](https://wiki.debian.org/unclutter), and sed: `sudo apt-get install unclutter sed`
4. Set up Raspbian to auto login using: `sudo raspi-config` Within config navigate: **3 Boot Options -> B1 Desktop / CLI -> B4 Desktop Autologin**
5. Copy the **kiosk.sh** shell script to the home directory: */home/pi/*
6. Copy the **kiosk.service** to the */lib/systemd/system/* directory
7. Start the service on restart: `sudo systemctl enable kiosk.service`

## Useful Service Commands
* Load service into systemd: \
`sudo systemctl daemon-reload`
* Enable the service to start on restart: \
`sudo systemctl enable kiosk.service`
* Start the service immediately: \
`sudo systemctl start kiosk.service`
* Stop the service temporarily: \
`sudo systemctl stop kiosk.service`
* Disable the service, until it's enabled again: \
`sudo systemctl disable kiosk.service`
