#!/bin/bash
set -e

DOTFILES=(.bash_aliases .bashrc .gitconfig .gitignore .inputrc .profile .ssh/config .config/fish)
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for file in "${DOTFILES[@]}"
do
  if [ "$HOME/$file" -ef "$DIR/$file" ]; then
    echo "$HOME/$file already symlinked"
  else
    if [ -f "$HOME/$file" ] && ! cmp -s "$DIR/$file" "$HOME/$file"; then
      mv -v "$HOME/$file" "$HOME/$file.bak"
    fi
    ln -sfv "$DIR/$file" "$HOME/$file"
  fi
done
