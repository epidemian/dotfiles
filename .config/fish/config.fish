if not status is-interactive
    exit
end

### Abbreviations

abbr -a be bundle exec
abbr -a g git
abbr -a gs git s
abbr -a xo xdg-open
abbr -a wl wc -l
# Fix dumb name for bat(1) on Ubuntu repositories.
alias bat batcat

### Misc functions

# Note: these should probably be defined each on a separate file, as fish likes
# it (see funcsave(1)).

alias c fish_clipboard_copy
alias v fish_clipboard_paste

function serve-dir -d "Simple HTTP server for current directory"
    ruby -run -ehttpd . -p8000
end

function new-script -a file -d "Create a new Bash script"
    echo >$file "#!/bin/bash
set -o errexit -o nounset -o pipefail
"
    chmod +x $file
end

function killport -a port -d "Kill any process listening on a given port"
    lsof -t -i :$port -s TCP:LISTEN | xargs -r kill
end

function gay -d "Colorful man(1) alternative"
    COLUMNS=(math $COLUMNS / 4) man $argv | toilet --termwidth --font pagga | lolcat --force | less -R
end

function bot -d "Retro man(1) alternative"
    COLUMNS=(math $COLUMNS / 3) man $argv | toilet --termwidth --font future | lolcat --force --freq 0.01 --seed 540 | less -R
end

function rot13 -d "Powerful anti-spoilers cipher"
    tr A-Za-z N-ZA-Mn-za-m
end

function crot -d "Copy rot13"
    echo -n "rot13("(echo $argv | rot13)")" | c
end

### PATH & tool initialization

test -d ~/bin && set -gx --prepend PATH ~/bin

# Add Rust and Go binaries to PATH
set -gx --prepend PATH ~/.cargo/bin
set -gx --append PATH /usr/local/go/bin

# Initialize zoxide as `j` and `ji`
zoxide init fish --cmd j | source

# Initialize rbenv
test -d ~/.rbenv && ~/.rbenv/bin/rbenv init - fish | source

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims