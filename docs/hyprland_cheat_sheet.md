# Hyprland Cheat Sheet

Essential keyboard-driven shortcuts for navigating and managing the **Royal Sheikah** environment in Hyprland.  
The **Super** key (`mainMod`) corresponds to the Windows/Cmd key on your keyboard.

---

## Launch & System

| Action                               | Shortcut         |
| :----------------------------------- | :--------------- |
| **Open App Launcher (Fuzzel)**       | `Super + Space`  |
| **Open Terminal (Kitty)**            | `Super + Return` |
| **Open File Manager (Yazi)**         | `Super + E`      |
| **Open Bluetooth Manager (bluetui)** | `Super + B`      |
| **Close active window**              | `Super + Q`      |
| **Exit Hyprland (Logout)**           | `Super + M`      |

---

## Navigation, Focus & Layout

| Action                     | Shortcut             |
| :------------------------- | :------------------- |
| **Change window focus**    | `Super + Arrow keys` |
| **Toggle Floating mode**   | `Super + V`          |
| **Toggle Pseudo-tiling**   | `Super + P`          |
| **Toggle Split direction** | `Super + J`          |

---

## Window Manipulation

| Action                                 | Shortcut                                       |
| :------------------------------------- | :--------------------------------------------- |
| **Swap window in grid (Keyboard)**     | `Super + Shift + Arrow keys`                   |
| **Resize active window (Keyboard)**    | `Super + Ctrl + Arrow keys` _(hold to repeat)_ |
| **Move floating/tiled window (Mouse)** | Hold `Super` + **Left Click** & drag           |
| **Resize window (Mouse)**              | Hold `Super` + **Right Click** & drag          |

---

## Workspaces & Scratchpad

| Action                                | Shortcut                   |
| :------------------------------------ | :------------------------- |
| **Go to workspace 1 to 10**           | `Super + 1` to `0`         |
| **Move active window to workspace X** | `Super + Shift + 1` to `0` |
| **Scroll through active workspaces**  | `Super + Mouse wheel`      |
| **Toggle Scratchpad (`magic`)**       | `Super + S`                |
| **Send active window to Scratchpad**  | `Super + Shift + S`        |

---

## Screenshots & Clipboard (Satty & cliphist)

| Action                                   | Shortcut            |
| :--------------------------------------- | :------------------ |
| **Region screenshot → Satty editor**     | `Super + C`         |
| **Fullscreen screenshot → Satty editor** | `Super + Shift + C` |
| **Region screenshot → Direct RAM copy**  | `Super + Ctrl + C`  |
| **Open Clipboard History (Fuzzel)**      | `Super + Shift + V` |
| **Delete entry from Clipboard History**  | `Super + Alt + V`   |

### Satty & Fuzzel Internal Shortcuts

- **Inside Satty:** `Ctrl + C` (copy to RAM & exit), `Ctrl + S` or `Enter` (save to `~/Pictures/Screenshots/`), `T` (toggle toolbars), `Esc` (discard).
- **Inside Fuzzel:** `Alt + 1` to `Alt + 9` (instant select by index), `Ctrl + J / K` (navigate list), `Ctrl + U` (clear input).

---

## Hardware & Media Keys

| Action                             | Key                                             |
| :--------------------------------- | :---------------------------------------------- |
| **Volume Up / Down / Mute**        | `XF86AudioRaiseVolume` / `LowerVolume` / `Mute` |
| **Microphone Mute**                | `XF86AudioMicMute`                              |
| **Screen Brightness Up / Down**    | `XF86MonBrightnessUp` / `Down`                  |
| **Media Play-Pause / Next / Prev** | `XF86AudioPlay` / `Next` / `Prev`               |
