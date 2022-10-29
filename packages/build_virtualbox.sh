#! /bin/bash

source src_common.sh
source utils/src_init_package_manager.sh

trap '__abort' 0

URL="https://download.virtualbox.org/virtualbox/7.0.2/virtualbox-7.0_7.0.2-154219~Ubuntu~jammy_amd64.deb"
FILE="./vbox.deb"

__wget "$URL" "$FILE"

${APT} ${INSTALL} ${FILE}
if [ -f /etc/apt/trusted.gpg ]; then
    sudo mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/virtualbox.gpg
fi

rm -rf "$FILE"

trap : 0
