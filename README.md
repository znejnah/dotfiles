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
| **App Launcher**    | [Rofi (Wayland)](https://github.com/lbonn/rofi)                                          |
| **Status Bar**      | [Waybar](https://github.com/Alexays/Waybar)                                              |
| **Editor**          | [Zed](https://zed.dev/)                                                                  |
| **Hardware**        | AMD Ryzen 5 7500F, NVIDIA GeForce RTX 5070, 32 GB RAM                                    |

---

## Repository Layout

```text
~/dotfiles/
├── .stow-local-ignore      # Prevents non-config files from being symlinked
├── README.md
├── aliases/
│   └── .aliases            # Global shell aliases & custom commands
├── docs/
│   └── arch_installation_roadmap.md
├── bash/
│   └── .bashrc             # Shell options, tools init (fzf, zoxide, starship)
├── starship/
│   └── .config/
│       └── starship.toml   # Custom Catppuccin Mocha prompt theme
└── zed/
    └── .config/zed/
        └── settings.json   # Keymaps, LSP configurations, editor settings
        └── themes/
            └── themes/     # Custom UI theme

```
