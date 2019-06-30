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