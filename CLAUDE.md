# Dotfiles (chezmoi)

Personal dotfiles for an Arch Linux + Hyprland machine, managed with chezmoi.
This directory is the chezmoi **source**; run Claude from here.
Remote: git@github.com:rafael-takahashi/dotto-files.git (treat as possibly public: never commit secrets).

## Workflow
- Edit files here in the source dir, not in `~/.config`. Then `chezmoi diff` -> `chezmoi apply`.
- If a live file in `~` was changed directly, bring it back with `chezmoi add <live path>` (or `chezmoi re-add`).
- Always show `chezmoi diff` before `chezmoi apply`.
- Do not commit or push unless asked. Never `sudo`; tell the user to run privileged commands in a separate terminal.

## Naming (source -> target)
- `dot_config/x` -> `~/.config/x`
- `executable_foo.sh` -> `foo.sh` with the exec bit
- `private_`, `.tmpl` also apply; edit `.tmpl` files as templates (keep `{{ }}` intact).
- Repo-only files (README.md, CLAUDE.md) must be listed in `.chezmoiignore`.

## Layout
- `dot_config/hypr/`: Hyprland. **`hyprland.lua` is the active config** (Hyprland 0.57); `hyprland.conf` is legacy. Binds use `hl.bind(mainMod .. " + " .. "KEY", hl.dsp.exec_cmd("..."))`. Also hyprpaper, hyprsunset, `scripts/`.
- `dot_config/waybar/`, `ghostty/` (preferred terminal), `rofi/`: app configs.
- `run_onchange_symlink.sh`: symlinks selected scripts into `~/.local/bin` (e.g. `toggle-night-mode`). New scripts meant to be called by bare name must be added there; scripts called by full path (e.g. `record-toggle.sh`) need not.

## Machine facts
- AMD RX 6600 (VAAPI works, `/dev/dri/renderD128`), Wayland.
- Screen recording: `hypr/scripts/executable_record-toggle.sh` (wf-recorder + slurp), bound to SUPER+SHIFT+R.

## Verifying changes
- Hyprland: `hyprctl reload`, then `hyprctl binds` / check for errors.
- Waybar/ghostty/rofi: reload the app and confirm it starts without errors.
