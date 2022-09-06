# From https://gist.github.com/techn0punk/4882cf2b607b3aeb7f863e6040ac9ac2
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# enable color support of ls and also add handy aliases
if [ -x $PREFIX/bin/dircolors ] || [ -x $PREFIX/usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls="ls --color=auto --group-directories-first"
    alias dir="dir --color=auto --group-directories-first"
    #alias vdir='vdir --color=auto'

    alias grep="grep --color=auto"
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lA'
alias l='ls -CF'

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
  if [ -f $PREFIX/usr/share/bash-completion/bash_completion ]; then
    . $PREFIX/usr/share/bash-completion/bash_completion
  elif [ -f $PREFIX/share/bash-completion/bash_completion ]; then
	. $PREFIX/share/bash-completion/bash_completion
  elif [ -f $PREFIX/etc/bash_completion ]; then
    . $PREFIX/etc/bash_completion
  fi
fi

. ~/.bash.d/init.sh
if [ -f ~/.bashrc.local ]; then . ~/.bashrc.local; fi
