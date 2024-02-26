#!/bin/bash

sudo apt update
sudo apt -f install

sudo apt install lsb \
                 lsb-base \
                 lsb-compact \
                 lsb-release \
                 cups \
                 printer-driver-escpr \
                 printer-driver-gutenprint \
                 system-config-printer 

# sudo dpkg -i lsb_4.1-48_amd64.deb
sudo dpkg -i epson-inkjet-printer-201207w_1.0.0-1lsb3.2_amd64.deb
sudo dpkg -i epson-printer-utility_1.1.2-1_amd64.deb

tar xvzf iscan-bundle-2.30.4.x64.deb.tar.gz
chmod +x /iscan-bundle-2.30.4.x64.deb/install.sh
./iscan-bundle-2.30.4.x64.deb/install.sh

sudo apt -f install
