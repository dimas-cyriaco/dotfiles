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
# [ -s "/Users/dimascyriaco/.bun/_bun" ] && source "/Users/dimascyriaco/.bun/_bun"

# eval "$(devbox global shellenv --init-hook)"
# eval "$(devbox global shellenv)"

# source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
source ~/.antidote/antidote.zsh
antidote load ~/dotfiles/zsh/.config/zsh/plugins.txt

if [ -e /home/dimas/.nix-profile/etc/profile.d/nix.sh ]; then . /home/dimas/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(starship init zsh)"

# source /home/dimas/.config/broot/launcher/bash/br

. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
