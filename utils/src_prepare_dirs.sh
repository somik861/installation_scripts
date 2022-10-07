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

_PATH_LDLIB="export LD_LIBRARY_PATH=\"${SOFTWARE_HOME}/lib:${SOFTWARE_HOME}/lib64:\$LD_LIBRARY_PATH\""
if ! grep -qx "${_PATH_LDLIB}" "${SHELL_RC}"; then
    echo "${_PATH_LDLIB}" >> "${SHELL_RC}"
fi

_PATH_MAN="export MANPATH=\"${SOFTWARE_HOME}/share/man:\$MANPATH\""
if ! grep -qx "${_PATH_MAN}" "${SHELL_RC}"; then
    echo "${_PATH_MAN}" >> "${SHELL_RC}"
fi

_PATH_INFO="export INFOPATH=\"${SOFTWARE_HOME}/share/info:\$INFOPATH\""
if ! grep -qx "${_PATH_INFO}" "${SHELL_RC}"; then
    echo "${_PATH_INFO}" >> "${SHELL_RC}"
fi

_PATH_CINCL="export C_INCLUDE_PATH=\"${SOFTWARE_HOME}/include:\$C_INCLUDE_PATH\""
if ! grep -qx "${_PATH_CINCL}" "${SHELL_RC}"; then
    echo "${_PATH_CINCL}" >> "${SHELL_RC}"
fi

_PATH_CPPINCL="export CPLUS_INCLUDE_PATH=\"${SOFTWARE_HOME}/include:\$CPLUS_INCLUDE_PATH\""
if ! grep -qx "${_PATH_CPPINCL}" "${SHELL_RC}"; then
    echo "${_PATH_CPPINCL}" >> "${SHELL_RC}"
fi


