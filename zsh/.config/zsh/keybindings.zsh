bindkey -s '^o' 'nvim $(fzf)^M'
bindkey -s '^g' '_gf\n'

# Use ctrl+space to accept zsh-autosuggestion suggestion
bindkey '^ ' autosuggest-accept

# Fix ctrl+p and ctrl+n
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
