#!/bin/bash

# Arquivo de saída
saida="icons.txt"
> "$saida"

# Função para obter caminho completo do ícone
get_icon_path() {
    local icon_name="$1"

    # Se já for um caminho absoluto
    if [[ "$icon_name" == /* && -f "$icon_name" ]]; then
        echo "$icon_name"
        return
    fi

    # Tenta encontrar nos diretórios padrões com várias extensões
    for ext in png svg xpm; do
        for dir in /usr/share/icons/hicolor/*/apps \
                   /usr/share/icons/*/*/apps \
                   /usr/share/pixmaps \
                   ~/.local/share/icons \
                   ~/.icons; do
            path="$dir/$icon_name.$ext"
            if [[ -f "$path" ]]; then
                echo "$path"
                return
            fi
        done
    done

    echo "Não encontrado"
}

# Procura todos os arquivos .desktop
desktop_files=$(find /usr/share/applications ~/.local/share/applications -name "*.desktop" 2>/dev/null)

# Processa cada um
while IFS= read -r file; do
    app_name=$(grep -m 1 "^Name=" "$file" | cut -d= -f2)
    icon_name=$(grep -m 1 "^Icon=" "$file" | cut -d= -f2)

    # Ignora entradas sem nome
    [[ -z "$app_name" || -z "$icon_name" ]] && continue

    icon_path=$(get_icon_path "$icon_name")

    echo "$app_name -- $icon_name" >> "$saida"
    echo "\"$icon_path\"" >> "$saida"
    echo "" >> "$saida"

done <<< "$desktop_files"

echo "Arquivo gerado: $saida"
