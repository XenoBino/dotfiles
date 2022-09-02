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
  echo -e "\e[31mError: \e[0m Too many ~/.XenoBino.dotfiles.*.log files" >&2
fi

make_backup() {
  DIR=$(dirname ~/$1)
  if [ ! -d $DIR ]; then
    mkdir -p $DIR
    return
  fi
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
install_file bash_login.sh .bash_login
install_file profile.sh .profile
install_file bashrc.sh .bashrc
install_file bash_aliases.sh .bash_aliases
install_file bash_logout.sh .bash_logout
install_dir bash .bash

# Install git config
install_file gitconfig.ini .gitconfig

# Install kitty config
install_file kitty.conf .config/kitty/kitty.conf

# Install bspwm, picom and sxhkd config
install_file bspwm/bspwmrc.sh .config/bspwm/bspwmrc
install_file bspwm/sxhkdrc .config/sxhkd/sxhkdrc
install_file bspwm/picom.conf .config/picom.conf
install_file bspwm/wallpaper.jpg .local/share/wallpapers/bspwm-default.jpg
