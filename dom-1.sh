#!/bin/bash

clear
echo " "
echo "Instalando o servidor gráfico, xinit e o gerenciador de login Slim..."
echo " "

# Instalando LightDM para login automático (opcional)
sudo apt install --no-install-recommends xorg xinit slim -y

# Criando arquivo de inicialização do X (se não existir)
if [ ! -f ~/.xinitrc ]; then
    echo "exec openbox-session" > ~/.xinitrc
fi
clear

# Configuração do Slim
sudo dpkg-reconfigure slim
clear

# Reiniciando o sistema para aplicar mudanças
echo "Instalação concluída! O sistema será reiniciado..."
sleep 3
sudo reboot
