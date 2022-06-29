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
`$HOME` environment variable and the executables `date`, `readlink -f`, `basename`
available in `$PATH`.

## Directory structure

```
|
|__ install.sh # The installation script
|__ README.md  # A readme file
|__ vimrc.vim  # Will be installed to ~/.vimrc.
|              # Nothing more than a few `runtime` calls to the actual
|              # config files located under `vim/*.vim`
|
|__ vim/       # Will be installed to ~/.vim/
   |
   |__ setup.vim         # The first file called after
   |__                   # `$VIMRUNTIME/defaults.vim`
   |__ theme.vim         # Color scheme and status line theme settings
   |__ plugin-config.vim # Used to configure plugins.
   |__ prefrences.vim    # Personal prefrences, this is where things such as
   |                     # `set number` reside.
   |
   |__ pack/           # This is where plugins exist, as git submodules.
      |
      |__ plugins
         |
		 |__ start  # Plugins that are always active
		 |  |
		 |  |__ ...
		 |  |__ ...
		 |
		 |__ opt    # Optional plugins
		    |
			|__ ...
			|__ ...
```

## Plugins

This is a list of the plugins used:

- [itchyny/lightline.vim][itchyny/lightline.vim]
- [tpope/vim-fugitive][vim-fugitive]
- [jiangmiao/auto-pairs][auto-pairs]
- [rafi/awesome-vim-colorschemes][awesome-vim-colorschemes]

[itchyny/lightline.vim]: https://github.com/itchyny/lightline.vin
[vim-fugitive]: https://github.com/tpope/vim-fugitive
[auto-pairs]: https://github.com/jiangmiao/auto-pairs
[awesome-vim-colorschemes]: https://github.com/rafi/awesome-vim-colorschemes
