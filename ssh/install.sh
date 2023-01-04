#! /bin/bash

source src_common.sh

trap '__abort' 0

mkdir -p "${HOME}/.ssh"

if sudo -v; then
    cp ssh/config_local ssh/config
else
    cp ssh/config_remote ssh/config
fi

mv ssh/config "${HOME}/.ssh/"

trap : 0
