#!/usr/bin/env bash

# $1 == 'python'
# $2 == destination

DESTINATION=$2

cp nix/python-flake.nix $DESTINATION/flake.nix
cp make/nix.make $DESTINATION/Makefile
(cd $DESTINATION && make build)

