#!/usr/bin/env bash

# Script Name:   ryzen-webdev.sh
# Description:   Install and configuration of a web development enviroment in ubuntu based systems.
# Site:          https://github.com/glaubersabino/ryzen-webdev/
# Linkedin:      https://www.linkedin.com/in/glauber-albuquerque/
# Written by:    Glauber Albuquerque
# Maintenance:   Glauber Albuquerque

clear
TIME=2

echo "RYZEN - WEBDEV LINUX SETUP"
echo "..........................."
echo "CHECKLIST
      
      01 - Atualizar o sistema operacional
      02 - Instalar Google Chrome
      03 - Instalar Telegram
      04 - Instalar VS Code
      05 - Instalar VS Code Extensions
      06 - Configurar VS Code(settings.json)
      07 - Instalar Git
      08 - Instalar Insomnia
      09 - Instalar Nodejs
      10 - Instalar YARN
      11 - Install Create-React-App
      12 - Instalação fontes Source Code Pro e Fira Code"
echo " "

echo "Atualizando o sistema operacional..."
sleep $TIME
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y

echo "Instalando o Google Chrome..."
sleep $TIME
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /home/$USER/Downloads/chrome.deb
sudo apt install /home/$USER/Downloads/chrome.deb -y

echo "Instalando Telegram..."
sleep $TIME
sudo apt install telegram -y

echo "Instalando VS Code..."
sleep $TIME
wget https://go.microsoft.com/fwlink/?LinkID=760868 -O /home/$USER/Downloads/vscode.deb
sudo apt install /home/$USER/Downloads/vscode.deb -y

echo "Instalando VS Code Extensions..."
sleep $TIME
code --install-extension eryouhao.brackets-dark-pro #Brackets Dark Theme
code --install-extension pkief.material-icon-theme #Material Icon Theme
code --install-extension ritwickdey.liveserver #Liveserver
code --install-extension moyu.snapcode #Code Snapshot
code --install-extension editorconfig.editorconfig #Editor Config
code --install-extension dbaeumer.vscode-eslint #ESLint
code --install-extension jpoissonnier.vscode-styled-components #Styled Components
code --install-extension naumovs.color-highlight #Color Highlighting

echo "Configurando o VS Code..."
sleep $TIME
sudo cp ./settings.json /home/$USER/.config/Code/User/

echo "Instalando o Git..."
sleep $TIME
sudo apt install git -y

echo "Instalando o Insomnia..."
sleep $TIME
# Adicionando o Insomnia a lista de repositórios.
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \ | sudo tee -a /etc/apt/sources.list.d/insomnia.list
# Download e instalação da key.
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \ | sudo apt-key add -
# Instalação
sudo apt-get update
sudo apt-get install insomnia

echo "Instalando o Nodejs..."
sleep $TIME
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Instalando o YARN..."
sleep $TIME
npm install -g yarn

echo "Instalando o Create-React-App..."
sleep $TIME
npm install -g create-react-app

echo "Instalando as fontes Source Code Pro e Fira Code..."
sleep $TIME
# Download das fontes
wget https://fonts.google.com/download?family=Source%20Code%20Pro -O /home/$USER/Downloads/source-code-pro.zip
wget https://fonts.google.com/download?family=Fira%20Code -O /home/$USER/Downloads/fira-code.zip

# Extração e instalação da Source Code Pro
sudo unzip source-code-pro.zip -d /home/$USER/Downloads/fonts/source-code-pro/
sudo cp /home/$USER/Downloads/fonts/source-code-pro/*.ttf /usr/share/fonts/truetype/
sudo cp /home/$USER/Downloads/fonts/source-code-pro/*.otf /usr/share/fonts/opentype/

# Extração e instalação da Fira Code
sudo unzip fira-code.zip -d /home/$USER/Downloads/fonts/fira-code/
sudo cp /home/$USER/Downloads/fonts/fira-code/*.ttf /usr/share/fonts/truetype/
sudo cp /home/$USER/Downloads/fonts/fira-code/*.otf /usr/share/fonts/opentype/

echo "Procedimentos concluídos com sucesso!"
sleep $TIME