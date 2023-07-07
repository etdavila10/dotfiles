# Dotfiles
This git repository is responsible for easily accessible dotfiles across workstations.

# Prerequisites
- git
- vcsh

# How to Setup
Simply run the below command on a new machine
```
vcsh clone https://github.com/etdavila10/dotfiles dotfiles
```

To add configuration run the commands below
```
vcsh enter dotfiles
git add <files to be staged>
git commit -m "updated configs"
git push
```

# Configurations Being Tracked
- Neovim
- Starship
- zshrc
