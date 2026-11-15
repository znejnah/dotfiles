# Cheatsheet: Zed Editor (100% Keyboard Workflow — Linux)

This reference summarizes the verified native keybindings for **Zed** on Linux (`base_keymap: "Zed"`), tailored for a button-free, **Royal Sheikah** minimalist UI.

> **Platform Note:** Shortcuts below reflect the exact Linux default keymap. On macOS, replace `Ctrl` with `Cmd` (`⌘`) for workspace, file, and tab actions.

## 1. Core Command & File Navigation

| Shortcut                            | Action                                 | Context / Notes                                                        |
| ----------------------------------- | -------------------------------------- | ---------------------------------------------------------------------- |
| `Ctrl + Shift + P` (or `F1`)        | **Command Palette**                    | Master entry point for every Zed action                                |
| `Ctrl + P` (or `Ctrl + E`)          | **Fuzzy File Finder**                  | Open any file in the project by partial name                           |
| `Ctrl + R` (or `Alt + Ctrl + O`)    | **Open Recent Project**                | Switch or open recent workspaces                                       |
| `Ctrl + O` / `Ctrl + K Ctrl + O`    | **Open Files / Open Folder**           | Open standalone files or a directory                                   |
| `Ctrl + Tab` / `Ctrl + Shift + Tab` | **Tab Switcher**                       | Cycle between recent open buffers (`Ctrl + Backspace` closes selected) |
| `Ctrl + PageUp` / `PageDown`        | **Previous / Next Tab**                | Linear tab switching inside current pane                               |
| `Alt + 1` .. `Alt + 9` (`Alt + 0`)  | **Activate Tab N (Last)**              | Jump directly to tab index inside active pane (`Pane` context)         |
| `Ctrl + W` (or `Ctrl + F4`)         | **Close Active Tab**                   | Replaces hidden close (`×`) tab buttons                                |
| `Ctrl + K W` / `Ctrl + K Ctrl + W`  | **Close All Tabs / All & Panes**       | Clear current pane or entire workspace                                 |
| `Ctrl + Shift + T`                  | **Reopen Closed Item**                 | Restore the last closed file                                           |
| `Ctrl + ,` / `Ctrl + Alt + ,`       | **Open Settings UI / `settings.json`** | Edit settings via UI or raw JSON file                                  |
| `Ctrl + K Ctrl + S`                 | **Open Keymap Editor**                 | Inspect or override keybindings (`Ctrl + E` opens `keymap.json`)       |

## 2. Panels, Docks & Region Focus (Button-Free UI)

Since dock buttons are hidden in `settings.json`, use these verified Linux bindings to summon, resize, or dismiss docks:

| Shortcut                     | Action                         | Notes                                                       |
| ---------------------------- | ------------------------------ | ----------------------------------------------------------- |
| `Ctrl + Shift + E`           | **Project Panel (File Tree)**  | Toggle focus (also reveals active file from `Editor`)       |
| `Ctrl + Shift + G`           | **Git Panel**                  | Toggle focus on Git changes & commit panel                  |
| `Ctrl + Shift + B`           | **Outline Panel**              | Toggle focus on structural symbol outline                   |
| `Ctrl + Shift + M`           | **Diagnostics Panel**          | Deploy project-wide LSP errors and warnings                 |
| `Ctrl + Shift + D`           | **Debug Panel**                | Toggle focus on debugger panel                              |
| `` Ctrl + ` ``               | **Toggle Integrated Terminal** | Show/hide terminal panel (`Ctrl + ~` spawns a new terminal) |
| `Ctrl + B`                   | **Toggle Left Dock**           | Show/hide left dock                                         |
| `Ctrl + Alt + B`             | **Toggle Right Dock**          | Show/hide right dock (where `project_panel` is docked)      |
| `Ctrl + J`                   | **Toggle Bottom Dock**         | Show/hide bottom dock                                       |
| `Ctrl + Alt + Y`             | **Toggle All Docks**           | Hide or restore all open docks at once                      |
| `Ctrl + Alt + W`             | **Close Active Dock**          | Dismiss whichever dock currently has focus                  |
| `Ctrl + Alt + -` / `=` (`0`) | **Resize / Reset Active Dock** | Decrease, increase, or reset active dock size               |
| `F6` / `Shift + F6`          | **Focus Next / Previous Part** | Cycle focus between editor, open docks, and status bar      |
| `Shift + Escape`             | **Toggle Zoom**                | Maximize/restore active pane or dock                        |
| `Escape`                     | **Cancel / Return to Editor**  | Dismiss search bars or menus and return focus               |

## 3. Search & Replace

| Shortcut                          | Action                        | Notes                                                          |
| --------------------------------- | ----------------------------- | -------------------------------------------------------------- |
| `Ctrl + F`                        | **Buffer Search**             | Find in current file (`Alt + Enter` selects all matches)       |
| `Ctrl + H`                        | **Buffer Replace**            | Find and replace in current file (`Ctrl + Enter` replaces all) |
| `Ctrl + Shift + F`                | **Project Search**            | Search across all files in workspace                           |
| `Ctrl + Shift + H`                | **Project Replace**           | Search and replace across entire project                       |
| `F3` / `Shift + F3`               | **Next / Previous Match**     | Cycle through search results (`Ctrl + Alt + G` also works)     |
| `Alt + C` / `Alt + W` / `Alt + R` | **Case / Whole Word / Regex** | Toggle search filters inside search bar                        |

## 4. Code Navigation & LSP Intelligence

| Shortcut                    | Action                         | Notes                                                           |
| --------------------------- | ------------------------------ | --------------------------------------------------------------- |
| `Ctrl + Shift + O`          | **Symbol Outline Picker**      | Fuzzy-jump to any symbol in the current file                    |
| `Ctrl + T`                  | **Workspace Symbol Search**    | Search functions/types across the entire repository             |
| `Ctrl + G`                  | **Go to Line**                 | Jump directly to `line:column`                                  |
| `Ctrl + M` (or `Ctrl + \|`) | **Move to Enclosing Bracket**  | Jump between matching `{ }`, `[ ]`, `( )`                       |
| `F12`                       | **Go to Definition**           | Jump to symbol declaration (`Alt + F12` opens in split)         |
| `Ctrl + F12`                | **Go to Type Definition**      | Jump to type declaration (`Alt + Ctrl + F12` in split)          |
| `Shift + F12`               | **Go to Implementation**       | Jump to concrete implementation                                 |
| `Alt + Shift + F12`         | **Find All References**        | List every usage of a symbol across the project                 |
| `F2`                        | **Rename Symbol**              | Safe project-wide LSP refactoring (`Enter` confirms)            |
| `Ctrl + .`                  | **Code Actions / Quick Fix**   | Trigger auto-imports, ESLint fixes, or Rust/Lua actions         |
| `Alt + Shift + O`           | **Organize Imports**           | Clean and sort imports manually                                 |
| `Ctrl + K Ctrl + I`         | **Hover Documentation**        | Display type signature and docs under cursor                    |
| `Ctrl + I`                  | **Show Signature Help**        | Display function parameter hints (`Up`/`Down` cycles overloads) |
| `Ctrl + :`                  | **Toggle Inlay Hints**         | Show/hide inline type and parameter annotations                 |
| `F8` / `Shift + F8`         | **Next / Previous Diagnostic** | Jump between errors and warnings in the file                    |

## 5. Multi-Cursor, Folding & Surgical Editing

| Shortcut                            | Action                          | Notes                                                             |
| ----------------------------------- | ------------------------------- | ----------------------------------------------------------------- |
| `Ctrl + D`                          | **Select Next Occurrence**      | Add cursor to next matching word (`Ctrl + K Ctrl + D` skips)      |
| `Ctrl + Shift + L` (or `Ctrl + F2`) | **Select All Occurrences**      | Place cursors on every match in the file                          |
| `Shift + Alt + Up` / `Down`         | **Add Cursor Above / Below**    | Vertical column editing                                           |
| `Ctrl + U` / `Ctrl + Shift + U`     | **Undo / Redo Selection**       | Step backward/forward through cursor selection history            |
| `Alt + Shift + Right` / `Left`      | **Expand / Shrink Syntax Node** | AST-aware structural selection                                    |
| `Ctrl + L`                          | **Select Current Line**         | Repeat to extend selection downward line by line                  |
| `Alt + Up` / `Down`                 | **Move Line(s) Up / Down**      | Reorder lines or blocks cleanly                                   |
| `Ctrl + Alt + Shift + Up` / `Down`  | **Duplicate Line(s) Up / Down** | Clone current line or selection                                   |
| `Ctrl + Shift + K`                  | **Delete Line**                 | Remove entire line without touching clipboard                     |
| `Ctrl + Shift + J`                  | **Join Lines**                  | Merge current line with the next line                             |
| `Ctrl + /`                          | **Toggle Line Comment**         | Comment/uncomment line or selection (`Shift + Alt + A` for block) |
| `Ctrl + Shift + I`                  | **Format Buffer**               | Manual format trigger (also runs on save, except `.jsonc`)        |
| `Ctrl + K S`                        | **Save Without Format**         | Save buffer bypassing formatters (`Ctrl + Alt + S` saves all)     |
| `Ctrl + {` / `Ctrl + }`             | **Fold / Unfold Lines**         | Fold/unfold current block (`Ctrl + K Ctrl + 0` / `J` for all)     |

## 6. Split Panes & Layout

| Shortcut                              | Action                  | Notes                                                               |
| ------------------------------------- | ----------------------- | ------------------------------------------------------------------- |
| `Ctrl + \` (or `Ctrl + K Right`)      | **Split Pane Right**    | Side-by-side editing (`Ctrl + K Left/Up/Down` for other directions) |
| `Ctrl + K Ctrl + Left/Right/Up/Down`  | **Focus Adjacent Pane** | Move keyboard focus between open splits                             |
| `Ctrl + K Shift + Left/Right/Up/Down` | **Swap Panes**          | Reorder split panes in workspace                                    |

## 7. Built-in Git Workflow

| Shortcut                  | Action                         | Notes                                                           |
| ------------------------- | ------------------------------ | --------------------------------------------------------------- |
| `Alt + .` / `Alt + ,`     | **Next / Previous Git Hunk**   | Jump between modified blocks in current file                    |
| `Ctrl + '` / `Ctrl + "`   | **Toggle / Expand Diff Hunks** | Preview inline git diff directly in editor                      |
| `Ctrl + Alt + Y`          | **Toggle Staged (Hunk/File)**  | Stage/unstage current hunk in editor or file in Git panel       |
| `Ctrl + K Ctrl + R`       | **Restore Hunk**               | Revert changes under cursor (`Ctrl + G Backspace` restores all) |
| `Alt + G B` / `Alt + G R` | **Git Blame / Review Diff**    | Toggle file blame or open full repository diff review           |
| `Ctrl + G Ctrl + G`       | **Git Fetch**                  | Inside `GitPanel` (`Ctrl + G Up/Down` for Push/Pull)            |

## 8. Essential Terminal CLI Entrypoints

```bash
# Open current directory in a new Zed window
zed .

# Open specific config file directly
zed ~/dotfiles/zed/.config/zed/settings.json

# Diff two files side-by-side from Kitty
zed --diff file_a.lua file_b.lua
```
