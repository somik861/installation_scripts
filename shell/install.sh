#! /bin/bash

source src_common.sh
source utils/src_init_package_manager.sh

trap '__abort' 0

${APT} ${INSTALL} zsh
sudo chsh --shell $(which zsh)

shell/configure.sh
export SHELL=$(which zsh)
shell/include_user_rc.sh

trap : 0

