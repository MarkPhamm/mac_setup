# Migration notes

This repo is a cleaned, portable reconstruction of the previous Mac setup.

## 1. Jonathan vs Powerlevel10k

The productivity article has an inconsistency:

- prose says Oh My Zsh is configured with Powerlevel10k
- the actual `.zshrc` snippet says:

```bash
ZSH_THEME="jonathan"
```

The fresh setup follows the concrete `.zshrc` configuration and uses **Jonathan**.

Powerlevel10k is therefore not installed by default.

## 2. Warp vs iTerm2

An early fresh-Mac recommendation included iTerm2.

The actual productivity workflow uses **Warp**, so the repo installs Warp and does not install iTerm2.

## 3. Company-specific configuration removed

The old setup contained items that should not be committed to a reusable/public dotfiles repo:

- an Insurify-specific Python path in a Cursor keybinding
- an Insurify-specific dbt manifest download location
- hardcoded Docker container IDs for an MWAA environment
- a user-specific `/Users/minh.pham/.local/bin` path

Replacements:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

and:

```bash
export DBT_MANIFEST_URL="..."
export DBT_STATE_DIR="prod_dbt_artifacts"
```

Machine/company-specific values belong in:

```text
~/.zshrc.local
```

That file is intentionally not version-controlled.

## 4. dbt aliases

The old workflow used `prod_dbt_artifacts` heavily for state/defer commands.

This repo keeps that as the default but parameterizes it:

```bash
export DBT_STATE_DIR="${DBT_STATE_DIR:-prod_dbt_artifacts}"
```

So a future project can override it without editing the repo.

## 5. Git cleanup aliases

The old cleanup aliases assume the primary branch is named `master`.

They are preserved because they were part of the workflow, but they should be treated as legacy helpers. Many newer repositories use `main`.

Before using:

```bash
git_delete_merged_branches
git_branch_clean
```

check the repo's default branch.

## 6. Cursor `Cmd + Shift + E`

The previous binding ran a specific local completeness-check script.

It is intentionally omitted from the portable keybindings because it has no generic equivalent.

## 7. Cursor command identifiers

Cursor evolves quickly. The repo preserves the `composerMode.agent` command from the existing setup, but if a future Cursor version changes that identifier, rebind `Cmd + I` using Cursor's current Command Palette / Keyboard Shortcuts UI.
