#!/bin/zsh

# backup old file
#mv -f ~/.vim ~/.vim.backup
#mv -f ~/.vimrc ~/.vimrc.backup
#mv -f ~/.zshrc ~/.zshrc.backup

# link new file
#ln -s .vim ~/.vim
#ln -s .vimrc ~/.vimrc
#ln -s .zshrc ~/.zshrc

#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
