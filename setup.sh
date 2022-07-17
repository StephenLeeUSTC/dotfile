#/usr/bin/env bash

mkdir -p ~/.config/nvim
stow -v nvim -t ~/.config/nvim

mkdir -p ~/.config/emacs
stow -v emacs -t ~/.config/emacs

cp ./.tmux.conf  ~/
cp ./.gitconfig  ~/
