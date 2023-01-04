#! /bin/bash

source src_common.sh

if nala --version > /dev/null 2>&1; then
    APT="sudo nala"
    INSTALL="install -y"
    UPDATE="update"
    UPGRADE="upgrade -y"
    elif apt --version  > /dev/null 2>&1; then
    APT="sudo apt"
    INSTALL="install -y"
    UPDATE="update"
    UPGRADE="upgrade -y"
else
    __die "Could not find suitable package manager"
fi

