#!/usr/bin/bash

SCRIPT_PATH="$(dirname -- "$( readlink -f -- "$0"; )")"
TIMESTAMP="$(date +"%S:%M:%H@%Y-%m-%d")"

mv $HOME/.vimrc $HOME/.vimrc~$TIMESTAMP
mv $HOME/.vim   $HOME/.vim~$TIMESTAMP

ln -s $SCRIPT_PATH/vimrc.vim $HOME/.vimrc
ln -snf $SCRIPT_PATH/config $HOME/.vim
