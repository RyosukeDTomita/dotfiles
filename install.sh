#!/bin/bash
##########################################################################
# Name: install.sh
#
# Description: This script is used to create symbolic links to the dotfiles
#
# Usage: ./initialsettings.sh
#
# Author: Ryosuke Tomita
# Date: 2024/07/15
##########################################################################

for f in $(ls -a ~/dotfiles | grep "^\.[a-zA-Z0-9]"); do
  if [ -e ~/$f ] || [ "$f" == ".git" ]; then
    continue
  fi
  echo $f
  ln -s ~/dotfiles/$f ~/$f
done
