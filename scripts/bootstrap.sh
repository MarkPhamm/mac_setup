#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "==> mac_setup bootstrap"

if ! xcode-select -p >/dev/null 2>&1; then
  echo
  echo "Apple Command Line Tools are not installed yet."
  echo "Run:"
  echo "  xcode-select --install"
  echo
  echo "Finish the macOS installer, then run this script again."
  exit 1
fi

echo "==> Apple Command Line Tools found: $(xcode-select -p)"

if ! command -v brew >/dev/null 2>&1; then
  echo "==> Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Homebrew's standard Apple Silicon location.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Homebrew: $(brew --version | head -n 1)"

echo "==> Installing Brewfile packages"
brew bundle --file="$REPO_ROOT/Brewfile"

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "==> Installing Oh My Zsh"
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "==> Oh My Zsh already installed"
fi

ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [[ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions" ]]; then
  echo "==> Installing zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions"
fi

if [[ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting" ]]; then
  echo "==> Installing zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"
fi

echo "==> Installing global formatter/linter tools with uv"
uv tool install --upgrade black || uv tool upgrade black
uv tool install --upgrade sqlfluff || uv tool upgrade sqlfluff

if ! command -v codex >/dev/null 2>&1; then
  echo "==> Installing Codex CLI"
  npm install -g @openai/codex
else
  echo "==> Codex CLI already installed"
fi

# Ensure uv tool executables are discoverable.
uv tool update-shell || true

echo
echo "Bootstrap complete."
echo "Next:"
echo "  ./scripts/link-dotfiles.sh"
echo "  ./scripts/configure-git.sh"
echo "  exec zsh"
echo "  gh auth login"
