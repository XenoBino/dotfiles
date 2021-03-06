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

# Install vim config
install_file vimrc.vim .vimrc
install_dir vim .vim

# Install bash config
make_backup .hushlogin
touch $HOME/.hushlogin
install_file bashrc.sh .bashrc
install_file bash_aliases.sh .bash_aliases
install_file bash_login.sh .bash_login
install_file bash_logout.sh .bash_logout
install_dir bash .bash

# Install git config
install_file gitconfig.ini .gitconfig
