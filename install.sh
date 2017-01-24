#!/bin/bash
#

# Copy files
cp ./.alias.sh ~/
cp ./.bash-settings.shh ~/
cp ./.bash_profile ~/
cp ./.git-alias.sh ~/
cp ./.git-completion.bash ~/
cp ./.git-config-setup.sh ~/
cp ./.git-prompt.sh ~/
cp ./.git-templates.sh ~/

cd ~

. ./bash_profile
