# shellcheck shell=bash

fpath=(~/.config/zsh "$fpath")
autoload -Uz compinit
compinit -u
