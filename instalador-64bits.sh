#!/bin/bash

sudo apt update

sudo apt -f install

sudo dpkg -i lsb_4.1-48_amd64.deb

sudo apt install lsb-base -y

sudo apt install lsb-release -y

sudo dpkg -i epson-inkjet-printer-201207w_1.0.0-1lsb3.2_amd64.deb

sudo dpkg -i epson-printer-utility_1.0.2-1lsb3.2_amd64.deb

./iscan-bundle-2.30.4.x64/install.sh

sudo apt -f install