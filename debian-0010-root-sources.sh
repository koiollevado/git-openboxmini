#!/bin/bash

clear
echo " "
echo "Insira uma senha para o ROOT"
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

sudo apt install -f

clear

sudo apt search xserver-xorg-video-
