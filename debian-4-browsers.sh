#!/bin/bash

# Função para exibir o menu de opções
function menu() {
  clear
  echo "Escolha o navedador de internet que deseja instalar:"
  echo "0. Chromium"
  echo "1. Firefox - repositório"
  echo "2. Firefox ESR"
  echo "3. Firefox - última versão"
  echo "4. Google Chrome 64 bits"
  echo "5. Sair"
  
  read -p "Digite o número da opção: " opcao
}

# Função para instalar o chromium
function instalar_Chromium() {
  sudo apt install chromium-browser -y
  clear
  chromium-browser https://chrome.google.com/webstore/detail/adblock-plus-free-ad-bloc/cfhdojbkjhnklbpkdaibdccddilifddb?hl=pt-BR &
  chromium-browser https://chrome.google.com/webstore/detail/downthemall/nljkibfhlpcnanjgbnlnbjecgicbjkge &
}

# Função para instalar o Firefox-R
function instalar_Firefox-R() {
  sudo apt install firefox -y
  sudo cp firefox.desktop /usr/share/applications
  clear
  firefox https://addons.mozilla.org/pt-BR/firefox/addon/adblock-plus/ &
  firefox https://addons.mozilla.org/pt-BR/firefox/addon/downthemall/ &
}

# Função para instalar o Firefox-E
function instalar_Firefox_E() {
  sudo apt install firefox-esr-l10n-pt-br -y
  clear
  firefox-esr https://addons.mozilla.org/pt-BR/firefox/addon/adblock-plus/ &
  firefox-esr https://addons.mozilla.org/pt-BR/firefox/addon/downthemall/ &
}

# Função para instalar o Firefox-L
function instalar_Firefox-L() {
  if [ $(uname -m) == "x86_64" ]; then 
  wget "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=pt-BR" -O firefox.tar.bz2; else 
  wget "https://download.mozilla.org/?product=firefox-latest&os=linux&lang=pt-BR" -O firefox.tar.bz2; fi
  sudo tar -jxvf firefox.tar.bz2 -C /opt/
  sudo mv /opt/firefox*/ /opt/firefox
  sudo ln -sf /opt/firefox/firefox /usr/bin/firefox
  rm firefox.tar.bz2
  sudo cp firefox.desktop /usr/share/applications
  clear
  firefox https://addons.mozilla.org/pt-BR/firefox/addon/adblock-plus/ &
  firefox https://addons.mozilla.org/pt-BR/firefox/addon/downthemall/ &
}

# Função para instalar o Chrome 64 bits
function instalar_Chrome() {
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  sudo apt-get install -f
  rm google-chrome*.deb
  clear
  google-chrome https://chrome.google.com/webstore/detail/adblock-plus-free-ad-bloc/cfhdojbkjhnklbpkdaibdccddilifddb?hl=pt-BR &
  google-chrome https://chrome.google.com/webstore/detail/downthemall/nljkibfhlpcnanjgbnlnbjecgicbjkge &
}

# Loop principal do script
while true; do
  menu

  case $opcao in
    0) instalar_Chromium ;;
    1) instalar_Firefox-R ;;
    2) instalar_Firefox-E ;;
    3) instalar_Firefox-L ;;
    4) instalar_Chrome ;;
    5) break ;;
    *) echo "Opção inválida!" ;;
  esac
done

echo "Obrigado por usar este script!"
