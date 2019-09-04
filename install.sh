#!/bin/zsh

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew bundle # install package by homebrew

./link.sh # link configure files

sudo brew services start supervisor # start supervisor service

curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh # install im-select

./vim.sh # install vim plugin

pip3 install --user pynvim # install pynvim for deoplete

curl -sLf https://spacevim.org/install.sh | bash # install spacevim

