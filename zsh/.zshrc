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
# source /usr/share/zsh-antidote/antidote.zsh
antidote load ~/dotfiles/zsh/.config/zsh/plugins.txt

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Config asfd
# . /opt/homebrew/opt/asdf/libexec/asdf.s
# source $(brew --prefix asdf)/libexec/asdf.sh
# source $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# [[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# export PNPM_HOME="/Users/dimascyriaco/Library/pnpm"
# export PATH="$PNPM_HOME:$PATH"

# source /home/dimas/.config/broot/launcher/bash/br

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# pnpm
export PNPM_HOME="/home/dimas/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
