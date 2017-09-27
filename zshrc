export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="bullet-train"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras)

autoload -Uz compinit
compinit

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:$HOME/dev/bin:$HOME/bin:$HOME/.cargo/bin/"
export GOPATH=~/dev

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias dot="source ~/.zshrc"
alias g="clear && gss"
alias la="clear && ls -lah"
alias ll="clear && ls -lh"
alias tmux="TERM=xterm-256color tmux"
alias enable_colemak="setxkbmap us -variant colemak"
alias disable_colemak="setxkbmap br"

function cdd() {
  cd $HOME/dev/$1
}

# capslock acts as control
/usr/bin/setxkbmap -option "ctrl:nocaps"

export TERM="xterm-256color"
export BULLETTRAIN_DIR_FG=black
export BULLETTRAIN_TIME_BG=#2C2C2C
export BULLETTRAIN_TIME_FG=white
export BULLETTRAIN_EXEC_TIME_SHOW=true

fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

export NPM_TOKEN=''

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/dimas/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/dimas/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/dimas/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /home/dimas/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh
