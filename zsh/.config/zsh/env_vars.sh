#!/bin/zsh
# shellcheck shell=bash

export ZPLUG_HOME=/usr/local/opt/zplug
export NVM_DIR="$HOME/.nvm"
export PROJECTS_PATH="$HOME/Projetos"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export HISTFILE="$HOME/.zhistory"
export PATH="$HOME/.local/bin:$PATH"
export HISTSIZE=5000               #How many lines of history to keep in memory
export HISTFILE=~/.zsh_history     #Where to save history to disk
export SAVEHIST=5000               #Number of history entries to save to disk
export EDITOR=lvim
export SPECTRE_ASKPASS='sap'

# NVM config
# shellcheck disable=SC1091
[ -s "$NVM_DIR"/nvm.sh ] && . "$NVM_DIR"/nvm.sh  # This loads nvm

# AVN config
# shellcheck disable=SC1091
[[ -s "$HOME"/.avn/bin/avn.sh ]] && source "$HOME"/.avn/bin/avn.sh # load avn

unset BROWSER
