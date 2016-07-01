#!/bin/bash
set -e

DOTFILES=(.bash_aliases .bash_profile .bashrc .gitconfig .gitignore .inputrc .profile .ssh/config Gemfile)
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for file in "${DOTFILES[@]}"
do
  ln -sfv "$DIR/$file" "$HOME/$file"
done 
