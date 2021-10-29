#!/bin/bash

# устанавливаем zsh
sudo apt install zsh -y

# делаем zsh оболочкой по умолчанию
echo "----------------------------"
echo "Делаем zhs оболочкой по умолчанию"
chsh -s /bin/zsh

# устанавливаем curl
sudo apt install curl
# ставим oh-myzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# копируем файлы в нужные каталоги
cp anime.zsh-theme $HOME/.oh-my-zsh/themes/
cp .zshrc $HOME/

echo "----------------------------"
echo "Настраиваем 'all-in' пакеты"

# Чтобы в системе были видны snap пакеты
snap_config="/etc/profile.d/apps-bin-path.sh"
snap_str="emulate sh -c 'source $snap_config'"
if [[ -e  $snap_config ]] && ! grep -q "$snap_str" >>/etc/zsh/zprofile; then
    echo "$snap_str" >>/etc/zsh/zprofile
fi

# Чтобы в системы были видны flatpack пакеты
flatpack_config="/etc/profile.d/flatpak.sh"
flatpack_str="emulate sh -c 'source $flatpack_config'"
if [[ -e  $flatpack_config ]] && ! grep -q "$flatpack_str" /etc/zsh/zprofile; then
    echo "$flatpack_str" >>/etc/zsh/zprofile
fi

echo "----------------"
echo "Перезагрузитесь"
