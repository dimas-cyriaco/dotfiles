#!/bin/zsh
# shellcheck shell=bash

export XDG_CONFIG_HOME="$HOME/.config"

my_shdir=$XDG_CONFIG_HOME/zsh

my_configs=(
  deno.zsh
  env_vars.sh
  plugins.zsh
  options.zsh
  theme.zsh
  aliases.zsh
  fzf.zsh
  keybindings.zsh
)

for f in "${my_configs[@]}"; do
  [[ -f $my_shdir/$f ]] && . "$my_shdir"/"$f"
done

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/dimascyriaco/.sdkman"
[[ -s "/Users/dimascyriaco/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dimascyriaco/.sdkman/bin/sdkman-init.sh"
