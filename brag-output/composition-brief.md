# Hyperframes Composition Brief: mac_setup

## Objective
Create a short launch-style brag video for `mac_setup`, a repo that turns a fresh Apple Silicon Mac into a fully configured analytics-engineering workstation with one script.

## Output
- Composition directory: `brag-output/composition/`
- Rendered video: `brag-output/brag.mp4`
- Format: landscape — 1920x1080
- Duration: 20 seconds

## Source Material
- Project root: `/Users/minhpham/projects/mac_setup`
- Primary files read: `README.md`, `Makefile`, `scripts/bootstrap.sh`, `scripts/verify.sh`, `zsh/.zshrc`, `docs/TOOLS.md`
- Product name: `mac_setup`
- Tagline / strongest claim: "This repo turns my Mac setup into code."
- Key UI or visual moment to recreate: a real terminal window — the `bootstrap.sh` install log, then the `verify.sh` COMMAND/STATUS table filling with green "OK" rows
- Copy that must appear verbatim:
  - `./scripts/bootstrap.sh`
  - `==> Homebrew`
  - `==> Oh My Zsh`
  - `==> zsh-autosuggestions`
  - `==> Installing global formatter/linter tools with uv`
  - `==> Codex CLI`
  - `./scripts/link-dotfiles.sh`
  - `./scripts/verify.sh`
  - `COMMAND` / `STATUS` table header
  - Row commands: `git`, `brew`, `uv`, `claude`, `codex`, `lazygit`, `fzf` each resolving to `OK`
  - `mac_setup`
  - "A fresh Mac, fully loaded, before your coffee's done."

## Creative Direction
- Tone preset: default
- Creative direction: a terminal-nerd speedrun flex — "zero to fully-configured dev machine before your coffee's done"
- Interpretation: playful and clean, not self-deprecating — the humor is in how satisfying the automation is. Comfortable pacing (5 scenes), crossfades/clean wipes, mixed-case type, the terminal itself is the star, not a mockup of one.
- Angle: Setting up a new Mac is usually a miserable afternoon of App Store installs and forgotten dotfiles. This repo turns that afternoon into three terminal commands and a fully green checklist. The video plays like a satisfying speedrun: blank Mac to fully-loaded dev machine, verified, in seconds.
- Hook: A brand new, empty terminal, cursor blinking. `./scripts/bootstrap.sh` types out, then fires.
- Outro / punchline: `mac_setup` — "A fresh Mac, fully loaded, before your coffee's done."
- Avoid:
  - Generic SaaS language ("streamline your workflow")
  - Abstract filler visuals unrelated to a real terminal
  - Any fake/invented tool names — every command and tool shown must be real (see verbatim list above)

## Visual Identity
- Background: near-black terminal ground, `#0D0F12`
- Text: off-white, `#E8EAED`
- Accent: terminal green `#3DDC84` (status "OK" color) with a secondary warm accent `#F5A623` for `==>` log markers
- Display font: monospace (SF Mono / JetBrains Mono fallback stack) — the whole video should read as a real terminal, not a UI mockup
- Body font: same monospace family, lighter weight for supporting lines
- Visual references from the project: the real `verify.sh` COMMAND/STATUS grid; the `bootstrap.sh` `==>` log style; the repo's own per-project terminal background auto-tint feature (`_project_bg` in `.zshrc`) as a literal color-shift beat

## Storyboard
Use the storyboard in `brag-output/brag-plan.md` as the creative contract.

Scene summary:
1. The blank Mac — 3s — empty terminal, `./scripts/bootstrap.sh` types out character by character and fires
2. Bootstrap speedrun — 5s — `==>` install log lines land one by one, each held long enough to read (Homebrew, Oh My Zsh, zsh-autosuggestions, uv tools, Codex CLI)
3. The terminal comes alive — 4s — `./scripts/link-dotfiles.sh` runs, prompt theme swaps, terminal background washes into a distinct tinted color (the real auto-tint feature)
4. All green — 5s — `./scripts/verify.sh` runs, the real COMMAND/STATUS table fills row by row (git, brew, uv, claude, codex, lazygit, fzf, ...) ending on a fully green column
5. Outro card — 3s — hard cut to `mac_setup` + "A fresh Mac, fully loaded, before your coffee's done." on the near-black background

## Audio
- Audio role: warm rhythmic bed under a mostly-diegetic terminal soundscape
- Audio arc: bed fades in low under the hook typing, rises slightly through the install log, holds steady through the color-shift reveal, small swell/peak as the verify table finishes all-green, fades out under the outro card
- Music: `assets/music/happy-beats-business-moves-vol-9-by-ende-dot-app.mp3` (mid-energy, clean, ~114.8 BPM)
- Music treatment: start ~0.30-0.35 volume under Scene 1, hold through Scenes 2-3, allow a natural swell/perceived peak at the Scene 4 payoff (all rows green), fade to 0 across Scene 5
- Music cue guidance: preset at `assets/music/cues/happy-beats-business-moves-vol-9-by-ende-dot-app.music-cues.json` (and matching `.md`). Strong cues in the first ~13s: 3.70s, 4.23s, 5.28s, 6.34s, 7.92s, 8.44s, 10.54s, 11.60s, 12.65s (all intensity ~0.99-1.00). Beat grid is a steady ~0.52-0.53s spacing (114.84 BPM) from 1.07s onward. Suggested targets: land the Scene 2→3 transition (terminal color-shift reveal, planned ~8s) near the 7.92s or 8.44s strong cue; land the Scene 3→4 transition (verify.sh starts, planned ~12s) near the 12.65s strong cue. No strong cue falls near the planned ~17s all-green payoff — either shift that moment a beat or two to land near a beat-grid point, or use natural timing there since it's the story's biggest beat and readability/pacing should win over cue-locking.
- Audio-reactive treatment: subtle — the terminal's green "OK" glow or cursor/prompt presence may breathe slightly with music RMS; no waveform/equalizer visuals
- Audio-coupled moments:
  - Scene 1 — the hook command typing out character by character with keyboard keypress sounds (randomize across `assets/sfx/keyboard/keypress-*.wav`)
  - Scene 2 — each `==>` log line landing with a soft print/tick sound, loosely following the beat grid but never rushing past the reading floor for each line
  - Scene 3 — the terminal background color wash paired with a soft whoosh/shimmer SFX
  - Scene 4 — each table row stamping "OK" with a light tick, resolving to a slightly bigger clean chime/bell on the final row (e.g. an `impact/impactBell_heavy_*` or `impact/impactSoft_medium_*` candidate)
  - Scene 5 — outro card holds in near-silence as music fades, no additional SFX
- SFX selection guidance: keep the sonic palette coherent — mechanical keyboard ticks for typing, soft interface/drop or card-place-style ticks for line-by-line log/table reveals, one clean bell/impact for the all-green payoff, one soft whoosh for the color-shift. Moderate density overall; never drown out terminal text legibility.
- SFX analysis guidance: use `<hyperframes-creative skill's sfx-analysis.md path>` if available; prefer low/medium high-frequency-risk files for the repeated per-line ticks, reserve any higher-risk file for the single final payoff accent only.
- Exact SFX choice: Hyperframes should choose exact filenames, timestamps, density, and volume based on the implemented animation.
- Audio files: music already copied to `brag-output/composition/assets/music/` (cue preset alongside it in `assets/music/cues/`). Hyperframes should copy any SFX it selects into `brag-output/composition/assets/sfx/...` following the same convention.

## Hyperframes Instructions
Load the composition-building Hyperframes domain skills — `hyperframes-core` (composition contract + `data-*` timing), `hyperframes-animation` (motion), `hyperframes-creative` (design spec, beats, audio-reactive), `hyperframes-keyframes` (seek-safe keyframes), and `hyperframes-cli` (lint/check/render). `/brag` is its own workflow: do not enter the `hyperframes` entry-point intent interview and do not route into its generic promo / launch-video workflow. Prefer native Hyperframes conventions over anything in `/brag`.

Requirements:
- Show at least one real UI, copy, or visual element from the source project (the real terminal commands, log lines, and verify table listed above).
- Keep all text readable in the final render — respect the reading-time floor from `step-2-plan.md` (short label ~0.8s settled; longer line ~0.3s/word, min ~1.2s).
- Keep the video within 15-25 seconds (target 20s).
- Include the planned music/SFX layer — audio was not disabled and silence is not the intended treatment here.
- Treat `/brag` audio notes as guidance, not a fixed cue sheet. Choose SFX after the visual animation exists.
- Treat music cue metadata as optional timing hints. Ignore cues that hurt readability, scene pacing, or the product story.
- Major reveals may move toward nearby strong cues within about 0.15s. Smaller entrances may align to nearby beat points within about 0.10s. Use only 1-3 strong cue locks in this 20s video.
- Use SFX to support motion and interaction: line/row-print ticks for sequential terminal output, a clean payoff chime for the all-green verify moment, keypress sounds for the typed hook command, restraint everywhere else.
- Honor the planned music treatment: fade-in under Scene 1, steady hold, swell near the Scene 4 payoff, fade-out under Scene 5.
- When wiring audio-reactive treatment, follow the `hyperframes-creative` skill's own extraction guidance (don't hardcode a path); apply it subtly to an existing element (terminal glow / cursor presence), not a new visualizer.
- Use local assets for audio (already copied into `composition/assets/music/`) and any required runtime/media dependencies.
- Run `hyperframes check` before render — it is brag's single gate.
