#!/bin/zsh

# backup old file
if [ -L $HOME/.vim.backup ]
then
	rm $HOME/.vim.backup
elif [ -d $HOME/.vim.backup ]
then
	rm -rf $HOME/.vim.backup
fi

if [ -d $HOME/Library/Application\ Support/Code/User ]
then
	rm -rf $HOME/Library/Application\ Support/Code/User
	ln -s $HOME/dotfiles/vscode $HOME/Library/Application\ Support/Code/User
fi

if [ -d $HOME/.ssh ]
then
	if [ -f $HOME/.ssh/config ]
	then
		mv -f $HOME/.ssh/config $HOME/.ssh/config.backup 
	fi

	ln -s $HOME/dotfiles/sshconfig $HOME/.ssh/config
fi


mv -f $HOME/.zshrc $HOME/.zshrc.backup
mv -f $HOME/.vimrc $HOME/.vimrc.backup

# link new file
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

