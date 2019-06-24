#!/bin/zsh

# backup old file
if [ -L $HOME/.vim.backup ]
then
	rm $HOME/.vim.backup
elif [ -d $HOME/.vim.backup ]
then
	rm -rf $HOME/.vim.backup
fi

mv -f $HOME/.vim $HOME/.vim.backup
mv -f $HOME/.zshrc $HOME/.zshrc.backup
mv -f $HOME/.hyper.js $HOME/.hyper.js.backup

# link new file
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.hyper.js $HOME/.hyper.js

