#! /bin/bash

source src_common.sh
source utils/src_prepare_dirs.sh

trap '__abort' 0

URL="https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.bz2"
FILE="$(basename "$URL")"


__wget "$URL" "$FILE"
tar xf "$FILE"

cd ./openmpi-4.1.4
./configure --prefix="${SOFTWARE_HOME}"
make all install
cd ..

rm -rf "$FILE" openmpi-4.1.4

trap : 0
