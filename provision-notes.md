## Backup old disk/computer data

- Back up full $HOME to external drive with rsync:
    ```
    rsync -av /home/demian/ /media/demian/Backup/<dir_name>
    ```

    Or, using an ignorelist to avoid copying unnecessary stuff:

    ```
    rsync -av --exclude-from=rsync-homedir-excludes.txt /home/demian/ /media/demian/Backup/<dir_name>
    ```

- Make sure to back up shell history (.bash_history or ~/.local/share/fish/fish_history)
- Make sure Firefox Sync synched everything
  - Take note of which profile is being used
- Make sure vscode preferences have been synched

## Provision new disk/computer

- choose a new host name (even if it's same machine and OS, will make things easier)
- set up keyboard layout as English (intl., with AltGr dead keys)
- add fish PPA: `sudo apt-add-repository ppa:fish-shell/release-4`
- install packages from provision.sh
- remove Firefox snap and install as .deb or from source
  - remove snap: https://askubuntu.com/questions/1399383/how-to-install-firefox-as-a-traditional-deb-package-without-snap-in-ubuntu-22
  - install: https://support.mozilla.org/en-US/kb/install-firefox-linux
- install system indicator: https://extensions.gnome.org/extension/3010/system-monitor-next/
- if Firefox Sync doesn't retrieve history or bookmarks data, copy those from backup (https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data)
- set up fish as default shell:
    ```bash
    echo "$(which fish)" | sudo tee -a /etc/shells
    chsh -s "$(which fish)"
    ```
  then log out and log in again for this login shell change to take effect
- install vscode from .deb package https://code.visualstudio.com/Download
- set up dotfiles running setup.sh
- install `asdf` (as a precompiled binary): https://asdf-vm.com/guide/getting-started.html (throw it into ~/bin)
- install Rust running rustup: https://www.rust-lang.org/tools/install
- install other software manually
  - spotify (make sure it's not a snap!)
  - chrome
  - calibre
  - OBS
