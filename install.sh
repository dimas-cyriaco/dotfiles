#!/usr/bin/env bash

brew install --head neovim
brew install alacritty
brew install antibody
brew install asdf
brew install aws-cli
brew install awsu
brew install bat
brew install broot
brew install font-fira-code-nerd-font
brew install fzf
brew install httpie
brew install jq
brew install key-codes
brew install lazygit
brew install lsd
brew install lua
brew install ripgrep
brew install starship
brew install stow
brew install trash
brew install zellij

# Install FZF extra functionality.
/opt/homebrew/opt/fzf/install

# karabiner

stow alacritty
stow bat
stow broot
stow git
stow karabiner
stow nvim
stow starship
stow zellij
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

