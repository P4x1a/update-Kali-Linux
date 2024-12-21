#!/bin/bash

# Função para mostrar o uso do script
mostrar_uso() {
    echo "Uso: $0 [opções]"
    echo "Opções:"
    echo "  -m, --menu           Exibir menu interativo"
    echo "  -u, --update         Atualizar a lista de pacotes"
    echo "  -g, --upgrade        Atualizar os pacotes instalados"
    echo "  -d, --dist-upgrade   Realizar uma atualização da distribuição"
    echo "  -r, --remove         Remover pacotes desnecessários"
    echo "  -c, --clean          Limpar o cache de pacotes"
    echo "  -h, --help           Mostrar esta ajuda"
}

# Funções para cada operação
atualizar_lista_pacotes() {
    echo "Updating package list..."
    sudo apt-get update
}

atualizar_pacotes_instalados() {
    echo "Upgrading installed packages..."
    sudo apt-get upgrade -y
}

atualizacao_distribuicao() {
    echo "Performing distribution upgrade..."
    sudo apt-get dist-upgrade -y
}

remover_pacotes_desnecessarios() {
    echo "Removing unnecessary packages..."
    sudo apt-get autoremove -y
}

limpar_cache_pacotes() {
    echo "Cleaning package cache..."
    sudo apt-get clean
}

# Menu interativo
exibir_menu() {
    echo "Escolha uma das opções abaixo:"
    echo "1. Atualizar a lista de pacotes"
    echo "2. Atualizar os pacotes instalados"
    echo "3. Realizar uma atualização da distribuição"
    echo "4. Remover pacotes desnecessários"
    echo "5. Limpar o cache de pacotes"
    echo "0. Sair"
    read -p "Digite sua escolha: " opcao
    case $opcao in
        1) atualizar_lista_pacotes ;;
        2) atualizar_pacotes_instalados ;;
        3) atualizacao_distribuicao ;;
        4) remover_pacotes_desnecessarios ;;
        5) limpar_cache_pacotes ;;
        0) exit 0 ;;
        *) echo "Opção inválida"; exibir_menu ;;
    esac
}

# Verificar se nenhum argumento foi fornecido
if [ $# -eq 0 ]; then
    mostrar_uso
    exit 1
fi

# Processar argumentos
while [ "$1" != "" ]; do
    case $1 in
        -m | --menu )            exibir_menu; exit 0 ;;
        -u | --update )          atualizar_lista_pacotes ;;
        -g | --upgrade )         atualizar_pacotes_instalados ;;
        -d | --dist-upgrade )    atualizacao_distribuicao ;;
        -r | --remove )          remover_pacotes_desnecessarios ;;
        -c | --clean )           limpar_cache_pacotes ;;
        -h | --help )            mostrar_uso; exit 0 ;;
        * )                      echo "Opção inválida: $1"; mostrar_uso; exit 1 ;;
    esac
    shift
done

echo "System updated successfully!"
