#!/usr/bin/env bash

set -eu

case $(uname -s) in
    Darwin)
        # install homebrew
        ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go/install)
        # pip
        sudo easy_install pip

        # syntax highlighted commands
        sudo pip install Pygments
    ;;
    *) : ;;
esac
