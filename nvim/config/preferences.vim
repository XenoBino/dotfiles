set number
set tabstop=4
set shiftwidth=4
set noshowmode
set showcmd
set mouse=""

" Allow h and l to switch lines
" From https://superuser.com/a/559436
set whichwrap+=<,>,h,l,[,]

" Move through soft wrapped lines
" From https://stackoverflow.com/a/21000307
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
