#!/bin/bash
set -o errexit -o nounset -o pipefail

packages=(
  bat
  build-essential
  byzanz
  cloc
  cowsay
  direnv
  fd-find
  fish
  fonts-firacode
  fzf
  gimp
  git
  htop
  httpie
  hub
  hyperfine
  imagemagick
  jq
  pv
  ripgrep
  ruby
  tig
  vlc
  xclip
  zoxide
)
sudo apt install --no-install-recommends "${packages[@]}"

mkdir -p ~/bin
# Ubuntu installs fd as fdfind
ln -s $(which fdfind) ~/bin/fd
