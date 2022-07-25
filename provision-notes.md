Notes from last computer provision

- set up keyboard layout as English (intl., with AltGr dead keys)
- install packages from provision.sh
- install system indicator: https://extensions.gnome.org/extension/120/system-monitor/
- install Firefox and Spotify as .deb packages instead of snaps (and any other bloated pre-installed snap)
- install Firefox dev edition & Sync
    - download .tar from website
    - copy to /opt/firefox
    - `chown -R demian:demian /opt/firefox`
- install vscode from .deb package https://code.visualstudio.com/Download
- set up dotfiles running setup.sh
- install rbenv and ruby-build form source (Ubuntu packages always lag behind)
- run `bundle install` on $HOME
- install other software manually
  - chrome
  - calibre
