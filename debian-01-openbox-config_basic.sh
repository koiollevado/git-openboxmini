
#!/bin/bash

# instalando pacotes

sudo apt install xinit -y
clear
sudo apt install slim -y
clear
sudo apt install openbox -y
clear
sudo apt install obconf -y
clear
sudo apt install obmenu -y
clear
sudo apt install lxappearance -y
clear
sudo apt install wicd -y
clear
sudo apt install wicd-curses -y
clear
sudo apt install pulseaudio -y
clear
sudo apt install pavucontrol -y
clear
sudo apt install pcmanfm -y
clear
sudo apt install conky -y
clear
sudo apt install p7zip -y
clear
sudo apt install p7zip-full -y
clear
sudo apt install p7zip-rar -y
clear
sudo apt install lzma -y
clear
sudo apt install lzma-dev -y
clear
sudo apt install xarchiver -y
clear
sudo apt install feh -y
clear
sudo apt install vlc --no-install-recommends --no-install-suggests -y
clear
sudo apt install geany -y
clear
sudo apt install plank -y
clear

# configuracoes de execucao do sistema

# configurando o xinitrc
mv xinitrc ~/.xinitrc
chmod +x ~/.xinitrc

# configurando o conkyrc
mv conkyrc ~/.conkyrc

# arquivo de configuracao .Xresources
mv Xresources ~/.Xresources

# configurando o autostart
mkdir -p /home/$USER/.config/openbox
echo "plank &" > /home/$USER/.config/openbox/autostart
echo "conky -c /home/$USER/.conkyrc &" >> ~/.config/openbox/autostart

# configurando openbox menu e atalhos de teclado
mv menu.xml ~/.config/openbox/
mv rc.xml ~/.config/openbox/

# remove o terminal uxterm xterm
sudo apt remove xterm -y

# instala o terminal lxterminal
sudo apt install lxterminal -y

sudo reboot
