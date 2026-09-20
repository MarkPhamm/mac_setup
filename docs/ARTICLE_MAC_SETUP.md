# I got a new Mac and refused to set it up by hand again

### One repo, four scripts, and about twenty minutes from a factory-fresh laptop to a working analytics engineering machine.

## Intro

Hi everyone, my name is Mark, an Analytics Engineer at Infinite Lambda, graduated from TCU in the summer of 2025, majoring in Computer System Analyst with minors in Math and Fintech.

I got a new M5 pro this month, and the moment I opened the lid I felt the specific dread of doing this again. Install the Command Line Tools. Wait. Install Homebrew. Wait. Try to remember whether I use eza or exa now. Find the Oh My Zsh install line. Google the zsh-autosuggestions clone URL for what must be the ninth time in my life. Open my old laptop, scroll through its `.zshrc`, and copy chunks across while hoping I do not also copy the three aliases that only worked because of a Docker container ID that no longer exists.

I have done that four times: personal laptop, school laptop, first work laptop, and now this one. Every time it takes the better part of a day, and every time the result is slightly different from the last one. That is the part that actually bothers me. Not the hours, the drift. I spend my working life telling people that if a transformation is not in version control it does not really exist, and then I configure the machine that runs those transformations by hand, from memory, with no record of what I did.

So this time I wrote it down as code. The repo is [mac_setup](https://github.com/MarkPhamm/mac_setup). It is not clever. There is no Ansible, no Nix, no 800-line install framework. It is a `Brewfile`, two zsh files, two JSON files for Cursor, and four bash scripts, and it takes a fresh Mac to a working machine in about twenty minutes, most of which is Homebrew downloading things while I make coffee.

## Takeaway

- Why "my dotfiles are in a gist" is not the same thing as a reproducible machine
- What actually belongs in a setup repo and what does not (spoiler: your employer's file paths do not)
- The four-script structure: bootstrap, link, configure, verify, and why verify matters more than it sounds
- How a `Brewfile` replaces the entire "install these 25 things" section of an onboarding doc
- The one trick I added this round: every git repo gets its own terminal background colour

## The problem with how I used to do it

My old approach was a Google Doc. It had a list of apps, a few terminal commands, and a copy of my `.zshrc` pasted in at the bottom. It was genuinely better than nothing.

It also rots. A doc cannot tell you that Terraform left Homebrew core after the license change and now lives in `hashicorp/tap`. It cannot tell you that the `docker_start_mwaa` alias you have been carrying since 2024 refers to a container that stopped existing when you changed jobs. It cannot tell you that you wrote down Powerlevel10k but have actually been running the Jonathan theme this whole time, which I only discovered when I diffed the doc against the real file. A doc records intentions. A repo records the machine.

The other problem is that a doc cannot be run. Every line in it is a thing you have to read, understand, and retype at the exact moment you are least patient, which is hour three of setting up a laptop you just want to start working on.

## What it installs

Everything lives in one `Brewfile`, which is Homebrew's manifest format. One file, one command, whole machine.

The core: Git, GitHub CLI, uv for Python, Node, AWS CLI, and Terraform from the HashiCorp tap.

The terminal layer, which is the part I would miss most if it disappeared: Warp as the terminal, Oh My Zsh on top of zsh, zoxide, eza, fzf, ripgrep, bat, jq, tree, and lazygit.

The apps: Cursor, OrbStack instead of Docker Desktop, Raycast instead of Alfred, Rectangle, 1Password, DBeaver instead of SQLWorkbench, and Obsidian.

And the Python and SQL tooling that I want available everywhere rather than per-project: Black and SQLFluff, installed with `uv tool install` so they live in their own environments and never fight with a project's dependencies.

A few of those are deliberate replacements for what my older setup notes recommended. DBeaver instead of SQLWorkbench, because SQLWorkbench wants you to manage a Java install and DBeaver ships its own runtime. OrbStack instead of Docker Desktop, because it starts in about two seconds and does not eat the battery. Raycast instead of Alfred. Cursor instead of whatever editor the doc said in 2023. I wrote those decisions down in `docs/MIGRATION_NOTES.md` rather than silently swapping them, because the next person to read the repo is me in two years, and I will want to know why.

## How it runs

Four scripts, in order. There is a `Makefile` too, so `make all` runs the whole chain, but I usually go one at a time on a new machine so I can watch what happens.

**Step 0** is the one thing that cannot be automated. Apple's Command Line Tools ship a GUI installer and there is no honest way around it:

```bash
xcode-select --install
```

Then clone the repo:

```bash
git clone https://github.com/MarkPhamm/mac_setup ~/mac_setup
cd ~/mac_setup
```

**Step 1: `./scripts/bootstrap.sh`.** This is the long one, and the only one that touches the network much. It checks that the Command Line Tools are actually there and stops with a useful message if they are not, installs Homebrew if it is missing, runs `brew bundle` against the `Brewfile`, installs Oh My Zsh, clones the two zsh plugins that are not Homebrew packages, installs Black and SQLFluff via `uv tool`, and installs the Codex CLI from npm. Every step is guarded by an existence check, so running it twice is safe and fast. That matters more than it sounds, because the first run of a setup script almost never is the only run.

**Step 2: `./scripts/link-dotfiles.sh`.** This symlinks `~/.zshrc` and `~/.zsh_aliases` to the copies in the repo. Symlinks, not copies, and that is the whole point: when I improve an alias six months from now, I edit it in the repo, and the change is version controlled by construction. There is nothing to remember to sync back. Anything already sitting at those paths gets moved to a timestamped `.backup` first rather than clobbered.

It also touches an empty `~/.zshrc.local`, which is where every secret, API key, employer-specific path, and machine-specific export goes. That file is never committed. The rule I follow is simple: if it would be wrong for a stranger to read it, or if it is only true on this one laptop, it goes in `.zshrc.local`. Everything else goes in the repo. My old `.zshrc` failed that test badly, which is exactly how a company file path ends up in a public gist.

**Step 3: `./scripts/configure-git.sh`.** Small script. Sets up `git lg`, the pretty graph log, and prints my current git identity so I remember to set it. Then `gh auth login` and GitHub is wired up.

**Step 4: `./scripts/verify.sh`.** This is the one I would tell you to steal if you steal nothing else. It loops through every command the setup is supposed to provide, prints OK or MISSING for each, checks whether `~/.zshrc` is actually a symlink and where it points, and checks that each GUI app exists in `/Applications`.

It sounds trivial, and it is trivial. It is also the difference between "I think the setup worked" and knowing. The failure mode of a setup script is not a loud crash, it is one package quietly not installing, which you discover three weeks later in the middle of something else. Twenty lines of bash turns that into a table you read once.

## The one new thing I added

Every repo now tints my terminal background its own colour.

I work across several repos in a normal day, usually with several Warp tabs open, and I have absolutely run a command in the wrong one. The fix is fifteen lines in `.zshrc`: hash the git repo root, turn the first three bytes of that hash into an RGB value clamped to a dark range so text stays readable, and set the background with an OSC 11 escape sequence. Outside a repo it resets.

```bash
_project_bg() {
  local git_root
  git_root=$(git rev-parse --show-toplevel 2>/dev/null) || {
    printf '\e]111\e\\'
    return
  }
  local hash=$(printf '%s' "$git_root" | md5 -q)
  local r=$(( 16#${hash:0:2} % 71 + 30 ))
  local g=$(( 16#${hash:2:2} % 71 + 30 ))
  local b=$(( 16#${hash:4:2} % 71 + 30 ))
  printf '\e]11;#%02x%02x%02x\e\\' $r $g $b
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd _project_bg
_project_bg
```

Because the colour comes from a hash of the path, it is deterministic. The dbt repo is the same slightly-green black on every machine I clone it to, forever, and I recognise a tab before I read the prompt. It hooks into `chpwd`, so it fires on every directory change. Two notes if you copy it: your terminal has to support OSC 11, which Warp, iTerm2, WezTerm, and Kitty do and Apple's Terminal does not, and `md5` is macOS, so on Linux you want `md5sum`.

This is the kind of thing I would never have bothered to set up when configuration was a manual chore, because it would have evaporated at the next laptop. When the config is a repo, a fifteen-line quality-of-life hack is permanent, and the calculation of what is worth doing changes completely.

## What I deliberately left out

The base setup is generic on purpose. No dbt adapters, no Airflow, no Spark, no Kubernetes CLI. Those are all things I use, and none of them are in the `Brewfile`.

The reason is that the warehouse adapter is a project decision, not a machine decision. The day I put `dbt-snowflake` in the base setup is the day the repo stops being about my Mac and starts being about one job. I keep a `docs/NEXT_LAYER.md` listing what the data-platform layer would contain when a project needs it. A list of candidates is cheap. An install you have to un-choose later is not.

Same logic for anything employer-shaped. The dbt aliases in the repo default to a state directory of `prod_dbt_artifacts` but read `$DBT_STATE_DIR`, so a project overrides it in `.zshrc.local`. The alias that downloads a production manifest reads `$DBT_MANIFEST_URL` instead of a hardcoded company link. The alias is portable; the URL is yours.

## Was it worth it

The repo took an evening to write with Claude. The setup it replaces took a day, and I did it four times.

But the hours are not really the argument, because I would have spent that evening fiddling with dotfiles regardless, and everyone who writes a setup repo knows it does not pay for itself as fast as they claim. The argument is that my machine is now a thing I can read, diff, and roll back. When I change a tool, there is a commit explaining it. When something breaks, `verify.sh` tells me what. When I get the next laptop, or a contractor asks how I have my environment set up, the answer is a URL instead of an afternoon.

Which is, word for word, the argument I make about data pipelines all day. It felt overdue to apply it to the laptop the pipelines are written on.

The repo is [here](https://github.com/MarkPhamm/mac_setup). Fork it, rip out my apps, put yours in. The `Brewfile` is the only file most people need to change.
