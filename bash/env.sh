export GPG_TTY=$(tty)

if command -v vim > /dev/null; then export EDITOR=vim;
elif command -v vi > /dev/null; then export EDITOR=vi;
elif command -v nano > /dev/null; then export EDITOR=nano;
fi
