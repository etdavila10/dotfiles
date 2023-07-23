# Dotfiles
This git repository is responsible for easily accessible dotfiles across workstations.

# Prerequisites
- `git`
- `vcsh`
- Further prerequisites documented in `zshrc` file.

# How to Setup
Simply run the below command on a new machine
```
vcsh clone https://github.com/etdavila10/dotfiles dotfiles
```
Note: Make sure that you don't already have existing files that conflict with
the ones tracked by this repository. If you do, make sure to delete them or
move them into backup files.

To add configuration run the commands below
```
vcsh enter dotfiles
git add <files to be staged>
git commit -m "updated config"
git push
```

# Configurations Being Tracked
- Neovim
- Neofetch
- zshrc/zprofile
- gitconfig
