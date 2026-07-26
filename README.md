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
`~/.dotfiles-backup/<timestamp>/` rather than overwritten. It also creates
`~/Pictures/Screenshots`, since `grim` won't write into a directory that
doesn't exist.

If you **move the repo** after installing, the existing symlinks will dangle —
just re-run `./install.sh` from the new location and they get repointed (the
stale links are swept into the backup folder).

One thing worth editing straight away: `hypr/hyprconfig/monitors.lua` describes
this laptop's panel (`eDP-1`, 1920x1200, scale 1.25). Run `hyprctl monitors` for
your own output names. Anything not listed there falls back to a catch-all rule
at its preferred mode.

## Dependencies

```sh
pacman -S hyprland hyprlock hypridle hyprpolkitagent xdg-desktop-portal-hyprland \
          waybar swaync rofi kitty neovim starship fastfetch awww \
          zsh zsh-autosuggestions zsh-syntax-highlighting \
          pipewire wireplumber networkmanager nm-connection-editor \
          blueman nautilus qt6ct libnotify \
          grim slurp wl-clipboard brightnessctl playerctl clang
```

`wlogout` and `pwvucontrol` are only on the AUR, so they need a helper:

```sh
yay -S wlogout pwvucontrol
```

Two things no package manager can provide:

- **AdwaitaMono Nerd Font** — every config references it by name. Not in the
  repos; download it from [nerd-fonts](https://www.nerdfonts.com), unzip into
  `~/.local/share/fonts/`, then `fc-cache -f`. Without it every
  glyph in the bar, prompt and launcher renders as a box.
- **Wallpapers** — the desktop one is set by hand, see
  [Wallpaper](#wallpaper) below. The lockscreen one is a path in
  `hypr/hyprlock.conf`: `~/Pictures/Wallpapers/cyberpunk-city.jpeg`. Supply
  your own or edit the path.

## Layout

```
colors/          shared GTK colour palette (waybar, swaync, wlogout)
fastfetch/       fastfetch config + arch ascii
hypr/            hyprland.lua + hyprconfig/*.lua, hyprlock, hypridle
hyprpolkitagent/ polkit dialog sizing
kitty/           kitty.conf + colour scheme
nvim/            single-file init.lua, no plugins
rofi/            launcher script, theme, colour schemes, shared imports
swaync/          notification centre config, style, sound script
waybar/          config.jsonc + one file per module, style, launch script
wlogout/         layout, style, icons + the svgs they came from
starship.toml    prompt
.zshrc           shell
```

### Theming

`colors/palette.css` is the single source of truth for the GTK apps — waybar,
swaync and wlogout all `@import "../colors/palette.css"`. It is deployed to
`~/.config/colors`, which is why the relative paths resolve.

Non-GTK apps keep their own copy of the same palette in their own format:
`kitty/colors/colors.conf` and `rofi/colors/github-dark.rasi`.

### Wallpaper

No wallpaper is set anywhere in this repo. `autostart.lua` only starts
`awww-daemon`; you pick the image yourself:

```sh
awww img ~/Pictures/Wallpapers/whatever.jpeg
```

The daemon caches that choice per output in `~/.cache/awww/` and redisplays it
on the next login, so this survives reboots without anything being committed.
Until you run it the first time the desktop is black.

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
| `SUPER` + `M` | Exit Hyprland |
| `SUPER` + arrows | Move focus |
| `SUPER` + `1..0` | Switch workspace |
| `SUPER` + `SHIFT` + `1..0` | Move window to workspace |
| `SUPER` + `S` | Scratchpad |
| `SUPER` + `SHIFT` + `S` | Move window to scratchpad |
| `PRINT` | Region screenshot → clipboard |
| `SUPER` + `PRINT` | Fullscreen → clipboard |
| `SUPER` + `SHIFT` + `PRINT` | Fullscreen → `~/Pictures/Screenshots` |

## Editing the Hyprland config

The config is Lua, not hyprlang. `hypr/.vscode/settings.json` points at
`/usr/share/hypr/stubs` so editors get completion on the `hl.*` API.
`hyprctl configerrors` reports problems in the running compositor.

## License

MIT, except the wlogout icons in `wlogout/assets` and `wlogout/icons` — those
are third-party and Creative Commons 3.0, attributed in
`wlogout/assets/CREDIT.md`. See [LICENSE](LICENSE).
