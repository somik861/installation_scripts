#!/bin/bash

source src_common.sh

trap '__abort' 0

source utils/src_init_package_manager.sh


$APT $UPDATE
$APT $UPGRADE

if [ "$APT" == "sudo apt" ]; then
    ${APT} ${INSTALL} nala
    source utils/src_init_package_manager.sh
fi

UBUNTU_PKG="g++ clang-format apt tar zip unzip curl build-essential zlib1g-dev libssl-dev"
ALL_PKG="git make perl gcc clang cmake tmux vim texlive-full net-tools wget"
ARCH_PKG=""

if [ "$APT" == "sudo apt" ] || [ "$APT" == "sudo nala" ]; then
    $APT $INSTALL $ALL_PKG $UBUNTU_PKG
    elif [ "$APT" == "sudo pacman" ]; then
    $APT $INSTALL $ALL_PKG $ARCH_PKG
else
    __die Unkown distro package manager
fi

trap : 0
