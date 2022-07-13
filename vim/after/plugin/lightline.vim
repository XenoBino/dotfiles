vim9script

if exists("g:is_a_project")
    autocmd VimEnter * NERDTree | vert resize 20 | wincmd p | redraw
endif
