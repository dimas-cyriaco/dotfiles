#!/usr/bin/env bash


brew install kitty
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font
brew install lsd
brew install antidote
brew install starship
brew install stow
brew install --head neovim
brew install asdf
brew install awscli
brew install bat
brew install broot
brew install dynobase
brew install fzf
brew install lazygit
brew install pulumi
brew install ripgrep
brew install trash
brew install --cask karabiner-elements
brew install --cask amethyst
brew install google-chrome

## Helix

### Install Rust

curl https://sh.rustup.rs -sSf | sh

### Install Helix

mkdir code
cd code
git clone git@github.com:helix-editor/helix.git
cd helix
cargo install --path helix-term
ln -s $PWD/runtime ~/.config/helix/runtime

# Install FZF extra functionality.
/opt/homebrew/opt/fzf/install

stow kitty
stow amethyst
stow bat
stow broot
stow git
stow helix
stow karabiner
stow starship
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
asdf list all nodejs
asdf install nodejs x.x.x
asdf global nodejs x.x.x

### Yarn

asdf plugin add yarn
asdf install yarn 1.22.19
asdf global yarn 1.22.19

## Editor Stuff

### Typescript language server

npm install -g typescript typescript-language-server

## Nushell + Starship

# brew install nushell
# mkdir ~/.cache/starship
# starship init nu | save ~/.cache/starship/init.nu
