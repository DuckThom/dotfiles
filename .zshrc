HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=100000

# Path to your oh-my-zsh installation.
export ZSH=/home/luna/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

test "$TERM" = "xterm" && export TERM=xterm-256color
test "$TERM" = "screen" && export TERM=screen-256color
# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR=/usr/bin/vim
export PATH=~/.npm/bin:~/.composer/vendor/bin:~/bin:~/dotfiles/bin:~/.bin:$PATH
export _JAVA_AWT_WM_NON_REPARENTING=1

# Unbind C-s
bindkey -r "^S"

if command -v pacaur > /dev/null; then
    alias get='pacaur -S'
    alias search='pacaur -Ss'
    alias show='pacaur -Si'
    alias update='pacaur -Sy'
    alias upgrade='pacaur -Syu'
    alias remove='pacaur -R'
else
    alias get='sudo apt-get install'
    alias search='apt-cache search'
    alias show='apt-cache show'
    alias update='sudo apt-get update'
    alias upgrade='sudo apt-get upgrade'
    alias remove='sudo apt-get remove'
    alias purge='sudo apt-get purge'
fi

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

source ~/dotfiles/zshplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
