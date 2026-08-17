# dotfiles

Personal configuration files, managed from `~/.config/dotfiles` and symlinked
into the locations each tool expects.

## Structure

- `config/<tool>/` — one directory per tool, holding its config files and a
  `setup.sh` that symlinks them into place (and does any tool-specific setup,
  like installing extensions).
- `Makefile` — a `setup_<tool>` target per tool, plus a `CONFIGS` list that
  controls which tools `make setup` installs.

Not every `config/<tool>/` directory has a `setup.sh` yet (e.g. `bash`,
`vim`, `claude`) — those aren't wired into the Makefile until one is added.

## Install everything

```sh
git clone <this-repo> ~/.config/dotfiles
cd ~/.config/dotfiles
make setup   # or: make install
```

This runs every `setup_<tool>` target listed in the `CONFIGS` variable at the
top of the `Makefile`. See what it will install without doing anything with:

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

## Adding/removing a config from `make setup`

Edit the `CONFIGS` list at the top of the `Makefile` — add or comment out a
tool name to include or skip it. Every name in `CONFIGS` needs a matching
`config/<tool>/setup.sh` script; once it's in the list, both `make <tool>`
and `make setup` pick it up automatically. Use the `add-tool-config` Claude
Code skill to scaffold a new one following this repo's conventions.
