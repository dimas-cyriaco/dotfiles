#!/usr/bin/env bash

sudo pacman -Sq --needed --noconfirm git
sudo pacman -Sq --needed --noconfirm zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo pacman -Sq --needed --noconfirm tmux
sudo pacman -Sq --needed --noconfirm neovim
sudo pacman -Sq --needed --noconfirm ctags
sudo pacman -Sq --needed --noconfirm the_silver_searcher
sudo pacman -Sq --needed --noconfirm hub
sudo pacman -Sq --needed --noconfirm xclip
sudo pacman -Sq --needed --noconfirm python-pip
sudo pip install neovim

nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall

ln -sf $(pwd)/zshrc $HOME/.zshrc
ln -sf $(pwd)/nvim $HOME/.config/nvim
ln -sf $(pwd)/tmux/tmux.conf $HOME/.tmux.conf
