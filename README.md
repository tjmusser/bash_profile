# Customize Your Terminal bash_profile
This script allows for easy customization your mac OSX terminal's bash profile. It installs commonly needed tools like git auto-complete, git templates, and an easy format for customizing the git prompt. And any changes you make can easily be refreshed.

All this stuff is already out there, this just puts all the pieces together in a nice, fast, easy-to-use package. You should review these before installing and make any necessary changes as this will permanently change your bash profile

This shell script installs these components:
* git-completion for auto completion
* git-prompt for coloring and customization of git in terminal
* git templates for pre-commit and pre-push hooks (Learn to use them, love them)
* [System aliases](https://github.com/tjmusser/bash_profile/blob/master/.alias.sh) for mac
* [Git aliases](https://github.com/tjmusser/bash_profile/blob/master/.git-alias.sh) for different git tasks
* Customized $PS1 for git using git-prompt
* Git config initial setup (House keeping stuff)


### Installation
This will install all of these settings and aliases globally for your git prompt along with your mac and git aliases.

Clone the repo in terminal and run these commands:
```
cd bash_profile
chmod +x install.sh
./install.sh
```

Once it's installed, new terminal windows will have this change.

### Making Changes
After installation, you can make changes or additions to these files to customize as needed. Once changes are made, your bash_profile needs to be updated. The profile can easily be reloaded with changes from any of these files with this command:

```
reload_bash
```

### Examples
These are just some of the git aliases in this script. [View the .git-alias.sh](https://github.com/tjmusser/bash_profile/blob/master/.git-alias.sh) file to see all of them.

Oh and slap people in the face that use `git reset HEAD --hard`. It’s a bad idea. Don’t do it!

**Check out**
```
git co feature/branch-name = git checkout feature/branch-name
git cob bugfix/branch-name = git checkout -b bugfix/branch-name
```

**Sync Master and Develop branches on your local**

This will update your local master and develop branches with the most recent changes from your origin repo. This will do a fetch from the origin, prune dead branches, and then do a fast-forward merge.

This creates a linear history and avoids a merge commit on these branches as we shouldn't be committing to master or develop directly. All we want to do is update our local branches without adding commits.
```
syncmaster == git checkout master && git fetch -p origin && git merge --ff-only origin/master
syncdev == git checkout develop && git fetch -p origin && git merge --ff-only origin/develop
syncall == syncmaster && syncdev
```

**Git History**

Displays a nicer, color coded, view of the git log. You can view the hole thing or set a flag `-X` for how many commits you want to view.
```
git hist -3 = log --format=format:'%C(bold yellow)%h%C(reset) %C(blue)(%ar)%C(reset) - %C(white)%s%C(reset) %C(dim white)[%an]%C(reset)%C(dim yellow)%d%C(reset)' --graph --decorate
```

**Amend changes to your previous commit**
```
git amend = git commit -a --amend
```
