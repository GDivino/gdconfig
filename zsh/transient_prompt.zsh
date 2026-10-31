# Transient prompt hook
# 1. Reset to the minimal arrow when a command finishes / Enter is pressed
function zle-line-finish() {
  PROMPT='$(starship module character)'
  RPROMPT=""
  zle reset-prompt
}
zle -N zle-line-finish

# 2. Restore the full multi-line prompt on the new active line
function precmd() {
  PROMPT='$(starship prompt)'
  RPROMPT='$(starship prompt --right)'
}
