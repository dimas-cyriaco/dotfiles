# shellcheck shell=bash

setopt autocd autopushd pushdignoredups
setopt inc_append_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Autocomplete
autoload -U compinit
compinit

# VI Mode
# bindkey -v
