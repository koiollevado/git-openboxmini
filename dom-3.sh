#!/bin/bash

clear
echo " "
echo "Configurando papel de parede aleatório..."
echo " "

# Configuração do diretório de wallpapers
mkdir -p ~/Imagens/wallpapers
mv wallpapers ~/.wallpapers && chmod +x ~/.wallpapers
mv wall0*.* ~/Imagens/wallpapers/

# Adiciona ao autostart do Openbox
echo "$HOME/.wallpapers" >> ~/.config/openbox/autostart

# Configuração de temas e ícones (descomentando se necessário)
# mkdir -p ~/.local/share/{icons,themes}
# cat xa* > Suru-4All.tar.gz
# tar -vzxf Suru-4All.tar.gz -C ~/.local/share/icons
# unzip Win8.zip -d ~/.local/share/themes
# unzip Win10.zip -d ~/.local/share/themes
# unzip lacapitaine.zip -d ~/.local/share/icons

clear
echo " "
echo "Concedendo permissão para reiniciar e desligar o computador..."
echo " "
echo "Edite o arquivo /etc/sudoers e adicione ao final a seguinte linha:"
echo " "
echo "$(whoami) ALL=(ALL) NOPASSWD: /sbin/reboot, /sbin/shutdown, /sbin/poweroff"
echo " "
echo "Certifique-se de adicionar uma linha em branco no final."
read -p "Pressione ENTER para abrir o arquivo..." && sudo geany /etc/sudoers

clear
echo " "
echo "Configuração do login automático..."
echo " "
read -p "Deseja configurar o login automático? (C)onfigurar / (S)air: " resposta
case "$resposta" in
    [Ss]*|"")
        echo "Saindo da configuração..."
        sleep 2
        exit
        ;;
    [Cc]*)
        echo "Edite o arquivo /etc/slim.conf e adicione as seguintes linhas:"
        echo " "
        echo "default_user        $(whoami)"
        echo "auto_login          yes"
        echo " "
        echo "Certifique-se de adicionar uma linha em branco no final."
        read -p "Pressione ENTER para abrir o arquivo..." && sudo geany /etc/slim.conf
        ;;
    *)
        echo "Opção inválida!"
        ;;
esac

clear
echo " "
echo "Configuração do reconhecimento de unidades de CD/DVD..."
echo " "
read -p "Deseja instalar o AutoFS? (I)nstalar / (S)air: " resposta
case "$resposta" in
    [Ss]*|"")
        echo "Saindo da configuração..."
        sleep 2
        exit
        ;;
    [Ii]*)
        echo "Instalando AutoFS... Aguarde..."
        sudo apt install -y autofs
        ;;
    *)
        echo "Opção inválida!"
        ;;
esac
