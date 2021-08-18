#!/bin/zsh
# shellcheck shell=bash

export XDG_CONFIG_HOME="$HOME/.config"

# Fix bug: https://github.com/ohmyzsh/ohmyzsh/issues/4607
export FPATH="/usr/local/share/zsh/functions:$FPATH"

my_shdir=$XDG_CONFIG_HOME/zsh

my_configs=(
  deno.zsh
  env_vars.sh
  secrets.sh
  plugins.zsh
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

# shellcheck disable=SC1091
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# shellcheck disable=SC1091
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/Users/dimascyriaco/.sdkman"
# shellcheck disable=SC1091
# [[ -s "/Users/dimascyriaco/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dimascyriaco/.sdkman/bin/sdkman-init.sh"

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

setxkbmap us -variant altgr-intl

