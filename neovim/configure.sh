#! /bin/bash

source src_common.sh

trap '__abort' 0

__banner Copying neovim configuration files

rm -rf ~/.config/nvim
cp -r neovim/config/nvim ~/.config/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qa

trap : 0
