# shellcheck shell=bash

function tree {
  br -c :pt "$@"
}

function short {
  curl -F"shorten=$1" https://0x0.st 2>/dev/null | pbcopy
  echo "Copied to clipboard."
}
