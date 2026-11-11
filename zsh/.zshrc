# ==========================
# VARIABLES D'ENVIRONNEMENT & TERMINAL
# ==========================
export COLORTERM="truecolor"
export PATH="$HOME/.local/bin:$PATH"
export INFRA_FILE="$HOME/dev/ops/docker-compose.yml"

# ==========================
# GESTION DE L'HISTORIQUE
# ==========================
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_SPACE         # Ne pas enregistrer les commandes commençant par un espace
setopt HIST_IGNORE_DUPS          # Ne pas enregistrer 2 fois de suite la même commande
setopt HIST_IGNORE_ALL_DUPS      # Supprimer les anciens doublons si la commande est réexécutée
setopt HIST_REDUCE_BLANKS        # Supprimer les espaces superflus
setopt HIST_SAVE_NO_DUPS         # Ne pas écrire de doublons dans le fichier .zsh_history

# ==========================
# CHARGEMENT DES ALIAS CUSTOM
# ==========================
# Si le fichier .aliases existe, on le charge ici
[ -f ~/.aliases ] && source ~/.aliases

# ==========================
# INITIALISATION DE L'AUTOCOMPLÉTION (ZSH)
# ==========================
# Charge compdef pour que les outils ci-dessous puissent s'en servir
autoload -Uz compinit
compinit

# ==========================
# GESTIONNAIRE DE VERSIONS NODE (fnm)
# ==========================
# Charge fnm instantanément et active le changement auto de version
eval "$(fnm env --use-on-cd --shell zsh)"

# ==========================
# RECHERCHE FLOU & NAVIGATION (FZF & ZOXIDE)
# ==========================
# Backend de recherche
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'

# Palette Royal Sheikah + interface flottante arrondie
export FZF_DEFAULT_OPTS=" \
  --color=bg+:#1c1c1e,bg:#1c1c1e,spinner:#00e5ff,hl:#00e5ff \
  --color=fg:#c0c6ba,header:#d4af37,info:#d4af37,pointer:#00e5ff \
  --color=marker:#22c55e,fg+:#ffffff,prompt:#00e5ff,hl+:#00e5ff \
  --color=border:#4e544b \
  --layout=reverse \
  --border=rounded \
  --height=40% \
  --prompt='◈ ' \
  --pointer='▶' \
  --marker='✓'"

# Binding fzf (Ctrl+R pour l'historique, Alt+C pour naviguer)
source <(fzf --zsh)

# zoxide en mode `cd`
eval "$(zoxide init zsh --cmd cd)"

# ==========================
# STARSHIP & PLUGINS
# ==========================
eval "$(starship init zsh)"

# Autosuggestion alignée sur Gris Roche Sheikah (#4e544b)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4e544b"
[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Angular CLI
command -v ng >/dev/null 2>&1 && source <(ng completion script)
