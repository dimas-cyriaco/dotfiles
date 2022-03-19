#!/usr/bin/env bash

stow alacritty
stow git
stow karabiner
stow lvim
stow starship
stow tmux
stow zsh

# echo "127.0.0.1 local.jusbrasil.com.br" | sudo tee -a /etc/hosts

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | zsh

zsh
nvm install 16
nvm install 17
nvm alias default 16
nvm use 16

# npm install -g avn avn-nvm
# avn setup

npm install -g yarn

# Install LunarVim
bash <(curl -s https://raw.githubusercontent.com/ChristianChiarulli/lunarvim/rolling/utils/installer/install.sh)

# if [ -z "$NEXUS_EMAIL" ]; then
  # : ${GITHUB_USERNAME?"Need to set GITHUB_USERNAME"}
  # : ${GITHUB_ACCESS_TOKEN?"Need to set GITHUB_ACCESS_TOKEN"}

#   npm set registry https://nexus.apps.jusbr.com/repository/npm-all/
#   npm set email $NEXUS_EMAIL
#   npm set _auth $(echo -n $GITHUB_USERNAME:$GITHUB_ACCESS_TOKEN | base64)
#   npm set always-auth true
# fi

