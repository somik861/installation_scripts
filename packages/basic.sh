#!/bin/bash

source ../common.sh
source ../utils/init_pacakge_manager.sh

$APT $UPDATE
$APT $UPGRADE

if [ "$APT" == "sudo apt" ]; then
    ${APT} ${INSTALL} nala
    source ../utils/init_pacakge_manager.sh
fi

UBUNTU_PKG="g++ clang-format tar untar zip unzip curl"
ALL_PKG="git make perl gcc clang cmake"
ARCH_PKG=""

if [ "$APT" == "sudo apt" ] || [ "$APT" == "sudo nala" ]; then
    $APT $INSTALL $ALL_PKG $UBUNTU_PKG
    elif [ "$APT" == "sudo pacman" ]; then
    $APT $INSTALL $ALL_PKG $ARCH_PKG
else
    __die Unkown distro package manager
fi