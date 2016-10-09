#!/usr/bin/env bash

# Required packages: git, zsh, neovim, ctags, the_silver_searcher, hub, xclip, python-pip3

sudo usermod -s $(which zsh) $USER
# or
# chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo pip3 install neovim

ln -sf $(pwd)/zshrc $HOME/.zshrc
ln -sf $(pwd)/nvim $HOME/.config/nvim
ln -sf $(pwd)/bullet-train.zsh-theme $HOME/.oh-my-zsh/themes/bullet-train.zsh-theme

nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall

git config --global core.editor nvim
git config --global user.email $USER_EMAIL
git config --global user.name $USER_FULL_NAME
