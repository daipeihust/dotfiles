#!/bin/zsh

while :
do
	cd /Users/daipei/dotfiles

	echo `date` &>> sync.info

	git pull &>> sync.info
	git add --all
	git commit -m "update dotfile" &>> sync.info
	git push &>> sync.info

	echo 'finish\n\n\n' &>> sync.info
	sleep 3600
done
