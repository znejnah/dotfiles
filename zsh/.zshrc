# ==========================
# ENVIRONMENT VARIABLES & TERMINAL
# ==========================
export COLORTERM="truecolor"
export PATH="$HOME/.local/bin:$PATH"
export INFRA_FILE="$HOME/dev/ops/docker-compose.yml"

# ==========================
# HISTORY MANAGEMENT
# ==========================
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_SPACE         # Do not record commands starting with a space
setopt HIST_IGNORE_DUPS          # Do not record consecutive duplicate commands
setopt HIST_IGNORE_ALL_DUPS      # Remove older duplicates if a command is re-executed
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks
setopt HIST_SAVE_NO_DUPS         # Do not write duplicate entries to .zsh_history

# ==========================
# CUSTOM ALIASES
# ==========================
# Source .aliases if it exists
[ -f ~/.aliases ] && source ~/.aliases

# ==========================
# ZSH COMPLETION INITIALIZATION
# ==========================
# Load compdef so downstream tools can register completions
autoload -Uz compinit
compinit

# ==========================
# NODE VERSION MANAGER (fnm)
# ==========================
# Load fnm and enable automatic version switching on directory change
eval "$(fnm env --use-on-cd --shell zsh)"

# ==========================
# FUZZY SEARCH & NAVIGATION (FZF & ZOXIDE)
# ==========================
# Search backend
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'

# Vice palette + rounded floating layout
export FZF_DEFAULT_OPTS=" \
  --color=bg+:#1b1529,bg:#130f1d,spinner:#00f0ff,hl:#ff2a85 \
  --color=fg:#e8e0f5,header:#ff2a85,info:#ff2a85,pointer:#00f0ff \
  --color=marker:#00e676,fg+:#ffffff,prompt:#00f0ff,hl+:#ff2a85 \
  --color=border:#3b2d54 \
  --layout=reverse \
  --border=rounded \
  --height=40% \
  --prompt='❯ ' \
  --pointer='▶' \
  --marker='★'"

# fzf keybindings (Ctrl+R for history, Alt+C for directory navigation)
source <(fzf --zsh)

# zoxide mapped to `cd`
eval "$(zoxide init zsh --cmd cd)"

# ==========================
# STARSHIP & PLUGINS
# ==========================
eval "$(starship init zsh)"

# Autosuggestions styled with Vice muted violet (#685887)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#685887"
[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Angular CLI
command -v ng >/dev/null 2>&1 && source <(ng completion script)
