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
  lolcat
  pv
  ripgrep
  ruby
  sl
  tig
  toilet
  vlc
  xclip
  zoxide
)
sudo apt install --no-install-recommends "${packages[@]}"

mkdir -p ~/bin
# Ubuntu installs fd as fdfind
[ -f ~/bin/fd ] || ln -s $(which fdfind) ~/bin/fd
