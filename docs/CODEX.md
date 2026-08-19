# Codex setup

## Install

The bootstrap script installs the Codex CLI globally with npm:

```bash
npm install -g @openai/codex
```

If you already have the CLI installed, bootstrap leaves it alone.

## Authenticate

Codex supports either ChatGPT sign-in or an OpenAI API key.

For ChatGPT sign-in, run:

```bash
codex --login
```

For API key auth, export your key in the shell:

```bash
export OPENAI_API_KEY="<your-key>"
```

Put that in `~/.zshrc.local` if you want it to load automatically in new shells.
Use one flow or the other, depending on how you want to manage access.

## Run

From any git repository:

```bash
codex
```

Useful modes:

```bash
codex --auto-edit
codex --full-auto
```

## Optional local config

Codex also supports local configuration under `~/.codex/`.

Keep secrets and machine-specific settings out of this repo. If you need a local config file, create it on your machine rather than committing it here.

## Verify

After bootstrap:

```bash
codex --help
```

If you use the OpenAI API key flow, confirm the variable is available in the shell that launches Codex.
