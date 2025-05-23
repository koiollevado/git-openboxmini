#!/bin/bash

clear
sudo apt install tint2 \
                 gsimplecal \
                 pnmixer \
                 obsession \
                 xdotool
clear
mkdir /home/$USER/.config/tint2
cp tint2rc /home/$USER/.config/tint2/
clear
sudo cp *.png /usr/share/pixmaps/
sudo cp tint2-button.desktop /usr/share/applications/
clear

echo " "
echo "Altere o arquivo autostart em ~/.config/openbox"
echo " "
echo "plank &"
echo "tint2 &"
echo "pnmixer &"
echo "conky -c /home/$USER/.conkyrc &"
echo "/home/$USER/.wallpapers"
sudo geany ~/.config/openbox/autostart

sudo apt -f install
sudo reboot
