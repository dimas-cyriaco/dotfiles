# shellcheck shell=bash

alias ael="aws ec2 describe-instances"
alias aeln="aws ec2 describe-instances --query \"Reservations[].Instances[].Tags[?Key=='Name'].Value\" --output text"
alias c=clear
alias dcd="docker compose down -v"
alias dcu="docker compose up -d"
alias dot='source $HOME/.zshrc'
alias dv=devbox
alias dvg="devbox global"
alias dvs="devbox shell"
alias gss="git status"
alias h=hledger
alias hg="history 1 | grep"
alias kt="kitty --session ~/.config/kitty/startup.conf"
# alias k="kubectl"
# alias ka="kubectl apply -f ."
alias kk="k9s"
alias ld=lazydocker
alias lg=lazygit
alias la="eza -la --icons"
alias ll="eza -l --icons"
alias ln=lazynpm
alias rm=trash
alias t=taskell
alias tw="$HOME/code/judit/taskell.md"
alias v=nvim
