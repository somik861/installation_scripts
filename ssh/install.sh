#! /bin/bash

source src_common.sh

trap '__abort' 0

mkdir -p "${HOME}/.ssh"
cp ssh/config "${HOME}/.ssh/"

ssh/deploy_keys.sh

trap : 0
