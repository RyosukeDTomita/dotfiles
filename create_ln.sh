#!/bin/bash
##########################################################################
# Name: create_ln
#
# Description: This script is used to create symbolic links to the dotfiles.
# NOTE: dotfiles/ directory must be placed in the home directory. 
#  For host OS.
#
# Usage: ./install.sh
#
# Author: Ryosuke Tomita
# Date: 2024/07/15
##########################################################################
# 先にoh-my-zshのinstallをしていると.zshrcが存在するため削除する
rm ~/.zshrc

# create symbolic links to the dotfiles not including .git, .config directory
for f in $(ls -a ~/dotfiles | grep "^\.[a-zA-Z0-9]"); do
  if [ "${f}" == ".git" ] || [ "${f}" == ".config" ]; then
    continue
  fi
  if [ ! -e ~/${f} ]; then
    ln -s ~/dotfiles/${f} ~/${f}
    echo "=====CREATE SYMBOLIC LINKS ${HOME}/dotfiles/${f} --> ${HOME}/${f}====="
  fi
done


# ===== nvim =====
if [ ! -d ~/.config/nvim ]; then
  mkdir -p ~/.config/nvim
  echo "=====CREATE SYMBOLIC LINKS ~/dotfiles/.config/nvim --> ~/.config/nvim====="
fi
ln -s ~/dotfiles/.config/nvim/* ~/.config/nvim/

# ===== git ignore =====
if [ ! -d ~/.config/git ]; then
  mkdir -p ~/.config/git
  echo "=====CREATE SYMBOLIC LINKS ~/dotfiles/.config/git --> ~/.config/git====="
fi
ln -s ~/dotfiles/.config/git/* ~/.config/git/

# ===== VS Code settings =====
vscode_dir=~/.config/Code/User
vscode_src=~/dotfiles/.config/Code/User

if [ ! -d "$vscode_dir" ]; then
  mkdir -p "$vscode_dir"
  echo "=====CREATE SYMBOLIC LINKS $vscode_src --> $vscode_dir====="
fi

for file in settings.json keybindings.json; do
  if [ ! -e "$vscode_dir/$file" ]; then
    ln -s "$vscode_src/$file" "$vscode_dir/$file"
  fi
done

# ===== mise config =====
mise_conf=~/.config/mise/config.toml
mise_src=~/dotfiles/.config/mise/config.toml

if [ ! -e "$mise_conf" ]; then
  mkdir -p "$(dirname "$mise_conf")"
  echo "=====CREATE SYMBOLIC LINKS $mise_src --> $mise_conf====="
  ln -s "$mise_src" "$mise_conf"
fi

# =====Claude Code =====
claude_conf=~/.claude/settings.json
claude_src=~/dotfiles/.claude/settings.json

if [ ! -e "$claude_conf" ]; then
  mkdir -p "$(dirname "$claude_conf")"
  echo "=====CREATE SYMBOLIC LINKS $claude_src --> $claude_conf====="
  ln -s "$claude_src" "$claude_conf"
fi
