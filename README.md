# Bash Profile

Some basic useful settings for a mac bash_profile that I use. Includes:
* git-completion for auto completion
* git-prompt for coloring and customization of git in terminal
* git templates for pre-commit and pre-push hooks
* System aliases for mac
* Git aliases for different git tasks
* Customized $PS1 for git using git-prompt
* Git config initial setup


### Installation

Clone repo and in terminal and run commands:
```
chmod +x install.sh
./install.sh
```

### Reload
After installation, if you make changes to your `.alias.sh` file, the bash_profile can be reloaded with the pre-installed alias:
```
reload_profile
```
