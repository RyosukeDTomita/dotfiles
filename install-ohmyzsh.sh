#!/bin/bash
if [ ! -e ~/.zshrc ] && [ ! -e ~/.oh-my-zsh ]; then
  echo "-----install oh-my-zsh-----"
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


# extensions
if [ ! -e ~/.oh-my-zsh/custom/plugins/zsh-autocomplete ]; then
  echo "-----install zsh-autocomplete-----"
  git clone https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
fi
