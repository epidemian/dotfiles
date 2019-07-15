#!/bin/bash
set -e

DOTFILES=(.bash_aliases .bashrc .gitconfig .gitconfig-toptal .gitignore .inputrc .profile .ssh/config Gemfile)
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for file in "${DOTFILES[@]}"
do
  if [ "$HOME/$file" -ef "$DIR/$file" ]; then
    echo "$HOME/$file already symlinked"
  else
    if [ -f "$HOME/$file" ]; then
      mv -v "$HOME/$file" "$HOME/$file.bak"
    fi
    ln -sv "$DIR/$file" "$HOME/$file"
  fi
done
