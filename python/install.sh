#! /bin/bash

source src_common.sh
source utils/src_init_shell.sh

trap '__abort' 0

if ! conda -h >/dev/null 2>&1; then
    URL="https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh"
    FILE="$(basename "$URL")"
    INSTALL_DIR="${HOME}/.anaconda3"

    rm -rf "${INSTALL_DIR}" 

    __wget "$URL" "$FILE"
    chmod u+x "$FILE"
    ./"$FILE" -p "${INSTALL_DIR}" -b 
    BIN="${INSTALL_DIR}/bin"

    eval "$("${BIN}/conda" shell.bash hook)"
    conda init $SHELL_NAME 
    conda config --set auto_activate_base false

    rm "$FILE"
fi

./python/rebuild_env.sh

trap : 0
