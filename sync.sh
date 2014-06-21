#!/usr/bin/env bash

set -e
set -u

cd "$(dirname "$0")"

#git pull origin master

function syncDots() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "sync.sh" \
    --exclude "README.md" --exclude "LICENSE" -avh . ~
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