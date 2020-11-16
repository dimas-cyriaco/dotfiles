#!/usr/bin/env bash

brew install git
brew install neovim
brew cask install alacritty
brew install zplug
# brew tap homebrew/cask-fonts
brew cask install font-sauce-code-pro-nerd-font

stow zsh
stow neovim
stow alacritty

if [ -z "$USER_EMAIL" ]; then
  fail "USER_EMAIL is not set"
fi

if [ -z "$USER_FULL_NAME" ]; then
  fail "USER_FULL_NAME is not set"
fi

ssh_key_file="$HOME/.ssh/id_rsa.pub"
if [ ! -f "$ssh_key_file" ]; then
  ssh-keygen -t rsa
fi

cat "$ssh_key_file"

sudo pip3 install pynvim

nvim +call dein#install()
nvim +UpdateRemotePlugins +qall

git config --global core.editor nvim
git config --global user.email $USER_EMAIL
git config --global user.name $USER_FULL_NAME
