#! /bin/bash

source src_common.sh
source utils/src_init_package_manager.sh

trap '__abort' 0

URL="https://go.skype.com/skypeforlinux-64.deb"
FILE="./skype.deb"

__wget "$URL" "$FILE"

${APT} ${INSTALL} ${FILE}
if [ -f /etc/apt/trusted.gpg ]; then
    sudo mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/skypeforlinux.gpg
fi



rm -rf "$FILE"

trap : 0
