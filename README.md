# Jellybeans Tmux

A clean, dark Tmux theme using the classic [Jellybeans](https://github.com/WTFox/jellybeans.nvim) color palette with [Flexoki's](https://github.com/kepano/flexoki) inky black background.

Fork of [tokyo-night-tmux](https://github.com/janoamaral/tokyo-night-tmux) with recolored palette.

## Color Palette

| Color    | Hex       | Usage                    |
|----------|-----------|--------------------------|
| Background | `#100f0f` | Flexoki black          |
| Foreground | `#e8e8d3` | Jellybeans fg          |
| Teal     | `#2DA099` | Session pill, text     |
| Blue     | `#8197bf` | Accents, borders       |
| Green    | `#99ad6a` | Success, git icons     |
| Yellow   | `#dad085` | Warnings, changes      |
| Red      | `#B05050` | Errors, deletions      |
| Orange   | `#cf6a4c` | Highlights             |
| Magenta  | `#c6b6ee` | Special                |
| Cyan     | `#2B5B77` | Info                   |

## Features

- **Powerline separators** - Pill-shaped status elements with smooth transitions
- **Git status** - Branch name, sync status, insertions/deletions
- **OS icon** - Auto-detected Apple/Linux/Windows icon
- **Path widget** - Current directory with folder icon
- **Lualine-compatible colors** - Teal accent matches Neovim lualine

## Requirements

- Any patched [Nerd Font](https://www.nerdfonts.com/) (v3+)
- Bash 4.2 or newer

Optional for widgets:
- `bc` (netspeed widget)
- `gh` or `glab` (git widgets)
- `playerctl` (Linux) or `nowplaying-cli` (macOS) for music

### macOS

```bash
brew install bash bc coreutils gawk gh gsed jq nowplaying-cli
```

## Installation

### Using TPM

```bash
set -g @plugin "imrellx/jellybeans-tmux"
```

### Manual

```bash
git clone https://github.com/imrellx/jellybeans-tmux ~/.config/tmux/plugins/jellybeans-tmux
```

Then add to `tmux.conf`:
```bash
run-shell ~/.config/tmux/plugins/jellybeans-tmux/jellybeans.tmux
```

## Configuration

### Transparency

```bash
set -g @jellybeans-tmux_transparent 1  # Use terminal background
```

### Number Styles

```bash
set -g @jellybeans-tmux_window_id_style digital  # digital|roman|fsquare|hsquare|dsquare|super|sub|hide|none
set -g @jellybeans-tmux_pane_id_style hsquare
set -g @jellybeans-tmux_zoom_id_style dsquare
```

### Widgets

#### Date/Time (enabled by default)

```bash
set -g @jellybeans-tmux_show_datetime 0    # Disable
set -g @jellybeans-tmux_date_format YMD    # YMD|MDY|DMY
set -g @jellybeans-tmux_time_format 24H    # 24H|12H
```

#### Path

```bash
set -g @jellybeans-tmux_show_path 1
set -g @jellybeans-tmux_path_format relative  # relative|full
```

#### Git Status

```bash
set -g @jellybeans-tmux_show_git 1
```

#### Web Git (GitHub/GitLab)

```bash
set -g @jellybeans-tmux_show_wbg 1
```

#### Battery

```bash
set -g @jellybeans-tmux_show_battery_widget 1
set -g @jellybeans-tmux_battery_name "BAT1"
set -g @jellybeans-tmux_battery_low_threshold 21
```

#### Network Speed

```bash
set -g @jellybeans-tmux_show_netspeed 1
set -g @jellybeans-tmux_netspeed_iface "en0"
set -g @jellybeans-tmux_netspeed_showip 1
```

#### Music

```bash
set -g @jellybeans-tmux_show_music 1
```

#### Hostname

```bash
set -g @jellybeans-tmux_show_hostname 1
```

### Window Icons

```bash
set -g @jellybeans-tmux_terminal_icon
set -g @jellybeans-tmux_active_terminal_icon
set -g @jellybeans-tmux_window_tidy_icons 0
```

## Example Configuration

```bash
set -g @plugin 'imrellx/jellybeans-tmux'

set -g @jellybeans-tmux_show_datetime 0
set -g @jellybeans-tmux_show_path 1
set -g @jellybeans-tmux_path_format relative
set -g @jellybeans-tmux_window_id_style dsquare
set -g @jellybeans-tmux_show_git 1
```

This gives you a minimal status bar with path and git info, matching Neovim's lualine aesthetic.

## Credits

- Original [tokyo-night-tmux](https://github.com/janoamaral/tokyo-night-tmux) by [Lógico](https://github.com/janoamaral)
- [Jellybeans](https://github.com/WTFox/jellybeans.nvim) color scheme
- [Flexoki](https://github.com/kepano/flexoki) background colors

## License

MIT
