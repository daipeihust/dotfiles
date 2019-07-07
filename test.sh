#!/bin/zsh

backupAndLink() {
	local backup=$HOME/$1.backup
	if [ -L $backup ]
	then
		rm $backup
	elif [ -d $backup ]
	then
		rm -rf $backup
	fi

	target=$HOME/$1
	
	if [ -L $target ]
	then
		rm $target
	elif [ -f $target -o -d $target ]
	then
		mv $target $target.backup
	fi

	origin=$HOME/dotfiles/$1

	ln -s $origin $target
}

########## vim part ##########

backupAndLink .vim
backupAndLink .vimrc

##############################
