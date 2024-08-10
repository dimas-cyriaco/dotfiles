#!/bin/zsh
# shellcheck shell=bash

unset BROWSER

export CARGO_UNSTABLE_SPARSE_REGISTRY=true
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
export EDITOR=nvim
export HISTFILE="$HOME/.zhistory"
export HISTFILE=~/.zsh_history #Where to save history to disk
export HISTSIZE=5000           #How many lines of history to keep in memory
export KEYTIMEOUT=1
export NOTES_PATH="/Users/dimas/Library/Mobile Documents/com~apple~CloudDocs/Documents/Notes"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export SAVEHIST=5000 #Number of history entries to save to disk
export TASKDATA=~/tasks
export TASKRC=~/.config/task/.taskrc
export TERM=xterm-256color

# Fzf Theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
	--color=fg:#c0caf5,bg:#24283b,hl:#bb9af7
	--color=fg+:#FFFFFF,bg+:#1a1b26,hl+:#7dcfff
	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff
	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi
