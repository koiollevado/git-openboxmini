#!/bin/bash

clear
sudo apt install tint2 -y
sudo apt install gsimplecal -y
sudo apt install pnmixer -y
sudo apt install obsession -y
clear
cp tint2rc /home/$USER/.config/tint2

echo " "
echo "Altere o arquivo autostart em ~/.config/openbox"
echo " "
echo "plank &"
echo "tint2 &"
echo "pnmixer &"
echo "conky -c /home/fassisfilho/.conkyrc &"
echo "/home/fassisfilho/.wallpapers"

sudo apt -f install
sudo reboot
