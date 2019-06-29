#!/bin/zsh

cd /Users/daipei/dotfiles &&

echo `date` >> up.out &&

git pull >> up.out &&
git add --all >> up.out &&
git commit -m "update dotfile" >> up.out &&
git push >> up.out

echo 'finish\n\n\n' >> up.out
