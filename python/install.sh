#! /bin/bash

source src_common.sh

trap '__abort' 0
URL="https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh"
FILE="$(basename "$URL")"

__wget "$URL" "$FILE"
chmod u+x "$FILE"
./"$FILE" -p "${HOME}/.anaconda3" -b 

# eval "$(conda shell.bash hook)"

rm "$FILE"
trap : 0
