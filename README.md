# dotfiles

My personal configuration files for **Arch Linux**, managed with **GNU Stow**.

Designed for keyboard-driven development, minimal dependencies, and high refresh-rate gaming on an AMD Zen 4 + NVIDIA RTX 50 series setup.

---

## System Specs & Stack

| Component           | Tool / Hardware                                                                          |
| :------------------ | :--------------------------------------------------------------------------------------- |
| **OS**              | Arch Linux (Dual-boot with Windows)                                                      |
| **WM / Compositor** | [Hyprland](https://hyprland.org/) (configured in Lua)                                    |
| **Terminal**        | [Kitty](https://sw.kovidgoyal.net/kitty/)                                                |
| **Shell**           | Bash + [Starship](https://starship.rs/) + [ble.sh](https://github.com/akinomyoga/ble.sh) |
| **File Manager**    | [Yazi](https://yazi-rs.github.io/) (terminal)                                            |
| **System Monitor**  | [btop](https://github.com/aristocratos/btop)                                             |
| **App Launcher**    | [Fuzzel](https://codeberg.org/dnkl/fuzzel) (Wayland native, icon-free)                   |
| **Screenshots**     | `grim` + `slurp` + [Satty](https://github.com/gabm/Satty)                                |
| **Clipboard**       | [cliphist](https://github.com/sentriz/cliphist) + `wl-clipboard` (via Fuzzel dmenu)      |
| **Status Bar**      | [Waybar](https://github.com/Alexays/Waybar)                                              |
| **Audio**           | PipeWire + WirePlumber + pavucontrol                                                     |
| **Bluetooth**       | BlueZ + [bluetui](https://github.com/pythops/bluetui) (TUI)                              |
| **Editor**          | [Zed](https://zed.dev/)                                                                  |
| **Hardware**        | AMD Ryzen 5 7500F, NVIDIA GeForce RTX 5070, 32 GB RAM                                    |

---

## Visual Identity: Royal Sheikah

| Role                       | Name          | Hex Code  |
| :------------------------- | :------------ | :-------- |
| **Base / Surfaces**        | Obsidian      | `#1c1c1e` |
| **Primary Accent / Mode**  | Royal Gold    | `#d4af37` |
| **Active Tech / Network**  | Sheikah Cyan  | `#00e5ff` |
| **Success / Battery**      | Ocarina Green | `#22c55e` |
| **Warning / Intermediate** | Stasis Orange | `#ff7a00` |
| **Critical / Danger**      | Gloom Red     | `#e11d48` |
| **Borders / Separators**   | Rock Gray     | `#4e544b` |
| **Foreground Text**        | Sheikah Sand  | `#c0c6ba` |

---

## Core Configurations

**App Launcher & dmenu (Fuzzel)**

- **Deployment:** `stow fuzzel`
- **Aesthetics:** Pure Wayland (`layer=overlay`), icon-free (`icons-enabled=no`) with dynamic height (`minimal-lines=yes`), Obsidian background, Royal Gold border, and Sheikah Cyan selection highlight.
- **Usage:** Mapped to `SUPER + SPACE` for apps (encapsulating TUI tools in `kitty -e`) and `dmenu` backend for `cliphist`.

**Screenshots & Clipboard Workflow**

- **Deployment:** `stow satty` + `hypr/config/keybinds.lua` & `rules.lua`
- **Capture Pipeline:** `grim` + `slurp` (styled with Royal Gold border & Sheikah Cyan selection) piped into **Satty** (`SUPER + C` for region, `SUPER + SHIFT + C` for fullscreen, `SUPER + CTRL + C` for direct RAM copy).
- **Window Rules:** Satty opens as a centered floating window (`75% 75%`) with a custom Royal Sheikah annotation palette.
- **Clipboard History:** Persistent `cliphist` watchers for text and images, queried via `SUPER + SHIFT + V` and pruned via `SUPER + ALT + V` using `fuzzel --dmenu --with-nth=2`.

**Status Bar (Waybar)**

- **Deployment:** `stow waybar`
- **Aesthetics:** Floating obsidian islands with Sheikah Cyan bottom borders and state glows.
- **Modules:** Workspaces, active window, clock, network, CPU, CPU temperature (`k10temp` Tctl), RAM, volume, Bluetooth, tray.

**File Manager (Yazi)**

- **Deployment:** `stow yazi`
- **Aesthetics:** Native Royal Sheikah `theme.toml` matching manager states, badges, and mime types.
- **Philosophy:** Vanilla configuration with zero external plugins.

**System Monitor (btop)**

- **Deployment:** `stow btop`
- **Aesthetics:** Custom `royal_sheikah.theme` with multi-tier gradients for CPU/RAM load and temperature metrics (`save_config_on_exit = false` to keep Git state clean).

**Notification Daemon (Dunst)**

- **Deployment:** `stow dunst`
- **Aesthetics:** Royal Sheikah palette with dynamic borders based on notification urgency.
- **System:** Minimalist D-Bus listener via `libnotify`.

**Audio Server (PipeWire)**

- **Dependencies:** `pipewire`, `wireplumber`, `pipewire-pulse`, `pavucontrol`.
- **Mixing:** Graphical routing via pavucontrol, clickable from the Waybar volume module.

**Bluetooth Connectivity (bluetui)**

- **Dependencies:** `bluez`, `bluez-utils`, `upower`, `bluetui`.
- **System:** `Experimental = true` mode in `/etc/bluetooth/main.conf` for battery polling. `uhid` kernel module for BLE mice.
- **Interface:** Keyboard-driven `bluetui` TUI launched in a centered floating Kitty window (`bluetooth-tui` class) via `SUPER + B`.

---

## Repository Layout

```text
~/dotfiles/
├── .stow-local-ignore               # Prevents non-config files from being symlinked
├── README.md
├── aliases/
│   └── .aliases                     # Global shell aliases & custom commands
├── bash/
│   └── .bashrc                      # Shell options, tools init (fzf, zoxide, starship)
├── btop/
│   └── .config/btop/
│       ├── btop.conf
│       └── themes/
├── docs/
│   ├── arch_installation_roadmap.md
│   └── hyprland_cheat_sheet.md
├── dunst/
│   └── .config/dunst/
│       └── dunstrc                  # Notification alerts configuration
├── fuzzel/
│   └── .config/fuzzel/
│       └── fuzzel.ini               # Minimalist Royal Sheikah launcher & dmenu config
├── hypr/
│   └── .config/hypr/
│       ├── hyprland.lua             # Global WM configuration centralized
│       ├── hyprpaper.conf
│       ├── config/                  # Config split into sections
│       └── wallpapers/
├── kitty/
│   └── .config/kitty/
│       └── kitty.conf               # Terminal configuration
├── satty/
│   └── .config/satty/
│       └── config.toml              # Screenshot annotation tool & Royal Sheikah palette
├── starship/
│   └── .config/
│       └── starship.toml            # Custom prompt theme
├── waybar/
│   └── .config/waybar/
│       ├── config.jsonc             # Wayland status bar
│       └── style.css
├── yazi/
│   └── .config/yazi/
│       ├── init.lua
│       ├── keymap.toml
│       ├── theme.toml
│       └── yazi.toml
└── zed/
    └── .config/zed/
        ├── settings.json            # Keymaps, LSP configurations, editor settings
        └── themes/
```
