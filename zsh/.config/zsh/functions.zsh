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

_rtx_hook() {
  trap -- '' SIGINT;
  eval "$("/opt/homebrew/bin/rtx" hook-env -s zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_rtx_hook]+1}" ]]; then
  precmd_functions=( _rtx_hook "${precmd_functions[@]}" )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_rtx_hook]+1}" ]]; then
  chpwd_functions=( _rtx_hook "${chpwd_functions[@]}" )
fi

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
