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
brew install --cask karabiner-elements

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
stow bat
stow broot
stow git
stow karabiner
stow nvim
stow starship
stow zellij
stow zsh

echo "127.0.0.1 local.motrix.global" | sudo tee -a /etc/hosts

## AstroVim

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
