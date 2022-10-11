#! /bin/bash

source src_common.sh
source utils/src_init_package_manager.sh

trap '__abort' 0

URL="https://download.opera.com/download/get/?id=59056&location=415&nothanks=yes&sub=marine&utm_tryagain=yes"
FILE="./opera.deb"

__wget "$URL" "$FILE"

${APT} ${INSTALL} ${FILE}

${APT} ${INSTALL} snapd
sudo snap install chromium-ffmpeg
LIB=$(find /snap -name libffmpeg.so 2> /dev/null | tail -n 1)
sudo mkdir -p /usr/lib/x86_64-linux-gnu/opera/lib_extra
sudo cp "$LIB" /usr/lib/x86_64-linux-gnu/opera/lib_extra/

rm -rf "$FILE"

trap : 0
