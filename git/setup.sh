#! /bin/bash

source src_common.sh

trap '__abort' 0

git config --global user.email "xjurack1@fi.muni.cz"
git config --global user.name "Jan Juracka"

trap : 0
