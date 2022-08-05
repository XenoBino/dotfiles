if [ "$LOGIN_SHELL" == "1" ]; then
  eval "$(ssh-agent -k)" > /dev/null
fi
