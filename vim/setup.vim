filetype plugin on

if !has('gui_running')
	set t_Co=256
endif

if $COLORTERM ==# "truecolor"
	set termguicolors
endif
