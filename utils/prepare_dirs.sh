#! /bin/bash

source ../common.sh

__banner Ensuring installation directories

SOFTARE_HOME="${HOME}/Software/general"

mkdir -p "${SOFTARE_HOME}/bin"
mkdir -p "${SOFTARE_HOME}/lib"
mkdir -p "${SOFTARE_HOME}/lib64"
mkdir -p "${SOFTARE_HOME}/share/man"
mkdir -p "${SOFTARE_HOME}/share/info"
mkdir -p "${SOFTARE_HOME}/include"