# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Prevent accidental file overwrites on stdout redirection.
set -o noclobber

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=$HISTSIZE

# Share history across sessions: save and reload the history after each command
# finishes
PROMPT_COMMAND="history -a; history -c; history -r;"

# Let reverse search receive ctrl+S to do a forward search.
stty -ixon

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Prepend cd to directory names automatically
#shopt -s autocd

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Configure __git_ps1.
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_DESCRIBE_STYLE=branch

# Use a minimal prompt.
minps1() { PS1='\$ '; }
# Use a fancy prompt.
fullps1() {
  local red='\[\e[31;1m\]'
  local green='\[\e[32;1m\]'
  local magenta='\[\e[35;1m\]'
  local cyan='\[\e[36;1m\]'
  local reset='\[\e[0m\]'

  local chroot='${debian_chroot:+($debian_chroot)}'
  local dir='\w'
  local git_status='$(__git_ps1)'
  local result_color='$([ "$?" == "0" ] && echo "'${green}'" || echo "'${red}'")'
  local prompt_ch='❱  '

  PS1="\n${chroot}${cyan}${dir}${magenta}${git_status}\n${result_color}${prompt_ch}${reset}"
}
fullps1

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Create a new Bash script file with basic template.
new-script() {
  cat >"$1" <<EOS
#!/bin/bash
set -o errexit -o nounset -o pipefail
EOS
  chmod +x "$1"
}

# Kill any process listening on a given port.
killport() {
  lsof -t -i :"$1" -s TCP:LISTEN | xargs -r kill
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  elif [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
  fi
fi

# rbenv config.
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Set up direnv hook.
eval "$(direnv hook bash)"

# Initialize zoxide as `j` and `ji`
eval "$(zoxide init bash --cmd j)"

# Initialize Rust's cargo
source "$HOME/.cargo/env"
