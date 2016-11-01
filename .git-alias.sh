#!bin/bash
#
# Aliases to use within git

git config --global alias.co checkout
git config --global alias.ci '!git commit --verbose'
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist 'log --format=format:'%C(bold yellow)%h%C(reset) %C(blue)(%ar)%C(reset) -  %C(white)%s%C(reset) %C(dim white)[%an]%
C(reset)%C(dim yellow)%d%C(reset)' --graph --decorate
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'
git config --global alias.last 'log -1 HEAD'
git config --global alias.ffm 'merge --ff-only'
git config --global alias.cob 'checkout -b'
git config --global alias.la '!git config -l | grep alias | cut -c 7-'
git config --global alias.ac '!git add . && git commit --verbose'
git config --global alias.pfwl 'push --force-with-lease origin'

git config --global alias.wipe '!git add -A && git commit -qm "WIPE SAVEPOINT" && git reset HEAD~1 --hard'
git config --global alias.save '!git add -A && git commit -m "SAVEPOINT"'
git config --global alias.wip 'commit -am "WIP"'
git config --global alias.amend 'commit -a --amend'
git config --global alias.filelog 'log -u'
git config --global alias.logtree 'log --graph --oneline --decorate --all'
