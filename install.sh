#!/usr/bin/env sh

pacman -S --needed git
pacman -S --needed zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
pacman -S --needed neovim
pacman -S --needed tmux

ln -sf $(pwd)/zshrc $HOME/.zshrc
ln -sf $(pwd)/nvim $HOME/.config/nvim
ln -sf $(pwd)/tmux/tmux.conf $HOME/.tmux.conf
