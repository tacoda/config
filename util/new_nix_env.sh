#!/usr/bin/env bash

# $1 == 'python'
# $2 == destination

DESTINATION=$2

cp nix/python-flake.nix $DESTINATION/flake.nix
(cd $DESTINATION && nix build)

