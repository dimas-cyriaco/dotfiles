#!/usr/bin/env bash

fail() {
  echo $1
  exit 1
}

assert_installed() {
  hash $1 2>/dev/null
  if [ $? -eq 1 ]; then
    fail "$1 is not installed"
  fi
}

assert_installed git
assert_installed zsh
assert_installed nvim
assert_installed ctags
assert_installed ag
assert_installed go
# assert_installed yriac
assert_installed pip3

if [ -z "$USER_EMAIL" ]; then
  fail "USER_EMAIL is not set"
fi

if [ -z "$USER_FULL_NAME" ]; then
  fail "USER_FULL_NAME is not set"
fi

ssh_key_file="$HOME/.ssh/id_rsa.pub"
if [ ! -f "$ssh_key_file" ]; then
  ssh-keygen -t rsa
fi

cat "$ssh_key_file"

sudo usermod -s $(which zsh) $USER
# or
# chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo pip3 install neovim

ln -sf $(pwd)/zshrc $HOME/.zshrc
ln -sf $(pwd)/nvim $HOME/.config/nvim
cp -sf $(pwd)/bullet-train.zsh-theme $HOME/.oh-my-zsh/themes/bullet-train.zsh-theme
cp -sf $(pwd)/.gitconfig $HOME/.gitconfig

nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall

git config --global core.editor nvim
git config --global user.email $USER_EMAIL
git config --global user.name $USER_FULL_NAME
