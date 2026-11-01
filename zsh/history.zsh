# ==========================================
# History & Arrow Key Config
# ==========================================

# 1. Setup History File and Limits
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# 2. History Options
setopt APPEND_HISTORY        # Append to history file (don't overwrite)
setopt INC_APPEND_HISTORY    # Write after every command immediately
setopt SHARE_HISTORY         # Share history across multiple terminal tabs
setopt HIST_IGNORE_ALL_DUPS  # Remove older duplicate commands from history
setopt HIST_IGNORE_SPACE     # Ignore commands that start with a space

# 3. Smart Up/Down Arrow Keybindings (Prefix Search)
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Bind standard arrow keys
bindkey '^[[A' up-line-or-beginning-search   # Up arrow
bindkey '^[[B' down-line-or-beginning-search # Down arrow

# Bind application mode arrow keys (used by some terminals like macOS Terminal/iTerm)
bindkey '^[OA' up-line-or-beginning-search   # Up arrow
bindkey '^[OB' down-line-or-beginning-search # Down arrow
