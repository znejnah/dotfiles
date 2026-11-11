# dotfiles

My personal configuration files for **Arch Linux**, managed with **GNU Stow**.

Designed for development and high refresh-rate gaming on an AMD Zen 4 + NVIDIA RTX 50 series setup.

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
| **App Launcher**    | [Rofi (Wayland)](https://github.com/lbonn/rofi) + Candy Icons theme                      |
| **Status Bar**      | [Waybar](https://github.com/Alexays/Waybar)                                              |
| **Audio**           | PipeWire + WirePlumber + pavucontrol                                                     |
| **Bluetooth**       | BlueZ + rofi-bluetooth-git                                                               |
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
- **Aesthetics:** Custom `royal_sheikah.theme` with multi-tier gradients for CPU/RAM load and temperature metrics.

**Notification Daemon (Dunst)**

- **Deployment:** `stow dunst`
- **Aesthetics:** Royal Sheikah palette with dynamic borders based on notification urgency.
- **System:** Minimalist D-Bus listener via `libnotify`.

**Audio Server (PipeWire)**

- **Dependencies:** `pipewire`, `wireplumber`, `pipewire-pulse`, `pavucontrol`.
- **Mixing:** Graphical routing via pavucontrol, clickable from the Waybar volume module.

**Bluetooth Connectivity**

- **Dependencies:** `bluez`, `bluez-utils`, `upower`, `rofi-bluetooth-git` (AUR).
- **System:** `Experimental = true` mode in `/etc/bluetooth/main.conf` for battery polling. `uhid` kernel module for BLE mice.
- **Interface:** Rofi-bluetooth mapped to `SUPER + B` via the Lua programs table.

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
│   └── arch_installation_roadmap.md
│   └── hyprland_cheat_sheet.md
├── dunst/
│   └── .config/dunst/
│       └── dunstrc                  # Notification alerts configuration
├── hypr/
│   └── .config/hypr/
│       └── hyprland.lua              # Global WM configuration centralized
│       └── hyprpaper.conf
│       └── config/                   # Config split into sections
│       └── wallpapers/
├── kitty/
│   └── .config/kitty/
│       └── kitty.conf                # Terminal configuration
├── rofi/
│   └── .config/rofi/
│       └── config.rasi               # App Launcher configuration (Candy Icons)
├── starship/
│   └── .config/
│       └── starship.toml             # Custom prompt theme
├── waybar/
│   └── .config/waybar/
│       ├── config.jsonc              # Wayland status bar
│       └── style.css
 configuration
│       └── style.css                 # ElectroVoid styling
├── yazi/
│   └── .config/yazi/
│       ├── init.lua
│       ├── keymap.toml
│       ├── theme.toml
│       └── yazi.toml
└── zed/
    └── .config/zed/
        └── settings.json             # Keymaps, LSP configurations, editor settings
        └── themes/
```
