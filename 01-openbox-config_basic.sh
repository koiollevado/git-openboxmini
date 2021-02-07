
#!/bin/bash

# pesquisando pacotes no repositório
sudo apt search xinit
sudo apt search slim
sudo apt search openbox
sudo apt search obconf
sudo apt search obmenu
sudo apt search lxappearance
sudo apt search wicd
sudo apt search wicd-curses
sudo apt search pulseaudio
sudo apt search pavucontrol
sudo apt search pcmanfm
sudo apt search conky
sudo apt search xarchiver
sudo apt search feh
sudo apt search plank
sudo apt search vlc
sudo apt search leafpad
sudo apt search lxterminal

# instalando pacotes
clear
sudo apt install xinit
clear
sudo apt install slim
clear
sudo apt install openbox
clear
sudo apt install obconf
clear
sudo apt install obmenu
clear
sudo apt install lxappearance
clear
sudo apt install wicd
clear
sudo apt install wicd-curses
clear
sudo apt install pulseaudio
clear
sudo apt install pavucontrol
clear
sudo apt install pcmanfm
clear
sudo apt install conky
clear
sudo apt install xarchiver
clear
sudo apt install feh
clear
sudo apt-get install vlc --no-install-recommends --no-install-suggests
clear
sudo apt install leafpad
clear
sudo apt install lxterminal
clear

# configuracoes de execucao do sistema

# configurando o xinitrc
mv xinitrc ~/.xinitrc
chmod +x ~/.xinitrc

# configurando usuario reiniciar desligar
sudo echo "$( whoami ) ALL=(ALL) NOPASSWD: /sbin/reboot, /sbin/shutdown, /sbin/poweroff" >>/etc/sudoers

# configurando o autostart
echo "plank &" > /home/$USER/.config/openbox/autostart
echo "conky -c /home/$USER/.conkyrc &" >> ~/.config/openbox/autostart
echo "/home/$USER/.wallpapers" >> ~/.config/openbox/autostart

# configurando openbox menu e atalhos de teclado
mv menu.xml ~/.config/openbox/
mv rc.xml ~/.config/openbox/

# arquivo de configuracao .Xresources
mv Xresources ~/.Xresources

# configurando o papel de parede aleatorio do desktop
mv wallpapers ~/.wallpapers
mkdir ~/Imagens/wallpapers
chmod +x ~/.wallpapers

# configurando o conkyrc
mv conkyrc ~/.conkyrc

# configurando auto-login de usuário
echo -n "Deseja logar este usuário automaticamente (0)Não (1)Sim (S)air? "; read resposta
case "$resposta" in
    1|y|Y|"")
        sudo echo "default_user $( whoami )" >> /etc/slim.conf
	sudo echo "auto_login yes" >> /etc/slim.conf
	echo "O este usuário agora tem login automático."
	sleep 5
    ;;
    0|n|N)
        echo "O este usuário não tem login automático."
	sleep 5
    ;;
    s|S)
        echo "Saindo..."
	sleep 5
    ;;
    *)
        echo "Opção inválida"
    ;;
esac

sudo reboot