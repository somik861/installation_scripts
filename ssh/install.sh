#! /bin/bash

source src_common.sh

trap '__abort' 0

mkdir -p "${HOME}/.ssh"
cp config "${HOME}/.ssh/"

trap : 0
