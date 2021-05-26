#!/bin/zsh
# shellcheck shell=bash

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

y() {
  if cat package.json > /dev/null 2>&1; then
    scripts=$(jq .scripts < package.json | sed '1d;$d' | fzf --height 40%)

    if [[ -n $scripts ]]; then
        script_name=$(echo "$scripts" | awk -F ': ' '{gsub(/"/, "", $1); print $1}' | xargs)
        yarn run "$script_name"
    else
        echo "Exit: You haven't selected any script"
    fi
  else
    echo "Error: There's no package.json"
  fi
}