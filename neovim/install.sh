#! /bin/bash

source utils/src_prepare_dirs.sh
source src_common.sh

__banner Installing neovim

FILE="neovim-bin.tar"
tar xf "neovim/${FILE}"
cp -r neovim-bin/* "${SOFTWARE_HOME}"

rm -rf neovim-bin

source neovim/configure.sh
