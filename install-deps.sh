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

        sudo easy_install pip

        # for the c alias (syntax highlighted cat)
        sudo pip install Pygments

        # compass for sass
        gem install compass
    ;;
    *) echo 'No dependencies to be installed on this platform.';;
esac
