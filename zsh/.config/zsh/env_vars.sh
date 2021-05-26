#!/bin/zsh
# shellcheck shell=bash

export ZPLUG_HOME=/usr/local/opt/zplug
export ALIEN_THEME="gruvbox"
export ALIEN_USE_NERD_FONT=1
export NVM_DIR="$HOME/.nvm"
export PROJECTS_PATH="$HOME/Projetos"

# NVM config
# shellcheck disable=SC1091
[ -s "$NVM_DIR"/nvm.sh ] && . "$NVM_DIR"/nvm.sh  # This loads nvm

# AVN config
# shellcheck disable=SC1091
[[ -s "$HOME"/.avn/bin/avn.sh ]] && source "$HOME"/.avn/bin/avn.sh # load avn
