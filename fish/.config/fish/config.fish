set -Ux XDG_CONFIG_HOME $HOME/.config
set -U EDITOR nvim
set -U SHELL /usr/local/bin/fish
set -U PROJECTS_PATH $HOME/Projetos

set -Ux FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -Ux FZF_DEFAULT_OPTS '--height 40% --layout reverse --info inline --border  --preview-window down:1:noborder --color "fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899"'
