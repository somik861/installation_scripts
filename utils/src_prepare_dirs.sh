#! /bin/bash

source src_common.sh
source utils/src_init_shell.sh

__banner Ensuring installation directories

source shell/.user_rc

mkdir -p "${SOFTWARE_HOME}/bin"
mkdir -p "${SOFTWARE_HOME}/lib"
mkdir -p "${SOFTWARE_HOME}/lib64"
mkdir -p "${SOFTWARE_HOME}/share/man"
mkdir -p "${SOFTWARE_HOME}/share/info"
mkdir -p "${SOFTWARE_HOME}/include"

