#! /bin/bash

source src_common.sh
source utils/src_init_package_manager.sh

trap '__abort' 0

curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
sudo mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/spotify.gpg

echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
${APT} ${UPDATE}
${APT} ${INSTALL} spotify-client

rm -rf "$FILE"

trap : 0
