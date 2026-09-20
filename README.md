# dotfiles

Personal configuration files, managed from `~/.config/dotfiles` and symlinked
into the locations each tool expects.

## Structure

- `config/<tool>/` — one directory per tool, holding its config files and a
  `setup.sh` that symlinks them into place (and does any tool-specific setup,
  like installing extensions).
- `Makefile` — a `make <tool>` target per tool, plus a `CONFIGS` list that
  controls which tools `make setup` installs.

Not every `config/<tool>/` directory has a `setup.sh` yet (e.g. `bash`,
`vim`, `claude`) — those aren't wired into the Makefile until one is added.

## Install everything

```sh
git clone <this-repo> ~/.config/dotfiles
cd ~/.config/dotfiles
make setup   # or: make install
```

This runs every tool's target listed in the `CONFIGS` variable at the top of
the `Makefile`. See what it will install without doing anything with:

```sh
make list        # prints the configs that will be installed
make -n setup     # prints the setup.sh commands that will run
```

## Install a single config

Run that tool's name as a target directly, e.g.:

```sh
make vscode
make zed
make ipython
```

or invoke that tool's `setup.sh` directly:

```sh
bash config/zed/setup.sh
```

## Windows

On Windows, use the PowerShell variant instead of `make`/`bash`. Symlinks
need either an elevated PowerShell or Developer Mode (Settings > System > For
developers).

```powershell
git clone <this-repo> $HOME\.config\dotfiles
cd $HOME\.config\dotfiles
.\install.ps1              # every config that has a setup.ps1
.\install.ps1 zed vscode   # only the named configs
.\install.ps1 -List        # show what would be installed
```

Each `config/<tool>/setup.ps1` mirrors that tool's `setup.sh` (using
`%APPDATA%` paths where the tool needs them) and shares the link helper in
`lib.ps1`. Unlike `make setup`, `install.ps1` has no `CONFIGS` list — it
installs every tool that has a `setup.ps1`. Existing files are never
overwritten: move or delete them first (a link that's already correct is
skipped).

## Adding/removing a config from `make setup`

Edit the `CONFIGS` list at the top of the `Makefile` — add or comment out a
tool name to include or skip it. Every name in `CONFIGS` needs a matching
`config/<tool>/setup.sh` script; once it's in the list, both `make <tool>`
and `make setup` pick it up automatically. Use the `add-tool-config` Claude
Code skill to scaffold a new one following this repo's conventions.
