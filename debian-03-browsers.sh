
#!/bin/bash

echo " "
echo "Qual navegador de internet deseja instalar?"
echo -n "Digite (0)Chromium (1)Firefox ESR (2)Firefox-última-versão (3)Google Chrome 64 bits. Tecle Enter para confirmar: " ; read browser

case "$browser" in
 0|"")
 sudo apt install chromium -y
 clear
 ;; 
 1)
 sudo apt install firefox-esr -y
 sudo apt install firefox-esr-l10-pt-br -y
 clear
 ;;
 2)
 sudo apt install wget -y
 if [ $(uname -m) == "x86_64" ]; then 
 wget "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=pt-BR" -O firefox.tar.bz2; else 
 wget "https://download.mozilla.org/?product=firefox-latest&os=linux&lang=pt-BR" -O firefox.tar.bz2; fi
 sudo tar -jxvf firefox.tar.bz2 -C /opt/
 sudo mv /opt/firefox*/ /opt/firefox
 sudo ln -sf /opt/firefox/firefox /usr/bin/firefox
 rm firefox.tar.bz2
 clear
 ;;
 3)
 sudo apt install wget -y
 wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
 sudo dpkg -i google-chrome-stable_current_amd64.deb
 sudo apt-get install -f
 rm google-chrome*.deb
 clear
 ;;
 n|N)
 echo "O procedimento de instalação foi concluído."
 sleep 5
 clear
 ;;
 *)
 echo "Opção inválida"
 ;;
esac