#! /bin/bash

source src_common.sh

trap '__abort' 0

__banner Copying neovim configuration files

rm -rf ~/.config/nvim
cp -r neovim/config/nvim ~/.config/
nvim --headless +PlugInstall +qa

trap : 0
