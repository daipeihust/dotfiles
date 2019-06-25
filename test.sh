
if [ -d $HOME/Library/Application\ Support/Code/User ]
then
	rm -rf $HOME/Library/Application\ Support/Code/User
	ln -s $HOME/dotfiles/vscode $HOME/Library/Application\ Support/Code/User
fi