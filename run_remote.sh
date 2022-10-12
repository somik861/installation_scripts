#! /bin/bash

source src_common.sh
source utils/src_prepare_dirs.sh

trap '__abort' 0

# inject new directories
grep -x 'export.*' "${HOME}/.bashrc" > _tmp.sh
source ./_tmp.sh
rm _tmp.sh

__banner Setting up shell
shell/include_user_rc.sh

__banner Setting up git
git/setup.sh

__banner Installing neovim
neovim/install.sh

__banner Installing anaconda
python/install.sh

__banner Building gcc
source utils/src_init_shell.sh
packages/build_gcc.sh 12.2.0 default
packages/build_gcc.sh 11.3.0 default
echo "source gcc12_activate" >> "${SHELL_RC}"

__banner Installing rest of packages
packages/build_openmpi.sh
packages/build_vcpkg.sh

__banner Installing ssh
cp ssh/config_remote ssh/config
ssh/install.sh

trap : 0
