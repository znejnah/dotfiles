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
| **App Launcher**    | [Rofi (Wayland)](https://github.com/lbonn/rofi) + Candy Icons theme                      |
| **Status Bar**      | [Waybar](https://github.com/Alexays/Waybar)                                              |
| **Audio**           | PipeWire + WirePlumber + pavucontrol                                                     |
| **Bluetooth**       | BlueZ + rofi-bluetooth-git                                                               |
| **Editor**          | [Zed](https://zed.dev/)                                                                  |
| **Hardware**        | AMD Ryzen 5 7500F, NVIDIA GeForce RTX 5070, 32 GB RAM                                    |

---

## Core Configurations

**Status Bar (Waybar)**

- **Deployment:** `stow waybar`
- **Aesthetics:** ElectroVoid theme, 85% opacity with Hyprland blur, JetBrainsMono font.
- **Modules:** Workspaces, active window, clock, network, CPU, RAM, volume, Bluetooth, tray.

**Audio Server (PipeWire)**

- **Dependencies:** `pipewire`, `wireplumber`, `pipewire-pulse`, `pavucontrol`.
- **Mixing:** Graphical routing via pavucontrol, clickable from the Waybar volume module.

**Bluetooth Connectivity**

- **Dependencies:** `bluez`, `bluez-utils`, `upower`, `rofi-bluetooth-git` (AUR).
- **System:** `Experimental = true` mode in `/etc/bluetooth/main.conf` for battery polling. `uhid` kernel module for BLE mice.
- **Interface:** Rofi-bluetooth mapped to `SUPER + B` via the Lua programs table.

**Notification Daemon (Dunst)**

- **Deployment:** `stow dunst`
- **Aesthetics:** ElectroVoid theme with custom neon borders based on urgency (Cyan for low, Purple for normal, Red for critical).
- **System:** Minimalist D-Bus listener via `libnotify`.

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
│           └── themes/               # Custom UI theme
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
│       └── config.jsonc              # Wayland status bar configuration
│       └── style.css                 # ElectroVoid styling
└── zed/
    └── .config/zed/
        └── settings.json             # Keymaps, LSP configurations, editor settings
        └── themes/
            └── electrovoid.json      # Custom UI theme
```
