#! /bin/bash

source src_common.sh
source utils/src_init_package_manager.sh

trap '__abort' 0

URL="https://download.opera.com/download/get/?id=59056&location=415&nothanks=yes&sub=marine&utm_tryagain=yes"
FILE="./opera.deb"

__wget "$URL" "$FILE"

${APT} ${INSTALL} ${FILE}

rm -rf "$FILE"

trap : 0
