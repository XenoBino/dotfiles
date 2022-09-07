#!/usr/bin/bash

DOT_FILES="$(dirname -- "$( readlink -f -- "$0"; )")"
TIMESTAMP="$(date +"%S:%M:%H@%Y-%m-%d")"
LOG_FILE=

for i in {1..10000}; do
  if ! [ -f $HOME/.XenoBino.dotfiles.$i.log ]; then
    LOG_FILE=$HOME/.XenoBino.dotfile.$i.log
    break
  fi
done

if [ "$LOG_FILE" == "" ]; then
  printf "\x1b[31m%s\x1b[0m %s\n" "Error:" "Too many ~/.XenoBino.dotfiles.*.log files" >&2
fi

make_backup() {
  # If the directory containing the file or directory to backup doesn't exist,
  # create it.
  DIR=$(dirname ~/$1)
  if [ ! -d $DIR ]; then
    mkdir -p $DIR
    return
  fi

  # If the file or the directory to backup exists, make a backup
  if [ -f $HOME/$1 ] || [ -d $HOME/$1 ]; then
    backup_name=$HOME/$1~$TIMESTAMP
    mv $HOME/$1 $backup_name
    echo $backup_name >> $LOG_FILE
  fi
}

install_file() {
  make_backup $2 && ln -s $DOT_FILES/$1 $HOME/$2
}

install_dir() {
  make_backup $2 && ln -snf $DOT_FILES/$1 $HOME/$2
}

# Install nvim config
install_dir nvim/site .local/share/nvim/site
install_dir nvim/config .config/nvim

if command -v nvim &> /dev/null; then nvim -c "PackerCompile" -c "q"; fi

# Install bash config
make_backup .hushlogin
touch $HOME/.hushlogin
make_backup .bash_profile
install_file bash/bash_login.sh   .bash_login
install_file bash/profile.sh      .profile
install_file bash/bashrc.sh       .bashrc
install_file bash/bash_aliases.sh .bash_aliases
install_file bash/bash_logout.sh  .bash_logout
install_dir  bash/bash.d          .bash.d

# Install git config
install_file cli/gitconfig.ini .gitconfig

# Install kitty config
install_file desktop/kitty.conf .config/kitty/kitty.conf

# Install bspwm, picom and sxhkd config
install_file desktop/bspwmrc.sh .config/bspwm/bspwmrc
install_file desktop/sxhkdrc    .config/sxhkd/sxhkdrc
install_file desktop/picom.conf .config/picom.conf
install_dir  desktop/dunstrc    .config/dunst/dunstrc
install_dir  images/wallpapers  .local/share/wallpapers/xeno
