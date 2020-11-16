#!/usr/bin/env bash

brew install git
brew install neovim
brew install zplug
brew install stow
brew install nvm

brew cask install alacritty
brew cask install font-sauce-code-pro-nerd-font
brew cask install github
brew cask install slack
brew cask install notion
brew cask install steam
brew cask install adobe-creative-cloud
brew cask install bartender

stow zsh
stow nvim
stow alacritty

sudo pip3 install pynvim

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $TMPDIR/installer.sh
sh $TMPDIR/installer.sh ~/.cache/dein

nvim +call dein#install()
nvim +UpdateRemotePlugins +qall

if [ -z "$NEXUS_EMAIL" ]; then
  : ${GITHUB_USERNAME?"Need to set GITHUB_USERNAME"}
  : ${GITHUB_ACCESS_TOKEN?"Need to set GITHUB_ACCESS_TOKEN"}

  npm set registry https://nexus.apps.jusbr.com/repository/npm-all/
  npm set email $NEXUS_EMAIL
  npm set _auth $(echo -n "$GITHUB_USERNAME:$GITHUB_ACCESS_TOKEN" | base64)
  npm set always-auth true
fi

