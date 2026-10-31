# ========== autocomplete ==========
# Enable the modern completion system
autoload -Uz compinit
compinit

# Enable menu selection with arrow keys on repeated Tab
zstyle ':completion:*' menu select

# Case-insensitive (all), partial-word, and substring completion
# e.g., 'cd d/o' matches 'Desktop/org'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Colorize completion listings using default LS_COLORS
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# Group matches by category (e.g., commands, files, options)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
