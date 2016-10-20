export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="bullet-train"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker docker-compose git taskwarrior)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias dc="dcb && dcu"
alias dbuild="clear && docker-compose build"
alias dup="clear && docker-compose up"
alias dfull="dbuild && dup"
alias dot="source ~/.zshrc"
alias drc="docker rm $(docker ps -a -q)"
alias dri="docker rmi $(docker images -q)"
alias dclear="drc && dri"
alias g="clear && gss"
alias la="clear && ls -lah"
alias ll="clear && ls -lh"
alias lpc="lpass --password -c "
alias lps="lpass ls | grep "
alias task="clear && task"
alias tmux="TERM=xterm-256color tmux"
alias tk="task"
alias tm="timew"
alias ts="timew summary"

function cdd() {
  cd $HOME/dev/src/github.com/descomplica/$1
}

function dbash() {
  docker-compose exec $1 bash
}

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# capslock acts as control
/usr/bin/setxkbmap -option "ctrl:nocaps"

# NPM login {{{
export NPM_USER=descomplica
export NPM_PASS=
export NPM_EMAIL=dimas.cyriaco@descomplica.com.br
# }}}

# Go Lang {{{
export GOPATH=~/dev
export PATH=$PATH:$HOME/dev/bin:$HOME/bin
# }}}

export TERM="xterm-256color"
export BULLETTRAIN_DIR_FG=black
export BULLETTRAIN_TIME_BG=#2C2C2C
export BULLETTRAIN_TIME_FG=white
export BULLETTRAIN_EXEC_TIME_SHOW=true

# Github Hub settings {{{
eval "$(hub alias -s)"
fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit
# }}}
