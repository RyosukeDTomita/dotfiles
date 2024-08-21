#!/bin/bash
##########################################################################
# Name: install.sh
#
# Description: This script is used to create symbolic links to the dotfiles.
# NOTE: dotfiles/ directory must be placed in the home directory.
#
# Usage: ./install.sh
#
# Author: Ryosuke Tomita
# Date: 2024/07/15
##########################################################################
# create symbolic links to the dotfiles not including .git, .config directory
for f in $(ls -a ~/dotfiles | grep "^\.[a-zA-Z0-9]"); do
  if [ "${f}" == ".git" ] || [ "${f}" == ".config" ]; then
    continue
  fi
  if [ -e !~/${f} ]; then
    ln -s ~/dotfiles/${f} ~/${f}
    echo "=====CREATE SYMBOLIC LINKS ${HOME}/dotfiles/${f} --> ${HOME}/${f}====="
  # NOTE: The environment variable `REMOTE_CONTAINERS` is true in Dev Containers.
  elif [ "${REMOTE_CONTAINERS}" == "true" ]; then
    echo "REMOTE_CONTAINERS IS ${REMOTE_CONTAINERS}, THEN OVERWRITE SYMBOLIC LINKS"
    backup_dir=dotfiles_$(date +%Y%m%d)
    if [ ! -d ${backup_dir} ]; then
      mkdir ~/${backup_dir}
    fi
    cp ~/${f} ${backup_dir}
    ln -sf ~/dotfiles/${f} ~/${f}
    echo "=====CREATE SYMBOLIC LINKS ${HOME}/dotfiles/${f} --> ${HOME}/${f}====="
  fi
done


# create symbolic links to the .config/nvim directory
if [ ! -d ~/.config/nvim ]; then
  mkdir -p  ~/.config/nvim
fi
ln -s ~/dotfiles/.config/nvim/* ~/.config/nvim/
