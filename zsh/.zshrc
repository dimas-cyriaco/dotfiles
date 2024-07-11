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
  vim-mode.sh
)

for f in "${my_configs[@]}"; do
  # shellcheck disable=SC1090
  [[ -f $my_shdir/$f ]] && . "$my_shdir"/"$f"
done

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.config/zsh/plugins.txt

ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/dimas/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# opam configuration
[[ ! -r /Users/dimas/.opam/opam-init/init.zsh ]] || source /Users/dimas/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
