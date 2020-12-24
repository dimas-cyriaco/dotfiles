#!/usr/bin/env bash

brew install git
brew install neovim
brew install zplug
brew install stow
brew install tmux
brew install ripgrep
brew install fzf
brew install dmux
brew install bat
brew install fish
brew install git-delta
brew install gotop
brew install flutter
brew install yarn

brew cask install alacritty
brew cask install font-sauce-code-pro-nerd-font
brew cask install github
brew cask install slack
brew cask install notion
brew cask install insomnia

stow zsh
stow nvim
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

sudo pip3 install pynvim

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $TMPDIR/installer.sh
sh $TMPDIR/installer.sh ~/.cache/dein

nvim +UpdateRemotePlugins +qall

git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm

if [ -z "$NEXUS_EMAIL" ]; then
  : ${GITHUB_USERNAME?"Need to set GITHUB_USERNAME"}
  : ${GITHUB_ACCESS_TOKEN?"Need to set GITHUB_ACCESS_TOKEN"}

  npm set registry https://nexus.apps.jusbr.com/repository/npm-all/
  npm set email $NEXUS_EMAIL
  npm set _auth $(echo -n $GITHUB_USERNAME:$GITHUB_ACCESS_TOKEN | base64)
  npm set always-auth true
fi

