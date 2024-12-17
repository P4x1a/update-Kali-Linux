#!/bin/bash

# Instala o nano se não estiver instalado
if ! command -v nano &> /dev/null
then
    echo "Nano não encontrado, instalando..."
    sudo apt-get install -y nano
else
    echo "Nano já está instalado"
fi

# Cria o script de atualização
cat << 'EOF' > atualizar_kali.sh
#!/bin/bash

# Atualiza a lista de pacotes
echo "Atualizando a lista de pacotes..."
sudo apt-get update

# Atualiza os pacotes instalados
echo "Atualizando os pacotes instalados..."
sudo apt-get upgrade -y

# Atualiza a distribuição do sistema
echo "Atualizando a distribuição do sistema..."
sudo apt-get dist-upgrade -y

# Remove pacotes desnecessários
echo "Removendo pacotes desnecessários..."
sudo apt-get autoremove -y

# Limpa o cache de pacotes
echo "Limpando o cache de pacotes..."
sudo apt-get clean

echo "Sistema atualizado com sucesso!"
EOF

# Dá permissão de execução ao script de atualização
chmod +x atualizar_kali.sh

# Executa o script de atualização
./atualizar_kali.sh
