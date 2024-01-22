# Set up zsh environment config
source ~/.zsh_env

# Uncomment to enable profiling (don't forget to uncomment 'zprof' at the bottom aswell)
#zmodload zsh/zprof

plugins=(git zsh-syntax-highlighting)

# Enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

# Setup custom aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# Setup custom functions
[ -f ~/.zsh_functions ] && source ~/.zsh_functions

# Load custom config
[ -f ~/.zshrc_custom ] && source ~/.zshrc_custom

# Uncomment to enable profiling output
#zprof
