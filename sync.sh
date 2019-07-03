#!/bin/zsh

while :
do
	cd /Users/daipei/dotfiles

	echo `date` &>> sync.info

	git pull &>> sync.info
	echo 'pull finish \nready to commit'
	git add --all
	git commit -m "update dotfile" &>> sync.info
	echo 'commit finish \nready to push'
	git push &>> sync.info
	echo 'push finish'

	echo 'finish\n\n\n' &>> sync.info
	sleep 3600
done
