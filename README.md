# mac_setup

Reproducible setup for a fresh Apple Silicon Mac used for analytics engineering, data engineering, and day-to-day development.

This repo turns my Mac setup into code: Homebrew packages, terminal tooling, Zsh configuration, Cursor keybindings, formatting shortcuts, Git helpers, and setup notes.

## What this repo installs

### Core
- Apple Command Line Tools
- Homebrew
- Git + GitHub CLI
- uv
- AWS CLI
- Terraform
- Oh My Zsh
- zsh-autosuggestions
- zsh-syntax-highlighting

### Terminal workflow
- Warp
- zoxide
- eza
- lazygit
- fzf
- ripgrep
- bat
- jq
- tree
- wget
- lzop

### Development apps
- Cursor
- Codex CLI
- OrbStack
- Raycast
- Rectangle
- 1Password
- DBeaver
- Obsidian

### Python / SQL tooling
- Black
- SQLFluff

## Setup philosophy

```text
macOS
├── Xcode Command Line Tools
├── Homebrew
│   ├── CLI packages
│   └── GUI apps
├── Warp
│   └── zsh
│       └── Oh My Zsh
│           ├── Jonathan theme
│           ├── zsh-autosuggestions
│           ├── zsh-syntax-highlighting
│           ├── zoxide
│           └── personal aliases/functions
├── Cursor
│   ├── extensions.txt
│   ├── keybindings.json
│   └── tasks.json
├── uv
│   ├── Python versions
│   └── global CLI tools
├── AWS CLI
├── Terraform
├── DBeaver
├── Obsidian
├── docs/
│   ├── CODEX.md
│   ├── CURSOR.md
│   ├── EXTENSIONS.md
│   ├── MIGRATION_NOTES.md
│   ├── NEXT_LAYER.md
│   ├── SHORTCUTS.md
│   ├── SOURCES.md
│   └── TOOLS.md
└── OrbStack
    └── Docker
```

## Fresh Mac install

### 1. Install Apple Command Line Tools

```bash
xcode-select --install
```

Verify after the installer finishes:

```bash
xcode-select -p
git --version
```

Expected developer tools path is normally:

```text
/Library/Developer/CommandLineTools
```

### 2. Clone this repo

```bash
git clone https://github.com/MarkPhamm/mac_setup ~/mac_setup
cd ~/mac_setup
```

### 3. Bootstrap the machine

```bash
./scripts/bootstrap.sh
```

The bootstrap script:
1. verifies Apple Command Line Tools
2. installs Homebrew if missing
3. runs the `Brewfile`
4. installs Oh My Zsh
5. installs the two external Zsh plugins
6. installs Black and SQLFluff with `uv tool`

### 4. Link dotfiles

```bash
./scripts/link-dotfiles.sh
exec zsh
```

Existing dotfiles are backed up before links are created.

### 5. Configure Git / GitHub

```bash
./scripts/configure-git.sh
gh auth login
```

### 6. Install Cursor config

See [`docs/CURSOR.md`](docs/CURSOR.md).

```bash
./scripts/install-cursor-keybindings.sh
./scripts/install-cursor-extensions.sh
```

### 7. Set up Codex

See [`docs/CODEX.md`](docs/CODEX.md).

### 8. Verify

```bash
./scripts/verify.sh
```

## Common commands

```bash
refresh                 # source ~/.zshrc
ll                      # eza long listing
la                      # eza including hidden files
cd <partial-name>       # zoxide-powered smart navigation
lazygit                 # terminal Git UI
git lg                  # pretty Git graph
gitall "message"        # add, commit, push

sqfl model.sql          # SQLFluff lint
sqff model.sql          # SQLFluff fix

dbt_run model_name
dbt_test model_name
dbt_run_defer model_name
dbt_build_defer model_name
```

## Important migration decisions

A few items from the old setup were intentionally cleaned up:

- **Warp, not iTerm2**: Warp is the terminal used in the productivity stack.
- **Jonathan theme, not Powerlevel10k**: the article mentions Powerlevel10k in prose, but the actual `.zshrc` shown uses `ZSH_THEME="jonathan"`. This repo follows the actual config.
- **No employer-specific paths**: old Insurify filesystem paths and hardcoded Docker container IDs are not part of the reusable config.
- **dbt state is configurable**: aliases default to `prod_dbt_artifacts`, but use `$DBT_STATE_DIR` so a project can override it.
- **Manifest download is configurable**: set `$DBT_MANIFEST_URL` instead of hardcoding a company URL.

See [`docs/MIGRATION_NOTES.md`](docs/MIGRATION_NOTES.md) for details.

## Current rebuild status

As of the fresh M4 Mac rebuild on 2026-08-19:

- [x] Fresh Mac booted
- [x] `xcode-select --install` requested
- [ ] Command Line Tools installation verified
- [ ] Homebrew verified
- [ ] Oh My Zsh installed
- [ ] Brew bundle installed
- [ ] Dotfiles linked
- [ ] GitHub authenticated
- [ ] Cursor configuration restored
- [ ] Final verification completed

Update this checklist as the machine is rebuilt.

## Repo structure

```text
mac_setup/
├── Brewfile
├── Makefile
├── README.md
├── cursor/
│   ├── extensions.txt
│   ├── keybindings.json
│   └── tasks.json
├── docs/
│   ├── CURSOR.md
│   ├── EXTENSIONS.md
│   ├── MIGRATION_NOTES.md
│   ├── NEXT_LAYER.md
│   ├── SHORTCUTS.md
│   ├── SOURCES.md
│   └── TOOLS.md
├── scripts/
│   ├── bootstrap.sh
│   ├── configure-git.sh
│   ├── install-cursor-extensions.sh
│   ├── install-cursor-keybindings.sh
│   ├── link-dotfiles.sh
│   └── verify.sh
└── zsh/
    ├── .zshrc
    └── aliases.zsh
```

## Source

The workflow is reconstructed from my existing setup plus my article:

**The Productivity Stack I Actually Use as an Analytics Engineer**  
Mark Pham, March 17, 2026.

The article is useful as the human explanation; this repo is the executable version.
