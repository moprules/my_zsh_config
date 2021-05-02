#!/bin/bash

# устанавливаем zsh
sudo apt install zsh -y

# делаем zsh оболочкой по умолчанию
chsh -s /bin/zsh

# устанавливаем curl
sudo apt install curl
# ставим oh-myzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# копируем файлы в нужные каталоги
cp anime.zsh-theme $HOME/.oh-my-zsh/themes/
cp .zshrc $HOME/

# загружем настройки для zsh
source $HOME/.zshrc
