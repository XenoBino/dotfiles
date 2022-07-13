vim9script

# Completely disable netrw, I hate it
g:loaded_netrw       = 1
g:loaded_netrwPlugin = 1

# Always loaded plugins
packadd auto-pairs
packadd lightline

if exists("g:is_a_project")
    # Only load when there is a project
    packadd fugitive

    packadd vim-devicons
    packadd vim-nerdtree-syntax-highlight
    packadd nerdtree
endif
