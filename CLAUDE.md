# Dotfiles (chezmoi)

Arch Linux + Hyprland (Wayland, AMD RX 6600) dotfiles. This dir is the chezmoi **source**.
Remote: git@github.com:rafael-takahashi/dotto-files.git (possibly public: never commit secrets).

## Workflow
- Edit here, not in `~/.config`. Then show `chezmoi diff` -> `chezmoi apply`.
- If a live file in `~` was changed directly, sync it back with `chezmoi re-add` / `chezmoi add <path>`.
- Never `sudo`; tell the user to run privileged commands themselves.

## Commits
- Only commit/push when asked. Use Conventional Commits: `type(scope): summary` (feat, fix, chore, docs, refactor), lowercase, imperative.

## Naming (source -> target)
- `dot_config/x` -> `~/.config/x`; `executable_foo.sh` -> `foo.sh` (exec bit); `private_` and `.tmpl` also apply (keep `{{ }}` intact).
- Repo-only files (README.md, CLAUDE.md) must be listed in `.chezmoiignore`.

## Layout
- `dot_config/hypr/`: **`hyprland.lua` is the active config** (Hyprland 0.57); `hyprland.conf` is legacy. Binds: `hl.bind(mainMod .. " + " .. "KEY", hl.dsp.exec_cmd("..."))`.
- Terminal: ghostty. Other apps: waybar, rofi.
- `run_onchange_symlink.sh` links scripts into `~/.local/bin`. Scripts called by bare name must be added there; ones called by full path need not.

## Verifying
- Hyprland: `hyprctl reload`, then `hyprctl binds` and check for errors.
- Other apps: reload and confirm they start cleanly.
