# shellcheck shell=bash

alias ael="aws ec2 describe-instances"
alias aeln="aws ec2 describe-instances --query \"Reservations[].Instances[].Tags[?Key=='Name'].Value\" --output text"
alias b="br -c :sort_by_type"
alias c=clear
alias dot='source $HOME/.zshrc'
alias hg="history 1 | grep"
alias lg=lazygit
alias ll="exa -la --icons"
alias ln=lazynpm
alias ld=lazydocker
alias p=pnpm
alias pp="clear && pulumi preview"
alias pss="clear && pulumi stack select"
alias pss="pulumi stack select"
alias pu="clear && pulumi up"
alias pur="clear && pulumi refresh"
alias rm=trash
alias v=nvim
alias dcu="docker compose up -d"
alias dcd="docker compose down -v"
alias kt="kitty --session ~/.config/kitty/startup.conf"
