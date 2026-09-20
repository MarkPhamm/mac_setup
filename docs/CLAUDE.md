# Claude Code setup

## Install

The Brewfile installs the Claude Code CLI via Homebrew:

```bash
brew install --cask claude-code
```

`brew bundle` in the bootstrap script handles this. Homebrew does not auto-update this cask; upgrade it with:

```bash
brew upgrade claude-code
```

## Authenticate

Claude Code needs a Pro, Max, Team, Enterprise, or Console account. After install, start a session and follow the browser prompts:

```bash
claude
```

For API key auth, export your key in the shell:

```bash
export ANTHROPIC_API_KEY="<your-key>"
```

Put that in `~/.zshrc.local` if you want it to load automatically in new shells.

## Run

From any project directory:

```bash
claude
```

## Optional local config

Claude Code also supports local configuration under `~/.claude/`.

Keep secrets and machine-specific settings out of this repo. If you need a local config file, create it on your machine rather than committing it here.

## Verify

After bootstrap:

```bash
claude --version
claude doctor
```

If you use the API key flow, confirm the variable is available in the shell that launches Claude Code.
