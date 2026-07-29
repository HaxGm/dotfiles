#!/usr/bin/env bash
#
# Symlink this repo into place. Safe to re-run — already-correct links are left
# alone, and anything else in the way is moved to ~/.dotfiles-backup/<timestamp>.
#
# Usage:  ./install.sh [--dry-run]

set -euo pipefail

repo="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
config="${XDG_CONFIG_HOME:-$HOME/.config}"
backup="$HOME/.dotfiles-backup/$(date +%Y%m%d_%H%M%S)"

dry_run=false
[[ "${1:-}" == "--dry-run" ]] && dry_run=true

# Directories linked into ~/.config
config_dirs=(
    colors
    fastfetch
    hypr
    hyprpolkitagent
    kitty
    networkmanager-dmenu
    rofi
    swaync
    waybar
    wlogout
)

# Individual files, as "<path in repo>:<target>"
files=(
    "starship.toml:$config/starship.toml"
    ".zshrc:$HOME/.zshrc"
)

link() {
    local src="$1" dst="$2"

    if [[ -L "$dst" && "$(readlink -f "$dst")" == "$(readlink -f "$src")" ]]; then
        printf '  ok       %s\n' "$dst"
        return
    fi

    if [[ -e "$dst" || -L "$dst" ]]; then
        printf '  backup   %s\n' "$dst"
        if ! $dry_run; then
            mkdir -p "$backup"
            mv "$dst" "$backup/"
        fi
    fi

    printf '  link     %s -> %s\n' "$dst" "$src"
    if ! $dry_run; then
        mkdir -p "$(dirname "$dst")"
        ln -s "$src" "$dst"
    fi
}

$dry_run && echo "DRY RUN — nothing will be changed"
echo "repo: $repo"
echo

for d in "${config_dirs[@]}"; do
    link "$repo/$d" "$config/$d"
done

for entry in "${files[@]}"; do
    link "$repo/${entry%%:*}" "${entry#*:}"
done

# SUPER+SHIFT+PRINT writes here; grim fails if it doesn't exist
if [[ ! -d "$HOME/Pictures/Screenshots" ]]; then
    printf '  mkdir    %s\n' "$HOME/Pictures/Screenshots"
    $dry_run || mkdir -p "$HOME/Pictures/Screenshots"
fi

echo
echo "Done. Two things this script cannot install for you:"
echo "  - AdwaitaMono Nerd Font  (see README, not in the repos)"
echo "  - the lockscreen wallpaper referenced by hypr/hyprlock.conf:"
echo "      ~/Pictures/Wallpapers/cyberpunk-city.jpeg"
