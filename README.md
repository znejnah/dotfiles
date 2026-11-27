# dotfiles

My personal configuration files for **Arch Linux** (and shared cross-platform configs with **macOS**), managed with **GNU Stow**.

Designed for keyboard-driven development, minimal dependencies, and high refresh-rate gaming on an AMD Zen 4 + NVIDIA RTX 50 series setup.

---

## System Specs & Stack

| Component              | Tool / Hardware                                                                                                                                                |
| :--------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **OS**                 | Arch Linux (Dual-boot with Windows)                                                                                                                            |
| **WM / Compositor**    | [Hyprland](https://hyprland.org/) (configured in Lua)                                                                                                          |
| **Terminal**           | [Kitty](https://sw.kovidgoyal.net/kitty/)                                                                                                                      |
| **Shell**              | Bash + [Starship](https://starship.rs/) + [ble.sh](https://github.com/akinomyoga/ble.sh) _(Zsh on macOS)_                                                      |
| **File Manager**       | [Yazi](https://yazi-rs.github.io/) (terminal)                                                                                                                  |
| **PDF Viewer**         | [Zathura](https://pwmt.org/projects/zathura/) (`zathura-pdf-mupdf`, default via `xdg-open`)                                                                    |
| **System Monitor**     | [bottom](https://github.com/ClementTsang/bottom) (`btm`)                                                                                                       |
| **System Info**        | [Fastfetch](https://github.com/fastfetch-cli/fastfetch)                                                                                                        |
| **App Launcher**       | [Fuzzel](https://codeberg.org/dnkl/fuzzel) (Wayland native, icon-free)                                                                                         |
| **Screenshots**        | `grim` + `slurp` + [Satty](https://github.com/gabm/Satty)                                                                                                      |
| **Clipboard**          | [cliphist](https://github.com/sentriz/cliphist) + `wl-clipboard` (via Fuzzel dmenu)                                                                            |
| **Status Bar**         | [Waybar](https://github.com/Alexays/Waybar) (with dynamic solar-cycle clock)                                                                                   |
| **Screen Lock / Idle** | [hyprlock](https://wiki.hypr.land/Hypr-Ecosystem/hyprlock/) + [hypridle](https://wiki.hypr.land/Hypr-Ecosystem/hypridle/)                                      |
| **Notifications**      | [Dunst](https://dunst-project.org/) + `libnotify`                                                                                                              |
| **Audio**              | PipeWire + WirePlumber + [wiremix](https://github.com/tsowell/wiremix) (TUI)                                                                                   |
| **Bluetooth**          | BlueZ + [bluetui](https://github.com/pythops/bluetui) (TUI)                                                                                                    |
| **Editor**             | [Zed](https://zed.dev/) (GPU-accelerated via Vulkan)                                                                                                           |
| **API & Load CLI**     | [Hurl](https://hurl.dev/), [websocat](https://github.com/vi/websocat), [grpcurl](https://github.com/fullstorydev/grpcurl), [oha](https://github.com/hatoo/oha) |
| **Package Maint.**     | `pacman` + `pacman-contrib` (`paccache`) + `reflector` + `yay-bin`                                                                                             |
| **Hardware**           | AMD Ryzen 5 7500F, NVIDIA GeForce RTX 5070, 32 GB RAM                                                                                                          |

---

## Visual Identity: Vice City / Leonida

| Role                        | Name          | Hex Code  |
| :-------------------------- | :------------ | :-------- |
| **Abyssal Backdrop**        | Abyssal Night | `#07091b` |
| **Elevated Surfaces**       | Deep Bay      | `#0f1436` |
| **Primary Focus / Active**  | Sunset Pink   | `#ff5ca8` |
| **Navigation / Telemetry**  | Vice Cyan     | `#00f0ff` |
| **Structure / Night Cycle** | Neon Purple   | `#8c6cff` |
| **Warmth / Noon Cycle**     | Miami Peach   | `#ffb86b` |
| **Success / Battery**       | Palm Mint     | `#00e68a` |
| **Critical / Wanted Alert** | Coral Heat    | `#ff3b6b` |
| **Borders / Dividers**      | Muted Indigo  | `#2d2861` |
| **Foreground Text**         | Soft Vapor    | `#d5ddf7` |

---

## Core Configurations

**Editor & API Testing Workflow (Zed + CLI Stack)**

- **Deployment:** `stow zed aliases`
- **Aesthetics:** Custom Vice theme (`themes/vice.json`) built on Abyssal Night (`#07091b`) with blurred window transparency, custom keybindings (`keymap.json`), and task runner (`tasks.json`).
- **CLI API Stack:** Pure terminal testing via `hurl` (`ht`, `hv`), `websocat` (`ws`), `grpcurl` (`grpc`), and HTTP benchmarking via `oha` (`bench`), integrated directly into Zed tasks (`Ctrl+Alt+R` / `Ctrl+Alt+V`).

**Shell Prompt & Aliases (Starship + Bash/Zsh)**

- **Deployment:** `stow starship bash aliases`
- **Prompt:** Resize-safe two-line Vice City prompt (`starship.toml`) using native `right_format` for command duration and clock (compatible across Arch Linux and macOS).
- **Cross-Shell Helpers:** Unified `reload` (Bash & Zsh compatible) and interactive `fzf`-powered `ahelp()` command browser styled in Vice City colors.
- **Arch Maintenance:** Fast mirror sorting (`mirrors` via `reflector`) and full system + AUR upgrade with automatic cache pruning (`archup` via `yay-bin` + `paccache`).

**App Launcher & dmenu (Fuzzel)**

- **Deployment:** `stow fuzzel`
- **Aesthetics:** Pure Wayland (`layer=overlay`), icon-free (`icons-enabled=no`) with dynamic height (`minimal-lines=yes`), Abyssal Night background, Sunset Pink border, and Vice Cyan selection highlight.
- **Usage:** Mapped to `SUPER + SPACE` for apps (encapsulating TUI tools in `kitty -e`) and `dmenu` backend for `cliphist`.

**Screenshots & Clipboard Workflow**

- **Deployment:** `stow satty` + `hypr/config/keybinds.lua` & `rules.lua`
- **Capture Pipeline:** `grim` + `slurp` (styled with Sunset Pink border & Vice Cyan selection) piped into **Satty** (`SUPER + C` for region, `SUPER + SHIFT + C` for fullscreen, `SUPER + CTRL + C` for direct RAM copy).
- **Window Rules:** Satty opens as a centered floating window (`75% 75%`) with a custom Vice City neon annotation palette.
- **Clipboard History:** Persistent `cliphist` watchers for text and images, queried via `SUPER + SHIFT + V` and pruned via `SUPER + ALT + V` using `fuzzel --dmenu --with-nth=2`.

**Status Bar (Waybar)**

- **Deployment:** `stow waybar`
- **Aesthetics:** Minimalist floating Abyssal Night islands (`rgba(7, 9, 27, 0.92)`) with subtle Neon Purple glass borders.
- **Dynamic Modules:**
  - **Workspaces:** 4 persistent GTA-style wanted stars (`󰓎` active in Sunset Pink, `` occupied in Neon Purple, dimmed when empty).
  - **Solar Clock (`custom/clock`):** Automatically shifts accent colors throughout the day (`06:00` Vice Cyan dawn → `11:00` Miami Peach day → `17:00` Sunset Pink evening → `21:00` Neon Purple night), with a monthly calendar tooltip on hover and instant time/date toggle on left-click.
  - **Telemetry & Sensors:** Network bandwidth, CPU usage, CPU temperature (`k10temp` Tctl), RAM, PipeWire volume, Bluetooth, and system tray.

**File Manager (Yazi) & PDF Viewer (Zathura)**

- **Deployment:** `stow yazi zathura`
- **Aesthetics:** Native Vice `theme.toml` with pill separators in Yazi and matching dark recolor mode/highlights in `zathurarc`.
- **Integration:** Zathura is registered as default PDF handler (`xdg-mime`) and triggered via Yazi, `xdg-open`, or the cross-platform `o` shell alias, while hidden from Fuzzel (`NoDisplay=true`).

**System Monitor (bottom) & System Info (Fastfetch)**

- **Deployment:** `stow bottom fastfetch`
- **Aesthetics:** Pure declarative `bottom.toml` with a custom 3-row Vice layout (CPU, RAM/VRAM, Network, Temperatures, Disks, and Vim-navigable Processes) alongside a bicolore Sunset Pink / Vice Cyan `fastfetch` summary.

**Notification Daemon (Dunst)**

- **Deployment:** `stow dunst`
- **Aesthetics:** Abyssal Night surface with urgency-coded frames (Neon Purple for low, Sunset Pink for normal, Coral Heat for critical).
- **System:** Minimalist D-Bus listener via `libnotify`.

**Screen Lock & Idle Management (hyprlock + hypridle)**

- **Deployment:** `stow hypr`
- **Lock Screen (`hyprlock.conf`):** Blurred fixed Vice City wallpaper over Abyssal Night (`#07091b`), Vice Cyan clock, reactive Sunset Pink / Vice Cyan / Coral Heat password ring, and a live Miami Peach Caps Lock indicator (`SUPER + ESCAPE`).
- **Idle Daemon (`hypridle.conf`):** Automatically locks the session via `loginctl lock-session` after 10 minutes of inactivity and powers down displays (`dpms off`) after 15 minutes without deep-sleep conflicts on NVIDIA RTX 50 hardware.

**Audio Server (PipeWire & wiremix)**

- **Dependencies:** `pipewire`, `wireplumber`, `pipewire-pulse`, `wiremix`.
- **Mixing:** Keyboard-driven `wiremix` TUI launched in a centered floating Kitty window (`audio-tui` class), also clickable from the Waybar volume module.

**Bluetooth Connectivity (bluetui)**

- **Dependencies:** `bluez`, `bluez-utils`, `upower`, `bluetui`.
- **System:** `Experimental = true` mode in `/etc/bluetooth/main.conf` for battery polling. `uhid` kernel module for BLE mice.
- **Interface:** Keyboard-driven `bluetui` TUI launched in a centered floating Kitty window (`bluetooth-tui` class) via `SUPER + B`.

---

## Repository Layout

```text
~/dotfiles/
├── .gitignore                       # Ignores OS-specific/auto-generated files (e.g. zed/prompts)
├── .stow-local-ignore               # Prevents non-config files from being symlinked
├── README.md
├── aliases/
│   └── .aliases                     # Cross-platform shell aliases & custom commands (Arch/macOS)
├── bash/
│   └── .bashrc                      # Bash options, tools init (fzf, zoxide, starship, ble.sh)
├── bottom/
│   └── .config/bottom/
│       └── bottom.toml              # Declarative Vice system monitor
├── docs/
│   ├── arch_installation_roadmap.md
│   └── hyprland_cheat_sheet.md
├── dunst/
│   └── .config/dunst/
│       └── dunstrc                  # Notification alerts configuration
├── fastfetch/
│   └── .config/fastfetch/
│       └── config.jsonc             # Minimalist Vice system fetch configuration
├── fuzzel/
│   └── .config/fuzzel/
│       └── fuzzel.ini               # Minimalist Vice launcher & dmenu config
├── hypr/
│   └── .config/hypr/
│       ├── hypridle.conf            # Idle timeouts & DPMS screen power management
│       ├── hyprland.lua             # Global WM configuration centralized
│       ├── hyprlock.conf            # GPU-accelerated Vice lock screen
│       ├── hyprpaper.conf
│       ├── config/                  # Config split into sections (theme.lua, keybinds, rules...)
│       └── wallpapers/
├── kitty/
│   └── .config/kitty/
│       ├── kitty.conf               # Terminal configuration
│       └── vice.conf                # Vice City / Leonida color theme
├── satty/
│   └── .config/satty/
│       └── config.toml              # Screenshot annotation tool & Vice palette
├── starship/
│   └── .config/
│       └── starship.toml            # Resize-safe Vice prompt theme
├── waybar/
│   └── .config/waybar/
│       ├── config.jsonc             # Wayland status bar
│       ├── style.css                # Minimalist dynamic HUD stylesheet
│       └── scripts/
│           └── clock-cycle.sh       # Solar-cycle clock & calendar tooltip script
├── yazi/
│   └── .config/yazi/
│       ├── init.lua
│       ├── keymap.toml
│       ├── theme.toml
│       └── yazi.toml
├── zathura/
│   └── .config/zathura/
│       └── zathurarc                # Minimalist Vice PDF viewer configuration
└── zed/
    └── .config/zed/
        ├── keymap.json              # Custom editor & task runner keybindings
        ├── settings.json            # LSP configurations, UI, and editor settings
        ├── tasks.json               # CLI task definitions (Hurl, etc.)
        └── themes/
            └── vice.json            # Vice Zed theme
```
