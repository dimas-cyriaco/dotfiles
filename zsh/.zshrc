#!/bin/zsh
# shellcheck shell=bash

autoload -Uz compinit
compinit

export XDG_CONFIG_HOME="$HOME/.config"

my_shdir=$XDG_CONFIG_HOME/zsh

my_configs=(
  env_vars.sh
  secrets.sh
  options.zsh
  aliases.zsh
  fzf.zsh
  keybindings.zsh
  functions.zsh
)

for f in "${my_configs[@]}"; do
  # shellcheck disable=SC1090
  [[ -f $my_shdir/$f ]] && . "$my_shdir"/"$f"
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/Users/dimascyriaco/.bun/_bun" ] && source "/Users/dimascyriaco/.bun/_bun"

eval "$(devbox global shellenv --init-hook)"
# eval "$(devbox global shellenv)"

# source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
source /nix/store/7k2wpycd8qr99s0k6sjcmwxdsnrds4yl-antidote-1.9.2/share/antidote/antidote.zsh
antidote load ~/dotfiles/zsh/.config/zsh/plugins.txt

if [ -e /home/dimas/.nix-profile/etc/profile.d/nix.sh ]; then . /home/dimas/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(starship init zsh)"

source /home/dimas/.config/broot/launcher/bash/br
