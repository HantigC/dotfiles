---
name: add-tool-config
description: Scaffold a new tool's config into this dotfiles repo — a new config/<tool>/ directory, a setup.sh that symlinks its files into place, and a wired-up Makefile target. Use this whenever the user wants to start managing a new tool's config here (e.g. "add a config for X", "manage <tool>'s settings in dotfiles", "wire up a new dotfiles setup script"), or wants an existing config/<tool>/ directory that's missing a setup.sh/Makefile target brought up to the repo's convention. Always use this instead of improvising the directory layout from scratch.
---

# Add a tool config to this dotfiles repo

This repo manages per-tool configs under `config/<tool>/`, each with its own
`setup.sh` that symlinks files into the tool's real config location, plus a
matching target in the root `Makefile`. This skill is the scaffolding recipe
— follow it instead of inventing a new layout, so every tool's config looks
and behaves the same way.

Study `config/vscode/` and `config/zed/` before writing anything new — they're
the two fullest examples of this pattern (multi-file, platform-dependent
target path). `config/ipython/setup.sh` is a good minimal example of the
same pattern for a single, non-platform-dependent target path.

## Steps

### 1. Pick the directory name

Use the tool's own lowercase name, matching how it's already referred to
elsewhere (`vscode`, `zed`, `ipython`, `bash`, `vim`). Ask the user if it's
ambiguous. Create it:

```bash
mkdir -p config/<tool>
```

### 2. Add the tool's actual config files

This is the part that varies per tool and isn't scripted — it's the content
a user would normally edit by hand (settings, keybindings, an init file...).
Two ways this typically goes:

- **The user already has a real, in-use config for this tool somewhere on
  disk.** Read it from its real location first and use that as the base,
  the same way the current Zed setup was built from `~/.config/zed/settings.json`
  rather than invented from scratch. A live, already-tuned config always
  beats a guessed one — don't overwrite real preferences with placeholders.
- **Starting fresh.** Before inventing setting keys, keybinding action names,
  or a plugin-list format, verify them against the tool's real docs/source
  (as was done for Zed's `settings.json`/`keymap.json` schema and action
  names via its own GitHub repo) rather than guessing. Wrong keys silently
  no-op in most editors, which is worse than an obvious error.

### 3. Write `config/<tool>/setup.sh`

Follow the existing scripts' shape exactly:

- No shebang line — every existing `setup.sh` starts straight with `set -x`
  and is invoked as `bash config/<tool>/setup.sh`, not executed directly.
- Resolve the local source dir the same way every other script does:
  `local_dir="$(pwd)/$(dirname "$0")"`.
- Figure out the tool's real target config directory. If it's the same path
  on every OS (like ipython's `~/.ipython/profile_default`), just set it
  directly. If it differs by platform (like VS Code's or Zed's), use the
  same `case "$platform" in Darwin) ... ;; Linux) ... ;; MINGW*|MSYS*|CYGWIN*|Windows_NT) ... ;; *) echo "Unknown platform: $platform"; exit 1 ;; esac`
  structure, with `platform=$(uname -s 2>/dev/null || echo "$OS")` above it.
  Don't assume the path is the same on macOS and Linux — check; Zed, for
  example, deliberately breaks from VS Code's per-OS convention and uses
  `~/.config/zed` on both.
- `mkdir -p` the target directory before symlinking into it, in case the
  tool has never been run there before.
- Symlink each config file individually with `ln -s "${local_dir}/<file>" "${target_dir}/<file>"`
  (one line per file — don't try to symlink the whole directory). Existing
  scripts don't use `-f`, so re-running errors loudly on "File exists"
  rather than silently clobbering something — preserve that unless the user
  explicitly wants idempotent re-runs, in which case use `ln -sf` and say
  you're deviating from the existing pattern and why.
- If the tool has an extension/plugin list (like VS Code's
  `extensions.txt` + install loop) or an equivalent auto-install setting
  baked into its own config (like Zed's `auto_install_extensions`), handle
  it the way that tool actually supports — don't assume every tool has a
  CLI flag for scripted installs; some (Zed) don't, and the config file
  handles it on next launch instead. Say which one applies, and why, in a
  comment.
- `chmod +x config/<tool>/setup.sh` to match the other scripts' permissions.

### 4. Wire it into the `Makefile`

Add a target following the exact existing pattern — a tab-indented recipe
line, and the target name added to the `.PHONY` list at the top:

```makefile
.PHONY: setup_bash setup_vscode setup_ipython setup_zed setup_<tool>

setup_<tool>:
	bash config/<tool>/setup.sh
```

Don't reformat or reorder the existing targets — just append.

### 5. Document it in `CLAUDE.md`

Add matching bullets to the `## Structure` section, one per file, in the
same terse `` `cofing\<tool>` - description `` style already used there for
`vscode` and `zed` (yes, `cofing` is a typo and the separator is a
backslash even though these are POSIX paths — that's the established
convention in this file already; match it rather than fixing it, so the
new entries don't stand out from the old ones).

### 6. Verify, but don't auto-run the symlink step

```bash
bash -n config/<tool>/setup.sh   # syntax check
```

Validate any JSON/config files you wrote with an appropriate parser for
that format. Do **not** run `make setup_<tool>` (or the script directly)
without asking first — it symlinks into the user's real, live config
location and can collide with a file that's already there (exactly what
happened with Zed's `settings.json`, which existed as a real file, not yet
a symlink). Flag that risk to the user instead of resolving it silently.
