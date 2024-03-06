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

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load ~/dotfiles/zsh/.config/zsh/plugins.txt

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
# [ -s "/Users/dimascyriaco/.bun/_bun" ] && source "/Users/dimascyriaco/.bun/_bun"

# eval "$(devbox global shellenv --init-hook)
# eval "$(devbox global shellenv)"

# source /Users/dimascyriaco/.config/broot/launcher/bash/br

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PATH="$PATH:/opt/homebrew/lib/ruby/gems/3.3.0/bin"

