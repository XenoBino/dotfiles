vim9script

filetype plugin on

set nocompatible
set showcmd
set scrolloff=5
set laststatus=2

syntax on
g:c_comment_strings = 1

if !has('gui_running')
	set t_Co=256
endif

if $COLORTERM ==# "truecolor"
	set termguicolors
endif
