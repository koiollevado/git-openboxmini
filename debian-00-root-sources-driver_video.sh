
#!/bin/bash

echo "Insira uma senha para o ROOT"
sudo passwd root

clear

sudo mv /etc/apt/sources.list /etc/apt/sources.list-backup
sudo mv debian-sources.list /etc/apt/sources.list

clear

echo "Atualizando a lista do repositório"
sudo apt update
sudo apt upgrade

sudo apt-get install -f

clear
