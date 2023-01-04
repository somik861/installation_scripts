#! /bin/bash

source src_common.sh
source utils/src_init_shell.sh

trap '__abort' 0

URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
FILE="$(basename "$URL")"
INSTALL_DIR="${HOME}/.miniconda3"

rm -rf "${INSTALL_DIR}" 

__wget "$URL" "$FILE"
chmod u+x "$FILE"
./"$FILE" -p "${INSTALL_DIR}" -b 
BIN="${INSTALL_DIR}/bin"

eval "$("${BIN}/conda" shell.bash hook)"
conda init $SHELL_NAME 
conda config --set auto_activate_base false
conda config --add channels conda-forge

conda update -y -n base -c defaults conda
conda create -n py311 python=3.11

rm "$FILE"

trap : 0
