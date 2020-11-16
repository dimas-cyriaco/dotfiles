#!/usr/bin/env bash

brew install git
brew install neovim
brew install zplug
brew cask install alacritty
brew cask install font-sauce-code-pro-nerd-font
brew cask install github

echo "stow zsh"
stow zsh
echo "stow nvim"
stow nvim
echo "stow alacritty"
stow alacritty

sudo pip3 install pynvim

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

