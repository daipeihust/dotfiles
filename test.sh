
if [ -d $HOME/.ssh ]
then
	if [ -f $HOME/.ssh/config ]
	then
		mv -f $HOME/.ssh/config $HOME/.ssh/config.backup 
	fi

	ln -s $HOME/dotfiles/sshconfig $HOME/.ssh/config
fi