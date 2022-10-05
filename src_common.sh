#!/bin/bash

# die Message
__die()
{
    echo "$*"
    exit 1
}

# banner Message
__banner()
{
    echo "============================================================"
    echo "$*"
    echo "============================================================"
}


# untar what where
__untar()
{
    dir="$1";
    file="$2"
    case $file in
        *xz)
            tar xJ -C "$dir" -f "$file"
        ;;
        *bz2)
            tar xj -C "$dir" -f "$file"
        ;;
        *gz)
            tar xz -C "$dir" -f "$file"
        ;;
        *)
            tar x -C "$dir" -f "$file"
        ;;
    esac
}

# Abort
__abort()
{
        cat <<EOF
***************
*** ABORTED ***
***************
An error occurred. Exiting...
EOF
    exit 1
}


# wget url save_to
__wget()
{
    url=$1; shift
    file=$1; shift
    
    if [ ! -e "$file" ]; then
        wget --verbose "$url" -O "$FILE"
    else
        echo "already downloaded: $file"
    fi
}

set -e

