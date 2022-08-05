vim9script

# Completely disable netrw, I hate it
g:loaded_netrw       = 1
g:loaded_netrwPlugin = 1

autocmd FileType html,css packadd emmet-vim

# Always loaded plugins
packadd auto-pairs
packadd lightline

# Only load when there is a project
if exists("g:is_a_project")
    packadd fugitive

    packadd vim-devicons
    packadd vim-nerdtree-syntax-highlight
    packadd nerdtree
endif
