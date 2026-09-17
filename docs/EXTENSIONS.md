# Cursor extensions

The installable source of truth is:

```text
cursor/extensions.txt
```

That file is the Brewfile equivalent for Cursor: one extension ID per line. On a new Mac, after Cursor and the `cursor` CLI are available:

```bash
./scripts/install-cursor-extensions.sh
```

The script skips extensions that are already installed, so it is safe to run again.

## What is in the list

The list matches the extensions currently installed on this machine, minus Cursor-bundled IDs (`anysphere.cursorpyright`, `anysphere.remote-ssh`). Those come with Cursor and should not be reinstalled from the marketplace.

After install:

1. Select **Tokyo Night** with `Cmd + Shift + P` → `Preferences: Color Theme`.
2. Select **Material Icon Theme** with `Cmd + Shift + P` → `Preferences: File Icon Theme`.
3. Paste a WakaTime API key from [wakatime.com](https://wakatime.com) if prompted.

Keep extensions global when they are part of your general workflow. Put project-specific recommendations in a project's `.vscode/extensions.json` instead of adding them to this machine-wide list.

## List what is installed

```bash
cursor --list-extensions
cursor --list-extensions --show-versions
```

## Refresh the repo list from this machine

After installing or removing extensions in the UI:

```bash
cursor --list-extensions | grep -v '^anysphere\.'
```

Compare that output with `cursor/extensions.txt` and update the file if the change should follow you to the next Mac.
