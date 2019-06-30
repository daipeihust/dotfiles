#!/bin/zsh

link() {
	local file=$1
	local target=$2

	local backup=$target.backup
	if [ -L $backup ]
	then
		rm $backup
	elif [ -d $backup ]
	then
		rm -rf $backup
	fi
	
	if [ -L $target ]
	then
		rm $target
	elif [ -f $target -o -d $target ]
	then
		mv $target $target.backup
	fi

	local origin=$HOME/dotfiles/$file

	ln -s $origin $target
}

cd $HOME/dotfiles

link .vim $HOME/.vim
link .vimrc $HOME/.vimrc

link vscode $HOME/Library/Application\ Support/Code/User

link sshconfig $HOME/.ssh/config

link .zshrc $HOME/.zshrc

link .gitconfig $HOME/.gitconfig

link supervisor.d /usr/local/etc/supervisor.d
mkdir $HOME/.supervisor
sudo brew services start supervisor

