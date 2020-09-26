#!/bin/bash

# копируем файлы в нужные каталоги
cp anime.zsh-theme $HOME/.oh-my-zsh/themes/
cp .zshrc $HOME/

# загружем настройки для zsh
source $HOME/.zshrc
