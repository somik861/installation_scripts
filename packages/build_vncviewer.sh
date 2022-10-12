#! /bin/bash

source src_common.sh
source utils/src_init_package_manager.sh

trap '__abort' 0

URL="https://downloads.realvnc.com/download/file/viewer.files/VNC-Viewer-6.22.826-Linux-x64.deb"
FILE="./vncviewer.deb"

__wget "$URL" "$FILE"

${APT} ${INSTALL} ${FILE}
if [ -f /etc/apt/trusted.gpg ]; then
    sudo mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/vncviewer.gpg
fi

rm -rf "$FILE"

trap : 0
