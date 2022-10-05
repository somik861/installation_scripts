#! /bin/bash

source src_common.sh
source util/src_init_shell.sh

__banner Ensuring installation directories

SOFTARE_HOME="${HOME}/Software/general"

mkdir -p "${SOFTARE_HOME}/bin"
mkdir -p "${SOFTARE_HOME}/lib"
mkdir -p "${SOFTARE_HOME}/lib64"
mkdir -p "${SOFTARE_HOME}/share/man"
mkdir -p "${SOFTARE_HOME}/share/info"
mkdir -p "${SOFTARE_HOME}/include"

_PATH_BIN="export PATH=\"${SOFTARE_HOME}\bin:\$PATH\""
if ! grep -qx "${_EXPORT_BIN}" "${SHELL_RC}"; then
    echo "${_PATH_BIN}" >> "${SHELL_RC}"
fi
