
#Os créditos do script vão para
#https://www.monolitonimbus.com.br/como-acertar-data-e-horario-no-linux/#:~:text=%C3%89%20poss%C3%ADvel%20fazer%20com%20que,pacote%20%E2%80%9Cntpdate%E2%80%9D%20est%C3%A1%20obsoleto.

# Para ajustar o timezone do ubuntu proceda com os comandos:


#!/bin/bash

# Atualize o repositório
sudo apt-get update

# Instale o pacote "tzdata" para ajustar o timezone (fuso-horário)
sudo apt-get install tzdata

# Execute o comando para iniciar a configuração
sudo dpkg-reconfigure tzdata

# Selecione: America
# e depois, selecione: Recife (este fuso-horário se manteve)

#--------------------------------------
# Atualizando o relógio com servidor local ntp
RETRY_MAX=5
 
retry=1
while [ 1 ] ; do
    echo "Tentativa:$retry"
    ntpdate -u br.pool.ntp.org
    if [ "$?" -ne "1" ]; then
        hwclock -w
        echo "OK"
        exit 0
    fi

    let retry=$retry+1
    if [ "$retry" -gt "$RETRY_MAX" ] ; then
        echo "ERRO: Nao foi possivel ajustar a hora na $RETRY_MAX tentativa."
        echo "Provavelmente sem conexao a internet ou sem DNS server"
        exit 1
    fi
done
