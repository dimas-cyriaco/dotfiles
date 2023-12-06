#!/bin/zsh
# shellcheck shell=bash

unset BROWSER

export AWS_PROFILE=motrix
export CARGO_UNSTABLE_SPARSE_REGISTRY=true
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
export EDITOR=nvim
export HISTFILE="$HOME/.zhistory"
export HISTFILE=~/.zsh_history #Where to save history to disk
export HISTSIZE=5000           #How many lines of history to keep in memory
export KEYTIMEOUT=1
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$PATH:$HOME/.pulumi/bin"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$DOTNET_ROOT"
export SAVEHIST=5000 #Number of history entries to save to disk
export TERM=xterm-256color
export TASKRC=~/.config/task/.taskrc
export TASKDATA=~/.config/task/.task
# export TERM=xterm-kitty
export NEOVIDE_MULTIGRID=true
export LEDGER_FILE=~/ledger/all.journal

# Fzf Theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
	--color=fg:#c0caf5,bg:#24283b,hl:#bb9af7
	--color=fg+:#FFFFFF,bg+:#1a1b26,hl+:#7dcfff
	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff
	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

# pnpm
# export PNPM_HOME="/Users/dimascyriaco/Library/pnpm"
# case ":$PATH:" in
# *":$PNPM_HOME:"*) ;;
# *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# pnpm end

# Zsh Vim Mode plugin config
function zvm_config() {
  export ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL
  export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}
