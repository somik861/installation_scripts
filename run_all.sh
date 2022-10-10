#! /bin/bash

source src_common.sh
source utils/src_prepare_dirs.sh

trap '__abort' 0

# inject new directories
grep -x 'export.*'  "${HOME}/.bashrc" > _tmp.sh
source ./_tmp.sh
rm _tmp.sh

__banner Updating package manager
packages/basic.sh

__banner Setup git
git/setup.sh

__banner Installing new shell
shell/install.sh
export SHELL=$(which zsh)

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
