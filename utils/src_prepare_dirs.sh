#! /bin/bash

source src_common.sh
source utils/src_init_shell.sh

__banner Ensuring installation directories

source shell/.user_rc

mkdir -p "${SOFTWARE_HOME}/bin"
