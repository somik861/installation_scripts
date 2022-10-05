#! /bin/bash

source src_common.sh

SHELL_NAME=$(basename $SHELL)
if [ "$SHELL_NAME" = "zsh" ]; then
    SHELL_RC="${HOME}/.zshrc"
elif [ "$SHELL_NAME" = "bash" ]; then
    SHELL_RC="${HOME}/.bashrc"
else
    __die Unknown shell
fi
