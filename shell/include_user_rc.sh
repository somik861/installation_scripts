#! /bin/bash

source src_common.sh
source utils/src_init_shell.sh

trap '__abort' 0

cp shell/.user_rc "${HOME}/"

_TO_INPUT="source \${HOME}/.user_rc"
if ! grep -qx "${_TO_INPUT}" "${SHELL_RC}"; then
    echo "${_TO_INPUT}" >> "${SHELL_RC}"
fi

trap : 0
