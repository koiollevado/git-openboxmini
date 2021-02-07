
#!/bin/bash

sudo passwd root

sudo sed -i "s/^deb-src http\:\/\/b/# deb-src http\:\/\/b/g" /etc/apt/sources.list
sudo sed -i "s/^deb-src http\:\/\/a/# deb-src http\:\/\/a/g" /etc/apt/sources.list
sudo sed -i "s/^deb-src http\:\/\/s/# deb-src http\:\/\/s/g" /etc/apt/sources.list
sudo sed -i "s/^deb http\:\/\/a/# deb http\:\/\/a/g" /etc/apt/sources.list

sudo sed -i "s/^deb cdrom/# deb cdrom/g" /etc/apt/sources.list

sudo sed -i "s/debian buster main/debian buster main contrib non-free/g" /etc/apt/sources.list
sudo sed -i "s/debian buster-updates main/debian buster-updates main contrib non-free/g" /etc/apt/sources.list
sudo sed -i "s/buster\/updates main/buster\/updates main contrib non-free/g" /etc/apt/sources.list

sudo apt update
sudo apt upgrade

lspci | grep -i vga
echo "Insira o nome do drive vga listado: " ; read driver
sudo apt search $driver
echo "Insira o nome do pacote a ser instalado: " ; read pacote
sudo apt install $pacote
sudo apt-get install -f
sudo update-initramfs -u
sudo reboot