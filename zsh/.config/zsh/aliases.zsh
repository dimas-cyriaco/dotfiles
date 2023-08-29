# shellcheck shell=bash

alias awsp="source _awsp"
alias b="br -c :sort_by_type"
alias dot='source $HOME/.zshrc'
alias hg="history 1 | grep"
alias ll="exa -la --icons"
alias ln=lazynpm
alias p=pueue
alias nx="yarn nx"
alias lg=lazygit
alias y=yarn
alias c=clear
alias rm=trash
alias v=nvim
alias pp="clear && pulumi preview"
alias pu="clear && pulumi up"
alias pss="clear && pulumi stack select"
alias pn="pnpm"
alias aeln="aws ec2 describe-instances --query \"Reservations[].Instances[].Tags[?Key=='Name'].Value\" --output text"
alias ael="aws ec2 describe-instances"
alias pss="pulumi stack select"
