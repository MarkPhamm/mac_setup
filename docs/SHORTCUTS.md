# Keyboard shortcuts

## Terminal

| Shortcut | Action |
|---|---|
| `Ctrl + W` | delete previous word |
| `Ctrl + U` | clear line before cursor |
| `Ctrl + L` | clear screen |
| `Ctrl + E` | move to end of line |
| `Ctrl + A` | move to beginning of line |
| `Ctrl + R` | search command history |
| `Ctrl + B` | move cursor backward |
| `Ctrl + F` | move cursor forward |
| `Ctrl + C` | stop current process |
| `Option + B` | move to beginning of word |
| `Alt/Option + F` | move to end of word |
| hold `Option` + click | precise cursor placement |
| `Tab` | completion |
| `Up` | previous command |

## Cursor / VS Code

| Shortcut | Action |
|---|---|
| `Cmd + Shift + P` | command palette |
| `Cmd + P` | quick open |
| `Cmd + B` | toggle sidebar |
| `Cmd + \` | split editor |
| `Cmd + ,` | settings |
| `Cmd + Shift + H` | find/replace across directory |
| `Cmd + L` | select line |
| `Cmd + /` | comment/uncomment |
| `Ctrl + `` | integrated terminal |

See `cursor/keybindings.json` for the custom bindings.

## Useful shell commands

List processes:

```bash
ps -ax
```

Remove remote-deleted branches from local autocomplete/state:

```bash
git fetch --prune --all
```

Pipe output:

```bash
ps -ax | grep vpn
```
