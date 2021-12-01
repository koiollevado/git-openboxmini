
#!/bin/bash

clear
echo " "
echo "Qual navegador de internet deseja instalar?"
echo -n "Digite (0)Chromium (1)Firefox-repositório (2)Firefox ESR (3)Firefox-última-versão (4)Google Chrome 64 bits. Tecle Enter para confirmar: " ; read browser

case "$browser" in
 0|"")
 sudo apt install chromium-browser -y
 clear
 chromium-browser https://chrome.google.com/webstore/detail/adblock-plus-free-ad-bloc/cfhdojbkjhnklbpkdaibdccddilifddb?hl=pt-BR &
 chromium-browser https://chrome.google.com/webstore/detail/downthemall/nljkibfhlpcnanjgbnlnbjecgicbjkge &
 ;; 
 1)
 sudo apt install firefox -y
 clear
 firefox https://addons.mozilla.org/pt-BR/firefox/addon/adblock-plus/ &
 firefox https://addons.mozilla.org/pt-BR/firefox/addon/downthemall/ &
 ;;
 2)
 sudo apt install firefox-esr-l10n-pt-br -y
 clear
 firefox-esr https://addons.mozilla.org/pt-BR/firefox/addon/adblock-plus/ &
 firefox-esr https://addons.mozilla.org/pt-BR/firefox/addon/downthemall/ &
 ;;
 3)
 if [ $(uname -m) == "x86_64" ]; then 
 wget "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=pt-BR" -O firefox.tar.bz2; else 
 wget "https://download.mozilla.org/?product=firefox-latest&os=linux&lang=pt-BR" -O firefox.tar.bz2; fi
 sudo tar -jxvf firefox.tar.bz2 -C /opt/
 sudo mv /opt/firefox*/ /opt/firefox
 sudo ln -sf /opt/firefox/firefox /usr/bin/firefox
 rm firefox.tar.bz2
 clear
 firefox https://addons.mozilla.org/pt-BR/firefox/addon/adblock-plus/ &
 firefox https://addons.mozilla.org/pt-BR/firefox/addon/downthemall/ &
 ;;
 4)
 wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
 sudo dpkg -i google-chrome-stable_current_amd64.deb
 sudo apt-get install -f
 rm google-chrome*.deb
 clear
 google-chrome https://chrome.google.com/webstore/detail/adblock-plus-free-ad-bloc/cfhdojbkjhnklbpkdaibdccddilifddb?hl=pt-BR &
 google-chrome https://chrome.google.com/webstore/detail/downthemall/nljkibfhlpcnanjgbnlnbjecgicbjkge &
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
