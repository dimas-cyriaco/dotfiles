#!/bin/zsh
# shellcheck shell=bash

export ZPLUG_HOME=/usr/local/opt/zplug
export NVM_DIR="$HOME/.nvm"
export PROJECTS_PATH="$HOME/Projetos"
export PATH=/Users/dimascyriaco/.cargo/bin:$PATH

# NVM config
# shellcheck disable=SC1091
[ -s "$NVM_DIR"/nvm.sh ] && . "$NVM_DIR"/nvm.sh  # This loads nvm

# AVN config
# shellcheck disable=SC1091
[[ -s "$HOME"/.avn/bin/avn.sh ]] && source "$HOME"/.avn/bin/avn.sh # load avn
