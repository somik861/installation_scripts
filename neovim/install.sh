#! /bin/bash

source ../utils/prepare_dirs.sh
source ../common.sh

__banner Installing neovim

URL="https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz"
FILE="$(basename "$URL")"
__wget "$URL" "$FILE"
__untar "$FILE" "."
mv ./nvim-linux64/* "${SOFTWARE_HOME}"

source configure.sh
