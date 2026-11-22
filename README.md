# dotfiles

My personal configuration files for **Arch Linux** (and shared cross-platform configs with **macOS**), managed with **GNU Stow**.

Designed for keyboard-driven development, minimal dependencies, and high refresh-rate gaming on an AMD Zen 4 + NVIDIA RTX 50 series setup.

---

## System Specs & Stack

| Component           | Tool / Hardware                                                                                                                                                |
| :------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **OS**              | Arch Linux (Dual-boot with Windows)                                                                                                                            |
| **WM / Compositor** | [Hyprland](https://hyprland.org/) (configured in Lua)                                                                                                          |
| **Terminal**        | [Kitty](https://sw.kovidgoyal.net/kitty/)                                                                                                                      |
| **Shell**           | Bash + [Starship](https://starship.rs/) + [ble.sh](https://github.com/akinomyoga/ble.sh) _(Zsh on macOS)_                                                      |
| **File Manager**    | [Yazi](https://yazi-rs.github.io/) (terminal)                                                                                                                  |
| **PDF Viewer**      | [Zathura](https://pwmt.org/projects/zathura/) (`zathura-pdf-mupdf`, default via `xdg-open`)                                                                    |
| **System Monitor**  | [bottom](https://github.com/ClementTsang/bottom) (`btm`)                                                                                                       |
| **System Info**     | [Fastfetch](https://github.com/fastfetch-cli/fastfetch)                                                                                                        |
| **App Launcher**    | [Fuzzel](https://codeberg.org/dnkl/fuzzel) (Wayland native, icon-free)                                                                                         |
| **Screenshots**     | `grim` + `slurp` + [Satty](https://github.com/gabm/Satty)                                                                                                      |
| **Clipboard**       | [cliphist](https://github.com/sentriz/cliphist) + `wl-clipboard` (via Fuzzel dmenu)                                                                            |
| **Status Bar**      | [Waybar](https://github.com/Alexays/Waybar)                                                                                                                    |
| **Audio**           | PipeWire + WirePlumber + [wiremix](https://github.com/tsowell/wiremix) (TUI)                                                                                   |
| **Bluetooth**       | BlueZ + [bluetui](https://github.com/pythops/bluetui) (TUI)                                                                                                    |
| **Editor**          | [Zed](https://zed.dev/) (GPU-accelerated via Vulkan)                                                                                                           |
| **API & Load CLI**  | [Hurl](https://hurl.dev/), [websocat](https://github.com/vi/websocat), [grpcurl](https://github.com/fullstorydev/grpcurl), [oha](https://github.com/hatoo/oha) |
| **Package Maint.**  | `pacman` + `pacman-contrib` (`paccache`) + `reflector` + `yay-bin`                                                                                             |
| **Hardware**        | AMD Ryzen 5 7500F, NVIDIA GeForce RTX 5070, 32 GB RAM                                                                                                          |

---

## Visual Identity: Vice

| Role                       | Name             | Hex Code  |
| :------------------------- | :--------------- | :-------- |
| **Base / Surfaces**        | Vice Midnight    | `#130f1d` |
| **Primary Accent / Mode**  | Flamingo Neon    | `#ff2a85` |
| **Active Tech / Network**  | Ocean Drive Cyan | `#00f0ff` |
| **Success / Battery**      | Palm Mint        | `#00e676` |
| **Warning / Intermediate** | Sunset Amber     | `#ff9e00` |
| **Critical / Danger**      | Heatwave Crimson | `#ff1744` |
| **Borders / Separators**   | Dusk Violet      | `#3b2d54` |
| **Foreground Text**        | Vapor Mist       | `#e8e0f5` |

---

## Core Configurations

**Editor & API Testing Workflow (Zed + CLI Stack)**

- **Deployment:** `stow zed aliases`
- **Aesthetics:** Custom Vice theme (`themes/vice.json`) with blurred window transparency, custom keybindings (`keymap.json`), and task runner (`tasks.json`).
- **CLI API Stack:** Pure terminal testing via `hurl` (`ht`, `hv`), `websocat` (`ws`), `grpcurl` (`grpc`), and HTTP benchmarking via `oha` (`bench`), integrated directly into Zed tasks (`Ctrl+Alt+R` / `Ctrl+Alt+V`).

**Shell Aliases & System Maintenance**

- **Deployment:** `stow aliases`
- **Cross-Shell Helpers:** Unified `reload` (Bash & Zsh compatible) and interactive `fzf`-powered `ahelp()` command browser styled in Vice colors.
- **Arch Maintenance:** Fast mirror sorting (`mirrors` via `reflector`) and full system + AUR upgrade with automatic cache pruning (`archup` via `yay-bin` + `paccache`).

**App Launcher & dmenu (Fuzzel)**

- **Deployment:** `stow fuzzel`
- **Aesthetics:** Pure Wayland (`layer=overlay`), icon-free (`icons-enabled=no`) with dynamic height (`minimal-lines=yes`), Vice Midnight background, Flamingo Neon border, and Ocean Drive Cyan selection highlight.
- **Usage:** Mapped to `SUPER + SPACE` for apps (encapsulating TUI tools in `kitty -e`) and `dmenu` backend for `cliphist`.

**Screenshots & Clipboard Workflow**

- **Deployment:** `stow satty` + `hypr/config/keybinds.lua` & `rules.lua`
- **Capture Pipeline:** `grim` + `slurp` (styled with Flamingo Neon border & Ocean Drive Cyan selection) piped into **Satty** (`SUPER + C` for region, `SUPER + SHIFT + C` for fullscreen, `SUPER + CTRL + C` for direct RAM copy).
- **Window Rules:** Satty opens as a centered floating window (`75% 75%`) with a custom Vice annotation palette.
- **Clipboard History:** Persistent `cliphist` watchers for text and images, queried via `SUPER + SHIFT + V` and pruned via `SUPER + ALT + V` using `fuzzel --dmenu --with-nth=2`.

**Status Bar (Waybar)**

- **Deployment:** `stow waybar`
- **Aesthetics:** Floating Vice Midnight islands with Ocean Drive Cyan bottom borders and neon state glows.
- **Modules:** Workspaces, active window, clock, network, CPU, CPU temperature (`k10temp` Tctl), RAM, volume, Bluetooth, tray.

**File Manager (Yazi) & PDF Viewer (Zathura)**

- **Deployment:** `stow yazi zathura`
- **Aesthetics:** Native Vice `theme.toml` in Yazi and matching statusbar/highlights in `zathurarc`.
- **Integration:** Zathura is registered as default PDF handler (`xdg-mime`) and triggered via Yazi, `xdg-open`, or the cross-platform `o` shell alias, while hidden from Fuzzel (`NoDisplay=true`).

**System Monitor (bottom) & System Info (Fastfetch)**

- **Deployment:** `stow bottom fastfetch`
- **Aesthetics:** Pure declarative `bottom.toml` with a custom 3-row Vice layout (CPU, RAM/VRAM, Network, Temperatures, Disks, and Vim-navigable Processes) alongside a neon-accented `fastfetch` summary.

**Notification Daemon (Dunst)**

- **Deployment:** `stow dunst`
- **Aesthetics:** Vice palette with dynamic borders based on notification urgency.
- **System:** Minimalist D-Bus listener via `libnotify`.

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
│       ├── hyprland.lua             # Global WM configuration centralized
│       ├── hyprpaper.conf
│       ├── config/                  # Config split into sections
│       └── wallpapers/
├── kitty/
│   └── .config/kitty/
│       └── kitty.conf               # Terminal configuration
├── satty/
│   └── .config/satty/
│       └── config.toml              # Screenshot annotation tool & Vice palette
├── starship/
│   └── .config/
│       └── starship.toml            # Custom Vice prompt theme
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
