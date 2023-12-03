# shellcheck shell=bash

bindkey -s '^o' 'nvim $(fzf)^M'
bindkey -M vicmd '^f' nf

# Use ctrl+space to accept zsh-autosuggestion suggestion
bindkey '^ ' autosuggest-accept

# Fix ctrl+p and ctrl+n
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

