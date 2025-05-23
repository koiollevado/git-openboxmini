#!/usr/bin/env bash
# Uso:
#   chmod +x gerar_menu.sh
#   ./gerar_menu.sh entradas.txt menu.xml

set -e

entrada="lsapps.txt"
saida="menu.xml"

if [[ -z $entrada || ! -f $entrada ]]; then
  echo "ERRO: informe o arquivo de entradas (.txt) como primeiro argumento." >&2
  exit 1
fi

# ---------- função auxiliar: gera um id "seguro" ----------
limpa_id() {
  iconv -f utf-8 -t ascii//TRANSLIT <<< "$1" | tr -dc '[:alnum:]'
}

# ---------- início do XML ----------
{
  printf '<?xml version="1.0" encoding="UTF-8"?>\n'
  printf '<openbox_menu>\n'
  printf ' <menu id="root-menu" label="Aplicativos">\n'
} > "$saida"

prev_cat=""
while IFS=';' read -r categoria rotulo icone comando || [[ -n $categoria ]]; do
  [[ -z $categoria ]] && continue

  if [[ $categoria != "$prev_cat" ]]; then
    [[ -n $prev_cat ]] && printf '  </menu>\n' >> "$saida"
    id=$(limpa_id "$categoria")
    printf '  <menu id="%s" label="%s">\n' "$id" "$categoria" >> "$saida"
    prev_cat="$categoria"
  fi

  printf '    <item label="%s" icon="%s">\n'  "$rotulo" "$icone"                  >> "$saida"
  printf '      <action name="Execute">\n'                                         >> "$saida"
  printf '        <command>%s</command>\n' "$comando"                  >> "$saida"
  printf '      </action>\n'                                                       >> "$saida"
  printf '    </item>\n'                                                           >> "$saida"

done < "$entrada"

[[ -n $prev_cat ]] && printf '  </menu>\n' >> "$saida"

# ---------- bloco adicional: sair, reiniciar, desligar ----------
cat >> "$saida" << 'EOF'
  <separator/>
  <item label="Sair">
    <action name="Execute">
      <execute>openbox --exit</execute>
    </action>
  </item>
  <item label="Reiniciar">
    <action name="Execute">
      <execute>sudo reboot</execute>
    </action>
  </item>
  <item label="Desligar">
    <action name="Execute">
      <execute>sudo shutdown -h now</execute>
    </action>
  </item>
</openbox_menu>
EOF
