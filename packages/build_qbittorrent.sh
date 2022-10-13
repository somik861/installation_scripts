#! /bin/bash

source src_common.sh
source utils/src_init_package_manager.sh

trap '__abort' 0

sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable

${APT} ${UPDATE}
${APT} ${INSTALL} qbittorrent

trap : 0
