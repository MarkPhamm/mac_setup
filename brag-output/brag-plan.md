# Brag Plan: mac_setup

## What is this app?
A single repo (`mac_setup`) that turns a brand-new Apple Silicon Mac into a fully configured analytics-engineering workstation with one script — Homebrew packages, Zsh/Oh My Zsh, Cursor config, Git, Claude Code and Codex, all installed and verified without a single manual click.

## The angle
The joke/claim: setting up a new Mac is usually a miserable afternoon of App Store installs, forgotten dotfiles, and "wait, what was that alias again?" This repo turns that afternoon into three terminal commands and a green checklist. The video plays it like a satisfying "speedrun" — messy blank Mac to fully-loaded dev machine, verified, in seconds.

## Hook (first 2-3 seconds)
A brand new, empty terminal window. Cursor blinking. Text types in: `./scripts/bootstrap.sh` — then everything happens at once.

## Key moments (the middle)
- The bootstrap script's `==>` log lines rapid-fire down the terminal: Homebrew, Oh My Zsh, zsh-autosuggestions, Black, SQLFluff — each line landing like a checklist item, not a wall of text.
- Cut to the `.zshrc` growing an identity: the prompt itself changes theme, and the terminal background tints a distinct color — a nod to the repo's actual per-project auto-tint feature (`_project_bg`), shown as the terminal glowing into a new color the instant you `cd` into a repo.
- The `verify.sh` grid fills in: COMMAND / STATUS rows stamping "OK" one after another — git, brew, uv, claude, codex, lazygit, fzf — building to a full column of green OK's.

## Outro / punchline
The full verify grid sits fully green for a beat, then a hard cut to the repo name card: **mac_setup** — "A fresh Mac, fully loaded, before your coffee's done."

## User flow worth showing
1. **Entry:** blank terminal on a fresh Mac, one command typed: `./scripts/bootstrap.sh`.
2. **Key action:** the bootstrap log streams through its real install steps (Homebrew → Oh My Zsh → plugins → Black/SQLFluff → Codex), then `./scripts/link-dotfiles.sh` links the dotfiles and the prompt/theme flips live.
3. **Result:** `./scripts/verify.sh` prints the real COMMAND/STATUS table, every row landing "OK", capped by the GUI apps check.

## Tone
- Preset: default
- Creative direction: a terminal-nerd speedrun flex — "zero to fully-configured dev machine before your coffee's done"
- Interpretation: playful and clean, not a joke at the product's expense — the humor is in how satisfying the automation is. Comfortable 4-5 scene pacing, crossfades, mixed-case type, let the terminal be the star.

## Format: landscape — 1920x1080
## Duration: 20 seconds

## Visual identity (from the project)
- Background: near-black terminal ground, `#0D0F12`
- Accent: terminal green, `#3DDC84` (the "OK" status color), with a secondary warm accent `#F5A623` for the `==>` log markers
- Text: off-white, `#E8EAED`
- Display font: a clean monospace (SF Mono / JetBrains Mono) — the whole video should feel like it's set in a real terminal
- Body font: same monospace family, lighter weight for supporting lines
- Strongest visual element: the real `verify.sh` COMMAND/STATUS table filling with green "OK" rows, plus the project-based terminal-background auto-tint moment

## Share copy (draft)
One script, and a brand new Mac is a fully-loaded analytics engineering machine before your coffee's done.

## Audio direction
- Role: warm rhythmic bed under a mostly-diegetic terminal soundscape
- Music: upbeat, minimal electronic/lo-fi coding-playlist bed — steady, not aggressive
- Music treatment: starts low under the hook, rises slightly under the install-log scene, small swell into the all-green verify moment, quick fade under the outro card
- Music cue guidance: to be detected at composition time (no bundled preset chosen yet); target one strong cue at the moment the verify grid finishes filling green, and a beat-grid window across the `==>` log lines for the sequential reveal
- Audio-reactive treatment: subtle — the terminal's green glow/cursor blink may breathe slightly with the music, nothing flashy
- SFX posture: moderate — mechanical keyboard ticks on typed commands, soft terminal "line print" ticks per log line, a clean upward chime on the final all-green table, a soft whoosh on the color-tint shift
- Audio-coupled moments: the hook command typing out character by character with key ticks; the `==>` bootstrap lines landing one by one with print ticks; the verify table rows stamping "OK" one by one with a light tick each, resolving to a slightly bigger chime on the last row
- Restraint rule: never let music or SFX drown out the terminal text being legible; no laugh track or comedic stingers — the satisfaction is the joke

## Storyboard

### Scene 1 — The blank Mac — 3s
A fresh terminal window, empty prompt, blinking cursor. `./scripts/bootstrap.sh` types out character by character, then Enter.
Sequential/interaction: yes — command types out character by character, then submits
Audio intent: quiet anticipation, single clean keystroke ticks
Audio-coupled idea: type the hook command with subtle mechanical key ticks, cursor blink sound optional
Music: soft bed fades in under the typing
Transition mood: clean → Scene 2

### Scene 2 — Bootstrap speedrun — 5s
The bootstrap log scrolls: `==> Homebrew`, `==> Oh My Zsh`, `==> zsh-autosuggestions`, `==> Installing global formatter/linter tools with uv`, `==> Codex CLI` — each `==>` line lands distinctly, not a blur.
Sequential/interaction: yes — 5 `==>` lines land one by one, each held long enough to read
Audio intent: building momentum, satisfying rapid-fire progress
Audio-coupled idea: a soft print/tick sound on each `==>` line landing, synced to a light beat-grid
Music: bed rises slightly in energy
Transition mood: clean wipe → Scene 3

### Scene 3 — The terminal comes alive — 4s
`./scripts/link-dotfiles.sh` runs, then the prompt visibly changes theme and the terminal background glows into a distinct tinted color — the repo's real auto-tint-per-project feature, shown as the whole terminal shifting color.
Sequential/interaction: yes — prompt theme swap, then a color wash across the terminal background
Audio intent: a small "reveal" moment, tactile and satisfying
Audio-coupled idea: a soft whoosh/shimmer timed to the color shift
Music: continues steady, no drop yet
Transition mood: soft crossfade → Scene 4

### Scene 4 — All green — 5s
`./scripts/verify.sh` runs. The real COMMAND/STATUS table fills in row by row: git, brew, uv, claude, codex, lazygit, fzf... each stamping "OK" in the accent green, building to a full green column, capped by the GUI apps check.
Sequential/interaction: yes — table rows stamp "OK" one by one, accelerating slightly toward the end
Audio intent: rising satisfaction, resolving in a small triumphant beat
Audio-coupled idea: a light tick per row landing, a slightly bigger clean chime when the last row lands all-green
Music: small swell/strong cue lands exactly as the last row completes
Transition mood: hard cut (post-payoff beat) → Scene 5

### Scene 5 — Outro card — 3s
Hard cut to a clean title card: **mac_setup**, then the line "A fresh Mac, fully loaded, before your coffee's done." on the near-black background with the green accent.
Sequential/interaction: none
Audio intent: settle, confident close
Audio-coupled idea: none — let the line hold in silence-adjacent quiet as music fades
Music: fades out under the card
Transition mood: — (end)

**Music mood for this video:** upbeat, clean, minimal coding-playlist energy
**Audio summary:** A steady, understated electronic bed builds quietly under a mostly-diegetic terminal soundscape (keystrokes, line-prints, a whoosh, a final chime), peaking exactly as the verify table turns fully green, then fading out under the outro card.
