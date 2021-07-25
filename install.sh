#!/usr/bin/env bash

brew install tmux
brew install git
brew install neovim
brew install zplug
brew install stow
brew install ripgrep
brew install fd
brew install fzf
brew install bat
brew install git-delta
brew install bpytop
brew install yarn
brew install ranger
brew install lazygit
brew install lazydocker
brew install lazynpm
brew install z
brew install font-fira-code-nerd-font
brew install lsd

brew cask install alacritty
brew cask install github
brew cask install slack
brew cask install notion
brew cask install insomnia

stow zsh
stow lvim
stow alacritty
stow git
stow tmux

echo "127.0.0.1 local.jusbrasil.com.br" | sudo tee -a /etc/hosts

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | zsh

zsh
nvm install 10
nvm alias default 10
nvm use 10

npm install -g avn avn-nvm
avn setup

npm install -g yarn

# Install LunarVim
LVBRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/ChristianChiarulli/lunarvim/rolling/utils/installer/install.sh)

if [ -z "$NEXUS_EMAIL" ]; then
  : ${GITHUB_USERNAME?"Need to set GITHUB_USERNAME"}
  : ${GITHUB_ACCESS_TOKEN?"Need to set GITHUB_ACCESS_TOKEN"}

  npm set registry https://nexus.apps.jusbr.com/repository/npm-all/
  npm set email $NEXUS_EMAIL
  npm set _auth $(echo -n $GITHUB_USERNAME:$GITHUB_ACCESS_TOKEN | base64)
  npm set always-auth true
fi

