# mac_setup Brewfile
#
# Install everything:
#   brew bundle --file=./Brewfile
#
# Remove packages not declared here:
#   brew bundle cleanup --file=./Brewfile
# Review cleanup output before using --force.

# HashiCorp tap: terraform left Homebrew core after the BSL license change.
# Homebrew requires explicit trust for third-party taps.
tap "hashicorp/tap"

# Core development
brew "git"
brew "gh"
brew "uv"
brew "node"
brew "awscli"
brew "hashicorp/tap/terraform", trusted: true

# Shell / productivity CLI
brew "jq"
brew "fzf"
brew "ripgrep"
brew "bat"
brew "eza"
brew "tree"
brew "wget"
brew "zoxide"
brew "lazygit"
brew "lzop"

# Desktop apps
cask "cursor"
cask "claude-code"
cask "warp"
cask "orbstack"
cask "raycast"
cask "rectangle"
cask "1password"
cask "dbeaver-community"
cask "obsidian"

# LaTeX
cask "basictex"
