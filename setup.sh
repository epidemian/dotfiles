#!/bin/bash
set -e

DOTFILES=(.bash_profile .bashrc .gitconfig .gitignore .inputrc .profile .ssh/config)
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for file in "${DOTFILES[@]}"
do
  ln -sfv "$DIR/$file" "$HOME/$file"
done 
