# Exports
export LC_ALL="en_US.UTF-8"
export LANG=en_US.UTF-8
export PATH=~/.gem/ruby/2.4.0/bin:node_modules/.bin/:vendor/bin:~/.npm/bin:~/.composer/vendor/bin:~/bin:~/dotfiles/bin:~/.bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export EDITOR=/usr/bin/vim
export _JAVA_AWT_WM_NON_REPARENTING=1

test "$TERM" = "xterm" && export TERM=xterm-256color
test "$TERM" = "screen" && export TERM=screen-256color

plugins=(git)

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=100000

ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_CHAR="\$ "
BULLETTRAIN_RUBY_BG="red"

alias dexit="docker exec -it"

# Unbind C-s
bindkey -r "^S"

# Set some fancy colors for the framebuffer terminal
if test "$TERM" = "linux"; then
    echo -en "\e]P01D1F21" # black
    echo -en "\e]P1E84F4F" # darkred
    echo -en "\e]P2B8D68C" # darkgreen
    echo -en "\e]P3E1AA5D" # brown
    echo -en "\e]P47DC1CF" # darkblue
    echo -en "\e]P59B64FB" # darkmagenta
    echo -en "\e]P66D878D" # darkcyan
    echo -en "\e]P7dddddd" # lightgrey
    echo -en "\e]P8404040" # darkgrey
    echo -en "\e]P9D23D3D" # red
    echo -en "\e]PAA0CF5D" # green
    echo -en "\e]PBF39D21" # yellow
    echo -en "\e]PC4E9FB1" # blue
    echo -en "\e]PD8542FF" # magenta
    echo -en "\e]PE42717B" # cyan
    echo -en "\e]PFdddddd" # white
    clear # for background artifacting
fi

# Load the aliases and helper functions
source ~/dotfiles/.zsh.aliases

if [ -f ~/.gitconfig.local ]; then
    source ~/.gitconfig.local
fi

source ~/dotfiles/zshplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
