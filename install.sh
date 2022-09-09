#!/usr/bin/env bash

brew install --head neovim
brew install alacritty
brew install antibody
brew install asdf
brew install aws-cli
brew install bat
brew install broot
brew install dynobase
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font
brew install fzf
brew install lazygit
brew install lsd
brew install pulumi
brew install ripgrep
brew install starship
brew install stow
brew install trash
brew install zellij
brew install --cask karabiner-elements
brew install --cask amethyst

## Helix

### Install Rust

curl https://sh.rustup.rs -sSf | sh

### Install Helix

mkdir code
cd code
git clone git@github.com:helix-editor/helix.git
cd helix
cargo install --path helix-term

# Install FZF extra functionality.
/opt/homebrew/opt/fzf/install

stow alacritty
stow amethyst
stow bat
stow broot
stow git
stow helix
stow karabiner
stow nvim
stow starship
stow zellij
stow zsh

# echo "127.0.0.1 local.motrix.global" | sudo tee -a /etc/hosts

## AstroVim

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync

## Asdf

### Node

brew install gpg
brew install gawk
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

### Yarn

asdf plugin add yarn
asdf install yarn 1.22.19
asdf global yarn 1.22.19

## Editor Stuff

### Typescript language server

npm install -g typescript typescript-language-server
