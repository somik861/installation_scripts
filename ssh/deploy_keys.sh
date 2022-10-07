#! /bin/bash

source src_common.sh

trap '__abort' 0

HOSTS=$(cat "$HOME/.ssh/config" | grep 'Host ' | sed 's/Host //g')

if ! [ -f "$HOME/.ssh/id_ed25519.pub" ]; then
    __die Not implemented
fi

KEY=$(cat "$HOME/.ssh/id_ed25519.pub")

for HOST in $HOSTS; do
    echo "Proccessing ${HOST}:"
    if ! ssh ${HOST} "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && if ! grep -qx \"${KEY}\" ~/.ssh/authorized_keys; then echo \"${KEY}\" >> ~/.ssh/authorized_keys; fi"; then 
        echo "${HOST} did not recieve key"
    fi
done

trap : 0
