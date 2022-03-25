#!/usr/bin/env bash

brew install --head neovim
brew install antibody
brew install fzf

# Install FZF extra functionality.
/opt/homebrew/opt/fzf/install

# alacritty
# bat
# broot
# karabiner
# starship \
# stow \
# tmux

stow alacritty
stow git
stow karabiner
stow lvim
stow starship
stow tmux
stow zsh

echo "127.0.0.1 local.motrix.global" | sudo tee -a /etc/hosts

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

zsh
nvm install 16
nvm install 17
nvm alias default 16
nvm use 16

npm install -g awsp

# npm install -g avn avn-nvm
# avn setup

npm install -g yarn

