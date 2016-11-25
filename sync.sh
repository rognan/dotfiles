#!/usr/bin/env bash

set -e
set -u

cd "$(dirname "$0")"

function syncDots() {
    case $(uname -s) in
        Darwin)
            rsync  --exclude-from=.syncignore --cvs-exclude --exclude ".jenv" -avh . ~
        ;;
        Linux)
            rsync  --exclude-from=.syncignore --cvs-exclude \
            --exclude "bin/free" --exclude "bin/subl" \
            -avh . ~
        ;;
        *) echo "Unknown OS. Aborting sync ..."
        ;;
    esac

    source ~/.bash_profile
}

if [ ! -z "${1+x}" ] && [ "$1" == "--force" -o "$1" == "-f" ]; then
    syncDots
else
    read -p "This will overwrite existing files in $HOME. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy] ]]; then
        syncDots
    fi
fi

unset syncDots
