#!/usr/bin/env bash

# COLOURS
G="\033[0;32m"
R="\033[0;31m"
B="\033[0;34m"
Y="\033[0;33m"

echo Changing directory to "$( dirname "${BASH_SOURCE[0]}" )"
cd "$( dirname "${BASH_SOURCE[0]}" )"

echo "$G Updating Submodules"
git submodule update --init --recursive

# Array of filenames to skip, any arguments passed to
# the script will be added here
skip=("README.md", "tools", "backups", "sshconfig", "LICENSE.orig", "LICENSE.md", "osx", $0, $*)
bckpdir="${PWD}/backups/$(date "+%Y%m%d%H%M%S_backup")"
for name in *; do
  if [[ ! ${skip[*]} =~ $name ]]; then
    target="$HOME/.$name"

    if [ -a $target ]; then
      if [[ ! -d $bckpdir ]]; then
        mkdir -p $bckpdir
      fi
      echo -e "$B [+] Backing up $target to $bckpdir/.$name"
      cp -r $target $bckpdir
      echo -e "$R [-] Removing $target"
      echo rm $target
    fi

    ln -s "$PWD/$name" "$target"
    echo "$G [>] Linked $PWD/$name to $target"
  else
    echo "$Y [~] Skipping ${name}"
  fi
done

echo "Gonna install vim plugins, might take a while."
[[ ! -d $HOME/.vim/bundle/Vundle.vim ]] && git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +BundleInstall! +BundleClean +qall

echo "Finished installing dotfiles."
