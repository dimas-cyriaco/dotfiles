#!/bin/zsh
# shellcheck shell=bash

export XDG_CONFIG_HOME="$HOME/.config"

my_shdir=$XDG_CONFIG_HOME/zsh

my_configs=(
  env_vars.sh
  plugins.zsh
  options.zsh
  theme.zsh
  aliases.zsh
  fzf.zsh
  keybindings.zsh
)

for f in $my_configs; do
  [[ -f $my_shdir/$f ]] && . $my_shdir/$f
done
