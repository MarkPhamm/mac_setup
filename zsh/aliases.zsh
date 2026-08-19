# ============================================================
# mac_setup: reusable aliases and shell functions
# ============================================================

# ------------------------------------------------------------
# Shell
# ------------------------------------------------------------
alias refresh="source ~/.zshrc"

# ------------------------------------------------------------
# eza: modern ls
# ------------------------------------------------------------
alias ls="eza --group-directories-first"
alias ll="eza -l --group-directories-first"
alias la="eza -la --group-directories-first"

# ------------------------------------------------------------
# SQLFluff
# ------------------------------------------------------------
alias sqfl="sqlfluff lint"
alias sqff="sqlfluff fix"

# ------------------------------------------------------------
# Docker / OrbStack
# WARNING: these can remove containers/images/volumes.
# ------------------------------------------------------------
alias docker_clean="docker system prune -a && docker volume prune && docker image prune -a"
alias docker_stop_all='docker stop $(docker ps -q)'
alias docker_remove_all_images='docker rmi $(docker images -q)'

# Old setup also had a `docker_start_mwaa` alias with hardcoded
# container IDs. That is intentionally machine/project-specific and
# belongs in ~/.zshrc.local instead of this repo.

# ------------------------------------------------------------
# dbt
# ------------------------------------------------------------
# Default matches the previous workflow, but projects can override:
#   export DBT_STATE_DIR=/path/to/artifacts
export DBT_STATE_DIR="${DBT_STATE_DIR:-prod_dbt_artifacts}"

dbt_run() {
  dbt run -s "$@" -f
}

dbt_run_operation() {
  dbt run-operation "$1" --args "${2:-{}}"
}

alias dbt_run_defer='dbt run --defer --state "$DBT_STATE_DIR" -s'
alias dbt_run_defer_favor_state='dbt run --defer --state "$DBT_STATE_DIR" --favor-state -s'
alias dbt_run_changed='dbt run --defer --state "$DBT_STATE_DIR" --select state:modified+'

alias dbt_test="dbt test -s"
alias dbt_test_defer='dbt test --defer --state "$DBT_STATE_DIR" -s'
alias dbt_test_changed='dbt test --defer --state "$DBT_STATE_DIR" --select state:modified+'

alias dbt_build_changed='dbt build --defer --state "$DBT_STATE_DIR" --select state:modified+'
alias dbt_build_defer='dbt build --defer --state "$DBT_STATE_DIR" -s'
alias dbt_build_defer_favor_state='dbt build --defer --state "$DBT_STATE_DIR" --favor-state -s'
alias dbt_build_all='dbt build --defer --state "$DBT_STATE_DIR" --select + --resource-type=model'

alias dbt_clone='dbt clone --state "$DBT_STATE_DIR" -f --resource-type=model -s'
alias dbt_seed="dbt seed -s"
alias dbt_parse_fix="dbt parse --no-partial-parse"
alias dbt_freshness="dbt source freshness"

# Portable replacement for the old company-specific manifest download alias.
# Configure in ~/.zshrc.local:
#   export DBT_MANIFEST_URL="https://..."
get_dbt_manifest() {
  if [[ -z "${DBT_MANIFEST_URL:-}" ]]; then
    echo "DBT_MANIFEST_URL is not set."
    return 1
  fi

  mkdir -p "$DBT_STATE_DIR"
  curl -L -o "$DBT_STATE_DIR/manifest.json" "$DBT_MANIFEST_URL"
}

# Find unique directories containing files whose paths match the search.
find_dir() {
  rg --files | xargs -n1 dirname | grep -i "$1" | sort -u
}

# ------------------------------------------------------------
# Git
# ------------------------------------------------------------
gitall() {
  git add .

  if [[ -n "${1:-}" ]]; then
    git commit -m "$1"
  else
    git commit
  fi

  git push
}

# Preserved from the old workflow.
# These assume a branch named `master`; use with care in repos using `main`.
alias git_delete_merged_branches='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
alias git_branch_clean='git branch --merged | grep -v master | xargs git branch -d'

# Useful one-off cleanup:
#   git fetch --prune --all
