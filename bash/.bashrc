# ~/.bashrc

# ==============================================================================
# BASH LINE EDITOR (ble.sh) - EARLY INITIALIZATION
# ==============================================================================
# Must intercept the interactive shell session before any terminal output or rendering
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach


# ==============================================================================
# SYSTEM GLOBALS & DEFAULTS (Arch Linux)
# ==============================================================================
if [ -f /etc/bash.bashrc ]; then
  . /etc/bash.bashrc
fi


# ==============================================================================
# ENVIRONMENT VARIABLES
# ==============================================================================
export COLORTERM="truecolor"
export INFRA_FILE="$HOME/dev/ops/docker-compose.yml"

# Safely prepend local bin directories to PATH without duplication
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH


# ==============================================================================
# CLI THEMES (ElectroVoid Palette)
# ==============================================================================
export BAT_THEME="base16" # Neutral fallback before creating a custom bat theme

# FZF Royal Sheikah UI (Anthracite bg, Cyan Sheikah accents, Royal Gold selections)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_DEFAULT_OPTS=" \
--color=bg:#1c1c1e,bg+:#242426,fg:#c0c6ba,fg+:#e5e5e5,hl:#ff7a00,hl+:#ff7a00 \
--color=prompt:#00e5ff,pointer:#d4af37,marker:#22c55e,border:#4e544b,header:#4e544b \
--prompt='◈ ' --pointer='▲' --marker='⎔' --layout=reverse --border"


# ==============================================================================
# BASH BEHAVIOR & HISTORY
# ==============================================================================
shopt -s autocd cdspell globstar checkwinsize histappend
set -o ignoreeof

# History limits and duplication control
HISTSIZE=50000
HISTFILESIZE=50000
HISTCONTROL=ignoreboth:erasedups

# Synchronize history across all open terminals in real time
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


# ==============================================================================
# CUSTOM DOTFILES & ALIASES
# ==============================================================================
[ -f ~/.aliases ] && source ~/.aliases


# ==============================================================================
# TOOL INTEGRATIONS (Strict Order Required)
# ==============================================================================
# 1. Node Version Manager
eval "$(fnm env --use-on-cd --shell bash)"

# 2. Navigation & Search
eval "$(fzf --bash)"
eval "$(zoxide init bash --cmd cd)"

# 3. Prompt
eval "$(starship init bash)"

# 4. Angular Autocompletion (Fail silently if not installed yet)
command -v ng >/dev/null 2>&1 && source <(ng completion script)


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
