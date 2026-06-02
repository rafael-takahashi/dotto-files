### Personal Dotfiles Managed with Chezmoi

This repository contains my personal configuration files (dotfiles), scripts, and styles managed with [chezmoi](https://chezmoi.io/).

### Setup

1. **Install chezmoi**

```bash
# On Arch-based distros
sudo pacman -S chezmoi

# Or use the official install script
sh -c "$(curl -fsLS get.chezmoi.io)"
```

2. **Clone and apply the dotfiles**

```bash
chezmoi init --apply git@github.com:rafael-takahashi/hypr-dotfiles.git
```
This clones the repo, deploys the configs to your home directory, and runs any run_once scripts (e.g., symlinks your scripts to ~/.local/bin).
