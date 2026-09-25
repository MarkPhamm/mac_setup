# ============================================================
# mac_setup: ~/.zshrc
# ============================================================

# Homebrew on Apple Silicon.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# User-installed command line tools (uv tools, pipx-style tools, etc.).
export PATH="$HOME/.local/bin:$PATH"

# SnowSQL installs as an app bundle and does not put itself on PATH.
if [[ -d "/Applications/SnowSQL.app/Contents/MacOS" ]]; then
  export PATH="/Applications/SnowSQL.app/Contents/MacOS:$PATH"
fi

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
# Project terminal background
# ------------------------------------------------------------
# Sets the terminal background colour from the current git repo root, so each
# project gets its own (deterministic) dark tint. Resets outside a repo.
# Requires a terminal that supports OSC 11 (iTerm2, WezTerm, Kitty; not Apple
# Terminal).
if [[ -o interactive ]] && command -v md5 >/dev/null 2>&1; then
  _project_bg() {
    local git_root
    git_root=$(git rev-parse --show-toplevel 2>/dev/null) || {
      printf '\e]111\e\\'
      return
    }
    local hash=$(printf '%s' "$git_root" | md5 -q)
    local r=$(( 16#${hash:0:2} % 71 + 30 ))
    local g=$(( 16#${hash:2:2} % 71 + 30 ))
    local b=$(( 16#${hash:4:2} % 71 + 30 ))
    printf '\e]11;#%02x%02x%02x\e\\' $r $g $b
  }

  autoload -Uz add-zsh-hook
  add-zsh-hook chpwd _project_bg
  _project_bg
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Added by dbt Fusion extension (ensure dbt binary dir on PATH)
if [[ ":$PATH:" != *":/Users/minhpham/.local/bin:"* ]]; then
  export PATH=/Users/minhpham/.local/bin:"$PATH"
fi
# Added by dbt Fusion extension
alias dbtf=/Users/minhpham/.local/bin/dbt
