#! /bin/bash

source src_common.sh

trap '__abort' 0

git config --global user.email "janjuracka861@seznam.cz"
git config --global user.name "Jan Juracka"

trap : 0
