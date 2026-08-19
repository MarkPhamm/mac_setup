# Tools

## Core packages

| Tool | Role |
|---|---|
| Homebrew | macOS package manager |
| Git | source control |
| GitHub CLI (`gh`) | GitHub auth, repos, PRs, issues, workflows |
| uv | Python versions, virtual environments, dependencies, global CLI tools |
| Node.js | npm host for Codex CLI |
| Oh My Zsh | Zsh configuration framework |

## Terminal stack

| Tool | Role |
|---|---|
| Warp | primary terminal |
| zoxide | smart `cd`, learns frequently used directories |
| eza | modern replacement for `ls` |
| lazygit | terminal UI for Git |
| fzf | fuzzy finder |
| ripgrep (`rg`) | fast recursive search |
| bat | better file preview / `cat` replacement |
| jq | JSON processing |
| tree | directory tree output |
| wget | downloads |
| lzop | fast LZO compression CLI |

## Desktop apps

| App | Role |
|---|---|
| Cursor | primary code editor |
| OrbStack | Docker / container runtime |
| Raycast | launcher and productivity utility |
| Rectangle | keyboard window management |
| 1Password | password / credential management |

## Python and SQL

Black and SQLFluff are installed as user-wide tools through `uv`:

```bash
uv tool install black
uv tool install sqlfluff
```

This keeps them isolated from project environments while still making the binaries available in the shell.

## Codex CLI

Codex is installed globally with npm:

```bash
npm install -g @openai/codex
```

The recommended local setup uses `OPENAI_API_KEY` from `~/.zshrc.local`, but Codex also supports local config under `~/.codex/`.

## zoxide

The Zsh config initializes zoxide with:

```bash
eval "$(zoxide init zsh --cmd cd)"
```

That intentionally replaces normal `cd` behavior with zoxide's smart jumping while still supporting normal paths.

Example:

```bash
cd dbt
cd airflow
```

Once zoxide learns those locations, they do not need to be children of the current directory.

## eza

The aliases preserve the previous workflow:

```bash
alias ls="eza --group-directories-first"
alias ll="eza -l --group-directories-first"
alias la="eza -la --group-directories-first"
```

## lazygit

Run inside any Git repo:

```bash
lazygit
```

Use `?` inside lazygit to display its shortcut help.

## lzop

```bash
lzop file
lzop -d file.lzo
lzop -c -d file.lzo
```
