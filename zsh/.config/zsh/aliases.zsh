# shellcheck shell=bash

alias dot='source $HOME/.zshrc'
alias en='nvim $HOME/dotfiles/lvim/.config/lvim/lv-config.lua'
alias hg="history 1 | grep "
alias hl="habito list"
alias hll="habito list -l"
alias kc='kubectl'
alias kx='kubectx'
alias la="lsd -Al --group-dirs first"
alias ld='lazydocker'
alias lg='lazygit'
alias ll="lsd -A1 --group-dirs first"
alias ln='lazynpm'
alias nr='npm run'
alias nvim='lvim'
alias pf='kubectl port-forward svc/network-graphql-playground 8080:80'
alias s='spectre -t x'
alias t='clear && task'
alias tdy='task status:completed end:yesterday all'
alias tw='timew summary :ids'
