#!/bin/bash

clear
echo " "
echo "Insira uma senha para o root"
echo " "
sudo passwd root
clear
sudo mv /etc/apt/sources.list /etc/apt/sources.list-backup
sudo mv debian-12-sources.list /etc/apt/sources.list
clear
echo " "
echo "Atualizando a lista do repositório"
echo " "
sudo apt update
sudo apt upgrade
sudo apt install openbox \
                 obmenu \
                 obconf \
                 lxappearance \
                 lxterminal \
                 geany
sudo apt -f install
sudo reboot
