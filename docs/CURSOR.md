# Cursor setup

## Install

Cursor is installed by the `Brewfile`.

```bash
brew install --cask cursor
```

## Enable the `cursor` shell command

In Cursor:

1. Open the Command Palette with `Cmd + Shift + P`
2. Search for the command that installs the `cursor` command in `PATH`
3. Run it
4. Verify in a new terminal:

```bash
cursor --version
cursor .
```

The exact wording of the command can change between Cursor releases, so search the Command Palette rather than depending on a hardcoded menu label.

## Keybindings

The repo contains:

```text
cursor/keybindings.json
```

The important custom workflow includes:

| Shortcut | Action |
|---|---|
| `Cmd + I` | Cursor Composer / agent mode |
| `Cmd + 1` | Toggle focus between terminal and editor |
| `Cmd + Shift + C` | Copy relative file path |
| `Cmd + Shift + F` | SQLFluff fix current SQL file |
| `Cmd + Shift + L` | SQLFluff lint current SQL file |
| `Cmd + Shift + B` | Black-format current Python file |
| `Cmd + Shift + S` | format + save, behavior depends on file type |
| `Ctrl + Z` | send terminal undo control sequence |
| `Ctrl + Shift + Z` | same terminal undo control sequence |

`Cmd + Shift + S` intentionally replaces the normal Save As behavior for SQL/Python files.

## Tasks

The SQLFluff keybindings reference task names, so the repo also provides:

```text
cursor/tasks.json
```

For a project that should use them, copy or link it to:

```text
.vscode/tasks.json
```

The two tasks are:

```text
SQLFluff Fix Current File
SQLFluff Lint Current File
```

## Machine-specific keybinding intentionally removed

The old config had `Cmd + Shift + E` execute a Python script under an Insurify-specific path.

That path does not belong in a portable Mac bootstrap repo. If an equivalent workflow is needed at a new company/project, add it locally with a project-relative path.

## Standard shortcuts worth keeping in muscle memory

- `Cmd + Shift + P`: command palette
- `Cmd + P`: quick open
- `Cmd + B`: toggle sidebar
- `Cmd + \`: split editor
- `Cmd + ,`: settings
- `Cmd + Shift + H`: directory-wide find/replace
- `Cmd + L`: select current line
- `Cmd + /`: comment/uncomment
- `Ctrl + ``: integrated terminal
