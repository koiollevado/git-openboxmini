
#!/bin/bash

echo " "
echo "Atualizando o repositório... Aguarde..."
echo " "
# sudo apt update
echo " "
echo "Atualizando a distro... Aguarde..."
echo " "
# sudo apt upgrade
echo " "
echo "Instalando pacotes quebrados do repositório... Aguarde..."
echo " "
# sudo apt install -f
echo " "
echo "Removendo arquivos obsoletos... Aguarde..."
echo " "
# sudo apt autoremove
# sudo apt clean
# sudo apt autoclean


# sudo apt-get install texlive-full texmaker okular biblatex abntex jabref texlive-fonts-extra klatexformula texlive-latex-extra texlive

# sudo apt -f install

# sudo apt-get install texlive-full kile kile-l10n okular biblatex abntex jabref texlive-fonts-extra klatexformula texlive-latex-extra texlive
clear
echo " "
echo "  Instalando o LaTeX no Ubuntu 18.04"
echo " "
echo "[1] texlive-base................161 MB"
echo "[2] texlive-latex-recomendado...192 MB"
echo "[3] texlive.....................256 MB"
echo "[4] texlive-latex-extra.........416 MB"
echo "[5] texlive-full...............4704 MB"
echo " "
echo "[s] Sair"
echo " "
echo -n "Escolha uma opção: "; read num
case "$num" in
    1"")
        echo "A opção 1 foi a escolhida."
	echo " "
	sudo apt-get install texlive-latex-base texlive-lang-portuguese
    ;;
    2)
        echo "A opção 2 foi a escolhida."
	echo " "
	sudo apt-get install texlive-latex-base texlive-latex-recommended texlive-lang-portuguese
    ;;
    3)
        echo "A opção 3 foi a escolhida."
	echo " "
	sudo apt-get install abntex texlive texlive-latex-base texlive-latex-recommended texlive-lang-portuguese
    ;;
    4)
        echo "A opção 4 foi a escolhida."
	echo " "
	sudo apt-get install abntex texlive texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-lang-portuguese
    ;;
    5)
        echo "A opção 5 foi a escolhida."
	echo " "
	sudo apt-get install abntex texlive-full
    ;;
    s|S)
        echo "Saindo..."
	echo " "
    ;;
    *)
        echo "Opção inválida"
    ;;
esac

clear
echo " "
echo "     Instalando um editor LaTeX"
echo " "
echo "[1] texworks.....................15 MB"
echo "[2] latexila....................254 MB"
echo "[3] gummi.......................459 MB"
echo "[4] kile........................479 MB"
echo "[5] lyx.........................610 MB"
echo "[6] texmaker....................655 MB"
echo " "
echo "[s] Sair"
echo " "
echo -n "Escolha uma opção: "; read num
case "$num" in
    5"")
        echo "A opção 5 foi a escolhida."
	echo " "
	sudo apt-get install lyx
    ;;
    2)
        echo "A opção 2 foi a escolhida."
	echo " "
	sudo apt install latexila
    ;;
    4)
        echo "A opção 4 foi a escolhida."
	echo " "
	sudo apt install kile
    ;;
    6)
        echo "A opção 6 foi a escolhida."
	echo " "
	sudo apt install texmaker
    ;;
    3)
        echo "A opção 3 foi a escolhida."
	echo " "
	sudo apt install gummi 
    ;;
    1)
        echo "A opção 1 foi a escolhida."
	echo " "
	sudo apt install texworks
    ;;
    s|S)
        echo "Saindo..."
	echo " "
    ;;
    *)
        echo "Opção inválida"
    ;;
esac