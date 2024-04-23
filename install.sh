#!/usr/bin/env bash

brew install alacritty
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono-nerd-font
brew install eza
brew install zoxide
brew install antidote
brew install starship
brew install stow
brew install asdf
brew install awscli
brew install bat
brew install yazi
brew install fzf
brew install lazygit
brew install rectangle
brew install raycast
brew install ripgrep
brew install trash
brew install helix

## Helix

### Install Rust

# curl https://sh.rustup.rs -sSf | sh

### Install Helix

mkdir code
cd code || return
# git clone git@github.com:helix-editor/helix.git
# cd helix || return
# cargo install --path helix-term
# ln -s "$PWD/runtime" ~/.config/helix/runtime

# Install FZF extra functionality.
eval "$(fzf --zsh)"

stow bat
stow yabai
stow skhd
stow yazi
stow zellij
stow git
stow helix
stow starship
stow zsh

echo "127.0.0.1 local.judit.io" | sudo tee -a /etc/hosts

## Asdf

### Node

brew install gpg
brew install gawk
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf list all nodejs
asdf install nodejs latest
asdf global nodejs latest

## Editor Stuff

### Typescript language server

npm install -g typescript typescript-language-server
