#!/usr/bin/env bash

set -e
set -u

cd "$(dirname "$0")"

function syncDots() {
    case $(uname -s) in
        Darwin)
            rsync \
            --exclude ".git/" --exclude ".gitmodules" --exclude ".DS_Store" \
            --exclude "sync.sh" --exclude "install-deps.sh" --exclude "osx/" \
            --exclude "README.md" --exclude "LICENSE" \
            -avh . ~
        ;;
        Linux)
            rsync --exclude "bin/free" \
            --exclude ".git/" --exclude ".gitmodules" --exclude ".DS_Store" \
            --exclude "sync.sh" --exclude "install-deps.sh" --exclude "osx/" \
            --exclude "README.md" --exclude "LICENSE" --exclude "bin/subl"\
            -avh . ~
        ;;
        *) echo "Unknown platform detected. Aborting sync ..."
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