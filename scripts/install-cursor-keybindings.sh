#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE="$REPO_ROOT/cursor/keybindings.json"
TARGET="$HOME/Library/Application Support/Cursor/User/keybindings.json"
STAMP="$(date +%Y%m%d%H%M%S)"

if [[ ! -f "$SOURCE" ]]; then
  echo "Missing source keybindings: $SOURCE" >&2
  exit 1
fi

mkdir -p "$(dirname "$TARGET")"

if [[ -f "$TARGET" ]]; then
  BACKUP="$TARGET.backup.$STAMP"
  cp "$TARGET" "$BACKUP"
  echo "Backed up existing keybindings to: $BACKUP"
fi

node - "$SOURCE" "$TARGET" <<'NODE'
const fs = require("fs");

const [sourcePath, targetPath] = process.argv.slice(2);

function parseJsonc(filePath) {
  let text = fs.readFileSync(filePath, "utf8");
  text = text.replace(/^\s*\/\/.*$/gm, "");
  text = text.replace(/\/\*[\s\S]*?\*\//g, "");
  text = text.replace(/,\s*([}\]])/g, "$1");
  return JSON.parse(text);
}

const source = parseJsonc(sourcePath);
const target = fs.existsSync(targetPath) ? parseJsonc(targetPath) : [];

if (!Array.isArray(source) || !Array.isArray(target)) {
  throw new Error("Keybindings files must contain JSON arrays");
}

const serialized = new Set(target.map((binding) => JSON.stringify(binding)));
const additions = source.filter((binding) => {
  const key = JSON.stringify(binding);
  if (serialized.has(key)) return false;
  serialized.add(key);
  return true;
});

fs.writeFileSync(targetPath, `${JSON.stringify([...target, ...additions], null, 4)}\n`);
console.log(`Added ${additions.length} keybinding(s) to ${targetPath}`);
NODE

echo "Reload Cursor with: Cmd + Shift + P -> Developer: Reload Window"
