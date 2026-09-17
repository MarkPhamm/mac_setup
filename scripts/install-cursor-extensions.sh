#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXTENSIONS_FILE="$REPO_ROOT/cursor/extensions.txt"

if [[ ! -f "$EXTENSIONS_FILE" ]]; then
  echo "Missing extensions list: $EXTENSIONS_FILE" >&2
  exit 1
fi

if ! command -v cursor >/dev/null 2>&1; then
  echo "The cursor CLI is not on PATH." >&2
  echo "In Cursor: Cmd + Shift + P, then run the command that installs 'cursor' in PATH." >&2
  exit 1
fi

installed="$(cursor --list-extensions | tr '[:upper:]' '[:lower:]')"
added=0
skipped=0

while IFS= read -r line || [[ -n "$line" ]]; do
  ext="${line%%#*}"
  ext="${ext// /}"
  [[ -z "$ext" ]] && continue

  ext_lc="$(printf '%s' "$ext" | tr '[:upper:]' '[:lower:]')"
  if printf '%s\n' "$installed" | grep -qx "$ext_lc"; then
    echo "Already installed: $ext"
    skipped=$((skipped + 1))
    continue
  fi

  echo "==> Installing $ext"
  cursor --install-extension "$ext"
  added=$((added + 1))
done < "$EXTENSIONS_FILE"

echo
echo "Installed $added extension(s); $skipped already present."
echo "Reload Cursor with: Cmd + Shift + P -> Developer: Reload Window"
echo "WakaTime still needs an API key from https://wakatime.com after install."
