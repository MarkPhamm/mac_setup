#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STAMP="$(date +%Y%m%d%H%M%S)"

backup_and_link() {
  local source="$1"
  local target="$2"

  if [[ -e "$target" || -L "$target" ]]; then
    if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
      echo "Already linked: $target"
      return
    fi

    echo "Backing up $target -> ${target}.backup.${STAMP}"
    mv "$target" "${target}.backup.${STAMP}"
  fi

  ln -s "$source" "$target"
  echo "Linked: $target -> $source"
}

backup_and_link "$REPO_ROOT/zsh/.zshrc" "$HOME/.zshrc"
backup_and_link "$REPO_ROOT/zsh/aliases.zsh" "$HOME/.zsh_aliases"

touch "$HOME/.zshrc.local"

echo
echo "Dotfiles linked."
echo "Machine-specific config belongs in:"
echo "  $HOME/.zshrc.local"
echo
echo "Reload with:"
echo "  exec zsh"
