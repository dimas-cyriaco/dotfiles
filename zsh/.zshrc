export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "eendroroy/alien"
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

# ENV Variables
export ALIEN_THEME="gruvbox"
export ALIEN_USE_NERD_FONT=1
export NVM_DIR="$HOME/.nvm"

# Options
setopt autocd autopushd \ pushdignoredups
setopt inc_append_history
setopt share_history

# Autocomplete
autoload -U compinit
compinit

# Vim keybinginds
bindkey -v

# NVM config
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# AVN config
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# Aliases
alias la="ls -lah"
alias ll="ls -lh"
