#!/bin/bash
# NOTE: dein.vimの事前に準備が必要なため，.confing/nvim/init.vimでinstallしている
# FIXME: 適宜最新バージョンに変更
wget https://github.com/neovim/neovim/releases/download/v0.10.1/nvim.appimage
chmod +x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv ./squashfs-root/usr/bin/nvim /usr/bin/nvim
sudo mv ./squashfs-root/usr/share/nvim  /usr/share/nvim
#./squashfs-root/usr/bin/nvim
rm nvim.appimage
rm -rf ./squashfs-root/

