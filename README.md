# Jellybeans Tmux

A clean, minimal Tmux theme using the classic [Jellybeans](https://github.com/WTFox/jellybeans.nvim) color palette with [Flexoki's](https://github.com/kepano/flexoki) inky black background.

Fork of [tokyo-night-tmux](https://github.com/janoamaral/tokyo-night-tmux), simplified and recolored.

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

- **Powerline separators** - Pill-shaped status elements
- **Git status** - Branch name, sync status
- **OS icon** - Auto-detected Apple/Linux/Windows icon
- **Path widget** - Current directory with folder icon
- **Lualine-compatible colors** - Teal accent matches Neovim lualine

## Requirements

- Any patched [Nerd Font](https://www.nerdfonts.com/) (v3+)
- Bash 4.2 or newer

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

#### Path

```bash
set -g @jellybeans-tmux_show_path 1
set -g @jellybeans-tmux_path_format relative  # relative|full
```

#### Git Status

```bash
set -g @jellybeans-tmux_show_git 1
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
