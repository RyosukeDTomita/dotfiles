#!/bin/bash
if [ ! -e ~/.zshrc ] && [ ! -e ~/.oh-my-zsh ]; then
  echo "-----install oh-my-zsh-----"
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
