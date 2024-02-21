#!/bin/bash

sudo apt update

sudo apt -f install

sudo dpkg -i lsb_4.1-48_amd64.deb

sudo apt install lsb-base -y

sudo apt install lsb-release -y

sudo apt install cups -y
sudo apt install printer-driver-escpr -y
sudo apt install printer-driver-gutenprint -y
sudo apt install system-config-printer -y

sudo dpkg -i epson-inkjet-printer-201207w_1.0.0-1lsb3.2_amd64.deb

sudo dpkg -i epson-printer-utility_1.0.2-1lsb3.2_amd64.deb

tar xvzf iscan-bundle-2.30.4.x64.deb.tar.gz

./iscan-bundle-2.30.4.x64.deb/install.sh

sudo apt -f install
