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
snap_apps="emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'"
if [ -e  /etc/profile.d/apps-bin-path.sh] && !(grep -i "$snap_apps" /etc/zsh/zprofile > /dev/null); then
    sudo echo "$snap_apps" >>/etc/zsh/zprofile
fi

# Чтобы в системы были видны flatpack пакеты
flatpack_apps="emulate sh -c 'source /etc/profile.d/flatpak.sh'"
if [ -e  /etc/profile.d/flatpak.sh] && !(grep -i "$flatpack_apps" /etc/zsh/zprofile > /dev/null); then
    sudo echo "$flatpack_apps" >>/etc/zsh/zprofile
fi

# загружем настройки для zsh
echo "----------------"
echo "Перезагрузитесь"
