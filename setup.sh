#!/bin/bash

DIR="$(dirname $0)"

function askForConfirmation () {
    echo
    echo "Hit enter to continue, or Ctrl-C to abort..."

    read
}

echo "Note: You should run this script from your target installation"
echo "  directory into the relative path of the dotfiles."
echo
echo "(I wouldn't recommend running this script with an absolute path,"
echo "  like ~/dotfiles/setup-symlinks.sh - relative paths are cool.)"
echo
echo -e "Running from: \e[1m$(pwd)\e[0m"
echo -e "Linking to:   \e[1m$DIR\e[0m"
echo
echo -e "Recommended:  \e[1m$HOME\e[0m"
echo -e "              \e[1mdotfiles\e[0m"
echo
echo "Symlinks will look like:"
echo "$(pwd)/.config/bspwm -> ../$DIR/.config/bspwm"
echo "$(pwd)/.gitconfig    -> $DIR/.gitconfig"
echo "$(pwd)/.zshrc        -> $DIR/.zshrc"

if [[ "$DIR" = "." ]]
then
    echo -e "\n\e[1;31mYou're running this script from its own directory!"
    echo -e "This is probably not what you want! Read above.\e[0m"
fi

askForConfirmation

mkdir -p .config
for conf in "$DIR/.config/"*
do
    file="$(basename $conf)"
    echo ".config/$file -> ../$DIR/.config/$file"
    ln -s "../$DIR/.config/$file" ".config/"
done 2>/tmp/.luna-dotfiles-setup-script.log

for file in .conkyrc .gitconfig .githelpers .zshrc .vimrc .vim .tmux.conf
do
    echo "$file -> $DIR/$file"
    ln -s "$DIR/$file" .
done 2>>/tmp/.luna-dotfiles-setup-script.log

echo
echo "Setting up oh-my-zsh"

askForConfirmation

if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH || {
  printf "Error: git clone of oh-my-zsh repo failed\n"
  exit 1
}

source ~/.zshrc

echo
echo "Installing bullet-train zsh theme"

askForConfirmation

mkdir $ZSH_CUSTOM/themes/
cd $ZSH_CUSTOM/themes
wget http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme
cd ~

echo
echo "Setting up git submodules"

askForConfirmation

cd $DIR
git submodule init
git submodule update

echo
cat /tmp/.luna-dotfiles-setup-script.log
echo

echo "Done!"
echo "Remember to change user.name and user.email in ~/.gitconfig"
echo "Or override them by setting the env values in ~/.gitconfig.local"
echo
echo "For example: 'export GIT_AUTHOR_EMAIL=foo@bar.com'"
