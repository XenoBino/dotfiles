#!/usr/bin/bash

SCRIPT_PATH="$(dirname -- "$( readlink -f -- "$0"; )")"

ln -s $SCRIPT_PATH/vimrc.vim $HOME/.vimrc
ln -snf $SCRIPT_PATH/config $HOME/.vim
