#! /bin/bash

source src_common.sh
source utils/src_init_package_manager.sh

trap '__abort' 0

URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
FILE="./vscode.deb"

__wget "$URL" "$FILE"

${APT} ${INSTALL} ${FILE}

rm -rf "$FILE"

trap : 0
