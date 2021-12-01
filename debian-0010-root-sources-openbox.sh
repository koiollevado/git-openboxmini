#!/bin/bash

clear
echo " "
echo "Insira uma senha para o root"
echo " "
sudo passwd root
clear
sudo mv /etc/apt/sources.list /etc/apt/sources.list-backup
sudo mv debian-10-sources.list /etc/apt/sources.list
clear
echo " "
echo "Atualizando a lista do repositório"
echo " "
sudo apt update
sudo apt upgrade
sudo apt install openbox -y
sudo apt install obmenu -y
sudo apt install obconf -y
sudo apt install lxappearance -y
sudo apt install lxterminal -y
sudo apt install geany -y
sudo apt -f install
sudo reboot
