let g:lightline = {
	\'colorscheme': 'materia',
	\'active': {
	\	'left': [
	\		[ 'mode', 'paste'  ],
	\		[ 'filename' ]
	\	],
	\	'right': [
	\		[ 'lineinfo' ],
	\		[ 'percent' ],
	\		[ 'gitbranch', 'fileformat', 'fileencoding', 'filetype', 'hexvalue' ]
	\	]
	\},
	\'inactive': {
	\	'left': [ [ 'filetype' ], [ 'gitbranch' ] ],
	\	'right': []
	\},
	\'component': {},
	\'component_function': {
	\	'gitbranch': 'LightlineGitHead',
	\	'filename': 'LightlineFilename',
	\	'filetype': 'LightlineFiletype',
	\	'hexvalue': 'LightlineHexValue',
	\	'fileformat': 'LightlineFileFormat',
	\	'fileencoding': 'LightlineFileEncoding',
	\	'lineinfo': 'LightlineCursor'
	\},
\}

function! LightlineGitHead() 
	return FugitiveIsGitDir() && !FiletypeBlackListed() && winwidth(0) > 50 ? FugitiveHead() . ' ' : ''
endfunction

function! LightlineCursor()
	return winwidth(0) > 45 ? (line('.') . (winwidth(0) > 50 ? ':' . col('.') : '')) : ''
endfunction

function! LightlineHexValue()
	return !FiletypeBlackListed() && winwidth(0) >= 80 ? '0x%B' : ''
endfunction

function! LightlineFileEncoding()
	return !FiletypeBlackListed() && winwidth(0) >= 70 ? &encoding : ''
endfunction

function! LightlineFileFormat()
	return !FiletypeBlackListed() && winwidth(0) >= 80 ? &fileformat : ''
endfunction

function! LightlineFiletype()
	return !FiletypeBlackListed() && winwidth(0) >= 40 ? &filetype : ''
endfunction

function! LightlineReadonly()
	return &readonly && winwidth(0) > 50 && !FiletypeBlackListed() ? ' (RO)' : ''
endfunction

function! FiletypeBlackListed()
	return &filetype =~ '\v(help|vimfiler|unite|netrw)'
endfunction

function! LightlineModified()
	return &modified && winwidth(0) > 60 ? ' ●' : ''
endfunction

function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[New file]'
	return filename . LightlineReadonly() . LightlineModified()
endfunction

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_altv = 1
