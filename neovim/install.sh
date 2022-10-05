#! /bin/bash

source utils/src_prepare_dirs.sh
source src_common.sh

__banner Installing neovim

URL="https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz"
FILE="$(basename "$URL")"
__wget "$URL" "$FILE"
__untar "$FILE" "."
mv ./nvim-linux64/* "${SOFTWARE_HOME}"
rm -r ./nvim-linux64

source neovim/configure.sh
