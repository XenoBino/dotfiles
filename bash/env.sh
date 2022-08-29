export GPG_TTY=$(tty)

if command -v nvim > /dev/null; then
  alias vi="nvim"
  alias vim="nvim"
  export EDITOR=nvim;
elif command -v vim > /dev/null; then
  alias vi="vim"
  export EDITOR=vim;
elif command -v vi > /dev/null; then export EDITOR=vi;
elif command -v nano > /dev/null; then export EDITOR=nano;
fi
