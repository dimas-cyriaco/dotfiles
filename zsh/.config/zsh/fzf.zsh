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
