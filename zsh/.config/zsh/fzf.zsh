#!/bin/zsh
# shellcheck shell=bash

# fzf's command
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules'"
# CTRL-T's command
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_COMMAND="$FZF_DEFAULT_COMMAND"
# ALT-C's command
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# for more info see fzf/shell/completion.zsh
_fzf_compgen_path() {
    fd . "$1"
}
_fzf_compgen_dir() {
    fd --type d . "$1"
}

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

git_status() {
  git -c color.status=always status --short
}

git_diff() {
  git diff --color=always -- "$1" | sed 1,4d; cat "$1"
}

_gf() {
  is_in_git_repo || return

  git_status \
    | fzf -m --ansi --nth 2..,.. --preview 'git_diff({-1}) | head -500'\
    | cut -c4-\
    | sed 's/.* -> //'
}

nf() {
  if cat package.json > /dev/null 2>&1; then
    scripts=$(jq .scripts < package.json | sed '1d;$d' | fzf --height 40%)

    if [[ -n $scripts ]]; then
        script_name=$(echo "$scripts" | awk -F ': ' '{gsub(/"/, "", $1); print $1}' | xargs)
        script="pnpm $script_name"
        fc -R =(print "$script")
        pnpm "$script_name"
    else
        echo "Exit: You haven't selected any script"
    fi
  else
    echo "Error: There's no package.json"
  fi
}
zle -N nf

# Select a docker container to start and attach to
function da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# Select a running docker container to stop
function ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# Select a docker container to remove
function drm() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker rm "$cid"
}
