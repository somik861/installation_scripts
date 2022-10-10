#! /bin/bash

source src_common.sh

trap '__abort' 0

URL="https://github.com/microsoft/vcpkg.git"
TARGET="$HOME/.vcpkg"

rm -rf "$TARGET"

git clone "$URL" "$TARGET"
pushd "$TARGET"
./bootstrap-vcpkg.sh
popd

trap : 0
