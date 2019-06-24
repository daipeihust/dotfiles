#!/bin/zsh

./dot.sh

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install package by homebrew
brew bundle

./vim.sh
