# ============================================================
# mac_setup: ~/.zshrc
# ============================================================

# Homebrew on Apple Silicon.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# User-installed command line tools (uv tools, pipx-style tools, etc.).
export PATH="$HOME/.local/bin:$PATH"

# ------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

# The actual configuration shown in the productivity-stack article.
ZSH_THEME="jonathan"

# Keep zsh-syntax-highlighting last.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# ------------------------------------------------------------
# Navigation
# ------------------------------------------------------------
# Replace `cd` with zoxide's smart directory jump behavior.
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# ------------------------------------------------------------
# Personal aliases / functions
# ------------------------------------------------------------
if [[ -f "$HOME/.zsh_aliases" ]]; then
  source "$HOME/.zsh_aliases"
fi

# ------------------------------------------------------------
# Local-only configuration
# ------------------------------------------------------------
# Put secrets, employer-specific paths, and machine-specific exports here.
# This file should NOT be committed.
if [[ -f "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
