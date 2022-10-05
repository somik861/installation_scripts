#! /bin/bash

source src_common.sh
source utils/src_init_package_manager.sh

trap '__abort' 0

${APT} ${INSTALL} zsh
sudo chsh --shell $(which zsh)

shell/configure.sh

trap : 0

