#! /bin/bash

source src_common.sh
source utils/src_prepare_dirs.sh

trap '__abort' 0

# OPTION VALUE
change_cmake()
{
    echo "Changing $1 to $2"
    if ! grep -q "^$1=" "CMakeCache.txt"; then
        echo ERROR: $1 not found 
        exit 1
    fi
    sed -i "s/^$1=.*$/$1=$2/" "CMakeCache.txt"
    return $? 
}

build_and_install()
{
    make -j8
    if sudo -v; then
        sudo make install
    else
        make install
    fi
}

SSH_URL="git@gitlab.fi.muni.cz:cbia/I3DLIB.git"
HTTPS_URL="https://gitlab.fi.muni.cz/cbia/I3DLIB.git"
FOLDER="I3DLIB"

if sudo -v; then
    INSTALL_DIR="/usr/local"
else
    INSTALL_DIR="${SOFTWARE_HOME}"
fi

git clone "${SSH_URL}" "${FOLDER}"
cd "${FOLDER}"
git checkout vcpkg_clean

## apply patches
# Patched --> patch src/diffusion_filters.cc ../packages/i3d_patches/diffusion_filters.cc.patch
patch src/RegistrationPointBased.cc ../packages/i3d_patches/RegistrationPointBased.cc.patch

## build
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=~/.vcpkg/scripts/buildsystems/vcpkg.cmake -DGLOBAL_INSTALL_PATH="${INSTALL_DIR}" ../

change_cmake ALGO_WITH_BLAS:BOOL ON
change_cmake ALGO_WITH_LAPACK:BOOL ON
change_cmake CORE_WITH_HDF5:BOOL OFF

build_and_install

change_cmake GLOBAL_BUILD_SHARED_LIBS:BOOL OFF
build_and_install

cd ..

## cleanup
cd ..
rm -rf "${FOLDER}"

trap : 0
