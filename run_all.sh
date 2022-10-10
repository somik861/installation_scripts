#! /bin/bash

source src_common.sh

trap'__abort' 0

__banner Updating package manager
packages/basic.sh

__banner Installing new shell
shell/install.sh
export SHELL=$(which zsh)
source ~/.zshrc

__banner Installing neovim
neovim/install.sh

__banner Installing anaconda
python/install.sh

__banner Building gcc
packages/build_gcc.sh 12.2.0 default
packages/build_gcc.sh 11.3.0 default
echo "source gcc12_activate" >> ~/.zshrc


__banner Installing rest of packages
packages/build_skype.sh
packages/build_vscode.sh
packages/build_openmpi.sh
packages/build_vcpkg.sh

__banner Installing ssh
ssh/install.sh

trap : 0
