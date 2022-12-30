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
- Make sure vscode preferences have been synched

## Provision new disk/computer

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
- install Rust running rustup: https://www.rust-lang.org/tools/install
- install other software manually
  - chrome
  - calibre
  - OBS
