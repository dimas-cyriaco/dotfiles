# shellcheck shell=bash

# shellcheck disable=SC1091
source "$ZPLUG_HOME"/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'zsh-users/zsh-autosuggestions'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -r -q; then
        echo; zplug install
    fi
fi

zplug load


# Z
source /usr/local/etc/profile.d/z.sh

# like normal z when used with arguments but displays an fzf prompt when used without.
unalias z 2> /dev/null
z() {
    [ $# -gt 0 ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}


# Fzf
# shellcheck disable=SC1090
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--height 40% --layout reverse --info inline --border  --preview-window down:1:noborder --color "fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899"'

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

gt() {
  # "Nothing to see here, move along"
  is_in_git_repo || return

  # Pass the list of the tags to fzf-tmux
  # - "{}" in preview option is the placeholder for the highlighted entry
  # - Preview window can display ANSI colors, so we enable --color=always
  # - We can terminate `git show` once we have $LINES lines
  git tag --sort -version:refname |
    fzf-tmux --multi --preview-window right:70% \
             --preview 'git show --color=always {} | head -'$LINES
}

# zsh-vim-mode

export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
