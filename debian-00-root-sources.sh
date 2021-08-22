
#!/bin/bash

clear
echo " "
echo "Insira uma senha para o ROOT"
echo " "
sudo passwd root

clear

sudo mv /etc/apt/sources.list /etc/apt/sources.list-backup

if [ $(lsb_release -sd) == "Debian GNU/Linux 11 (bullseye)"]; then
sudo mv debian-11-sources.list /etc/apt/sources.list; else
sudo mv debian-10-sources.list /etc/apt/sources.list; fi

clear

echo " "
echo "Atualizando a lista do repositório"
sudo apt update
sudo apt upgrade

sudo apt install -f

clear

sudo apt search xserver-xorg-video-
