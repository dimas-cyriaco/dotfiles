#!/bin/zsh
# shellcheck shell=bash

function short {
  curl -F"shorten=$1" https://0x0.st
}

curl-time() {
curl -w @- -o /dev/null -s "$@" <<'EOF'
    time_namelookup:  %{time_namelookup}\n
       time_connect:  %{time_connect}\n
    time_appconnect:  %{time_appconnect}\n
   time_pretransfer:  %{time_pretransfer}\n
      time_redirect:  %{time_redirect}\n
 time_starttransfer:  %{time_starttransfer}\n
                    ----------\n
         time_total:  %{time_total}\n
EOF
}

function mk {
  mkdir -p "$1"
  cd "$1" || exit
}

function delete_secret() {
    if [ $# -ne 1 ]; then
        echo "Usage: delete_secret <secret_id>"
        return 1
    fi

    local secret_id="$1"
    local region="us-east-1"

    aws secretsmanager delete-secret --secret-id "$secret_id" --force-delete-without-recovery --region "$region"
}

function delete_secrets_for_branch() {
    local branch_name="$1"
    local secret_templates=(
        "eng-api-$branch_name-codebuild-elastic-admin-key"
        "eng-api-$branch_name-codebuild-cognito-client-secret"
        "eng-api-$branch_name-codebuild-postgres-password"
    )

    for secret in "${secret_templates[@]}"; do
        delete_secret "$secret"
    done
}

function destroy_stack() {
    local branch_name="$1"

    pulumi stack select "motrix/env/$branch_name" --cwd infra/projects/env 2>/dev/null || true
    pulumi config set branch_name "$branch_name" --cwd infra/projects/env
    pulumi config set githubConnectionArn arn:aws:codestar-connections:us-east-1:786966036727:connection/5e705a79-3e07-4ea2-ae69-d4a25570ea4e  --cwd infra/projects/env
    pulumi config set coreReference dev --cwd infra/projects/env
    pulumi config set coreReference dev --cwd infra/projects/env
    pulumi destroy --yes --cwd infra/projects/env
}

function set_env() {
  local new_env="$1"

  rm .env
  cp ".env.$new_env" .env
}

function test_migration() {
  pnpm db:migration:generate src/shared/db/migrations/test --dr
}

function trb() {
  local value="$1"
  trans "$value" -brief en:pt-BR
}

function tr() {
  local value="$1"
  trans "$value" en:pt-BR
}

function test_fonts() {
  echo -e "\e[1mbold\e[0m"
  echo -e "\e[3mitalic\e[0m"
  echo -e "\e[3m\e[1mbold italic\e[0m"
  echo -e "\e[4munderline\e[0m"
  echo -e "\e[9mstrikethrough\e[0m"
}

function pf() {
  set -f
  local PUEUE_TASKS="pueue status --json | jq -c '.tasks' | jq -r '.[] | \"\(.id | tostring | (\" \" * (2 - length)) + .) | \(.command[-15:]) | ~/\(.path[20:]) | \(.status)\"'"
  local header="a:pause | s:start | r:restart | x:kill | f:log | e:reload"

  local bind="\
ctrl-b:execute-silent(echo {} | cut -d'|' -f1 | xargs pueue pause > /dev/null)+reload^$PUEUE_TASKS^,\
ctrl-s:execute-silent(echo {} | cut -d'|' -f1 | xargs pueue start > /dev/null)+reload^$PUEUE_TASKS^,\
ctrl-r:execute-silent(echo {} | cut -d'|' -f1 | xargs pueue restart -ik > /dev/null)+reload^$PUEUE_TASKS^,\
ctrl-x:execute-silent(echo {} | cut -d'|' -f1 | xargs pueue kill > /dev/null)+reload^$PUEUE_TASKS^,\
ctrl-t:execute-silent(echo {} | cut -d'|' -f1 | xargs pueue log | less > /dev/tty),\
ctrl-f:become(echo {} | cut -d'|' -f1 | xargs pueue follow),\
ctrl-e:reload^$PUEUE_TASKS^\
"

  echo $PUEUE_TASKS | sh | fzf --header "${header}" -m \
    --preview="echo {} | cut -d'|' -f1 | xargs pueue log | bat -l log --style=rule,numbers --color=always -r ':200'" \
    --preview-window="top" \
    --bind="$bind"
      set +f
}

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
