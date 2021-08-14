# shellcheck shell=bash

setopt autocd autopushd pushdignoredups
setopt inc_append_history
setopt share_history

# History Configuration
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

# Autocomplete
autoload -U compinit
compinit

