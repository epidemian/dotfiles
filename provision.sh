#!/bin/bash
set -o errexit -o nounset -o pipefail

sudo snap install --classic code
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
)
sudo apt install --no-install-recommends "${packages[@]}"
