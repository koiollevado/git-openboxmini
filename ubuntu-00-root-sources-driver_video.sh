
#!/bin/bash

echo "Insira uma senha para o ROOT"
sudo passwd root

clear

sudo mv /etc/apt/sources.list /etc/apt/sources.list-backup
sudo mv ubuntu-sources.list /etc/apt/sources.list

clear

echo "Atualizando a lista do repositório"
sudo apt update
sudo apt upgrade

clear

echo "Instalando os drivers da placa de vídeo."
lspci | grep -i vga
echo "Insira o nome do drive vga listado: " ; read driver
sudo apt search $driver
echo "Insira o nome do pacote a ser instalado: " ; read pacote
sudo apt install $pacote
sudo apt-get install -f

sudo reboot