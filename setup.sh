#!/usr/bin/env bash
# Deploy dotfiles: symlink everything into $HOME.
# Idempotent -- safe to run repeatedly.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

# Files symlinked directly into $HOME
HOME_FILES=(
    .bashrc
    .bash_profile
    .tmux.conf
)

# Directories symlinked into $HOME/.config/
CONFIG_DIRS=(
    alacritty
    nvim
)

link() {
    local src="$1"
    local dst="$2"

    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        # Real file/dir exists -- back it up once, then replace
        mkdir -p "$BACKUP_DIR"
        mv "$dst" "$BACKUP_DIR/"
        echo "backed up existing: $dst -> $BACKUP_DIR/"
    fi

    ln -sfn "$src" "$dst"
    echo "linked: $dst -> $src"
}

echo "==> Linking home files"
for f in "${HOME_FILES[@]}"; do
    if [ -e "$DOTFILES_DIR/$f" ]; then
        link "$DOTFILES_DIR/$f" "$HOME/$f"
    fi
done

echo "==> Linking config dirs"
mkdir -p "$HOME/.config"
for d in "${CONFIG_DIRS[@]}"; do
    if [ -e "$DOTFILES_DIR/.config/$d" ]; then
        link "$DOTFILES_DIR/.config/$d" "$HOME/.config/$d"
    fi
done

echo "==> Done."
echo "    Backup of pre-existing files (if any): $BACKUP_DIR"
echo "    Note: nerd fonts must be installed separately (see README)."
