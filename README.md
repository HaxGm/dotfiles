# dotfiles

Hyprland desktop on Arch, themed after **GitHub Dark**.

| | |
|---|---|
| Compositor | Hyprland (Lua config) |
| Bar | Waybar |
| Notifications | SwayNC |
| Launcher | Rofi |
| Terminal | kitty |
| Shell | zsh + starship |
| Editor | Neovim |
| Lock / idle | hyprlock, hypridle |
| Logout | wlogout |
| Wallpaper | awww |

## Install

Clone it wherever you like — the location is not baked in anywhere.

```sh
git clone <this repo> dotfiles
cd dotfiles
./install.sh --dry-run   # see what it would do
./install.sh
```

`install.sh` works out its own location at runtime, so `~/dotfiles`,
`~/.config/dotfiles`, `/srv/whatever` are all equally fine.

Everything is symlinked, so edits in the repo take effect immediately. The
script is re-runnable; anything already in the way is moved to
`~/.dotfiles-backup/<timestamp>/` rather than overwritten.

If you **move the repo** after installing, the existing symlinks will dangle —
just re-run `./install.sh` from the new location and they get repointed (the
stale links are swept into the backup folder).

## Dependencies

```sh
pacman -S hyprland hyprlock hypridle hyprpolkitagent xdg-desktop-portal-hyprland \
          waybar swaync rofi wlogout kitty neovim starship fastfetch awww \
          zsh zsh-autosuggestions zsh-syntax-highlighting \
          pipewire wireplumber pwvucontrol networkmanager nm-connection-editor \
          blueman nautilus qt6ct libnotify \
          grim slurp wl-clipboard brightnessctl playerctl clang
```

Two things `pacman` can't provide:

- **AdwaitaMono Nerd Font** — every config references it by name. Not in the
  repos; download `AdwaitaMono.zip` from the
  [nerd-fonts releases](https://github.com/ryanoasis/nerd-fonts/releases),
  unzip into `~/.local/share/fonts/`, then `fc-cache -f`. Without it every
  glyph in the bar, prompt and launcher renders as a box.
- **Lockscreen wallpaper** — `hypr/hyprlock.conf` points at
  `~/Pictures/Wallpapers/cyberpunk-city.jpeg`. Supply your own or edit the path.

## Layout

```
colors/          shared GTK colour palette (waybar, swaync, wlogout)
fastfetch/       fastfetch config + arch ascii
hypr/            hyprland.lua + hyprconfig/*.lua, hyprlock, hypridle
hyprpolkitagent/ polkit dialog sizing
kitty/           kitty.conf + colour scheme
nvim/            single-file init.lua, no plugins
rofi/            launcher script, theme, colour schemes
swaync/          notification centre config, style, sound script
waybar/          config.jsonc + one file per module, style, launch script
wlogout/         layout, style, icons
starship.toml    prompt
.zshrc           shell
```

### Theming

`colors/palette.css` is the single source of truth for the GTK apps — waybar,
swaync and wlogout all `@import "../colors/palette.css"`. It is deployed to
`~/.config/colors`, which is why the relative paths resolve.

Non-GTK apps keep their own copy of the same palette in their own format:
`kitty/colors/colors.conf` and `rofi/colors/github-dark.rasi`.

## Keybinds

`SUPER` is the modifier. Full list in `hypr/hyprconfig/binds.lua`.

| Bind | Action |
|---|---|
| `SUPER` + `RETURN` | Terminal |
| `SUPER` + `R` | Rofi |
| `SUPER` + `E` | Files |
| `SUPER` + `W` | Close window |
| `SUPER` + `V` | Toggle floating |
| `SUPER` + `Q` | Notification centre |
| `SUPER` + `T` | Restart bar + notifications |
| `SUPER` + `L` | Lock |
| `SUPER` + `N` | Logout menu |
| `SUPER` + `1..0` | Switch workspace |
| `SUPER` + `SHIFT` + `1..0` | Move window to workspace |
| `SUPER` + `S` | Scratchpad |
| `PRINT` | Region screenshot → clipboard |
| `SUPER` + `SHIFT` + `PRINT` | Fullscreen → `~/Pictures/Screenshots` |

## Editing the Hyprland config

The config is Lua, not hyprlang. `hypr/.vscode/settings.json` points at
`/usr/share/hypr/stubs` so editors get completion on the `hl.*` API.
`hyprctl configerrors` reports problems in the running compositor.
