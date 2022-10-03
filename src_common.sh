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
            __die "don't know how to unzip $file"
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
    urlroot=$1; shift
    tarfile=$1; shift
    
    if [ ! -e "$tarfile" ]; then
        wget --verbose "${urlroot}/$tarfile" --directory-prefix="$(dirname "$tarfile")"
    else
        echo "already downloaded: $tarfile  '$tarfile'"
    fi
}

