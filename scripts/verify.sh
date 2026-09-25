#!/usr/bin/env bash
set -u

commands=(
  git
  gh
  brew
  uv
  node
  npm
  codex
  claude
  jq
  fzf
  rg
  bat
  eza
  tree
  wget
  zoxide
  lazygit
  lzop
  aws
  terraform
  snow
  snowsql
  black
  sqlfluff
  pdflatex
)

failed=0

printf "%-18s %s\n" "COMMAND" "STATUS"
printf "%-18s %s\n" "-------" "------"

for cmd in "${commands[@]}"; do
  if command -v "$cmd" >/dev/null 2>&1; then
    printf "%-18s %s\n" "$cmd" "OK"
  else
    printf "%-18s %s\n" "$cmd" "MISSING"
    failed=1
  fi
done

echo

if [[ -d "$HOME/.oh-my-zsh" ]]; then
  echo "Oh My Zsh:        OK"
else
  echo "Oh My Zsh:        MISSING"
  failed=1
fi

if [[ -L "$HOME/.zshrc" ]]; then
  echo "~/.zshrc link:    $(readlink "$HOME/.zshrc")"
else
  echo "~/.zshrc link:    not a symlink"
fi

echo
echo "GUI apps:"
for app in Cursor Warp OrbStack Raycast Rectangle "1Password" DBeaver Obsidian SnowSQL; do
  if [[ -d "/Applications/${app}.app" ]]; then
    printf "%-18s %s\n" "$app" "OK"
  else
    printf "%-18s %s\n" "$app" "CHECK MANUALLY"
  fi
done

exit "$failed"
