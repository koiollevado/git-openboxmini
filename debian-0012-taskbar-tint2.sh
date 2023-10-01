#!/bin/bash

clear
sudo apt install -t stretch-backports tint2
sudo apt install gnome-menus -y
sudo apt install python-gtk2 -y
sudo apt install gsimplecal -y
sudo apt install pnmixer -y
sudo apt install obsession -y
clear

sudo apt -f install
sudo reboot
