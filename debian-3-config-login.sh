
#!/bin/bash

# configurando o papel de parede aleatorio do desktop
mv wallpapers ~/.wallpapers
mkdir -p ~/Imagens/wallpapers
chmod +x ~/.wallpapers
echo "/home/$USER/.wallpapers" >> ~/.config/openbox/autostart
mv wall0*.* /home/$USER/Imagens/wallpapers/

# instala Icons suru 4all e La Captaine e os temas windows 8 e windows 10
# cat xa* > Suru-4All.tar.gz
# mkdir -p ~/.local/share/icons
# tar -vzxf Suru-4All.tar.gz
# mv Suru\ 4All/ ~/.local/share/icons
# mkdir -p ~/.local/share/themes
# unzip Win8.zip -d ~/.local/share/themes
# unzip Win10.zip -d ~/.local/share/themes
# unzip lacapitaine.zip -d ~/.local/share/icons

# configuracoes manuais
clear
echo " "
echo "Permissão para reiniciar e desligar o computador"
echo "Edite o arquivo /etc/sudoers"
echo "E adicione ao final do arquivo a seguinte linha"
echo " "
echo " "
echo "$( whoami ) ALL=(ALL) NOPASSWD: /sbin/reboot, /sbin/shutdown, /sbin/poweroff"
echo " "
echo "Certifique-se de adicionar ao final uma linha em branco."
sudo geany /etc/sudoers

# configurando o login automático
clear
echo " "
echo "Configurando o login automático de usuário."
echo " "
echo "Deseja configurar o login automático de usuário?"
echo -n "Digite uma letra (C)onfigura o usuário. (S)air " ; read resposta
case "$resposta" in
    S|s|"")
        echo "Saindo da configuração..."
	sleep 5
	exit
    ;;
    c|C)
	echo "Edite o arquivo /etc/slim.conf como usuário root."
	echo 'Digite o comando "sudo geany /etc/slim.conf"'
	echo "Adicione ao final do arquivo as seguintes linhas"
	echo " "
	echo " "
	echo "default_user        $( whoami )"
	echo "auto_login          yes"
	echo " "
	echo "Certifique-se de adicionar ao final uma linha em branco."
	sudo geany /etc/slim.conf
    ;;
    *)
        echo "Opção inválida"
    ;;
esac

# configurando o drive CDROM-DVD
clear
echo " "
echo "Deseja fazer o reconhecimento de unidades de CDROM - DVDROM."
echo " "
echo -n "Digite uma letra (I)nstalar AutoFS. (S)air " ; read resposta
case "$resposta" in
    S|s|"")
        echo "Saindo da configuração..."
	sleep 5
	exit
    ;;
    i|I)
	echo "Instalando o programa AutoFS... Aguarde..."
	sudo apt install autofs
	sudo apt -f install
    ;;
    *)
        echo "Opção inválida"
    ;;
esac
