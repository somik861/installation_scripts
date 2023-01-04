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

BUILD_PKG="gcc g++ clang clang-format build-essential make pkg-config libtool libtool-bin valgrind openjdk-18-jdk maven linux-tools-common linux-tools-generic"
UTILS_PKG="apt tar zip unzip curl git git-gui perl cmake cmake-curses-gui xclip doxygen-gui ffmpeg htop wget net-tools gettext netowrk-maanger-openvpn"
LIBRARIES_PKG="zlib1g-dev libssl-dev"
APPS_PKG="libreoffice nomacs gimp smplayer mediainfo handbrake vim tmux"
VM_PKG="bridge-utils cpu-checker libvirt-clients libvirt-daemon qemu-kvm virt-manager libvirt-daemon-system virtinst"
TEX_PKG="texlive-full"

$APT $INSTALL $BUILD_PKG $UTILS_PKG $LIBRARIES_PKG $APPS_PKG $VM_PKG $TEX_PKG

trap : 0
