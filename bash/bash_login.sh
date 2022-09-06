if [ -f ~/.profile ]; then
  . ~/.profile
fi

# Since the shell is a login
export LOGIN_SHELL=1

. ~/.bash.d/login.sh
