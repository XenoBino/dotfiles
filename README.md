# Dotfiles
My personal dot files.

## Installation

Run:

```shell
./install.sh
```

to install the files to your home directory.

The original files in the home directory will not be merged or overwritten,
but rather be moved to `~/<FILENAME>~<TIMESTAMP>`.

The installation script is very minimal that it relies on a few things, being
`~` expansion and the `coreutils` tools.
