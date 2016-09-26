#!/usr/bin/env bash

# Required packages: git, zsh, neovim, ctags, the_silver_searcher, hub, xclip, python-pip

chsh -s $(which zsh)
# or
# sudo usermod -s $(which zsh) $USER

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo pip install neovim

ln -sf $(pwd)/zshrc $HOME/.zshrc
ln -sf $(pwd)/nvim $HOME/.config/nvim

nvim +PlugInstall +qall >/dev/null
nvim +UpdateRemotePlugins +qall >/dev/null

git config --global core.editor nvim
git config --global user.email "email-here"
git config --global user.name "name-here"

