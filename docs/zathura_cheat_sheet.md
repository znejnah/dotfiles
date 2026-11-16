# Zathura Cheat Sheet (Keyboard-Driven PDF Viewer)

Quick reference for **Zathura** (`zathura-pdf-mupdf`) integrated into the **Royal Sheikah** Arch Linux environment.

---

## 1. Launching & Opening Files

| Command / Context | Action |
| :--- | :--- |
| `o file.pdf` | Open via cross-platform alias (`xdg-open` on Arch, `open` on macOS) |
| `zathura file.pdf` | Launch Zathura directly from terminal |
| `Enter` in **Yazi** | Open selected PDF via `xdg-mime` default association |
| `:open <path>` | Open another PDF inside an active Zathura window |
| `:info` | Display document metadata (title, author, page count, format) |
| `:close` | Close the current document |
| `q` | Quit Zathura |

---

## 2. Navigation & Scrolling (Vim-Style)

| Keybind | Action |
| :--- | :--- |
| `j` / `k` | Scroll down / up smoothly |
| `h` / `l` | Scroll left / right |
| `J` / `K` | Jump to next / previous page |
| `Space` / `Shift + Space` | Scroll down / up one full screen |
| `Ctrl + d` / `Ctrl + u` | Scroll down / up half a screen |
| `gg` / `G` | Jump to first / last page |
| `<number>G` or `<number>gg` | Jump directly to page `<number>` (e.g., `42G`) |
| `Ctrl + o` / `Ctrl + i` | Jump backward / forward in position history |

---

## 3. Zoom, Layout & Display Modes

| Keybind | Action |
| :--- | :--- |
| `s` | Fit document to window **width** (default in `zathurarc`) |
| `a` | Fit entire page inside window (**best-fit**) |
| `+` / `-` | Zoom in / out |
| `=` | Reset zoom to 100% |
| `d` | Toggle dual-page view (side-by-side) |
| `r` | Rotate page 90° clockwise |
| `Ctrl + r` | Toggle color inversion (dark / original page colors) |
| `F5` | Toggle presentation mode (fullscreen single-page) |
| `F11` | Toggle standard fullscreen |
| `Ctrl + m` | Toggle bottom statusbar visibility |
| `Ctrl + n` | Toggle inputbar visibility |

---

## 4. Search, Links & Table of Contents

| Keybind | Action |
| :--- | :--- |
| `/<pattern>` | Search forward for `<pattern>` |
| `?<pattern>` | Search backward for `<pattern>` |
| `n` / `N` | Jump to next / previous search match |
| `f` | Display link hints on page (type hint letters/numbers to follow) |
| `F` | Display link hints and copy target URL to clipboard |
| `Tab` | Toggle Table of Contents (Index) sidebar |
| `j` / `k` *(in Index)* | Navigate sections in Table of Contents |
| `l` / `h` *(in Index)* | Expand / collapse subsections |
| `Enter` *(in Index)* | Jump to selected section |

---

## 5. Bookmarks & Quick Marks

| Keybind | Action |
| :--- | :--- |
| `m<letter>` | Save current position to quick mark `<letter>` (e.g., `ma`) |
| `'<letter>` | Jump back to quick mark `<letter>` (e.g., `'a`) |
| `:bmark <name>` | Save a named persistent bookmark |
| `:blist <name>` | Jump to a saved persistent bookmark (`Tab` for autocomplete) |
| `:bdelete <name>` | Delete a persistent bookmark |

---

## 6. Selection & Clipboard

*Configured with `set selection-clipboard clipboard` in `zathurarc` (direct sync with Wayland clipboard).*

| Action | Behavior |
| :--- | :--- |
| **Left-click + Drag** | Select text block and copy automatically to clipboard |
| **Shift + Left-click + Drag** | Select rectangular region |
| `y` *(after selection)* | Explicitly yank selection to clipboard |

---

## 7. Printing & Reloading

| Keybind / Command | Action |
| :--- | :--- |
| `R` | Reload current document (useful when compiling LaTeX/Typst/Markdown PDFs) |
| `Ctrl + p` | Open system print dialog |
| `:export attachments` | Extract embedded files from the PDF |