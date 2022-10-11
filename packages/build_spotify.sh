#! /bin/bash

source src_common.sh
source utils/src_init_package_manager.sh

trap '__abort' 0

sudo echo ""
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
if [ -f /etc/apt/trusted.gpg ]; then
    sudo mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/spotify.gpg
fi



echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
${APT} ${UPDATE}
${APT} ${INSTALL} spotify-client

trap : 0
