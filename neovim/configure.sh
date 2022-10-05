#! /bin/bash

__banner Copying neovim configuration files

rm -rf ~/.config/nvim
cp -r neovim/config/nvim ~/.config/
