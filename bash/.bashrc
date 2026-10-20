# ~/.bashrc

# ==============================================================================
# BASH LINE EDITOR (ble.sh) - EARLY INITIALIZATION
# ==============================================================================
# Must intercept the interactive shell session before any terminal output or rendering
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach


# ==============================================================================
# SYSTEM GLOBALS & DEFAULTS (Arch Linux)
# ==============================================================================
# Source global definitions from the Arch base system
if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi


# ==============================================================================
# ENVIRONMENT VARIABLES & CLI THEMES
# ==============================================================================
# Safely prepend local bin directories to PATH without duplication
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Theme configuration for bat (syntax highlighter replacing cat)
export BAT_THEME="Catppuccin Mocha"

# Catppuccin Mocha color palette & reverse UI layout for fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--prompt='  ' --pointer=' ' --layout=reverse --border"


# ==============================================================================
# BASH BEHAVIOR & SHELL OPTIONS (shopt)
# ==============================================================================
shopt -s autocd
shopt -s cdspell
shopt -s globstar
shopt -s checkwinsize
set -o ignoreeof

# Append to history and synchronize across all open terminals in real time
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


# ==============================================================================
# CUSTOM DOTFILES & ALIASES
# ==============================================================================
[ -f ~/.aliases ] && source ~/.aliases


# ==============================================================================
# TOOL INTEGRATIONS (Strict Order Required)
# ==============================================================================
eval "$(fzf --bash)"
eval "$(zoxide init bash --cmd cd)"
eval "$(starship init bash)"


# ==============================================================================
# AUTOSTART HYPRLAND (TTY1)
# ==============================================================================
# Start GUI on first screen only
if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec start-hyprland
fi


# ==============================================================================
# BASH LINE EDITOR (ble.sh) - FINAL ATTACH
# ==============================================================================
# Must ALWAYS remain the very last line
[[ ${BLE_VERSION-} ]] && ble-attach
