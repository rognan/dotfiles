#!/bin/bash

set -e

# homebrew
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go/install)

# command line spotify
mkdir ~/code && cd ~/code
git clone git://github.com/dronir/SpotifyControl.git
chmod u+x SpotifyControl/SpotifyControl.scpt

# for the c alias (syntax highlighted cat)
sudo easy_install Pygments