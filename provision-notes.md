## Backup old disk/computer data

- Back up full $HOME to external drive with rsync:
    ```
    rsync -av /home/demian/ /media/demian/Backup/<dir_name>
    ```

    Or, using an ignorelist to avoid copying unnecessary stuff:

    ```
    rsync -av --exclude-from=rsync-homedir-excludes.txt /home/demian/ /media/demian/Backup/<dir_name>
    ```

- Make sure to back up .bash_history
- Make sure Firefox Sync synched everything
  - Take note of which profile is being used
- Make sure vscode preferences have been synched

## Provision new disk/computer

- choose a new host name (even if it's same machine and OS, will make things easier)
- set up keyboard layout as English (intl., with AltGr dead keys)
- install packages from provision.sh
- install system indicator: https://extensions.gnome.org/extension/3010/system-monitor-next/
- install Spotify as .deb packages instead of snap (and any other bloated pre-installed snap)
- if Firefox Sync doesn't retrieve history or bookmarks data, copy those from backup (https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data)
- install vscode from .deb package https://code.visualstudio.com/Download
- set up dotfiles running setup.sh
- install rbenv and ruby-build form source (Ubuntu packages always lag behind)
- run `bundle install` on $HOME
- install Rust running rustup: https://www.rust-lang.org/tools/install
- install other software manually
  - chrome
  - calibre
  - OBS
