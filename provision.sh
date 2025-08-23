#!/bin/bash
set -o errexit -o nounset -o pipefail

packages=(
  bat
  byzanz
  cloc
  cowsay
  direnv
  fd-find
  fonts-firacode
  fzf
  gimp
  git
  htop
  httpie
  hub
  imagemagick
  jq
  pv
  ripgrep
  tig
  vlc
  xclip
  zoxide
)
sudo apt install --no-install-recommends "${packages[@]}"

mkdir -p ~/bin
# Ubuntu installs fd as fdfind
ln -s $(which fdfind) ~/bin/fd
