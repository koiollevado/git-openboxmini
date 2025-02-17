#!/bin/bash

clear
echo " "
echo "Defina uma senha para o usuário root:"
echo " "
sudo passwd root
clear

# Backup do sources.list original
sudo mv /etc/apt/sources.list /etc/apt/sources.list-backup
sudo mv debian-12-sources.list /etc/apt/sources.list
clear

# Atualizando repositórios e pacotes
echo " "
echo "Atualizando a lista de pacotes..."
echo " "
sudo apt update && sudo apt upgrade -y

# Instalando Openbox e pacotes essenciais
sudo apt install --no-install-recommends openbox obmenu obconf lxappearance lxterminal geany -y

# Finalizando instalação
sudo apt -f install -y
clear
echo "Instalação concluída! O sistema será reiniciado..."
sleep 3
sudo reboot
