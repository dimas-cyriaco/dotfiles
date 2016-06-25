#!/usr/bin/env bash

sudo pacman -S --needed git
sudo pacman -S --needed zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo pacman -S --needed tmux
sudo pacman -S --needed neovim
sudo pacman -S --needed ctags
sudo pacman -S --needed the_silver_searcher
sudo pacman -S --needed hub
sudo pacman -S --needed xclip
sudo pacman -S --needed python-pip
sudo pip install neovim

nvim +PlugInstall +qall >/dev/null
nvim +UpdateRemotePlugins +qall >/dev/null

ln -sf $(pwd)/zshrc $HOME/.zshrc
ln -sf $(pwd)/nvim $HOME/.config/nvim
ln -sf $(pwd)/tmux/tmux.conf $HOME/.tmux.conf
