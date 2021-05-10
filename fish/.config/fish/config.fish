set -Ux XDG_CONFIG_HOME $HOME/.config
set -U EDITOR nvim
set -U SHELL /usr/local/bin/fish
set -U PROJECTS_PATH $HOME/Projetos
set -gx PATH $HOME/.pub-cache/bin $PATH
set -gx PATH $PROJECTS/jusbr-kube/scripts $PATH
set -U FISH_CONFIG $XDG_CONFIG_HOME/fish/config.fish

set -Ux FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -Ux FZF_DEFAULT_OPTS '--height 40% --layout reverse --info inline --border  --preview-window down:1:noborder --color "fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899"'

function setenv; set -gx $argv; end
source ~/.env

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
set -g fish_user_paths "/usr/local/opt/redis@3.2/bin" $fish_user_paths

function port-forward
  kubectl port-forward svc/network-graphql-playground 8080:80
end

set -g fish_user_paths "/usr/local/opt/redis@3.2/bin" $fish_user_paths

set -U fish_gretting

function __nvm_use_on_cd --on-variable PWD --description 'Use Node.js version specified by project'
    # if test -e package.json
    #   nvm use (jq --monochrome-output --raw-output '.devEngines.node' package.json)
    #   return
    # end

    if test -e .nvmrc
       nvm use
       return
    end

    if test -e .node-version
       nvm use (cat .node-version)
       return
    end
end

set --universal nvm_default_version v15

set -U N_PREFIX $HOME/.config/n

function dot
    source $FISH_CONFIG
end

function hg
    history | grep $argv
end

function posix-source
	for i in (cat $argv)
		set arr (echo $i |tr = \n)
  		set -gx $arr[1] $arr[2]
	end
end
