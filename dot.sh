#!/bin/zsh

########## vim part ##########
if [ -L $HOME/.vim.backup ]
then
	rm $HOME/.vim.backup
elif [ -d $HOME/.vim.backup ]
then
	rm -rf $HOME/.vim.backup
fi

mv -f $HOME/.vimrc $HOME/.vimrc.backup
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
##############################


########## vscode ##########
if [ -d $HOME/Library/Application\ Support/Code/User ]
then
	rm -rf $HOME/Library/Application\ Support/Code/User
	ln -s $HOME/dotfiles/vscode $HOME/Library/Application\ Support/Code/User
fi
############################

########## ssh part ##########
if [ -d $HOME/.ssh ]
then
	if [ -f $HOME/.ssh/config ]
	then
		mv -f $HOME/.ssh/config $HOME/.ssh/config.backup 
	fi
	ln -s $HOME/dotfiles/sshconfig $HOME/.ssh/config
fi
##############################

########## zsh part ##########
mv -f $HOME/.zshrc $HOME/.zshrc.backup
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
##############################

########## git part ##########
mv -f $HOME/.gitconfig $HOME/.gitconfig.backup
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
##############################

########## supervisor ##########
if [ -d $HOME/.supervisor.backup ]
then
	rm -rf $HOME/.supervisor.backup
elif [ -L $HOME/.supervisor.backup ]
then
	rm $HOME/.supervisor.backup
fi

if [ -d $HOME/.supervisor ]
then
	mv -f $HOME/.supervisor $HOME/.supervisor.backup
fi
	
ln -s $HOME/dotfiles/.supervisor $HOME/.supervisor
################################

