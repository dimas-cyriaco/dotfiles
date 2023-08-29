#!/bin/zsh
# shellcheck shell=bash

unset BROWSER

export AWS_PROFILE=motrix
export CARGO_UNSTABLE_SPARSE_REGISTRY=true
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
export EDITOR=nvim
export HISTFILE="$HOME/.zhistory"
export HISTFILE=~/.zsh_history     #Where to save history to disk
export HISTSIZE=5000               #How many lines of history to keep in memory
export KEYTIMEOUT=1
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/.local/share/rtx/installs/nodejs/16.19.1/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH=$PATH:$HOME/.dotnet/tools
export PATH=$PATH:$DOTNET_ROOT
export SAVEHIST=5000               #Number of history entries to save to disk
export TASKDATA="$HOME/.config/task/tasks"
export TERM=xterm-256color

function zvm_config() {
  export ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL
  export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}
