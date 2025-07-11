#!/bin/bash
# NOTE: dein.vimは，.confing/nvim/init.vimにより起動時にinstallされる。
# FIXME: 適宜最新バージョンに変更
wget https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.appimage -O nvim.appimage
chmod +x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv ./squashfs-root/usr/bin/nvim /usr/bin/nvim
sudo mv ./squashfs-root/usr/share/nvim  /usr/share/nvim
#./squashfs-root/usr/bin/nvim
rm nvim.appimage
rm -rf ./squashfs-root/

# clipboard共有にxclipを使用
sudo apt install xclip
