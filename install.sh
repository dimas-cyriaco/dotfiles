#!/usr/bin/env bash

# devbox global pull git@github.com:dimas-cyriaco/devbox

# Overpass Fonts
# http://overpassfont.org

brew install kitty
# brew tap homebrew/cask-fonts
# brew install font-fira-code-nerd-font
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
brew install --cask emacs

# Arch
yay wl-clipboard
yay jq
yay tidy

## Helix

### Install Rust

curl https://sh.rustup.rs -sSf | sh

### Install Helix

mkdir code
cd code || return
git clone git@github.com:helix-editor/helix.git
cd helix || return
cargo install --path helix-term
ln -s "$PWD/runtime" ~/.config/helix/runtime

# Install FZF extra functionality.
"$(brew --prefix)/opt/fzf/install"

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

## Editor Stuff

### Typescript language server

npm install -g typescript typescript-language-server

## Nushell + Starship

# brew install nushell
# mkdir ~/.cache/starship
# starship init nu | save ~/.cache/starship/init.nu

## Alacricy - use_thin_strokes

# defaults write -g AppleFontSmoothing -int 0

# TreeSitter cli é usado pelo AstroVim para auto instalar gramáticas do TreeSitter.
cargo install tree-sitter-cli
