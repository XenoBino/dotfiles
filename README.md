# vim-config
My personal vim config.

## Installation

Run:
```shell
./install.sh
```
to install the config to the home directory.

The original config in the home directory will not be merged or overwritten,
but rather be moved to `~/.vimrc~<TIMESTAMP>` and `~/.vim~<TIMESTAMP>`.

The installation script is very minimal that it relies on a few things, being
`$HOME` environment variable and `date`, `readlink -f`, `basename`
in `$PATH`.

## Directory structure

```
|
|__ install.sh # The installation script
|__ README.md  # A readme file
|__ vimrc.vim  # Will be installed to ~/.vimrc.
|              # Nothing more than a few `runtime` calls to the actual config
|              # located under `config/*.vim`
|
|__ config/    # Will be installed to ~/.vim/
   |
   |__ vundle.vim        # Vundle config and `Plugin` commands
   |__ plugin-config.vim # Will be loaded before `vundle.vim`.
   |                     # Used to configure plugins
   |
   |__ prefrences.vim    # Personal prefrences, this is where things such as
   |                     # `set number` reside.
   |
   |__ Vundle/           # This is where plugins live, as git submodules.
      |
      |__ ...
      |__ ...
```

## Plugins

This is a list of the plugins used:

- [VundleVim/Vundle.vim][Vundle.vim]
- [preservim/nerdtree][nerdtree]
- [vim-airline/vim-airline][vim-airline]
- [vim-airline/vim-airline-themes][vim-airline-themes]
- [qdddddd/vim-cycle-airline-them][vim-cycle-airline-them]
- [tpope/vim-fugitive][vim-fugitive]
- [jiangmiao/auto-pairs][auto-pairs]


[Vundle.vim]: https://github.com/VundleVim/Vundle.vim
[nerdtree]: https://github.com/preservim/nerdtree
[vim-airline]: https://github.com/vim-airline/vim-airline
[vim-airline-themes]: https://github.com/vim-airline/vim-airline-themes
[vim-cycle-airline-them]: https://github.com/qdddddd/vim-cycle-airline-them
[vim-fugitive]: https://github.com/tpope/vim-fugitive
[auto-pairs]: https://github.com/jiangmiao/auto-pairs
