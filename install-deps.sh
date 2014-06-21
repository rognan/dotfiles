#!/usr/bin/env bash

set -e
set -u

case $(uname -s) in
    Darwin)
        # install homebrew
        ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go/install)

        # command line spotify on mac
        mkdir ~/code && cd ~/code
        git clone git://github.com/dronir/SpotifyControl.git
        chmod u+x SpotifyControl/SpotifyControl.scpt

        # for the c alias (syntax highlighted cat)
        sudo easy_install Pygments
    ;;
    *) echo 'No dependencies to be installed on this platform.';;
esac
