if command -v ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)" > /dev/null
fi

if command -v gpg-agent > /dev/null; then
  gpg-agent --daemon > /dev/null 2> /dev/null
fi

if command -v fastfetch >/dev/null;  then fastfetch;
elif command -v neofetch >/dev/null; then neofetch;
fi
