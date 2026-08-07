> **Note**
>
> This is a work in progress. The purpose of this repository is to start as clean as possible and build slowly up to an automated deployment of the end configuration.

# Dotfiles

This is my `dotfiles` configuration.

## Quick start

```bash
git clone https://github.com/drbrcho/dotfiles.git
cd dotfiles
./setup.sh
```

The script symlinks the configs into your home directory. You do not need to touch the files inside the repo -- the script handles everything. Existing real files (not symlinks) are backed up to `~/.dotfiles-backup-<timestamp>` before being replaced.

## Requirements

These are **not** installed by `setup.sh` -- install them yourself before first use.

| Requirement | Needed for | Install (Arch) |
|---|---|---|
| `base-devel` | C compiler -- nvim-treesitter compiles parser C code | `sudo pacman -S base-devel` |
| `nodejs` + `npm` | mason LSP servers (jsonls, yamlls, dockerls, pyright are npm-based) | `sudo pacman -S nodejs npm` |
| Nerd Font | icons in nvim (web-devicons, telescope, which-key) | `sudo pacman -S ttf-jetbrains-mono-nerd` |

### Notes

- Install the toolchains **before** first `nvim` run -- mason fails silently on npm-based LSPs when node/npm is missing
- Other toolchains if you add more LSPs: `python python-pip` (pip-based servers), `go` (gopls)
- After installing a Nerd Font, set it as the terminal font ("JetBrainsMono Nerd Font") -- installing the font does nothing until the terminal actually uses it
- Test icons: `echo -e "\ue0b0"` should render an arrow, not a square

macOS equivalents: requires [Homebrew](https://brew.sh) installed first, then `brew install gcc node npm` and `brew install --cask font-jetbrains-mono-nerd`.

## Breakdown

### Aliases

Basic aliases for common `CLI` tools as well as, `podman`, `nvim`, `git` and `kubectl`.

### Other functions

The last `25000` commands will be save in a `.histfile` in the `~/` (home directory).

### Alacritty

`Alacritty` uses the `gruvbox dark` theme, and `UbuntuMono Nerd Font` (has to be installed separately). Feel free to change the theme and font up to your liking.

### OS Support

The configuration has been tested on both `Linux` and `macOS`.
