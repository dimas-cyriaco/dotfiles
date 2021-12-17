#!/bin/bash

# Install Nix.
sh <(curl -L https://nixos.org/nix/install) --daemon
#curl -L https://nixos.org/nix/install | sh

# Install packages.

nix-env -iA \
  nixpkgs.git \
  nixpkgs.neovim \
  nixpkgs.vscode \
  nixpkgs.zsh \
  nixpkgs.antibody \
  nixpkgs.starship \
  nixpkgs.zoom-us \
  nixpkgs.stow \
  nixpkgs.direnv

# Setup home-manager
export NIX_PATH=${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels
nix-shell '<home-manager>' -A install

stow zsh

# Set zsh as default shell.
sudo chsh -s $(which zsh) $USER

# Bundle zsh plugins
antibody bundle < ~/.config/zsh/plugins.txt > ~/.zsh_plugins.sh
