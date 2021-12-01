#!/bin/bash

echo " "
echo "Insira uma senha para o root"
sudo passwd root
clear
sudo apt update
sudo apt upgrade
sudo apt -f install
sudo apt install openbox obmenu obconf lxappearance lxterminal geany
sudo apt -f install
sudo reboot
