#!/bin/bash

# Função para exibir o menu de opções
function menu() {
  echo " "
  echo "------------------------------------------------------------"                    
  echo "           Escolha o programa que deseja instalar:"
  echo "------------------------------------------------------------" 
  echo "                       1. Gimp"
  echo "                       2. Poster Razor"
  echo "                       3. Evince"
  echo "                       4. Xsane"
  echo "                       5. TODOS"
  echo "                       6. Sair"
  echo "------------------------------------------------------------" 
  echo " "  
  read -p "           Digite o número da opção: " opcao
}

# Função para instalar o GIMP
function instalar_gimp() {
  sudo apt install gimp -y
  sudo apt -f install
}

# Função para instalar o Poster Razor
function instalar_poster_razor() {
  sudo apt install posterazor -y
  sudo apt -f install
}

# Função para instalar o Evince
function instalar_evince() {
  sudo apt install evince -y
}

# Função para instalar o Xsane
function instalar_xsane() {
  sudo apt install xsane -y
  sudo apt -f install
}

# Função para instalar Todos
function instalar_todos() {
  sudo apt install xsane -y
  sudo apt install gimp -y
  sudo apt install evince -y
  sudo apt install posterazor -y
  sudo apt -f install                   
}

# Loop principal do script
while true; do
  menu

  case $opcao in
    1) instalar_gimp ;;
    2) instalar_poster_razor ;;
    3) instalar_evince ;;
    4) instalar_xsane ;;
    5) instalar_todos ;;
    6) break ;;
    *) echo "Opção inválida!" ;;
  esac
done

echo "Obrigado por usar este script!"
