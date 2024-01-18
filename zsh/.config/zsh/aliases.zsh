# shellcheck shell=bash

alias ael="aws ec2 describe-instances"
alias aeln="aws ec2 describe-instances --query \"Reservations[].Instances[].Tags[?Key=='Name'].Value\" --output text"
alias b="br -c :sort_by_type"
alias c=clear
alias dcd="docker compose down -v"
alias dcu="docker compose up -d"
alias dot='source $HOME/.zshrc'
alias dv=devbox
alias dvg="devbox global"
alias dvs="devbox shell"
alias h=hledger
alias hg="history 1 | grep"
alias kt="kitty --session ~/.config/kitty/startup.conf"
alias k="kubectl"
alias ka="kubectl apply -f ."
alias kk="k9s"
alias ld=lazydocker
alias lg=lazygit
alias la="exa -la --icons"
alias ll="exa -l --icons"
alias ln=lazynpm
alias p=pnpm
alias pp="clear && pulumi preview"
alias pss="clear && pulumi stack select"
alias pss="pulumi stack select"
alias pu="clear && pulumi up"
alias pur="clear && pulumi refresh"
alias rm=trash
alias t=task
alias v=nvim
