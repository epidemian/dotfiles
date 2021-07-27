#!/bin/bash
set -o errexit -o nounset -o pipefail

packages=(
  bat
  byzanz
  cloc
  cowsay
  direnv
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
