#!/bin/zsh

cd /Users/daipei/dotfiles &&

echo `date` >> sync.out &&

git pull >> sync.out &&
git add --all >> sync.out &&
git commit -m "update dotfile" >> sync.out &&
git push >> sync.out

echo 'finish\n\n\n' >> sync.out
