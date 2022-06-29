#!/usr/bin/bash

DOT_FILES="$(dirname -- "$( readlink -f -- "$0"; )")"
TIMESTAMP="$(date +"%S:%M:%H@%Y-%m-%d")"

make_backup() {
	if [ -f $HOME/$1 ]; then
		mv $HOME/$1 $HOME/$1~$TIMESTAMP
	fi
}

install_file() {
	make_backup $2 && ln -s $DOT_FILES/$1 $HOME/$2
}

install_dir() {
	make_backup $2 && ln -snf $DOT_FILES/$1 $HOME/$2
}

install_file vimrc.vim .vimrc
install_dir vim .vim
