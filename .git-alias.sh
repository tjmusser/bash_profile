#!bin/bash
#
# Aliases to use within git

git config --global alias.co checkout
git config --global alias.ci '!git commit --verbose'
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'
git config --global alias.last 'log -1 HEAD'
git config --global alias.ffm 'merge --ff-only'
git config --global alias.cob 'checkout -b'
git config --global alias.la '!git config -l | grep alias | cut -c 7-'
git config --global alias.ac '!git add . && git commit --verbose'
git config --global alias.pfwl 'push --force-with-lease origin'

