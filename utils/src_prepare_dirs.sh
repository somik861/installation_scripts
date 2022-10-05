#! /bin/bash

source src_common.sh
source utils/src_init_shell.sh

__banner Ensuring installation directories

SOFTWARE_HOME="${HOME}/Software/general"

mkdir -p "${SOFTWARE_HOME}/bin"
mkdir -p "${SOFTWARE_HOME}/lib"
mkdir -p "${SOFTWARE_HOME}/lib64"
mkdir -p "${SOFTWARE_HOME}/share/man"
mkdir -p "${SOFTWARE_HOME}/share/info"
mkdir -p "${SOFTWARE_HOME}/include"

_PATH_BIN="export PATH=\"${SOFTWARE_HOME}/bin:\$PATH\""
if ! grep -qx "${_PATH_BIN}" "${SHELL_RC}"; then
    echo "${_PATH_BIN}" >> "${SHELL_RC}"
fi
