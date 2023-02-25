#!/bin/zsh
# shellcheck shell=bash

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/Users/dimascyriaco/.local/share/bob/nvim-bin:$PATH"

export HISTFILE="$HOME/.zhistory"
export HISTSIZE=5000               #How many lines of history to keep in memory
export HISTFILE=~/.zsh_history     #Where to save history to disk
export SAVEHIST=5000               #Number of history entries to save to disk

export EDITOR=nvim

export AWS_PROFILE=motrix

unset BROWSER

# Vi mode settings
export KEYTIMEOUT=1

function zvm_config() {
  export ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL
  export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

# LLVM
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
