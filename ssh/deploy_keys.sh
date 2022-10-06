#! /bin/bash

source src_common.sh

trap '__abort' 0

HOSTS=$(cat "$HOME/.ssh/config" | grep 'Host ' | sed 's/Host //g')

if ! [ -f "$HOME/.ssh/id_ed25519.pub" ]; then
    __die Not implemented
fi

KEY=$(cat "$HOME/.ssh/id_ed25519.pub")

for HOST in $HOSTS; do
    echo "Enter password for ${HOST}:"
    ssh ${HOST} "mkdir -p ~/.ssh && echo ${KEY} >> ~/.ssh/authorized_keys"
done

trap : 0
