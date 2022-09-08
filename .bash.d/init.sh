. ~/.bash.d/functions.sh
. ~/.bash.d/env.sh

unset PROMPT_COMMAND
unset PS1

PS1="\[\e[32m\]\w \[\e[34;1m\]\$ \[\e[0m\]"
PS1="\[\e[32m\]\u@\h\[\e[0m\] \[\e[1;32m\]\w\[\e[0m\] \[\e[1;34m\]\$\[\e[0m\] "
