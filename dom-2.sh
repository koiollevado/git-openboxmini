#!/bin/bash

clear
echo " "
echo "Instalando pacotes essenciais..."
echo " "

# Instalando todos os pacotes em uma única linha para otimizar tempo e recursos
sudo apt install --no-install-recommends wget pcmanfm wicd wicd-curses \
    pulseaudio pavucontrol conky p7zip p7zip-full p7zip-rar lzma lzma-dev \
    xarchiver gnome-screenshot feh vlc plank -y

clear

echo "Configurando arquivos do sistema..."

# Configuração do xinitrc
mv xinitrc ~/.xinitrc && chmod +x ~/.xinitrc

# Configuração do conky
mv conkyrc ~/.conkyrc

# Configuração do tráfego de rede no conky
cat << 'EOF' > partner.sh
#!/bin/bash
interface=$(ip addr show | grep -m1 BROADCAST | awk '{print $2}' | tr -d ':')
sed -i "s/wlp1s10/$interface/g" ~/.conkyrc
sed -i "s/golimaru/$USER/g" ~/.conkyrc
EOF

chmod +x partner.sh && ./partner.sh
rm partner.sh  # Removendo o script após a execução

# Configuração do arquivo Xresources
mv Xresources ~/.Xresources

# Configuração do autostart do Openbox
mkdir -p ~/.config/openbox
cat << 'EOF' > ~/.config/openbox/autostart
plank &
conky -c ~/.conkyrc &
EOF

# Configuração do menu e atalhos do Openbox
mv menu.xml ~/.config/openbox/
mv rc.xml ~/.config/openbox/

# Ajustando o editor de texto no menu Openbox
sed -i "s/leafpad/geany/g" ~/.config/openbox/menu.xml

# Reiniciando o sistema
echo "Configuração concluída! O sistema será reiniciado..."
sleep 3
sudo reboot
